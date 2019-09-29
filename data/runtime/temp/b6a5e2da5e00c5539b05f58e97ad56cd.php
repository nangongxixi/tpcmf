<?php /*a:2:{s:85:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/admin\customer\unindex.html";i:1569631099;s:76:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/public\header.html";i:1569631100;}*/ ?>
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
    <ul class="nav nav-tabs">
        <li class="active"><a href="<?php echo url('customer/unindex'); ?>">报单</a></li>
        <li><a href="<?php echo url('customer/add'); ?>">添加意向客户</a></li>
    </ul>
    <form class="well form-inline margin-top-20" method="get" action="<?php echo url('customer/unindex'); ?>">
        客户姓名:
        <input type="text" class="form-control" name="user_name" value="<?php echo input('request.user_name/s',''); ?>"
               placeholder="请输入客户姓名">
        客户地址:
        <input type="text" class="form-control" name="address" value="<?php echo input('request.address/s',''); ?>"
               placeholder="请输入客户地址">
        &nbsp;&nbsp;所属员工:
        <select class="form-control" name="worker_uid">
            <option value="">---- 请选择所属员工 ----</option>
            <?php if(is_array($workerList) || $workerList instanceof \think\Collection || $workerList instanceof \think\Paginator): if( count($workerList)==0 ) : echo "" ;else: foreach($workerList as $key=>$vo): ?>
                <option value="<?php echo $key; ?>"
                <?php echo isset($args['worker_uid'])&&$args['worker_uid']==$key?'selected':'' ?>
                ><?php echo $vo; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
        &nbsp;&nbsp;客户状态：
        <select class="form-control" name="check_status">
            <option value="">---- 请选择客户状态 ----</option>
            <?php if(is_array($statusList) || $statusList instanceof \think\Collection || $statusList instanceof \think\Paginator): if( count($statusList)==0 ) : echo "" ;else: foreach($statusList as $key=>$vo): ?>
                <option value="<?php echo $key; ?>"
                <?php echo isset($args['check_status'])&&$args['check_status']==$key?'selected':'' ?>
                ><?php echo $vo; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('customer/unindex'); ?>">清空</a>
    </form>
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th width="50">ID</th>
            <th>客户姓名</th>
            <th>客户地址</th>
            <th>状态</th>
            <th>所属员工</th>
<!--            <th>审核人</th>-->
            <th>审核时间</th>
            <th width="150"><?php echo lang('ACTIONS'); ?></th>
        </tr>
        </thead>
        <tbody>
        <?php if(is_array($customerList) || $customerList instanceof \think\Collection || $customerList instanceof \think\Paginator): if( count($customerList)==0 ) : echo "" ;else: foreach($customerList as $key=>$vo): ?>
            <tr>
                <td><?php echo $vo['id']; ?></td>
                <td><?php echo $vo['user_name']; ?></td>
                <td>
                    <div class="self-nowrap" title="<?php echo $vo['address']; ?>"><?php echo $vo['address']; ?></div>
                </td>
                <td style="color:<?php echo $statusColor[$vo['check_status']]; ?>"><?php echo $statusList[$vo['check_status']]; ?></td>
                <td><?php echo isset($workerList[$vo['worker_uid']]) ? $workerList[$vo['worker_uid']] : ''; ?></td>
<!--                <td><?php echo isset($checkerList[$vo['check_uid']]) ? $checkerList[$vo['check_uid']] : ''; ?></td>-->
                <td><?php echo $vo['check_time']; ?></td>
                <td style="display: flex">
                    <!-- 按钮判断 -->
                    <?php if(cmf_get_current_admin_id() == 1 || (cmf_get_current_admin_id() == $vo['worker_uid'] && $vo['check_status'] == 2 )): ?>
                        <a class="btn btn-xs btn-primary" href='<?php echo url("customer/edit",array("id"=>$vo["id"])); ?>'>注册客户</a>
                    <?php endif; if(cmf_get_current_admin_id() == 1): ?>
                        <a class="btn btn-xs btn-danger js-ajax-delete"
                           href="<?php echo url('customer/delete',array('id'=>$vo['id'])); ?>">删除</a>
                    <?php endif; if((cmf_get_current_admin_id() == $vo['check_uid'] && $vo['check_role_id'] == 4 && $vo['check_status'] == 1) || (cmf_get_current_admin_id() == 1 && $vo['check_status'] != 2)): ?>
                            <a class="btn btn-xs btn-success js-ajax-dialog-btn"
                               href="<?php echo url('customer/check',array('id'=>$vo['id'], 'type'=>2)); ?>"
                               data-msg="您确定要通过此用户吗？">通过</a>
                    <?php endif; if((cmf_get_current_admin_id() == $vo['check_uid'] && $vo['check_role_id'] == 4 && $vo['check_status'] == 1) || (cmf_get_current_admin_id() == 1 && $vo['check_status'] != 3)): ?>
                        <a class="btn btn-xs btn-danger js-ajax-dialog-btn"
                           href="<?php echo url('customer/check',array('id'=>$vo['id'], 'type'=>3)); ?>"
                           data-msg="您确定要驳回此用户吗？">驳回</a>
                    <?php endif; if((cmf_get_current_admin_id() == $vo['worker_uid'] && $vo['check_status'] == 3) || (cmf_get_current_admin_id() == 1 && $vo['check_status'] == 3)): ?>
                        <a class="btn btn-xs btn-primary" href='<?php echo url("customer/add"); ?>'>重新报单</a>
                    <?php endif; ?>
                </td>
            </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
    </table>
    <div class="pagination"><?php echo $page; ?></div>
</div>
<script src="/static/js/admin.js"></script>
<style>
    .btn-xs{
        display: table-cell !important;
        margin-right: 5px;
    }
</style>
</body>
</html>