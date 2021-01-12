package sysinit

import (
	"github.com/streadway/amqp"
	"log"
)

var RabbitChannel *amqp.Channel
var RabbitQueue amqp.Queue

//初始化rabbitmq
func InitRabbitmq() {
	conn, err := amqp.Dial("amqp://guest:guest@39.106.96.175:5672/")
	if err != nil {
		log.Print("Failed to connect to RabbitMQ")
		return
	}
	RabbitChannel, err = conn.Channel()
	if err != nil {
		log.Print("Failed to open a RabbitMQ channel")
		return
	}
	RabbitQueue, err = RabbitChannel.QueueDeclare(
		"SeckillOrder", // name
		false,          // durable
		false,          // delete when unused
		false,          // exclusive
		false,          // no-wait
		nil,            // arguments
	)
	if err != nil {
		log.Print("Failed to declare a RabbitMQ queue")
		return
	}
}

//发消息
func SendtoRabbitmq(msg string) bool {
	err := RabbitChannel.Publish(
		"",               // exchange
		RabbitQueue.Name, // routing key
		false,            // mandatory
		false,            // immediate
		amqp.Publishing{
			ContentType: "text/plain",
			Body:        []byte(msg),
		})
	if err == nil {
		return true
	} else {
		log.Print("RabbitMQ消息发送失败")
		return false
	}
}
