package utils

import (
	"bytes"
	"fmt"
	"net/url"
	"strconv"
)

type Page struct {
	PageNo     int         //当前页
	PageSize   int         //每页数量
	TotalPage  int         //总页数
	TotalCount int         //总条数
	PageUrl    string      //URL地址
	FirstPage  bool        //上一页
	LastPage   bool        //下一页
	List       interface{} //数据
}

func PageUtil(count int, pageSize int, pageUrl string, list interface{}) Page {
	tp := count / pageSize
	if count%pageSize > 0 {
		tp = count/pageSize + 1
	}
	pageNo := 1
	u, _ := url.Parse(pageUrl)
	q := u.Query()
	page := q.Get("page")
	if page != "" {
		var err interface{}
		pageNo, err = strconv.Atoi(page)
		if err != nil {
			//如果传入的是不可识别的数组,则是第1页
			pageNo = 1
		}
	}
	return Page{PageNo: pageNo, PageSize: pageSize, TotalPage: tp, TotalCount: count, PageUrl: pageUrl, FirstPage: pageNo == 1, LastPage: pageNo == tp, List: list}
}

func (this *Page) url(page int) string {
	u, _ := url.Parse(this.PageUrl)
	q := u.Query()
	q.Set("page", strconv.Itoa(page))
	u.RawQuery = q.Encode()
	return u.String()
}

//转换成分页文本
func (this *Page) ToString() string {
	var buf bytes.Buffer

	//当前页左右的页面数量
	offset := 4

	buf.WriteString("<div class='page'><div>")
	//输出上一页
	if !this.FirstPage {
		buf.WriteString(fmt.Sprintf("<a class=\"prev\" href=\"%s\">&lt;</a>", this.url(this.PageNo-1)))
	}
	//输出左边的页面
	pageNo := this.PageNo
	//最低页面
	offsetSumNo := pageNo - offset
	//如果页数不足1，则从第1开始
	if offsetSumNo <= 0 {
		offsetSumNo = 1
	}

	//第一页
	if pageNo > (offset + 1) {
		buf.WriteString(fmt.Sprintf("<a style=\"background:#efefef;\" class=\"next\" href=\"%s\">%d</a>", this.url(1), 1))
	}

	//左边的页数
	for pageNo > offsetSumNo {
		//如果页数大于当前页则退出
		if offsetSumNo >= this.TotalPage {
			break
		}
		buf.WriteString(fmt.Sprintf("<a class=\"num\" href=\"%s\">%d</a>", this.url(offsetSumNo), offsetSumNo))
		offsetSumNo++
	}

	//输出当前页
	buf.WriteString(fmt.Sprintf("<span class=\"current\">%d</span>", this.PageNo))
	//输出右边的页
	pageNo = this.PageNo + 1 //+1表示不考虑当前页
	maxPage := pageNo + offset
	//如果最大的页数大于总页数,则偏移页等于总页
	if maxPage > this.TotalPage {
		maxPage = this.TotalPage
	}
	//遍历右边的页数
	for maxPage > pageNo {
		buf.WriteString(fmt.Sprintf("<a class=\"num\" href=\"%s\">%d</a>", this.url(pageNo), pageNo))
		pageNo++
	}

	if this.TotalPage != 0 {
		//最后一页
		if this.PageNo != this.TotalPage {
			buf.WriteString(fmt.Sprintf("<a style=\"background:#efefef;\" class=\"next\" href=\"%s\">%d</a>", this.url(this.TotalPage), this.TotalPage))
		}

		//输出下一页
		if !this.LastPage {
			buf.WriteString(fmt.Sprintf("<a class=\"next\" href=\"%s\">&gt;</a>", this.url(this.PageNo+1)))
		}
	}

	buf.WriteString("</div></div>")
	return buf.String()
}
