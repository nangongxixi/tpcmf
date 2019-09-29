<?php /*a:2:{s:85:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/admin\record_log\index.html";i:1569631105;s:76:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/public\header.html";i:1569667776;}*/ ?>
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
        <li class="active"><a>操作日志</a></li>
    </ul>
    <form class="well form-inline margin-top-20" method="get" action="<?php echo url('RecordLog/index'); ?>">
        从
        <input type="text" class="form-control js-date" name="begin_time" style="width: 120px;"
               value="<?php echo input('request.begin_time/s',''); ?>" placeholder="开始时间">
        至
        <input type="text" class="form-control js-date" name="end_time" style="width: 120px;"
               value="<?php echo input('request.end_time/s',''); ?>" placeholder="结束时间">
        &nbsp;&nbsp;
        员工:
        <select class="form-control" name="uid">
            <option value="">请选择员工</option>
            <?php if(is_array($userList) || $userList instanceof \think\Collection || $userList instanceof \think\Paginator): if( count($userList)==0 ) : echo "" ;else: foreach($userList as $key=>$vo): ?>
                <option value="<?php echo $vo['id']; ?>"
                <?php echo isset($args['uid'])&&$args['uid']==$vo['id']?'selected':'' ?>
                ><?php echo $vo['user_login']; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
        &nbsp;&nbsp;
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('RecordLog/index'); ?>">清空</a>
    </form>
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th>序号</th>
            <th>时间</th>
            <th>账号</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
            <tr>
                <td><?php echo $vo['id']; ?></td>
                <td><?php echo $vo['create_time']; ?></td>
                <td><?php echo $vo['nickname']; ?></td>
                <td>
                    <?php 
                        if ($vo['type'] < 10) {
                            echo $logType[$vo['type'] ?? 0] . ' ' . $vo['role']['name']??'';
                        }
                        if ($vo['type'] > 10 && $vo['type'] < 20) {
                            echo $logType[$vo['type']] . ' ' . $vo['user']['user_nickname'];
                        }
                        if ($vo['type'] > 20) {
                            echo $logType[$vo['type']] . ' ' . $vo['customer']['user_name'];
                        }
                     ?>
                </td>
            </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
    </table>
    <div class="pagination"><?php echo $page; ?></div>

</div>
<script src="/static/js/admin.js"></script>
</body>
</html>
