package models

import (
	_ "github.com/beego/beego/v2/client/orm"
	"time"
)

//订单类
type Order struct {
	Id          int
	Phone       string
	GoodsId     int
	CreatedTime time.Time `orm:"auto_now_add;type(datetime)"`
}
