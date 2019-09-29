<?php /*a:2:{s:79:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/admin\main\index.html";i:1569665005;s:76:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/public\header.html";i:1569667776;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

    <link href="/themes/admin_simpleboot3/public/assets/themes/<?php echo cmf_get_admin_style(); ?>/bootstrap.min.css" rel="stylesheet">
    <link href="/themes/admin_simpleboot3/public/assets/simpleboot3/css/simplebootadmin.css" rel="stylesheet">
    <link href="/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">



    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        form .input-order {
            margin-bottom: 0px;
            padding: 0 2px;
            width: 42px;
            font-size: 12px;
        }

        form .input-order:focus {
            outline: none;
        }

        .table-actions {
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 0px;
        }

        .table-list {
            margin-bottom: 0px;
        }

        .form-required {
            color: red;
        }
    </style>
    <script type="text/javascript">
        //全局变量
        var GV = {
            ROOT: "/",
            WEB_ROOT: "/",
            JS_ROOT: "static/js/",
            APP: '<?php echo app('request')->module(); ?>'/*当前应用名*/
        };
    </script>
    <script src="/themes/admin_simpleboot3/public/assets/js/jquery-1.10.2.min.js"></script>
    <script src="/static/js/wind.js"></script>
    <script src="/themes/admin_simpleboot3/public/assets/js/bootstrap.min.js"></script>

    <script src="/static/js/distpicker/distpicker.data.js"></script>
    <script src="/static/js/distpicker/distpicker.js"></script>
    <script src="/static/js/distpicker/main.js"></script>

    <script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>

    <script>
        Wind.css('artDialog');
        Wind.css('layer');
        $(function () {
            $("[data-toggle='tooltip']").tooltip({
                container: 'body',
                html: true,
            });
            $("li.dropdown").hover(function () {
                $(this).addClass("open");
            }, function () {
                $(this).removeClass("open");
            });
        });
    </script>
    <style>
        #think_page_trace_open {
            z-index: 9999;
        }

        .self-nowrap{
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            width: 350px;
        }
    </style>

<style>
    .home-info li em {
        float: left;
        width: 120px;
        font-style: normal;
        font-weight: bold;
    }
</style>
<?php 
    \think\facade\Hook::listen('admin_before_head_end',null,false);
 ?>
</head>
<body>
<script>
    $(document).ready(function () {
        $.ajax({
            type: 'GET',
            url: "<?php echo API_ADDR; ?>/" + 'user/index',
            success: function (res) {
                var obj = res.data;
                $('#readYes').html(obj.readYes);
                $('#readNo').html(obj.readNo);
                $('#customerYX').html(obj.customerYX);
                $('#customerDZC').html(obj.customerDZC);
                $('#customerZC').html(obj.customerZC);
                $('#customerTY').html(obj.customerTY);
                $('#user_login').html(obj.user_login);
                $('#last_login_time').html(obj.last_login_time);
                $('#last_login_ip').html(obj.last_login_ip);
            }
        });
    });
</script>
<div class="wrap">
    <table width="100%" style="height: 85vh; overflow: hidden">
        <tr>
            <td align="middle">
                <div class="head-box">
                    <div style="padding: 30px">
                        <div style="text-align: center;float: left">
                            <img src="/upload/<?php echo $admin['avatar']; ?>" width="80px" height="80px"
                                 style="border-radius: 50%; cursor: pointer " id="changAvatar">
                            <p class="user-name">姓名：<span id="user_login"></span></p>
                        </div>
                        <table class="table-box">
                            <tr>
                                <td>未读消息</td>
                                <td id="readNo">0</td>
                            </tr>
                            <tr>
                                <td>已读消息</td>
                                <td id="readYes">0</td>
                            </tr>
                        </table>
                        <br/><br/>
                        <div style="clear: both"></div>
                        <hr color="#4169E1" style="width: 100%"/>
                        <div class="ip-css">上次登录时间：<span id="last_login_time"></span></div>
                        <div class="ip-css">上次登录IP：<span id="last_login_ip"></span></div>
                        <br/>
                        <div class="customer-css" style="text-align: left">管理的客户信息</div>
                        <table class="table-box" style="width: 100%; margin: 0">
                            <tr>
                                <td>意向客户数</td>
                                <td id="customerYX">0</td>
                            </tr>
                            <tr>
                                <td>待注册客户数</td>
                                <td id="customerDZC">0</td>
                            </tr>
                            <tr>
                                <td>正常客户数</td>
                                <td id="customerZC">0</td>
                            </tr>
                            <tr>
                                <td>停用客户数</td>
                                <td id="customerTY">0</td>
                            </tr>
                        </table>
                        <div style="clear: both"></div>
                    </div>
                </div>
            </td>
            <td style="border-left: #ddd 1px solid; width: 50%" align="middle">
                <iframe src="../../webIM/admin.html" style="width:100%;height: 616px;" frameborder="0" id="appiframe-0"
                        class="appiframe"></iframe>
            </td>
        </tr>
    </table>
</div>

<link href="/themes/admin_simpleboot3/public/assets/simpleboot3/css/fileinput.min.css" rel="stylesheet">
<link href="/themes/admin_simpleboot3/public/assets/simpleboot3/css/fileinputmin.css" rel="stylesheet">
<link href="/themes/admin_simpleboot3/public/assets/simpleboot3/css/bootstrap.min.css" rel="stylesheet">

<link href="/themes/admin_simpleboot3/public/assets/simpleboot3/js/fileinputmin.js" rel="stylesheet">
<link href="/themes/admin_simpleboot3/public/assets/simpleboot3/js/fileinput.min.js" rel="stylesheet">


<div class="dialog-box" id="uploadImg">
    <form action="/admin/index/upload" enctype="multipart/form-data" method="post">
        <div class="form-group">
            <input id="file-3" type="file" name="image" multiple=true>
        </div>
        <div class="btn-group" style="margin-left:120px">
            <input type="submit" class="btn bg-primary" value="上传"/>
        </div>
    </form>

</div>

</body>
<style>
    .head-box {
        width: 94%;
        left: 20px !important;
        background-color: #f2f2f2;
        height: 100%;
    }

    .user-name, .customer-css {
        font-size: 16px;
        font-weight: bold;
        line-height: 220%;
    }

    .ip-css {
        line-height: 35px;
        text-align: left;
        background-color: #BEBEBE;
        padding-left: 15px;

    }

    .table-box {
        float: left;
        width: 300px;
        margin: 0 30px;
    }

    .table-box tr td {
        line-height: 51px;
        height: 51px;
        border: 1px solid #333;
        text-align: center;
    }
</style>
<script>
    $(document).ready(function () {
        $("#changAvatar").on('click', function () {
            $('#uploadImg').show();
        });
    });
</script>

<style>
    /* 下拉加载 */
    .load-end {
        color: #999;
        text-align: center;
        line-height: 180%
    }

    /* 重置密码 */
    .dialog-box {
        width: 330px;
        background-color: rgba(255, 255, 255, 0.5);
        border-radius: 10px;
        padding: 10px;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-left: -165px;
        margin-top: -150px;
        border-radius: 10px;
        border: 5px solid rgba(30, 144, 255, 0.5);
        display: none;
    }

    .mody-pwd {
        padding: 5px 15px;
        background-color: #fff;
        border: 1px solid #ddd;
        display: block;
        position: relative;
        right: 10px
    }
</style>
</html>
