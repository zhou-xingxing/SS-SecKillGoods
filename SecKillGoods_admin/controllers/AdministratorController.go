package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/validation"
	_ "github.com/beego/beego/v2/server/web"
	beego "github.com/beego/beego/v2/server/web"
)

//管理员管理
type AdministratorController struct {
	BaseController
}

//管理员列表
func (c *AdministratorController) Index() {
	pageNo, _ := c.GetInt("page", 1)
	pageSize := c.GetDefaultPageSize()
	userName := c.GetString("username", "")

	o := orm.NewOrm()
	//查询所有管理员列表
	var list []*models.AdminUser
	//设置排序
	qs := o.QueryTable(new(models.AdminUser)).
		OrderBy("-id").
		Offset(c.GetPageOffset(pageNo, pageSize)).
		Limit(pageSize).
		Filter("username__contains", userName)

	//管理员总数
	cnt, _ := qs.Count()
	//数据列表
	_, _ = qs.All(&list)
	//处理分页
	paginator := utils.PageUtil(int(cnt), pageSize, c.Ctx.Request.RequestURI, list)
	c.Data["list"] = list
	c.Data["paginator"] = paginator.ToString()
	c.Data["username"] = userName
	c.SetTpl("administrator/index.html")
}

//删除管理员
func (c *AdministratorController) Destroy() {
	id, _ := c.GetInt(":id")
	o := orm.NewOrm()
	if num, err := o.Delete(&models.AdminUser{Id: id}); err == nil {
		if num > 0 {
			c.ApiSuccess("操作成功", nil)
		}
	}
	c.ApiError("操作失败", nil)
}

// 设置管理员状态
func (c *AdministratorController) UpdateStatus() {
	id, _ := c.GetInt(":id")
	if id == 1 {
		c.ApiError("不允许禁用超级管理员", nil)
	}
	adminUser := models.AdminUser{Id: id}
	o := orm.NewOrm()
	//Read 返回error
	if o.Read(&adminUser) == nil {
		if adminUser.Status == 0 {
			adminUser.Status = 1
		} else if adminUser.Status == 1 {
			adminUser.Status = 0
		}
		if num, err := o.Update(&adminUser); err == nil {
			if num > 0 {
				c.ApiSuccess("操作成功", nil)
			}
			//c.ApiSuccess("操作成功", map[string]interface{}{"status":adminUser.Status,"num":num})
		}
	}
	c.ApiError("操作失败", nil)
}

//增加管理员用户页
func (c *AdministratorController) AddPage() {
	c.SetTpl("administrator/add.html")
}

//增加用户
func (c *AdministratorController) Add() {
	var adminUser models.AdminUser
	_ = c.Ctx.Input.Bind(&adminUser.Username, "username")
	_ = c.Ctx.Input.Bind(&adminUser.RoleId, "role")
	_ = c.Ctx.Input.Bind(&adminUser.Phone, "phone")
	_ = c.Ctx.Input.Bind(&adminUser.Email, "email")
	_ = c.Ctx.Input.Bind(&adminUser.Password, "pwd")
	adminUser.Status = 1 //设置为可用
	repwd := c.GetString("repwd")
	// 验证字段
	valid := validation.Validation{}
	valid.Email(adminUser.Email, "email").Message("邮箱格式不正确")
	valid.Mobile(adminUser.Phone, "phone").Message("手机号码格式不正确")
	if valid.HasErrors() {
		for _, err := range valid.Errors {
			c.ApiError(err.Message, nil)
		}
	}
	if repwd != adminUser.Password {
		c.ApiError("两次密码不一致", nil)
	}

	o := orm.NewOrm()
	//检查用户名是否已使用
	num, err := o.QueryTable(new(models.AdminUser)).Filter("username", adminUser.Username).Count()
	if err != nil {
		c.ApiError(err.Error(), nil)
	}
	if num > 0 {
		c.ApiError("当前用户名已存在", nil)
	}

	salt, _ := beego.AppConfig.String("pwd_salt")
	adminUser.Password = utils.Md5Encode(adminUser.Password + salt)

	num, err = o.Insert(&adminUser)
	if err == nil && num > 0 {
		c.ApiSuccess("插入成功", "")
	}
	c.ApiError("插入失败", nil)

}
