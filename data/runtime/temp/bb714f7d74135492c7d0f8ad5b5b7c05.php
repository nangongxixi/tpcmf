<?php /*a:2:{s:83:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/admin\message\notice.html";i:1569631105;s:76:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/public\header.html";i:1569667776;}*/ ?>
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
<link href="/themes/admin_simpleboot3/public/assets/simpleboot3/css/style.css" rel="stylesheet">
<body>
<div class="wrap js-check-wrap">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#">通知列表</a></li>
    </ul>
    <div class="solution-content clearfix">
        <div class="solution-list hd">
            <ul id="solution-list">
                <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                    <li data-id="<?php echo $vo['id']; ?>">
                        <span class="cdate"><?php echo $vo['create_time']; ?></span>
                        <h2><?php echo $vo['nickname']; ?></h2>
                    </li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </div>
        <div class="solution-item bd" id="solution-item">
            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                <div class="list-item"><?php echo $vo['content']; ?></div>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
        <button type="button" class="btn btn-default self-del" id="del">
            <span class="glyphicon glyphicon-trash"></span>删除
        </button>
    </div>
</div>
<script src="/static/js/admin.js"></script>
<script src="/themes/admin_simpleboot3/public/assets/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
    jQuery(".solution-content").slide({});
    //删除通知
    $('#del').on('click', function () {
        var index = $('#solution-list .on').index();
        var id = $('#solution-list').find(".on").attr('data-id');
        console.log(index);
        layer.confirm('您确定要删除？', {
            btn: ['确定', '取消']
        }, function () {
            $.ajax({
                type: 'GET',
                url: "<?php echo API_ADDR; ?>/" + 'message/user/delNotice&id=' + id,
                success: function (res) {
                    if (res.code !== 200) {
                        layer.msg(res.msg);
                        return false;
                    }
                    layer.msg(res.msg);
                    $('#solution-list li').eq(index).remove();
                    $('#solution-list li').eq(index).addClass('on');

                    $('#solution-item div').eq(index).remove();
                    $('#solution-item div').eq(index).show();
                }
            });
        });
    });
</script>

<script>
    $(function () {
        $('.my-worker').on('click', function () {
            var id = $(this).attr('data-id');
            var workerUid = $(this).attr('title');
            layer.open({
                title: '请选择所属员工',
                type: 2,
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '200px'], //宽高
                content: "dialog/id/" + id + "/wid/" + workerUid,
            });
        });
    });
</script>
</body>
</html>
