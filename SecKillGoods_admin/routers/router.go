package routers

import (
	"SecKillGoods_admin/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {

	beego.Router("/", &controllers.IndexController{})

	ns1 := beego.NewNamespace("/admin",
		// 后台主页面
		beego.NSRouter("/", &controllers.IndexController{}, "*:Index"),
		beego.NSRouter("/login", &controllers.IndexController{}, "*:Login"),
		beego.NSRouter("/dologin", &controllers.IndexController{}, "Post:DoLogin"),
		beego.NSRouter("/welcome", &controllers.IndexController{}, "*:Welcome"),
		beego.NSRouter("/person", &controllers.IndexController{}, "*:Person"),
		beego.NSRouter("/logout", &controllers.IndexController{}, "*:Logout"),
		beego.NSRouter("/auth_error", &controllers.IndexController{}, "*:AuthError"),

		//系统日志
		beego.NSNamespace("/syslog",
			beego.NSRouter("/", &controllers.AdminLogController{}, "*:Index"),
		),

		// 管理员管理
		beego.NSNamespace("/administrator",
			beego.NSRouter("/", &controllers.AdministratorController{}, "*:Index"),
			beego.NSRouter("/update_status/:id", &controllers.AdministratorController{}, "*:UpdateStatus"),
			beego.NSRouter("/add_page", &controllers.AdministratorController{}, "*:AddPage"),
			beego.NSRouter("/add", &controllers.AdministratorController{}, "*:Add"),
			beego.NSRouter("/edit_page/:id", &controllers.AdministratorController{}, "*:EditPage"),
			beego.NSRouter("/update/:id", &controllers.AdministratorController{}, "*:Update"),
			beego.NSRouter("/destroy/:id", &controllers.AdministratorController{}, "*:Destroy"),
		),

		//商品管理
		beego.NSNamespace("/goods",
			beego.NSRouter("/", &controllers.GoodsController{}, "*:Index"),
			beego.NSRouter("/add_page", &controllers.GoodsController{}, "*:AddPage"),
			beego.NSRouter("/add", &controllers.GoodsController{}, "*:Add"),
			beego.NSRouter("/edit_page/:id", &controllers.GoodsController{}, "*:EditPage"),
			beego.NSRouter("/update/:id", &controllers.GoodsController{}, "*:Update"),
			beego.NSRouter("/destroy/:id", &controllers.GoodsController{}, "*:Destroy"),
		),

		//客户管理
		beego.NSNamespace("/customer",
			beego.NSRouter("/", &controllers.CustomerController{}, "*:Index"),
			beego.NSRouter("/add_page", &controllers.CustomerController{}, "*:AddPage"),
			beego.NSRouter("/add", &controllers.CustomerController{}, "*:Add"),
			beego.NSRouter("/destroy/:id", &controllers.CustomerController{}, "*:Destroy"),
		),

		//订单管理
		beego.NSNamespace("/order",
			beego.NSRouter("/", &controllers.OrderController{}, "*:Index"),
		),
	)

	ns2 := beego.NewNamespace("/seckill",
		beego.NSRouter("/", &controllers.SecKillController{}, "*:Index"),
		beego.NSRouter("/goods_page/:id", &controllers.SecKillController{}, "*:GoodsPage"),
		beego.NSRouter("/goods_seckill/:id", &controllers.SecKillController{}, "*:GoodsSeckill"),
		//客户查询订单
		beego.NSRouter("/order", &controllers.SecKillController{}, "*:OrderList"),
	)
	beego.AddNamespace(ns1)
	beego.AddNamespace(ns2)
}
