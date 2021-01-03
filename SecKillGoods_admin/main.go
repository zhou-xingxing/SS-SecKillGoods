package main

import (
	_ "SecKillGoods_admin/models"
	_ "SecKillGoods_admin/routers"
	"SecKillGoods_admin/sysinit"
	beego "github.com/beego/beego/v2/server/web"
)

func main() {

	//root 123456
	//开启session
	beego.BConfig.WebConfig.Session.SessionOn = true
	//初始化数据库
	sysinit.InitDatabase()
	//建表用的
	//orm.RunCommand()

	beego.Run()
}
