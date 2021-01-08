package models

import (
	"github.com/beego/beego/v2/client/orm"
)

func (adminUser *AdminUser) TableName() string {
	return "admin_user"
}

//管理员类
type AdminUser struct {
	Id       int
	Username string `orm:"unique"`
	Password string
	Phone    string
	Email    string
	Status   uint8 `orm:"default(1);description(这是状态字段)"`
	RoleId   int
}

//根据用户名和密码获取单条数据
func AdminUserGetUserOneByNameAndPwd(username, password string) (*AdminUser, error) {
	m := AdminUser{}
	err := orm.NewOrm().QueryTable("admin_user").Filter("username", username).Filter("password", password).One(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
