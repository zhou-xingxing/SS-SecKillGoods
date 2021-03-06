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
	start_time := c.GetString("start_time", "")
	end_time := c.GetString("end_time", "")
	o := orm.NewOrm()
	//日志列表
	var list []*models.AdminLog
	qs := o.QueryTable(new(models.AdminLog)).
		OrderBy("-id").
		Offset(c.GetPageOffset(pageNo, pageSize)).
		Limit(pageSize)
	//时间过滤
	if start_time != "" && end_time != "" {
		qs = qs.Filter("created_time__gte", start_time).Filter("created_time__lte", end_time)
	} else if start_time != "" {
		qs = qs.Filter("created_time__gte", start_time)
	} else if end_time != "" {
		qs = qs.Filter("created_time__lte", end_time)
	}
	//用户名过滤
	if keyword != "" {
		qs = qs.Filter("username", keyword)
	}

	//总数
	cnt, _ := qs.Count()
	_, _ = qs.All(&list)
	paginator := utils.PageUtil(int(cnt), pageSize, c.Ctx.Request.RequestURI, list)

	c.Data["list"] = list
	c.Data["paginator"] = paginator.ToString()
	c.Data["keyword"] = keyword
	c.Data["start_time"] = start_time
	c.Data["end_time"] = end_time
	c.SetTpl("admin_log/index.html")
}
