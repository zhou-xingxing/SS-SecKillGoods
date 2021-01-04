package sysinit

import (
	//"SecKillGoods_admin/models"
	"github.com/beego/beego/v2/server/web/context"
)

//是否登录
func FilterLogin(ctx *context.Context) {
	adminUser := ctx.Input.Session("admin_user")
	// 当前未登录，且请求的页面不是登录页面
	if ctx.Request.RequestURI == "/admin/dologin" {
		return
	}
	if adminUser == nil && ctx.Request.RequestURI != "/admin/login" {
		ctx.Redirect(302, "/admin/login")
	}
}
