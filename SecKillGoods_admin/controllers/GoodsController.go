package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/validation"
	"log"
	"regexp"
	"strconv"
	"time"
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

//删除商品
func (c *GoodsController) Destroy() {
	id, _ := c.GetInt(":id")
	o := orm.NewOrm()
	if num, err := o.Delete(&models.Goods{Id: id}); err == nil {
		if num > 0 {
			c.ApiSuccess("操作成功", nil)
		}
	}
	c.ApiError("操作失败", nil)
}

//增加商品页面
func (c *GoodsController) AddPage() {
	c.SetTpl("goods/add.html")
}

//增加商品
func (c *GoodsController) Add() {
	var goods models.Goods
	//获取数据并验证数据
	//go语言诞生时间
	timeTemplate := "2006-01-02 15:04:05"
	startTime := c.GetString("start_time", "")
	endTime := c.GetString("end_time", "")
	start, serr := time.ParseInLocation(timeTemplate, startTime, time.Local)
	if serr != nil {
		c.ApiError("时间数据不合法", nil)
	}
	end, eerr := time.ParseInLocation(timeTemplate, endTime, time.Local)
	if eerr != nil {
		c.ApiError("时间数据不合法", nil)
	}
	if start.Before(end) == false {
		c.ApiError("开始时间应在截止时间之前", nil)
	}
	goods.StartTime = start
	goods.EndTime = end

	_ = c.Ctx.Input.Bind(&goods.GoodsName, "goods_name")
	valid := validation.Validation{}
	r, errre := regexp.Compile("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$")
	if errre != nil {
		log.Print("正则表达式编译错误")
		c.ApiError("正则表达式编译出错", nil)
	}
	valid.Match(goods.GoodsName, r, "goods_name").Message("商品名不合法")
	if valid.HasErrors() {
		for _, err := range valid.Errors {
			c.ApiError(err.Message, nil)
		}
	}
	goods_price := c.GetString("goods_price", "")
	goods_number := c.GetString("goods_number", "")
	price, errp := strconv.ParseFloat(goods_price, 64)
	if errp != nil || price < 0 {
		c.ApiError("商品价格不合法", nil)
	}
	number, errn := strconv.Atoi(goods_number)
	if errn != nil || number < 0 {
		c.ApiError("商品数量不合法", nil)
	}
	goods.GoodsPrice = price
	goods.GoodsNumber = number
	creator := c.GetSession("admin_user").(*models.AdminUser)
	goods.CreatorId = creator.Id
	//log.Print(goods)
	o := orm.NewOrm()
	num, err := o.Insert(&goods)
	if err == nil && num > 0 {
		c.ApiSuccess("操作成功", nil)
	}
	c.ApiError("操作失败", nil)

}

//编辑页面
func (c *GoodsController) EditPage() {
	id, err := c.GetInt(":id")
	if err != nil {
		c.ApiError("获取id失败", nil)
	}

	//查询商品数据
	o := orm.NewOrm()
	goods := models.Goods{Id: id}
	err = o.Read(&goods)
	if err == orm.ErrNoRows {
		c.ApiError("获取数据失败", nil)
	}
	c.Data["goods"] = goods
	//时间类型转为字符串
	c.Data["start_time"] = goods.StartTime.Format("2006-01-02 15:04:05")
	c.Data["end_time"] = goods.EndTime.Format("2006-01-02 15:04:05")
	c.SetTpl("goods/edit.html")
}

//更新
func (c *GoodsController) Update() {
	id, err := c.GetInt(":id")
	if err != nil {
		c.ApiError("获取id失败", nil)
	}
	o := orm.NewOrm()
	goods := models.Goods{Id: id}
	err = o.Read(&goods)
	if err == orm.ErrNoRows {
		c.ApiError("获取数据失败", nil)
	}
	//验证数据
	timeTemplate := "2006-01-02 15:04:05"
	startTime := c.GetString("start_time", "")
	endTime := c.GetString("end_time", "")
	start, serr := time.ParseInLocation(timeTemplate, startTime, time.Local)
	if serr != nil {
		c.ApiError("时间数据不合法", nil)
	}
	end, eerr := time.ParseInLocation(timeTemplate, endTime, time.Local)
	if eerr != nil {
		c.ApiError("时间数据不合法", nil)
	}
	if start.Before(end) == false {
		c.ApiError("开始时间应在截止时间之前", nil)
	}
	goods.StartTime = start
	goods.EndTime = end

	_ = c.Ctx.Input.Bind(&goods.GoodsName, "goods_name")
	valid := validation.Validation{}
	r, errre := regexp.Compile("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$")
	if errre != nil {
		log.Print("正则表达式编译错误")
		c.ApiError("系统错误", nil)
	}
	valid.Match(goods.GoodsName, r, "goods_name").Message("商品名不合法")
	if valid.HasErrors() {
		for _, err := range valid.Errors {
			c.ApiError(err.Message, nil)
		}
	}
	goods_price := c.GetString("goods_price", "")
	goods_number := c.GetString("goods_number", "")
	price, errp := strconv.ParseFloat(goods_price, 64)
	if errp != nil || price < 0 {
		c.ApiError("商品价格不合法", nil)
	}
	number, errn := strconv.Atoi(goods_number)
	if errn != nil || number < 0 {
		c.ApiError("商品数量不合法", nil)
	}
	goods.GoodsPrice = price
	goods.GoodsNumber = number
	num, err1 := o.Update(&goods)
	if err1 == nil {
		if num > 0 {
			c.ApiSuccess("更新成功", nil)
		} else {
			c.ApiError("信息并未修改", nil)
		}
	}
	c.ApiError("更新失败", nil)

}
