package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.html"
}

func (c *MainController) Login() {

	//adminUser := c.GetSession("admin_user")
	//if adminUser != nil{
	//	// 当前已经登录
	//	c.RequestSuccess("已登录","/admin")
	//}

	c.TplName = "index/login.html"
}
