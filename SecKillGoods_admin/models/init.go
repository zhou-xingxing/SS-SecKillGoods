package models

import (
	"github.com/beego/beego/v2/client/orm"
)

func init() {
	orm.RegisterModel(new(AdminUser), new(AdminLog), new(AdminRole), new(AdminAuthRule), new(Goods))
}
