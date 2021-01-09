package utils

import (
	"crypto/md5"
	"encoding/hex"
	"math/rand"
	"strings"
	"time"
)

//对字符串进行md5加密
func Md5Encode(data string) string {
	h := md5.New()
	h.Write([]byte(data))
	return hex.EncodeToString(h.Sum(nil))
}

//把时间戳转换为时间字符串
func GetDateByTime(cateTime int64) string {
	return time.Unix(cateTime, 0).Format("2006-01-02 15:04:05")
}

//判断某个字符串是否在字符串数组中
func Contains(array string, val string) bool {
	//array转换为字符串数组
	arrayList := strings.Split(array, ",")
	for _, v := range arrayList {
		if v == val {
			return true
		}
	}
	return false
}

//随机生成指定位数字符串
func RandString(len int) string {
	r := rand.New(rand.NewSource(time.Now().UnixNano()))
	bytes := make([]byte, len)
	for i := 0; i < len; i++ {
		b := r.Intn(26) + 65
		bytes[i] = byte(b)
	}
	return string(bytes)
}
