//封装request请求，自动提示处理错误
var sendRequest = function (url, type, data, headers) {
    var promise = new Promise(function (resolve, reject) {
        $.ajax({
            type: type, //"POST" 或 "GET"
            url: url,
            data: data,
            headers:headers,
            dataType: "json",
            success: function(data){
                if(data.code == 0){
                    //成功
                    resolve(data.data)
                }else{
                    //失败
                    reject(data)
                }
            },
            error: function (error) {
                msg_fail('系统出错了，请稍后重试~~!',{icon: 5,time:1000});
            }
        });
    });
    return promise;
};

//普通图片上传
var uploadFile = function (elem,errElem,type,remark) {
    var promise = new Promise(function (resolve, reject) {
        var uploadInst = upload.render({
            elem: elem
            ,url: '/upload'
            ,before: function(obj){
                layer.load(); //上传loading
                this.data={'type':type,'remark':remark};
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $(elem).attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code !== 0){
                    return msg_fail('上传失败');
                }
                //上传成功
                resolve(res)
                layer.closeAll('loading')
            }
            ,error: function(){
                //演示失败状态，并实现重传
                if(errElem){
                    var demoText = $(errElem);
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function() {
                        uploadInst.upload();
                    })
                }
                layer.closeAll('loading')
            }
        });
    });
    return promise;
}

//普通请求方法
function request(url, data, type, header){
    return sendRequest(url, type, data, header)
}

//使用post请求
function request_post(url,data) {
    return sendRequest(url, "POST", data, {})
}

//使用get请求
function request_get(url) {
    return sendRequest(url, "GET", {}, {})
}

//成功
function msg_success(msg,time) {
    layer.msg(msg,{icon: 1,time:1000});
}

//出错
function msg_error(msg) {
    layer.msg(msg,{icon: 5,time:1000});
}

//问号
function msg_question() {
    layer.msg(msg,{icon: 3,time:1000});
}

//警告
function msg_alert(msg) {
    layer.msg(msg,{icon: 0,time:1000});
}

//锁住了
function msg_lock(msg) {
    layer.msg(msg,{icon: 0,time:1000});
}

//请求通过
function msg_pass(msg) {
    layer.msg(msg,{icon: 6,time:1000});
}

//请求失败
function msg_fail(msg) {
    layer.msg(msg,{icon: 2,time:1000});
}

