package models

import (
	_ "github.com/beego/beego/v2/client/orm"
	"time"
)

//日志模型
type AdminLog struct {
	Id          int
	AdminUserId int
	Username    string
	Url         string
	Ip          string
	CreatedTime time.Time `orm:"auto_now_add;type(datetime)"`
}
