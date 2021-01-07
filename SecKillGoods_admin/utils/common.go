package utils

import (
	"crypto/md5"
	"encoding/hex"
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
