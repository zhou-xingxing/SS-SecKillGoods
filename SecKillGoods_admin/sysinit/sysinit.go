package sysinit

import (
	beego "github.com/beego/beego/v2/server/web"
	"log"

	"github.com/beego/beego/v2/client/orm"
	_ "github.com/go-sql-driver/mysql"
)

//初始化数据库
func InitDatabase() {
	//读取配置文件
	//数据库ip
	dbHost, _ := beego.AppConfig.String("mysql::db_host")
	//数据库端口
	dbPort, _ := beego.AppConfig.String("mysql::db_port")
	//数据库
	dbDatabase, _ := beego.AppConfig.String("mysql::db_database")
	//数据库名称
	dbUsername, _ := beego.AppConfig.String("mysql::db_username")
	//数据库密码
	dbPasword, _ := beego.AppConfig.String("mysql::db_password")
	//数据库字符集
	dbCharset, _ := beego.AppConfig.String("mysql::db_charset")
	//初始化数据库
	err := orm.RegisterDriver("mysql", orm.DRMySQL)
	if err != nil {
		log.Print("orm.RegisterDriver失败")
	}
	err = orm.RegisterDataBase("default", "mysql", dbUsername+":"+dbPasword+"@tcp("+dbHost+":"+dbPort+")/"+dbDatabase+"?charset="+dbCharset+"&loc=Local")
	if err != nil {
		log.Print("orm.RegisterDataBase失败")
	}

	// 自动创建表 数据库别名，true为先删除表再新增，true为自动更新数据表字段
	//isInstall, _ := beego.AppConfig.Bool("is_install")
	//_ = orm.RunSyncdb("default", isInstall, false)
}
