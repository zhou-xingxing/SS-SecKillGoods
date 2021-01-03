package utils

import (
	"crypto/md5"
	"encoding/hex"
)

//对字符串进行md5加密
func Md5Encode(data string) string {
	h := md5.New()
	h.Write([]byte(data))
	return hex.EncodeToString(h.Sum(nil))
}
