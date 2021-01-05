package controllers

import (
	"SecKillGoods_admin/models"
	"SecKillGoods_admin/utils"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/validation"
	beego "github.com/beego/beego/v2/server/web"
	"log"
	"regexp"
	"runtime"
	"time"
)

type IndexController struct {
	BaseController
}

func (c *IndexController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.html"
}

func (c *IndexController) Index() {

	c.Data["appname"], _ = beego.AppConfig.String("appname")
	//adminUser := c.GetSession("admin_user")
	//if adminUser == nil {
	//	// 未登录
	//	c.Redirect("/admin/login", 302)
	//}
	//查询用户的权限
	//ruleIds := logic.GetSessionAuth(c.Ctx)
	//var adminAuthRules []*models.AdminAuthRule
	//if ruleIds[0] != "*"{
	//	adminAuthRules,_ = models.AdminAuthRuleGetMenu(ruleIds...)
	//}else{
	//	adminAuthRules,_ = models.AdminAuthRuleGetMenu()
	//}
	////组装成树形菜单
	//c.Data["treeMenus"] = logic.MakeRuleTree(adminAuthRules,0)
	//
	c.Data["adminUser"] = c.GetSession("admin_user")
	c.TplName = "index/index.html"
}

func (c *IndexController) Login() {
	adminUser := c.GetSession("admin_user")
	if adminUser != nil {
		// 当前已经登录，进入管理页面
		c.Redirect("/admin", 302)
	}
	c.TplName = "index/login.html"
}

func (c *IndexController) DoLogin() {
	username := c.GetString("username")
	password := c.GetString("password")
	//验证参数
	pat1 := `^[a-zA-Z0-9_]{4,12}$`
	pat2 := `^[a-zA-Z0-9_]{6,12}$`
	match1, _ := regexp.MatchString(pat1, username)
	match2, _ := regexp.MatchString(pat2, password)
	if !match1 {
		c.ApiError("用户名不符合规则", nil)
	}
	if !match2 {
		c.ApiError("密码不符合规则", nil)
	}

	//加密密码且加盐
	salt, _ := beego.AppConfig.String("pwd_salt")
	password = utils.Md5Encode(password + salt)
	adminUser, err := models.AdminUserGetUserOneByNameAndPwd(username, password)

	log.Print(username, password)
	if err != nil {
		c.ApiError("用户名或者密码错误", nil)
	}
	if adminUser.Status == 0 {
		c.ApiError("用户被禁用，请联系管理员", nil)
	}
	//保存信息到Session
	c.RefreshAdminUserSession(adminUser)

	c.ApiSuccess("登录成功", nil)
}

//退出登录
func (c *IndexController) Logout() {
	//清除cookie和session
	_ = c.DestroySession()
	c.Ctx.SetCookie("beegosessionID", "")
	c.Redirect("/admin/login", 302)
}

//欢迎页面
func (c *IndexController) Welcome() {
	//数据统计
	o := orm.NewOrm()
	//访问数
	var maps []orm.Params
	num, err := o.Raw(`SELECT
			count(id) as sum_visit_count,
			count(IF(DATE_FORMAT(created_time, '%Y')=DATE_FORMAT(CURDATE(),'%Y'),true,null)) as year_visit_count,
			count(IF(DATE_FORMAT(created_time, '%Y%m')=DATE_FORMAT(CURDATE(),'%Y%m'),true,null)) as month_visit_count,
			count(IF(DATE_FORMAT(created_time, '%Y%m%d')=DATE_FORMAT(CURDATE(),'%Y%m%d'),true,null)) as day_visit_count
		FROM admin_log `).Values(&maps)

	if err == nil && num > 0 {
		c.Data["visitCount"], _ = maps[0]["sum_visit_count"]        //总访问数
		c.Data["yestVisitCount"], _ = maps[0]["year_visit_count"]   //年访问数
		c.Data["monthVisitCount"], _ = maps[0]["month_visit_count"] //月访问数
		c.Data["dayVisitCount"], _ = maps[0]["day_visit_count"]     //日访问数
	} else {
		log.Println(err, num)
	}

	c.Data["adminCount"], _ = o.QueryTable(new(models.AdminUser)).Count() //管理员数
	c.Data["adminUser"] = c.GetSession("admin_user")
	c.Data["nowTime"] = utils.GetDateByTime(time.Now().Unix())
	//获取系统信息
	c.Data["appName"] = beego.BConfig.AppName //项目名称
	c.Data["sysName"] = runtime.GOOS          //操作系统
	c.Data["goArch"] = runtime.GOARCH         //系统构架
	c.Data["sysVersion"] = runtime.Version()  //go版本

	//c.TplName = "index/welcome.html"
	c.SetTpl("index/welcome.html")
}

//个人中心
func (c *IndexController) Person() {
	if c.IsAjax() {
		//修改个人中心
		var adminUser models.AdminUser
		_ = c.Ctx.Input.Bind(&adminUser.Id, "id")

		o := orm.NewOrm()
		err := o.Read(&adminUser)

		if err != nil {
			c.ApiError("查询失败", nil)
		}

		_ = c.Ctx.Input.Bind(&adminUser.Phone, "phone")
		_ = c.Ctx.Input.Bind(&adminUser.Email, "email")

		valid := validation.Validation{}
		valid.Email(adminUser.Email, "email").Message("邮箱格式不正确")
		valid.Mobile(adminUser.Phone, "phone").Message("手机号码格式不正确")
		if valid.HasErrors() {
			for _, err := range valid.Errors {
				c.ApiError(err.Message, nil)
			}
		}

		pwd := c.GetString("pwd", "")
		//密码为空说明没有修改密码
		if pwd != "" {
			repwd := c.GetString("repwd")
			pat2 := `^[a-zA-Z0-9_]{6,12}$`
			match2, _ := regexp.MatchString(pat2, pwd)
			if !match2 {
				c.ApiError("密码不符合规则", nil)
			}
			if pwd != repwd {
				c.ApiError("两次密码不一致", nil)
			}
			salt, _ := beego.AppConfig.String("pwd_salt")
			adminUser.Password = utils.Md5Encode(pwd + salt)
		}
		_, err = o.Update(&adminUser)
		if err != nil {
			c.ApiError(err.Error(), nil)
		}

		//更新Session
		c.RefreshAdminUserSession(&adminUser)
		c.ApiSuccess("更新成功", nil)
	}
	adminUser := c.GetSession("admin_user")
	c.Data["adminUser"] = adminUser
	c.SetTpl("index/person.html")
}

func (c *IndexController) AuthError() {
	c.TplName = "common/auth_error.html"
}
