package models

import (
	_ "github.com/beego/beego/v2/client/orm"
	"time"
)

//商品类
type Goods struct {
	Id          int
	GoodsName   string
	GoodsPrice  float64
	GoodsNumber int
	CreatorId   int
	StartTime   time.Time `orm:"type(datetime)"`
	EndTime     time.Time `orm:"type(datetime)"`
}
