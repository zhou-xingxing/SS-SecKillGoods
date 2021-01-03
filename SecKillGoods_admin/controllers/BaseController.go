package controllers

import (
	"SecKillGoods_admin/models"
	beego "github.com/beego/beego/v2/server/web"
)

type BaseController struct {
	beego.Controller
	controllerName string //当前控制名称
	actionName     string //当前action名称
}

//JSON输出
func (c *BaseController) ApiJson(code int16, msg string, data interface{}) {
	if data == nil {
		data = ""
	}
	c.Data["json"] = map[string]interface{}{"code": code, "msg": msg, "data": data}
	//返回JSON
	c.ServeJSON()
	c.StopRun()
}

//返回成功的API成功
func (c *BaseController) ApiSuccess(msg string, data interface{}) {
	c.ApiJson(0, msg, data)
}

//返回失败的API请求
func (c *BaseController) ApiError(msg string, data interface{}) {
	c.ApiJson(-1, msg, data)
}

//返回失败且带code的API请求
func (c *BaseController) ApiErrorCode(msg string, data interface{}, code int16) {
	c.ApiJson(code, msg, data)
}

//刷新用户session
func (c *BaseController) RefreshAdminUserSession(user *models.AdminUser) {
	//保存信息到Session
	c.SetSession("admin_user", user)

}
