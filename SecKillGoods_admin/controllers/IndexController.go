package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"fmt"
	beego "github.com/beego/beego/v2/server/web"
	"log"
	"regexp"
)

type IndexController struct {
	BaseController
}

func (c *IndexController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.html"
}

func (c *IndexController) Index() {

	c.Data["appname"], _ = beego.AppConfig.String("appname")
	adminUser := c.GetSession("admin_user")
	if adminUser == nil {
		// 未登录
		c.Redirect("/admin/login", 302)
	}
	//查询用户的权限
	//ruleIds := logic.GetSessionAuth(c.Ctx)
	//var adminAuthRules []*models.AdminAuthRule
	//if ruleIds[0] != "*"{
	//	adminAuthRules,_ = models.AdminAuthRuleGetMenu(ruleIds...)
	//}else{
	//	adminAuthRules,_ = models.AdminAuthRuleGetMenu()
	//}
	////组装成树形菜单
	//c.Data["treeMenus"] = logic.MakeRuleTree(adminAuthRules,0)
	//
	c.Data["adminUser"] = c.GetSession("admin_user")
	c.TplName = "index/index.html"
}

func (c *IndexController) Login() {
	adminUser := c.GetSession("admin_user")
	if adminUser != nil {
		// 当前已经登录，进入管理页面
		c.Redirect("/admin", 302)
	}
	c.TplName = "index/login.html"
}

func (c *IndexController) Welcome() {
	c.TplName = "index/welcome.html"
}

func (c *IndexController) DoLogin() {
	username := c.GetString("username")
	password := c.GetString("password")
	fmt.Println(username, password)

	//验证参数
	pat1 := `^[a-zA-Z0-9_]{4,12}$`
	pat2 := `^[a-zA-Z0-9_]{6,12}$`
	match1, _ := regexp.MatchString(pat1, username)
	match2, _ := regexp.MatchString(pat2, password)
	if !match1 {
		c.ApiError("用户名不符合规则", nil)
	}
	if !match2 {
		c.ApiError("密码不符合规则", nil)
	}

	sessionAdminUser := c.GetSession("admin_user")
	if sessionAdminUser != nil {
		//当前已登录
		c.ApiSuccess("用户已登录", nil)
	}

	//加密密码且加盐
	salt, _ := beego.AppConfig.String("pwd_salt")
	password = utils.Md5Encode(password + salt)
	adminUser, err := models.AdminUserGetUserOneByNameAndPwd(username, password)
	log.Print(password)
	if err != nil {
		c.ApiError("用户名或者密码错误", nil)
	}
	if adminUser.Status == 0 {
		c.ApiError("用户被禁用，请联系管理员", nil)
	}
	//保存信息到Session
	c.RefreshAdminUserSession(adminUser)

	c.ApiSuccess("登录成功", nil)
}

//退出登录
func (c *IndexController) Logout() {
	//清除cookie和session
	_ = c.DestroySession()
	c.Ctx.SetCookie("beegosessionID", "")
	c.Redirect("/admin/login", 302)
}
