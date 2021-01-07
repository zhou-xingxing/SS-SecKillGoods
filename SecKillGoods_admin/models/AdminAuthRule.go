package models

import (
	"github.com/beego/beego/v2/client/orm"
)

//管理员权限模型
type AdminAuthRule struct {
	Id         int
	RuleName   string `orm:"unique"`
	RuleUrl    string `orm:"unique"`
	RoleIdList string
}

//根据地址获取权限ID 目前只能完全匹配的情况才能识别
func CheckRuleByUrl(Url string) (AdminAuthRule, error) {
	var adminAuthRule AdminAuthRule
	err := orm.NewOrm().QueryTable("admin_auth_rule").Filter("rule_url", Url).One(&adminAuthRule)
	return adminAuthRule, err
}
