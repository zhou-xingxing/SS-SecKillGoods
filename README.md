# SS-SecKillGoods
> 商品秒杀系统
>
> 基于Beego2.0和RabbitMQ
>
> 效果和实现：[项目文档](https://github.com/zhou-xingxing/SS-SecKillGoods/blob/main/%E9%A1%B9%E7%9B%AE%E6%96%87%E6%A1%A3.md)

## 项目结构

/SecKillGoods_admin 秒杀系统用户端和后台管理端项目

/DoOrder  商品订单处理程序

seckillgoods.sql 导出的sql文件

## 项目部署

1. 安装Go环境，我的是1.15.1
2. 使用Goland或其他IDE打开项目所在文件夹（.idea目录可能需要删除）
3. 开启go module
4. 在terminal输入`go run main.go`命令并执行
5. 也可以通过beego的bee工具启动项目，好处是支持热编译

```shell
go get -u github.com/beego/bee/v2
bee run
```

6. 代码中连接的数据库位于我的服务器中，如果想在本地建库，可打开conf文件修改配置信息并运行sql文件

## 项目运行

用户端：http://localhost:8080/seckill

后台管理端：http://localhost:8080/admin

管理员用户名：root 

密码：SSpku123456