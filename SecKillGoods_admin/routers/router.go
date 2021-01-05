package routers

import (
	"SecKillGoods_admin/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {
	beego.Router("/", &controllers.IndexController{})

	ns := beego.NewNamespace("/admin",
		// 后台主页面
		beego.NSRouter("/", &controllers.IndexController{}, "*:Index"),
		beego.NSRouter("/login", &controllers.IndexController{}, "*:Login"),
		beego.NSRouter("/dologin", &controllers.IndexController{}, "Post:DoLogin"),
		beego.NSRouter("/welcome", &controllers.IndexController{}, "*:Welcome"),
		beego.NSRouter("/person", &controllers.IndexController{}, "*:Person"),
		beego.NSRouter("/logout", &controllers.IndexController{}, "*:Logout"),

		//管理员日志
		beego.NSNamespace("/log",
			beego.NSRouter("/", &controllers.AdminLogController{}, "*:Index"),
		),
	)
	beego.AddNamespace(ns)
}
