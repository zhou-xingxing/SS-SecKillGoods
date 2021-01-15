package main

import (
	_ "SecKillGoods_admin/models"
	_ "SecKillGoods_admin/routers"
	"SecKillGoods_admin/sysinit"
	beego "github.com/beego/beego/v2/server/web"
)

func main() {

	//root SSpku123456
	//开启session
	beego.BConfig.WebConfig.Session.SessionOn = true
	//初始化数据库
	sysinit.InitDatabase()
	//建表用的
	//orm.RunCommand()
	//main orm syncdb -force=false: drop tables before create
	//初始化rabbitmq
	sysinit.InitRabbitmq()
	//过滤器，验证是否登录
	beego.InsertFilter("/admin/*", beego.BeforeRouter, sysinit.FilterLogin)
	//过滤器，敏感操作加日志
	beego.InsertFilter("/admin/*", beego.BeforeRouter, sysinit.FilterAddLog)
	//过滤器，鉴权
	beego.InsertFilter("/admin/*", beego.BeforeRouter, sysinit.FilterAuth)
	beego.Run()
}
