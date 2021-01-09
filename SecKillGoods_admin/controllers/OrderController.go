package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
)

type OrderController struct {
	BaseController
}

//订单列表
func (c *OrderController) Index() {
	pageNo, _ := c.GetInt("page", 1)
	pageSize := c.GetDefaultPageSize()
	phone := c.GetString("phone", "")
	goods_id := c.GetString("goods_id", "")
	start_time := c.GetString("start_time", "")
	end_time := c.GetString("end_time", "")

	o := orm.NewOrm()
	//查询所有订单列表
	var list []*models.Order
	//设置排序
	qs := o.QueryTable(new(models.Order)).
		OrderBy("-id").
		Offset(c.GetPageOffset(pageNo, pageSize)).
		Limit(pageSize)

	if phone != "" {
		qs = qs.Filter("phone", phone)
	}

	if goods_id != "" {
		qs = qs.Filter("goods_id", goods_id)
	}

	//筛选时间
	if start_time != "" && end_time != "" {
		qs = qs.Filter("created_time__gte", start_time).Filter("created_time__lte", end_time)
	} else if start_time != "" {
		qs = qs.Filter("created_time__gte", start_time)
	} else if end_time != "" {
		qs = qs.Filter("created_time__lte", end_time)
	}

	//总数
	cnt, _ := qs.Count()
	//数据列表
	_, _ = qs.All(&list)
	//处理分页
	paginator := utils.PageUtil(int(cnt), pageSize, c.Ctx.Request.RequestURI, list)
	c.Data["list"] = list
	c.Data["paginator"] = paginator.ToString()
	c.Data["phone"] = phone
	c.Data["goods_id"] = goods_id
	c.Data["start_time"] = start_time
	c.Data["end_time"] = end_time
	c.SetTpl("order/index.html")
}
