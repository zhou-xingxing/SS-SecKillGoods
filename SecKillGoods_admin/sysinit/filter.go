package sysinit

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/server/web/context"
	"regexp"
	"strconv"
)

//是否登录
func FilterLogin(ctx *context.Context) {
	adminUser := ctx.Input.Session("admin_user")
	if ctx.Request.RequestURI == "/admin/dologin" {
		return
	}
	// 当前未登录，且请求的页面不是登录页面
	if adminUser == nil && ctx.Request.RequestURI != "/admin/login" {
		ctx.Redirect(302, "/admin/login")
	}
}

//自动记录请求日志
func FilterAddLog(ctx *context.Context) {
	adminUserSession := ctx.Input.Session("admin_user")
	var adminUserId int
	var username string
	if adminUserSession != nil {
		adminUser := adminUserSession.(*models.AdminUser)
		adminUserId = adminUser.Id
		username = adminUser.Username
	}
	//过滤非敏感操作
	nologUrl := []string{
		`/admin/*`,
		`/admin/login/*`,
		`/admin/welcome/*`,
		//`/admin/syslog(\?)?.*`,
		//`/admin/auth_error/*`,
	}
	url := ctx.Request.RequestURI
	for _, v := range nologUrl {
		r := regexp.MustCompile(v)
		loc := r.FindStringIndex(url)
		if loc != nil {
			//完全匹配
			if loc[0] == 0 && loc[1] == len(url) {
				return
			}
		}
	}
	adminLog := models.AdminLog{
		AdminUserId: adminUserId,
		Username:    username,
		Url:         url,
		Ip:          ctx.Request.RemoteAddr,
	}
	m := orm.NewOrm()
	_, _ = m.Insert(&adminLog)
}

//权限过滤
func FilterAuth(ctx *context.Context) {
	if ctx.Request.RequestURI == "/admin/login" || ctx.Request.RequestURI == "/admin/dologin" {
		return
	}
	adminUser := ctx.Input.Session("admin_user").(*models.AdminUser)
	//如果是超级管理员直接放行
	if adminUser.RoleId == 1 {
		return
	}
	//检查当前访问是否为需要鉴权的操作
	authRule, _ := models.CheckRuleByUrl(ctx.Request.RequestURI)
	//如果不需要
	if authRule == nil {
		return
	} else {
		//检验当前role_id是否在允许列表里
		if utils.Contains(authRule.RoleIdList, strconv.Itoa(adminUser.RoleId)) {
			return
		} else {
			//没有权限
			ctx.Redirect(302, "/admin/auth_error")
		}
	}
}
