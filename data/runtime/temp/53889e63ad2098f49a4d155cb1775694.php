<?php /*a:2:{s:90:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/admin\customer\message_list.html";i:1569670099;s:76:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/public\header.html";i:1569667776;}*/ ?>
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

<link href="/webIM/assets/css/index.css" rel="stylesheet" type="text/css">
<body style="background: none; background-color: #fff">
<div class="wrap">
    <ul class="nav nav-tabs">
        <li><a href="<?php echo url('customer/index', ['id'=>$id]); ?>">基本信息</a></li>
        <li  class="active"><a href="<?php echo url('customer/messageList', ['id'=>$id]); ?>">对话记录</a></li>
        <li><a href="<?php echo url('customer/password', ['id'=>$id]); ?>">密码管理</a></li>
        <li><a href="<?php echo url('customer/log', ['id'=>$id]); ?>">操作日志</a></li>
    </ul>
    <form class="well form-inline margin-top-20" method="get" action="<?php echo url('RecordLog/index'); ?>">
        从
        <input type="text" class="form-control js-date" name="begin_time" style="width: 120px;"
               value="<?php echo input('request.begin_time/s',''); ?>" placeholder="开始时间">
        至
        <input type="text" class="form-control js-date" name="end_time" style="width: 120px;"
               value="<?php echo input('request.end_time/s',''); ?>" placeholder="结束时间">
        &nbsp;&nbsp;
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('RecordLog/index'); ?>">清空</a>
    </form>

    <div id="ChatRosters-123" class="chat-box-content main-box">
        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): if($vo['user_type'] == 1): ?>
                <div class="myMsg">
                    <img src="https://ss2.bdstjpg" width="40px" height="40px" id="rimg"><h4><?php echo $vo['uid']; ?></h4>
                    <span><?php echo $vo['content']; ?></span>
                </div>
            <?php endif; if($vo['user_type'] == 2): ?>
                <div class="otherMsg"><img src="https://wx-demjpg" width="40px" height="40px" id="limg"><h4><?php echo $vo['uid']; ?></h4>
                <span><?php echo $vo['content']; ?></span></div>
            <?php endif; ?>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
    <div class="pagination" style="margin-left: 45%; margin-top: -5px;"><?php echo $page; ?></div>
    <style>
        table tr th {
            height: 40px !important;
            line-height: 40px !important;
        }
    </style>
</div>
<script src="/static/js/admin.js"></script>
<style>
    .main-box{
        width: 750px;
        margin: 150px auto 0;
        background-color: #eee;
        height: 500px;
        padding: 30px; border: 1px solid #999
    }
</style>
</body>
</html>


