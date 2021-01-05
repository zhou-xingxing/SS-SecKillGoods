package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
)

//系统日志
type AdminLogController struct {
	BaseController
}

//查看日志
func (c *AdminLogController) Index() {
	pageNo, _ := c.GetInt("page", 1)
	pageSize := c.GetDefaultPageSize()
	//pageSize := 50
	keyword := c.GetString("keyword", "")

	o := orm.NewOrm()
	//日志列表
	var list []*models.AdminLog
	qs := o.QueryTable(new(models.AdminLog)).
		OrderBy("-id").
		Offset(c.GetPageOffset(pageNo, pageSize)).
		Limit(pageSize)
	//关键字搜索
	if keyword != "" {
		cond := orm.NewCondition()
		qs = qs.SetCond(
			cond.Or("username__contains", keyword).
				Or("url__contains", keyword).
				Or("ip__contains", keyword))
	}
	//总数
	cnt, _ := qs.Count()
	_, _ = qs.All(&list)
	paginator := utils.PageUtil(int(cnt), pageSize, c.Ctx.Request.RequestURI, list)

	c.Data["list"] = list
	c.Data["paginator"] = paginator.ToString()
	c.Data["keyword"] = keyword
	c.SetTpl("admin_log/index.html")
}
