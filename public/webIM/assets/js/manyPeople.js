/*页面加载*/
window.onload = function () {

    //默认清空token
    sessionStorage.removeItem("customer_login_token");
    $('.chat-box-input').hide();
    $('.chat-box-content').css({height: 560});

    messageListAll(); //聊天记录
    customerList(); //客户列表
    userList(); //员工列表

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

    //滚动加载更多
    $(document).ready(function () {

        //选择客户
        $('#friend .sel-cus').on('click', function () {
            $('#ChatRosters-123').html(" ");
            isLoad = false;

            $('.chat-box-input').show();
            $('.chat-box-content').css({height: 380});

            var id = $(this).attr('data-id');
            var name = $(this).attr('data-title');
            var token = $(this).attr('data-msg');
            $(this).css({"background-color": "#006fc4"}).siblings().css({"background-color": ""});
            $('.chat-box-hd span').html(name);
            sessionStorage.setItem('customer_login_token', token);
            sessionStorage.setItem('curr_customer_id', id);
            messageList();
        });

        var isLoad = false;
        var page = 2;
        $("#ChatRosters-123").unbind("scroll").bind("scroll", function (e) {
            console.log('我滚动了')
            if (isLoad) {
                return false;
            }
            console.log('我滚动了111')
            if ($(this).scrollTop() < 10) {
                var token = sessionStorage.getItem('customer_login_token');
                if(token){
                    //指定客户
                    var data = rqst('message/index/userMessageList', {"token": token, "page": page});
                }else{
                    //全部
                    var data = rqst('message/index/userMessageListAll', {"page": page});
                }

                if (data.length < 10) {
                    isLoad = true;
                    $('#ChatRosters-123').prepend('<div class="load-end">———— 我是有底线的 ————</div>');
                    return false;
                }
                data.reverse();
                var html = '';
                for (var i = 0; i < data.length; i++) {
                    //客服
                    if (data[i].user_type === 2) {
                        html += '<div class="otherMsg">' +
                            '<img src="' + data[i].sender_avatar + '" width="40px" height="40px" id="limg">' +
                            '<h4>' + data[i].sender_nickname + '</h4>' +
                            '<span>' + data[i].id + data[i].content + '</span></div>';
                    }
                    //客户
                    if (data[i].user_type === 1) {
                        html += '<div class="myMsg">' +
                            '<img src="' + data[i].accepter_avatar + '" width="40px" height="40px" id="rimg">' +
                            '<h4>鼎健在线客服</h4>' +
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
                return false;
            }
            result = res.data;
        }
    });
    return result;
}

//客户列表
var customerList = function (data = {}) {
    var token = sessionStorage.getItem('customer_login_token');
    var dataObj = {"token": token};
    if (data) {
        dataObj = data;
    }
    var data = rqst('message/user/customerList', dataObj);
    var html = '';
    for (var i = 0; i < data.length; i++) {
        //客户列表
        var avatar = data[i].avatar;
        if (!data[i].avatar) {
            avatar = 'assets/img/tx.jpg';
        }
        html += '<a class="sel-cus" style="cursor: pointer" data-id="' + data[i].id + '" data-title="' + data[i].user_name + '" data-msg="' + data[i].login_token + '">' +
            '<img src="' + avatar + '" width="40px" height="40px">' +
            '<i id="redP-1231a">1</i><span>' + data[i].user_name + '</span>' +
            '</a>';
    }
    $('#friend').html(" ");
    $('#friend').append(html);
}

//员工列表
var userList = function () {
    var data = rqst('message/user/userList');
    var html = '';
    for (var i = 0; i < data.length; i++) {
        //客户列表
        var avatar = data[i].avatar;
        if (!data[i].avatar) {
            avatar = 'assets/img/tx.jpg';
        }
        html += '<option value="' + data[i].id + '">' + data[i].user_nickname + '</option>';
    }
    $('select[name="worker_uid"]').append(html);
}

var messageListAll = function () {
    var res = rqst('message/index/userMessageListAll');
    appendList(res); //聊天记录
}

var messageList = function () {
    var token = sessionStorage.getItem('customer_login_token');
    var res = rqst('message/index/userMessageList', {"token": token});
    appendList(res); //聊天记录
/*    if(res.length < 10){
        $('#ChatRosters-123').prepend('<div class="load-end">———— 我是有底线的 ————</div>');
    }*/
    sessionStorage.setItem('message_nums', messageNums());//更新当前数量数量
}

//聊天记录样式
var appendList = function (data) {
    var html = '';
    if (data.length) {
        data.reverse();
    }
    for (var i = 0; i < data.length; i++) {
        //客服
        if (data[i].user_type === 2) {
            html += '<div class="otherMsg">' +
                '<img src="' + data[i].sender_avatar + '" width="40px" height="40px" id="limg">' +
                '<h4>' + data[i].sender_nickname + '</h4>' +
                '<span>' + data[i].content + '</span></div>';
        }
        //客户
        if (data[i].user_type === 1) {
            html += '<div class="myMsg">' +
                '<img src="' + data[i].accepter_avatar + '" width="40px" height="40px" id="rimg">' +
                '<h4>鼎健在线客服</h4>' +
                '<span>' + data[i].id + data[i].content + '</span>' +
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

var token = sessionStorage.getItem('customer_login_token');

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
    }, 99993000);
}

//当前客户的消息数量
var messageNums = function () {
    var token = sessionStorage.getItem('customer_login_token');
    return rqst('message/index/userMessageNums', {"token": token});
}

var sendClick = function () {
    var html = $('#text').html();
    var token = sessionStorage.getItem('customer_login_token');
    if (html.length < 1) {
        layer.msg('请输入内容');
        return false;
    }
    rqst('message/index/userSendMessage', {"content": html, 'token': token});

    var chatdiv = '<div class="myMsg">' +
        '<img src="assets/img/tx.jpg" width="40px" height="40px" id="rimg">' +
        '<h4>鼎健客服</h4>' +
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
