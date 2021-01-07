package models

import (
	_ "github.com/beego/beego/v2/client/orm"
)

//管理员角色模型
type AdminRole struct {
	Id          int
	RoleName    string `orm:"unique"`
	Description string
}
