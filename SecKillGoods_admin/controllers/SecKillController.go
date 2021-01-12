package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/validation"
	"log"
	"regexp"
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
	nowTime := utils.GetDateByTime(time.Now().Unix())

	//筛选出还没到秒杀截止时间的
	qs = qs.Filter("end_time__gte", nowTime)

	//总数
	cnt, _ := qs.Count()
	//数据列表
	_, _ = qs.All(&list)
	//处理分页
	paginator := utils.PageUtil(int(cnt), pageSize, c.Ctx.Request.RequestURI, list)
	c.Data["list"] = list

	c.Data["paginator"] = paginator.ToString()
	c.SetTpl("seckill/index.html")
}

//下订单页面
func (c *SecKillController) GoodsPage() {
	id, err := c.GetInt(":id")
	if err != nil {
		c.ApiError("获取商品id失败", nil)
	}

	//查询商品数据
	o := orm.NewOrm()
	goods := models.Goods{Id: id}
	err = o.Read(&goods)
	if err == orm.ErrNoRows {
		c.ApiError("获取数据失败", nil)
	}
	c.Data["goods"] = goods
	c.Data["start_time"] = goods.StartTime.Format("2006-01-02 15:04:05")
	c.Data["end_time"] = goods.EndTime.Format("2006-01-02 15:04:05")
	c.SetTpl("seckill/goods_page.html")
}

//下订单
func (c *SecKillController) GoodsSeckill() {
	id, err := c.GetInt(":id")
	if err != nil {
		c.ApiError("获取商品id失败", nil)
	}
	//接收数据
	phone := c.GetString("phone", "")
	code := c.GetString("code", "")
	log.Println(id, phone, code)
	//验证数据
	valid := validation.Validation{}
	r, errre := regexp.Compile("^[a-zA-Z0-9]+$")
	if errre != nil {
		log.Print("正则表达式编译错误")
		c.ApiError("正则表达式编译出错", nil)
	}
	valid.Phone(phone, "phone").Message("手机号不合法")
	valid.Match(code, r, "code").Message("抢购码不合法")
	if valid.HasErrors() {
		for _, err := range valid.Errors {
			c.ApiError(err.Message, nil)
		}
	}
	//验证抢购码
	o := orm.NewOrm()
	customer := models.Customer{Phone: phone}
	err = o.Read(&customer, "Phone")
	if err == orm.ErrNoRows {
		c.ApiError("无此用户", nil)
	}
	if customer.Code != code {
		c.ApiError("抢购码错误", nil)
	}
	//验证时间
	goods := models.Goods{Id: id}
	err = o.Read(&goods)
	if err == orm.ErrNoRows {
		c.ApiError("获取商品数据失败", nil)
	}
	now := time.Now()
	if goods.StartTime.Before(now) == false {
		c.ApiError("秒杀未开始", nil)
	}
	if goods.EndTime.Before(now) {
		c.ApiError("秒杀已结束", nil)
	}
	//改商品数据+写订单
	if goods.GoodsNumber <= 0 {
		log.Println("商品已被抢空")
		c.ApiSuccess("操作成功", nil)
	}
	goods.GoodsNumber -= 1
	num, err := o.Update(&goods)
	if err == nil {
		if num > 0 {
			log.Println("商品表修改成功")
		} else {
			log.Println("商品表修改失败")
			c.ApiSuccess("操作成功", nil)
		}
	}
	order := models.Order{}
	order.Phone = phone
	order.GoodsId = id
	num, err = o.Insert(&order)
	if err == nil {
		if num > 0 {
			log.Println("订单表修改成功")
		} else {
			log.Println("订单表修改失败")
			c.ApiSuccess("操作成功", nil)
		}
	}

	c.ApiSuccess("操作成功", nil)
}

type OrderInfo struct {
	Id          int
	Phone       string
	GoodsName   string
	CreatedTime time.Time
}

//用户查询order
func (c *SecKillController) OrderList() {
	pageNo, _ := c.GetInt("page", 1)
	pageSize := c.GetDefaultPageSize()
	phone := c.GetString("phone", "")

	o := orm.NewOrm()
	//查询所有订单列表
	var list []*models.Order
	//设置排序
	qs := o.QueryTable(new(models.Order)).
		OrderBy("-id").
		Offset(c.GetPageOffset(pageNo, pageSize)).
		Limit(pageSize)

	qs = qs.Filter("phone", phone)

	//总数
	cnt, _ := qs.Count()
	//数据列表
	_, _ = qs.All(&list)
	//处理分页
	paginator := utils.PageUtil(int(cnt), pageSize, c.Ctx.Request.RequestURI, list)

	var info []OrderInfo
	for _, v := range list {
		var order OrderInfo
		order.Id = v.Id
		order.Phone = v.Phone
		order.CreatedTime = v.CreatedTime

		good := models.Goods{Id: v.GoodsId}
		err := o.Read(&good)
		if err != nil {
			order.GoodsName = ""
		} else {
			order.GoodsName = good.GoodsName
		}
		info = append(info, order)
	}
	c.Data["info"] = info
	c.Data["paginator"] = paginator.ToString()
	c.Data["phone"] = phone
	c.SetTpl("seckill/order.html")
}
