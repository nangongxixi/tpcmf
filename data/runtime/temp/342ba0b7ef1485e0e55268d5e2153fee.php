<?php /*a:2:{s:82:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/admin\customer\info.html";i:1569670041;s:76:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/public\header.html";i:1569667776;}*/ ?>
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

</head>
<body>
<div class="wrap">
    <ul class="nav nav-tabs">
        <li class="active"><a href="<?php echo url('customer/index', ['id'=>$id]); ?>">基本信息</a></li>
        <li><a href="<?php echo url('customer/messageList', ['id'=>$id]); ?>">对话记录</a></li>
        <li><a href="<?php echo url('customer/password', ['id'=>$id]); ?>">密码管理</a></li>
        <li><a href="<?php echo url('customer/log', ['id'=>$id]); ?>">操作日志</a></li>
    </ul>
    <table class="table" border="1" style="margin-top: 20px; border: 1px solid #ddd">
        <tr>
            <th style="width: 100px">名称</th>
            <td><?php echo $user_name; ?></td>
        </tr>
        <tr>
            <th>性别：</th>
            <td><?php echo isset($sexs[$sex]) ? $sexs[$sex] : ''; ?></td>
        </tr>
        <tr>
            <th>登录账号：</th>
            <td><?php echo $account; ?></td>
        </tr>
        <tr>
            <th>联系电话：</th>
            <td><?php echo $phone; ?></td>
        </tr>
        <tr>
            <th>所在区域：</th>
            <td><?php echo $area; ?></td>
        </tr>
        <tr>
            <th>详细地址：</th>
            <td><?php echo $address; ?></td>
        </tr>
        <tr>
            <th>QQ：</th>
            <td><?php echo $qq; ?></td>
        </tr>
        <tr>
            <th>邮箱：</th>
            <td><?php echo $email; ?></td>
        </tr>
        <tr>
            <th>备注：</th>
            <td><?php echo $remark; ?></td>
        </tr>
    </table>
    <style>
        table tr th{
            height: 40px !important;
            line-height: 40px !important;
        }
    </style>
</div>
<script src="/static/js/admin.js"></script>
</body>
</html>


