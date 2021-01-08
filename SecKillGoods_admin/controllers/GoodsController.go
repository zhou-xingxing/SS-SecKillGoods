package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
	//"github.com/beego/beego/v2/core/validation"
)

//商品管理
type GoodsController struct {
	BaseController
}

//商品列表
func (c *GoodsController) Index() {
	pageNo, _ := c.GetInt("page", 1)
	pageSize := c.GetDefaultPageSize()
	goodsName := c.GetString("goods_name", "")

	o := orm.NewOrm()
	//查询所有商品列表
	var list []*models.Goods
	//设置排序
	qs := o.QueryTable(new(models.Goods)).
		OrderBy("-id").
		Offset(c.GetPageOffset(pageNo, pageSize)).
		Limit(pageSize).
		Filter("goods_name__contains", goodsName)

	//总数
	cnt, _ := qs.Count()
	//数据列表
	_, _ = qs.All(&list)
	//处理分页
	paginator := utils.PageUtil(int(cnt), pageSize, c.Ctx.Request.RequestURI, list)
	c.Data["list"] = list
	c.Data["paginator"] = paginator.ToString()
	c.Data["goods_name"] = goodsName
	c.SetTpl("goods/index.html")
}
