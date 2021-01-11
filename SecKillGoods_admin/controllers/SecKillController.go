package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
	"time"
)

type SecKillController struct {
	BaseController
}

//可以秒杀的商品列表
func (c *SecKillController) Index() {
	pageNo, _ := c.GetInt("page", 1)
	pageSize := c.GetDefaultPageSize()

	o := orm.NewOrm()
	//查询所有商品列表
	var list []*models.Goods
	//设置排序
	qs := o.QueryTable(new(models.Goods)).
		OrderBy("-id").
		Offset(c.GetPageOffset(pageNo, pageSize)).
		Limit(pageSize)

	//获得当前时间
	now_time := utils.GetDateByTime(time.Now().Unix())

	//筛选出还没到秒杀截止时间的
	qs = qs.Filter("end_time__gte", now_time)

	//总数
	cnt, _ := qs.Count()
	//数据列表
	_, _ = qs.All(&list)
	//处理分页
	paginator := utils.PageUtil(int(cnt), pageSize, c.Ctx.Request.RequestURI, list)
	c.Data["list"] = list
	c.Data["nowTime"] = now_time
	c.Data["paginator"] = paginator.ToString()
	c.SetTpl("seckill/index.html")
}
