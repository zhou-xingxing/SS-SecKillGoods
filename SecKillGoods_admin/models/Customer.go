package models

import (
	_ "github.com/beego/beego/v2/client/orm"
)

//消费者类
type Customer struct {
	Id           int
	Phone        string `orm:"unique"`
	CustomerName string
	//抢购码
	Code string
}
