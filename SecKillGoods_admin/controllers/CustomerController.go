package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/validation"
	"log"
	"regexp"
)

type CustomerController struct {
	BaseController
}

//消费者列表
func (c *CustomerController) Index() {
	pageNo, _ := c.GetInt("page", 1)
	pageSize := c.GetDefaultPageSize()
	phone := c.GetString("phone", "")

	o := orm.NewOrm()
	//查询所有用户列表
	var list []*models.Customer
	//设置排序
	qs := o.QueryTable(new(models.Customer)).
		OrderBy("-id").
		Offset(c.GetPageOffset(pageNo, pageSize)).
		Limit(pageSize)

	if phone != "" {
		qs = qs.Filter("phone", phone)
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
	c.SetTpl("customer/index.html")
}

//增加用户页面
func (c *CustomerController) AddPage() {
	c.SetTpl("customer/add.html")
}

//增加用户
func (c *CustomerController) Add() {
	var customer models.Customer
	_ = c.Ctx.Input.Bind(&customer.Phone, "phone")
	_ = c.Ctx.Input.Bind(&customer.CustomerName, "customer_name")
	//验证输入
	valid := validation.Validation{}
	r, errre := regexp.Compile("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$")
	if errre != nil {
		log.Print("正则表达式编译错误")
		c.ApiError("正则表达式编译出错", nil)
	}
	valid.Phone(customer.Phone, "phone").Message("手机号不合法")
	valid.Match(customer.CustomerName, r, "goods_name").Message("姓名不合法")
	if valid.HasErrors() {
		for _, err := range valid.Errors {
			c.ApiError(err.Message, nil)
		}
	}
	o := orm.NewOrm()
	//检查手机号是否已使用
	num, err := o.QueryTable(new(models.Customer)).Filter("phone", customer.Phone).Count()
	if err != nil {
		c.ApiError(err.Error(), nil)
	}
	if num > 0 {
		c.ApiError("当前手机号已存在", nil)
	}
	//随机生成8位抢购码
	customer.Code = utils.RandString(8)
	num, err = o.Insert(&customer)
	if err == nil && num > 0 {
		c.ApiSuccess("操作成功", nil)
	}
	c.ApiError("操作失败", nil)
}

//删除用户
func (c *CustomerController) Destroy() {
	id, _ := c.GetInt(":id")
	o := orm.NewOrm()
	if num, err := o.Delete(&models.Customer{Id: id}); err == nil {
		if num > 0 {
			c.ApiSuccess("操作成功", nil)
		}
	}
	c.ApiError("操作失败", nil)
}
