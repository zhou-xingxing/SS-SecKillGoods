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
		beego.NSRouter("/auth_error", &controllers.IndexController{}, "*:AuthError"),

		//管理员日志
		beego.NSNamespace("/log",
			beego.NSRouter("/", &controllers.AdminLogController{}, "*:Index"),
		),

		// 管理员列表
		beego.NSNamespace("/administrator",
			beego.NSRouter("/", &controllers.AdministratorController{}, "*:Index"),
			beego.NSRouter("/update_status/:id", &controllers.AdministratorController{}, "*:UpdateStatus"),
			//beego.NSRouter("/create", &controllers.AdminSysController{},"*:Create"),
			//beego.NSRouter("/add", &controllers.AdminSysController{},"*:Add"),
			//beego.NSRouter("/edit/:id", &controllers.AdminSysController{},"*:Edit"),
			//beego.NSRouter("/update/:id", &controllers.AdminSysController{},"*:Update"),
			beego.NSRouter("/destroy/:id", &controllers.AdministratorController{}, "*:Destroy"),
		),
	)
	beego.AddNamespace(ns)
}
