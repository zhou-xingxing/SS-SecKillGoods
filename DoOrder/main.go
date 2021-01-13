package main

import (
	"encoding/json"
	"github.com/beego/beego/v2/client/orm"
	_ "github.com/go-sql-driver/mysql"
	"github.com/streadway/amqp"
	"log"
	"time"
)

//消息类
type Msg struct {
	Phone   string
	GoodsId int
}

//订单类
type Order struct {
	Id          int
	Phone       string
	GoodsId     int
	CreatedTime time.Time `orm:"auto_now_add;type(datetime)"`
}

//商品类
type Goods struct {
	Id          int
	GoodsName   string
	GoodsPrice  float64
	GoodsNumber int
	CreatorId   int
	StartTime   time.Time `orm:"type(datetime)"`
	EndTime     time.Time `orm:"type(datetime)"`
}

func DoOrder(msg *Msg) {
	o := orm.NewOrm()
	to, err := o.Begin()
	if err != nil {
		log.Println("开启事务失败", err)
		return
	}
	goods := Goods{Id: msg.GoodsId}
	err = to.Read(&goods)
	if err != nil {
		log.Println("获取商品信息失败")
		return
	}
	if goods.GoodsNumber <= 0 {
		log.Println("商品已被抢空")
		return
	}
	goods.GoodsNumber -= 1
	_, err = to.Update(&goods)
	if err != nil {
		log.Println("更新商品表失败")
		err = to.Rollback()
		if err != nil {
			log.Println("回滚失败")
		}
		return
	}
	order := Order{}
	order.Phone = msg.Phone
	order.GoodsId = msg.GoodsId
	_, err = o.Insert(&order)
	if err != nil {
		log.Println("插入订单表失败")
		err = to.Rollback()
		if err != nil {
			log.Println("回滚失败")
		}
		return
	}
	err = to.Commit()
	if err != nil {
		log.Println("提交事务失败", err)
		return
	}
	log.Println("订单处理成功", msg)
}

func init() {
	err := orm.RegisterDriver("mysql", orm.DRMySQL)
	if err != nil {
		log.Println(err, "orm.RegisterDriver失败")
	}
	err = orm.RegisterDataBase("default", "mysql", "sspku:sspku@(39.106.96.175:3306)/seckillgoods?charset=utf8mb4&loc=Local")
	if err != nil {
		log.Println(err, "orm.RegisterDataBase失败")
	}
	log.Println("数据库连接成功")

	orm.RegisterModel(new(Goods), new(Order))
}

func main() {

	conn, err := amqp.Dial("amqp://guest:guest@39.106.96.175:5672/")
	if err != nil {
		log.Println(err, "Failed to connect to RabbitMQ")
		return
	}

	defer conn.Close()

	ch, err := conn.Channel()
	if err != nil {
		log.Println(err, "Failed to open a channel")
		return
	}

	defer ch.Close()

	q, err := ch.QueueDeclare(
		"SeckillOrder", // name
		false,          // durable
		false,          // delete when unused
		false,          // exclusive
		false,          // no-wait
		nil,            // arguments
	)
	if err != nil {
		log.Println(err, "Failed to declare a queue")
		return
	}
	msgs, err := ch.Consume(
		q.Name, // queue
		"",     // consumer
		true,   // auto-ack
		false,  // exclusive
		false,  // no-local
		false,  // no-wait
		nil,    // args
	)
	if err != nil {
		log.Println(err, "Failed to register a consumer")
		return
	}

	forever := make(chan bool)

	go func() {
		for d := range msgs {
			//log.Printf("Received a message: %s", d.Body)
			var msg Msg
			err := json.Unmarshal(d.Body, &msg)
			if err != nil {
				log.Println(d.Body, "解析失败")
				continue
			}
			DoOrder(&msg)
		}
	}()
	log.Printf(" [*] Waiting for messages. To exit press CTRL+C")
	<-forever //阻塞主线程
}
