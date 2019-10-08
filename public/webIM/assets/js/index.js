/*页面加载*/
window.onload = function () {
    var customer = JSON.parse(sessionStorage.getItem("customer"));

    //忘记密码提示
    $('#forgetPwd').click(function () {
        $msg = rqst('customer/index/forgetPwd');
        layer.msg($msg);
    });

    //登录
    $('#login').click(function () {
        var user = $('#user').val();
        var pwd = $('#pwd').val();
        var data = rqst('customer/index/login', {"username": user, "password": pwd});
        sessionStorage.setItem("customer", JSON.stringify(data));
        messageList();
        $('#loginPage').addClass('hide');
        $('#main').removeClass('hide');
    });

    //退出登录
    $('#logout').click(logoutClick);

    //初始化聊天记录
    if (customer) {
        $('#loginPage').addClass('hide');
        $('#main').removeClass('hide');
        if (customer.token) {
            messageList();
        }
    } else {
        $('#loginPage').removeClass('hide');
        $('#main').addClass('hide');
    }

    //绑定按钮
    $(document).keydown(function (event) {
        if (event.keyCode == 13 && event.ctrlKey) {
            sendClick();
        }
    });

    $('#file').change(function () {
        sendPrivatePicture('file');
    });

    $('#toregister').click(function () {
        layer.msg($(this).attr('msg'));
    });

    $('#toLogin').click(function () {
        divHide('#loginPage', '#registerPage');
    });
    $('#send').click(sendClick);
    $('.face').click(faceBoxClick);
    $('.face li').click(function () {
        chooseFaceClick(this);
    });
    $('#repwd').click(function () {
        $('#dialog-box').show();
    });
    $('#closeBtn').click(function () {
        $('#dialog-box').hide();
    });

    //重置密码
    $('#submitBtn').click(function () {
        $oldPwd = $('#dialog-box input[name="oldPwd"]').val();
        $newPwd = $('#dialog-box input[name="newPwd"]').val();
        $reNewPwd = $('#dialog-box input[name="reNewPwd"]').val();
        if (!$oldPwd || !$newPwd || !$reNewPwd) {
            layer.msg("请输入完整信息");
            return false;
        }
        if ($newPwd !== $reNewPwd) {
            layer.msg("两次输入不一致");
            return false;
        }
        rqst('customer/index/resetPwd', {token: customer.token, oldPwd: $oldPwd, newPwd: $newPwd});
        sessionStorage.removeItem("customer");
        window.location.reload();
    });

    //滚动加载更多
    $(document).ready(function () {
        var page = 2;
        var isLoad = false;
        $("#ChatRosters-123").unbind("scroll").bind("scroll", function (e) {
            if (isLoad) {
                return false;
            }
            if ($(this).scrollTop() < 20) {
                var customer = JSON.parse(sessionStorage.getItem("customer"));
                var data = rqst('message/index/customerMessageListAll', {"token": customer.token, "page": page});
                if (data.length < 10) {
                    isLoad = true;
                    $('#ChatRosters-123').prepend('<div class="load-end">———— 我是有底线的 ————</div>');
                    return false;
                }
                data.reverse();
                var html = '';
                for (var i = 0; i < data.length; i++) {
                    //客服
                    if (data[i].user_type === 1) {
                        html += '<div class="otherMsg"><img src="assets/img/tx.jpg" width="40px" height="40px" id="limg">' +
                            '<h4>鼎健在线客服</h4>' +
                            '<span>' + data[i].content + '</span></div>';
                    }
                    //客户
                    if (data[i].user_type === 2) {
                        html += '<div class="myMsg">' +
                            '<img src="' + customer.avatar + '" width="40px" height="40px" id="rimg">' +
                            '<h4>' + customer.nickname + '</h4>' +
                            '<span>' + data[i].id + data[i].content + '</span>' +
                            '</div>';
                    }
                }
                $('#ChatRosters-123').prepend(html);
                page++;
            }
        });
    });
};

var apiName = 'http://172.96.192.130/api.php?s=';
// var apiName = 'http://www.dj.com/api.php?s=';
var rqst = function ($url, $param) {
    var result = '';
    $.ajax({
        type: 'POST',
        url: apiName + $url,
        data: $param,
        async: false,
        success: function (res) {
            if (res.code !== 200) {
                layer.msg(res.msg);
                event = event || window.event;
                if (event.preventDefault) {  //非IE下内核 webkit引擎
                    event.preventDefault();
                } else {
                    event.returnValue = false; //IE引擎
                }
            }
            result = res.data;
        }
    });
    return result;
}

var messageList = function () {
    var customer = JSON.parse(sessionStorage.getItem("customer"));
    var res = rqst('message/index/customerMessageListAll', {"token": customer.token});
    appendList(res); //聊天记录
    sessionStorage.setItem('message_nums', messageNums());//更新当前数量数量
}

//聊天记录样式
var appendList = function (data) {
    var customer = JSON.parse(sessionStorage.getItem("customer"));
    var html = '';
    data.reverse();
    for (var i = 0; i < data.length; i++) {
        //客服
        if (data[i].user_type === 1) {
            html += '<div class="otherMsg"><img src="assets/img/tx.jpg" width="40px" height="40px" id="limg">' +
                '<h4>鼎健在线客服</h4>' +
                '<span>' + data[i].content + '</span></div>';
        }
        //客户
        if (data[i].user_type === 2) {
            html += '<div class="myMsg">' +
                '<img src="' + customer.avatar + '" width="40px" height="40px" id="rimg">' +
                '<h4>' + data[i].id + customer.nickname + '</h4>' +
                '<span>' + data[i].content + '</span>' +
                '</div>';
        }
    }
    appendScroll(html);
}

// 界面样式全局变量
var textMsg = '#text'; //需要发送的消息

/*基本API*/
var sendPrivatePicture = function (obj) {
    var chatdiv = $('<div>').attr({
        class: 'myMsg'
    });
    $('<img>')
        .attr({
            src: 'assets/img/tx.jpg',
            width: '40px',
            height: '40px',
            id: 'rimg'
        })
        .appendTo(chatdiv);
    var text = $('#text').text();
    var span = $('<span>').appendTo(chatdiv);
    $('<img>')
        .attr({
            // src: data.uri + '/' + data.entities[0].uuid,
            src: 'https://rs-m.jc001.cn/expo/001/1/2019/25009bfe288c5c639d0412538708e772.jpg',
            width: '300px'
        })
        .appendTo(span);
    $('#ChatRosters-123').append(chatdiv);
    // 图片延时
    setTimeout(function () {
        scrollBottom('#ChatRosters-123');
    }, 500);
}; //私聊发送图片

var customer = JSON.parse(sessionStorage.getItem("customer"));
if (customer) {
    var token = customer.token;
}

var logoutClick = function () {
    layer.confirm('您确定要退出？', {
        btn: ['确定', '取消'] //按钮
    }, function () {
        sessionStorage.removeItem("customer");
        window.location.reload();
    });
};

var faceBoxClick = function () {
    $('.face ul').toggleClass('hide');
}; //表情盒子点击事件

if (token) {
    setInterval(function () {
        $preNums = parseInt(sessionStorage.getItem('message_nums'));
        $currNums = messageNums();
        if ($currNums > $preNums) {
            messageList();
        }
    }, 3000);
}

//当前客户的消息数量
var messageNums = function () {
    var customer = JSON.parse(sessionStorage.getItem("customer"));
    return rqst('message/index/customerMessageNums', {"token": customer.token});
}

var sendClick = function () {
    var html = $('#text').html();
    var customer = JSON.parse(sessionStorage.getItem("customer"));
    if (html.length < 1) {
        layer.msg('请输入内容');
        return false;
    }
    rqst('message/index/customerSendMessage', {"content": html, 'token': customer.token});

    var chatdiv = '<div class="myMsg">' +
        '<img src="' + customer.avatar + '" width="40px" height="40px" id="rimg">' +
        '<h4>' + customer.nickname + '</h4>' +
        '<span>' + html + '</span>' +
        '</div>';
    appendScroll(chatdiv);
};

var appendScroll = function (html) {
    $('#ChatRosters-123').append(html);
    scrollBottom('#ChatRosters-123');
    // 清空输入框内容
    $(textMsg).text('');
    //保存当前数量数量
    sessionStorage.setItem('message_nums', messageNums());
}

var chooseFaceClick = function (li) {
    var a = $(li).html();
    // console.log(a);
    var text0 = $(li).attr('key');
    var text1 = $('#text').text();
    // $("#text").text(text1+text0+a);
    $('#text').append(a);
    var b = WebIM.utils.parseEmoji(text0);
    console.log(b);
}; //选择表情事件

var scrollBottom = function (obj) {
    $(obj).scrollTop($(obj).prop('scrollHeight'));
}; //让聊天窗口滚动条处于底部
