package utils

import (
	"crypto/md5"
	"encoding/hex"
	"math/rand"
	"regexp"
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

//验证密码
func PasswordVerify(s string) bool {
	//验证长度和不含特殊字符
	pat1 := `^[a-zA-Z0-9]{8,16}$`
	match1, _ := regexp.MatchString(pat1, s)
	if !match1 {
		return false
	}
	//同时包含大小写字母和数字
	pat2 := `[0-9]+`
	match2, _ := regexp.MatchString(pat2, s)
	if !match2 {
		return false
	}
	pat3 := `[a-z]+`
	match3, _ := regexp.MatchString(pat3, s)
	if !match3 {
		return false
	}
	pat4 := `[A-Z]+`
	match4, _ := regexp.MatchString(pat4, s)
	if !match4 {
		return false
	}
	return true
}
