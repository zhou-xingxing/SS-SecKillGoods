package utils

import (
	"crypto/md5"
	"encoding/hex"
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
