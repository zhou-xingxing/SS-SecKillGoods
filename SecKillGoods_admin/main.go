package main

import (
	_ "SecKillGoods_admin/routers"
	beego "github.com/beego/beego/v2/server/web"
)

func main() {
	beego.Run()
}
