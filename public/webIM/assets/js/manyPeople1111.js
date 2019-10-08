/*页面加载*/
window.onload = function () {
    appendList(); //聊天记录
    customerList(); //客户列表
    userList(); //员工列表
    sessionStorage.setItem('customer_login_token', '5d8c0a0e69be5');

    $('#search-customer').on('click', function () {
        var worker_uid = $('.form-data select[name="worker_uid"]').val();
        var area1 = $('.form-data select[name="area1"]').val();
        var area2 = $('.form-data select[name="area2"]').val();
        var area3 = $('.form-data select[name="area3"]').val();
        var data = {worker_uid: worker_uid, area1: area1, area2: area2, area3: area3};
        customerList(data);
    });

    var currLoginCustomer = sessionStorage.getItem('customer_login_token');
    console.log(currLoginCustomer)
    if (currLoginCustomer) {
        $('#loginPage').addClass('hide');
        $('#main').removeClass('hide');
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
    setMainMargin(); //动态设置聊天窗口的margin
    $('#file').change(function () {
        console.log(555);
        sendPrivatePicture('file');
    });

    $('#login').click(loginClick);
    $('#register').click(registerClick);
    $('#logout').click(logoutClick);
    $('#toregister').click(function () {
        divHide('#registerPage', '#loginPage');
    });
    $('#toLogin').click(function () {
        divHide('#loginPage', '#registerPage');
    });
    $('#send').click(sendClick);
    $('.face').click(faceBoxClick);
    $('.face li').click(function () {
        chooseFaceClick(this);
    });
    $('#reset').click(resetCustomer);

    var page = 2;
    var isLoad = false;
    $("#ChatRosters-123").unbind("scroll").bind("scroll", function (e) {
        if (isLoad) {
            return false;
        }
        if ($(this).scrollTop() < 20) {
            var worker_uid = sessionStorage.getItem('curr_customer_id');
            var dataObj = {worker_uid: worker_uid, page: page};
            $.ajax({
                type: 'POST',
                url: apiName + 'message/user/customerList',
                data: dataObj,
                async: false,
                success: function (res) {
                    if (res.data.length < 10) {
                        isLoad = true;
                        $('#ChatRosters-123').prepend('<div class="load-end">———— 我是有底线的 ————</div>');
                        return false;
                    }

                    var html = '';
                    for (var i = 0; i < res.data.length; i++) {
                        //客户列表
                        var avatar = res.data[i].avatar;
                        if (!res.data[i].avatar) {
                            avatar = 'assets/img/tx.jpg';
                        }
                        html += '<a class="sel-cus" style="cursor: pointer" data-id="' + res.data[i].id + '" data-title="' + res.data[i].user_name + '" data-msg="' + res.data[i].login_token + '">' +
                            '<img src="' + avatar + '" width="40px" height="40px">' +
                            '<i id="redP-1231a">1</i><span>' + res.data[i].user_name + '</span>' +
                            '</a>';
                    }
                    $('#friend').html(" ");
                    $('#friend').append(html);
                    page ++;
                }
            });

        }
    });

};

var resetCustomer = function () {
    $('.form-data select[name="worker_uid"]').val("");
    $("#distpicker").distpicker({
        province: '北京市',
        city: '北京市市辖区',
        district: '东城区',
    });
    customerList();
}

//客户列表
var customerList = function (data = {}) {
    var dataObj = {"token": sessionStorage.getItem('customer_login_token')};
    if (data) {
        dataObj = data;
    }
    $.ajax({
        type: 'POST',
        url: apiName + 'message/user/customerList',
        data: dataObj,
        success: function (res) {
            var html = '';
            for (var i = 0; i < res.data.length; i++) {
                //客户列表
                var avatar = res.data[i].avatar;
                if (!res.data[i].avatar) {
                    avatar = 'assets/img/tx.jpg';
                }
                html += '<a class="sel-cus" style="cursor: pointer" data-id="' + res.data[i].id + '" data-title="' + res.data[i].user_name + '" data-msg="' + res.data[i].login_token + '">' +
                    '<img src="' + avatar + '" width="40px" height="40px">' +
                    '<i id="redP-1231a">1</i><span>' + res.data[i].user_name + '</span>' +
                    '</a>';
            }
            $('#friend').html(" ");
            $('#friend').append(html);

            //选择客户
            $('#friend .sel-cus').on('click', function () {
                var id = $(this).attr('data-id');
                var name = $(this).attr('data-title');
                var token = $(this).attr('data-msg');
                $(this).css({"background-color": "#006fc4"}).siblings().css({"background-color": ""});
                $('.chat-box-hd span').html(name);
                sessionStorage.setItem('customer_login_token', token);
                sessionStorage.setItem('curr_customer_id', id);
                appendList();
            });
        }
    });
}

//员工列表
var userList = function () {
    $.ajax({
        type: 'GET',
        url: apiName + 'message/user/userList',
        success: function (res) {
            var html = '';
            for (var i = 0; i < res.data.length; i++) {
                //客户列表
                var avatar = res.data[i].avatar;
                if (!res.data[i].avatar) {
                    avatar = 'assets/img/tx.jpg';
                }
                html += '<option value="' + res.data[i].id + '">' + res.data[i].user_nickname + '</option>';
            }
            $('select[name="worker_uid"]').append(html);
        }
    });
}

var selectCustomer = function (e) {
    console.log($(e).attr('data-id'))
}

// 界面样式全局变量
// var apiName = 'http://172.96.192.130/api.php?s=';
var apiName = 'http://www.dj.com/api.php?s=';
var chatBoxContent = '#chat-box-content'; //聊天盒子内容容器
var chatObj = '.chat-box-hd span'; //聊天对象名字
var textMsg = '#text'; //需要发送的消息
var chatBox = '.chat-box'; //聊天盒子
var chatCover = '.chat-cover'; //聊天封面

/*基本功能*/
var buildChatRostersDiv = function (roster) {
    for (i = 0; i < roster.length; i++) {
        var id = 'ChatRosters-' + roster[i].name;
        appendChatDiv(id, chatBoxContent);
    }
}; // 构建好友聊天盒子

var handleTextMessage = function (message) {
    var chatdiv = $('<div>').attr({
        class: 'otherMsg'
    });
    $('<img>')
        .attr({
            src: './demo/img/bb.jpg',
            width: '40px',
            height: '40px',
            id: 'limg'
        })
        .appendTo(chatdiv);
    console.log(message);
    $('<h4>')
        .text(message.from)
        .appendTo(chatdiv);
    $('<span>')
        .html(message.data)
        .appendTo(chatdiv);
    $('#' + msgObjDivId).append(chatdiv);
    scrollBottom('#' + msgObjDivId);
    // 小红点添加
    if (curAcceptMsgObjDivId == null || msgObjDivId != curAcceptMsgObjDivId) {
        if (msgObjDivId in redPCache) {
            var redIVal = $('#' + listObjIId + ' i').text();
            redIVal = parseInt(redIVal) + 1;
            $('#' + listObjIId + ' i').text(redIVal);
        } else {
            var redI = $('<i>')
                .attr({
                    id: 'redP-' + msgObjDivId
                })
                .text(1);
            $('#' + listObjIId).append(redI);
            redPCache[msgObjDivId] = true;
        }
    }
}; //处理接受文字消息

/*基本API*/
var sendPrivateText = function (text, obj) {
    var id = conn.getUniqueId();
    var msg = new WebIM.message('txt', id);
    msg.set({
        msg: text, // 消息内容
        to: obj, // 接收消息对象
        roomType: false,
        success: function (id, serverMsgId) {
            console.log('发送私聊信息成功');
        },
        fail: function (e) {
            console.log('发送私聊信息失败');
        }
    });
    msg.body.chatType = 'singleChat';
    conn.send(msg.body);
}; // 私聊发送文本消息，发送表情同发送文本消息，只是会在对方客户端将表情文本进行解析成图片

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

var curAcceptMsgObj = '#ChatRosters-123'; //当前接受消息对象
var curAcceptMsgObjType = null; //当前接受消息对象类型
var curAcceptMsgObjDivId = null; //当前接受消息对象Divid
var curOwner = null;
var redPCache = {};

/*点击事件*/
var registerClick = function () {
    var a = $('#username').val();
    var b = $('#password').val();
    var c = $('#nickname').val();
    register(a, b, c);
}; //点击注册事件

var loginClick = function () {
    var user = $('#user').val();
    var pwd = $('#pwd').val();
    var dataObj = {"username": user, "password": pwd};
    console.log(dataObj)
    $.ajax({
        type: 'POST',
        url: apiName + 'customer/index/login',
        data: dataObj,
        success: function (res) {
            if (res.code !== 200) {
                layer.msg(res.msg);
                return false;
            }
            sessionStorage.setItem("customer_login_token", res.data.token);
            layer.msg(res.msg);
            $('#loginPage').addClass('hide');
            $('#main').removeClass('hide');
        }
    });
}; //点击登录按钮事件

var logoutClick = function () {
    layer.confirm('您确定要退出？', {
        btn: ['确定', '取消'] //按钮
    }, function () {
        sessionStorage.removeItem("customer_login_token");
        window.location.reload();
    });

}; //点击登出事件

var listMenuClick = function () {
    $('.list-menu ul').toggleClass('hide');
}; // 点击列表菜单事件
var addFriendsClick = function () {
    var name = $('#addFriendName').val();
    var msg = $('#addFriendMsg').val();
    addFriends(name, msg);
}; //点击添加好友事件
var chatMenuClick = function () {
    $('.chat-box-hd a ul').empty();
    if (curAcceptMsgObjType == 'chat') {
        var li = $('<li>')
            .attr({
                id: 'removeFriends',
                class: 'list-group-item'
            })
            .text('删除好友')
            .click(removeFriendsClick);
        $('.chat-box-hd a ul').append(li);
    } else if (curAcceptMsgObjType == 'groupchat') {
        if (curOwner == curUserId) {
            var id = $('#' + curAcceptMsgObjDivId.replace(/Chat/, 'List')).attr('hidename');
            var lia = $('<li>')
                .attr({
                    class: 'list-group-item'
                })
                .text('群ID：' + id);
            var li = $('<li>')
                .attr({
                    id: 'quitGroups',
                    class: 'list-group-item'
                })
                .text('解散群组')
                .click(unGroupClick);
            $('.chat-box-hd a ul').append(li);
            $('.chat-box-hd a ul').append(lia);
        } else {
            var id = $('#' + curAcceptMsgObjDivId.replace(/Chat/, 'List')).attr('hidename');
            var lia = $('<li>')
                .attr({
                    class: 'list-group-item'
                })
                .text('群ID：' + id);
            var li = $('<li>')
                .attr({
                    id: 'quitGroups',
                    class: 'list-group-item'
                })
                .text('退出群组')
                .click(leaveGroupClick);
            $('.chat-box-hd a ul').append(li);
            $('.chat-box-hd a ul').append(lia);
        }
    }
    $('.chat-box-hd a ul').toggleClass('hide');
}; // 点击聊天菜单事件

var createGroupsClick = function () {
    var value = $('#createGroupName').val();
    var info = $('#createGroupInfo').val();
    var members = [curUserId];
    createGroups(value, info, members, true, true, true);
}; //点击创建群事件
var joinGroupsClick = function () {
    var id = $('#addGroupId').val();
    joinGroups(id);
}; //点击添加群事件
var faceBoxClick = function () {
    $('.face ul').toggleClass('hide');
}; //表情盒子点击事件

var appendList = function () {
    var dataObj = {"token": sessionStorage.getItem('customer_login_token')};
    $.ajax({
        type: 'POST',
        url: apiName + 'message/index/userMessageList',
        data: dataObj,
        success: function (res) {
            var html = '';
            for (var i = 0; i < res.data.length; i++) {
                //客服
                if (res.data[i].user_type === 2) {
                    html += '<div class="otherMsg"><img src="https://wx-demo-api.jc001.cn/images/agent/head1.jpg" width="40px" height="40px" id="limg">' +
                        '<h4>鼎健在线客服</h4>\n' +
                        '<span>' + res.data[i].content + '</span></div>';
                }
                //客户
                if (res.data[i].user_type === 1) {
                    html += '<div class="myMsg">' +
                        '<img src="https://wx-demo-api.jc001.cn/images/agent/head1.jpg" width="40px" height="40px" id="rimg">' +
                        '<h4>鼎健在线客服</h4>\n' +
                        '<span>' + res.data[i].content + '</span>\n' +
                        '</div>';
                }
            }
            $('#ChatRosters-123').html(" ");
            $('#ChatRosters-123').append(html);
            scrollBottom('#ChatRosters-123');
            console.log(res.data)
            //保存当前数量数量
            sessionStorage.setItem('message_nums', messageNums());
        }
    });
}

setInterval(function () {
    $preNums = parseInt(sessionStorage.getItem('message_nums'));
    $currNums = messageNums();
    if ($currNums > $preNums) {
        appendList();
    }
}, 3000);

//当前客户的消息数量
var messageNums =
    function () {
        var nums = 0;
        $.ajax({
            type: 'GET',
            async: false,
            url: apiName + 'message/index/totalNums&token=' + sessionStorage.getItem('customer_login_token'),
            success: function (res) {
                nums = res.data
            }
        });
        return nums;
    }

var sendClick = function () {
    var html = $('#text').html();
    if (html.length < 1) {
        layer.msg('请输入内容');
        return false;
    }
    var dataObj = {"content": html, 'from_uid': sessionStorage.getItem('curr_customer_id')};
    $.ajax({
        type: 'POST',
        url: apiName + 'message/user/sendMessage',
        data: dataObj,
        success: function () {
            console.log('successl');
            if (html != null && html != '') {
                // 把发送的消息添加进消息盒子中
                var chatdiv = $('<div>').attr({
                    class: 'myMsg'
                });
                $('<img>')
                    .attr({
                        src: './asset/img/tx.jpg',
                        width: '40px',
                        height: '40px',
                        id: 'rimg'
                    })
                    .appendTo(chatdiv);
                var text = $('#text').html();
                $('<span>')
                    .html(text)
                    .appendTo(chatdiv);
                $('#ChatRosters-123').append(chatdiv);
                scrollBottom('#ChatRosters-123');
                // 清空输入框内容
                $(textMsg).text('');
                //保存当前数量数量
                sessionStorage.setItem('message_nums', messageNums());
            }
        },
    });
}; // 点击发送按钮处理的事件

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

var divHide = function () {
    for (let i = 1, len = arguments.length; i < len; i++) {
        $(arguments[i]).addClass('hide');
    }
    $(arguments[0]).removeClass('hide');
};
var chooseListDivClick = function (li) {
    var chooseObjId = li.id;
    var chooseObjDivId = chooseObjId.replace(/List/, 'Chat');
    var chooseAcceptMsgObj = $('#' + chooseObjId).attr('hidename');
    $(chatObj).text($(li).attr('displayName')); //显示当前对象聊天名字
    $('#' + chooseObjId).addClass('listColor'); //显示焦点背景颜色
    $('#' + chooseObjDivId).removeClass('hide'); //显示当前对象聊天div
    curAcceptMsgObjDivId = chooseObjDivId;
    curAcceptMsgObj = chooseAcceptMsgObj;
    curAcceptMsgObjType = li.type;
}; //选择列表事件

var setMainMargin = function () {
    if ($(window).height() <= 750) {
        $('.main').attr('style', 'margin-top:0px;');
    } else if ($(window).height() > 750) {
        $('.main').attr('style', 'margin-top:0;');
    }
    $(window).resize(function () {
        if ($(window).height() <= 750) {
            $('.main').attr('style', 'margin-top:0px;');
        } else if ($(window).height() > 750) {
            $('.main').attr('style', 'margin-top:0;');
        }
    });
}; //动态设置聊天窗口的margin
