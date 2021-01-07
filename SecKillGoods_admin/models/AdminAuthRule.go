package models

import (
	"github.com/beego/beego/v2/client/orm"
	"strings"
)

//管理员权限模型
type AdminAuthRule struct {
	Id         int
	RuleName   string `orm:"unique"`
	RuleUrl    string `orm:"unique"`
	RoleIdList string
}

//根据地址获取权限ID
//改用前缀匹配
func CheckRuleByUrl(Url string) (*AdminAuthRule, error) {
	//取出所有规则
	var rules []AdminAuthRule
	_, err := orm.NewOrm().QueryTable("admin_auth_rule").All(&rules)
	if err != nil {
		return nil, err
	}
	for _, v := range rules {
		if strings.HasPrefix(Url, v.RuleUrl) {
			return &v, err
		}
	}
	return nil, err
}
