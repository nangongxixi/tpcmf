<?php /*a:2:{s:84:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/admin\customer\dialog.html";i:1569631099;s:76:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/public\header.html";i:1569667776;}*/ ?>
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
<div class="wrap js-check-wrap">
    <form action="<?php echo url('customer/dialog'); ?>" method="post">
        <div class="form-group">
            <input type="hidden" name="id" value="<?php echo $id; ?>">
            <select class="form-control" name="worker_uid" id="worker_uid">
                <option value="">---- 请选择所属员工 ----</option>
                <?php if(is_array($workerList) || $workerList instanceof \think\Collection || $workerList instanceof \think\Paginator): if( count($workerList)==0 ) : echo "" ;else: foreach($workerList as $key=>$vo): $currentTag = $key == $wid ? 'selected' : '' ?>
                    <option value="<?php echo $key; ?>" <?php echo $currentTag; ?>><?php echo $vo; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </select>
        </div>
        <div class="form-group" style="text-align: center">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary js-ajax-submit"><?php echo lang('SAVE'); ?></button>
                <a class="btn btn-default close-win" href="javascript:;">取消</a>
            </div>
        </div>
    </form>
</div>

<script>
    $('.close-win').on('click', function () {
        window.parent.location.reload();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });
</script>
</body>
