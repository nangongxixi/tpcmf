<?php /*a:2:{s:79:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/admin\user\index.html";i:1569745063;s:76:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/public\header.html";i:1569667776;}*/ ?>
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
        <li class="active"><a href="<?php echo url('user/index'); ?>"><?php echo lang('ADMIN_USER_INDEX'); ?></a></li>
        <li><a href="<?php echo url('user/add'); ?>"><?php echo lang('ADMIN_USER_ADD'); ?></a></li>
    </ul>
    <form class="well form-inline margin-top-20" method="get" action="<?php echo url('User/index'); ?>">
        员工姓名:
        <input type="text" class="form-control" name="user_login" value="<?php echo input('request.user_login/s',''); ?>"
               placeholder="请输入员工姓名">
        &nbsp;&nbsp;角色:
        <select class="form-control" name="role_id">
            <option value="">---- 请选择角色 ----</option>
            <?php if(is_array($roles) || $roles instanceof \think\Collection || $roles instanceof \think\Paginator): if( count($roles)==0 ) : echo "" ;else: foreach($roles as $key=>$vo): ?>
                <option value="<?php echo $vo['id']; ?>" <?php echo isset($args['role_id'])&&$args['role_id']==$vo['id']?'selected':'' ?>><?php echo $vo['name']; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
        &nbsp;&nbsp;状态：
        <select class="form-control" name="user_status">
            <option value="">---- 请选择状态 ----</option>
            <?php if(is_array($statusList) || $statusList instanceof \think\Collection || $statusList instanceof \think\Paginator): if( count($statusList)==0 ) : echo "" ;else: foreach($statusList as $key=>$vo): ?>
                <option value="<?php echo $key; ?>" <?php echo isset($args['user_status'])&&$args['user_status']==$key?'selected':'' ?>><?php echo $vo; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('User/index'); ?>">清空</a>
    </form>
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th width="50">ID</th>
            <th>姓名</th>
            <th>角色</th>
            <th>状态</th>
            <th>客户数</th>
            <th>最后登录IP</th>
            <th>最后登录时间</th>
            <th width="270"><?php echo lang('ACTIONS'); ?></th>
        </tr>
        </thead>
        <tbody>
        <?php if(is_array($users) || $users instanceof \think\Collection || $users instanceof \think\Paginator): if( count($users)==0 ) : echo "" ;else: foreach($users as $key=>$vo): ?>
            <tr>
                <td><?php echo $vo['id']; ?></td>
                <td>
                    <?php if($vo['user_url']): ?><a href="<?php echo $vo['user_url']; ?>" target="_blank" title="<?php echo $vo['signature']; ?>"><?php echo $vo['user_nickname']; ?></a>
                        <?php else: ?>
                        <?php echo $vo['user_nickname']; ?>
                    <?php endif; ?>
                </td>
                <td><?php echo $roles[$vo['role_id']]['name']; ?></td>
                <?php if($vo['user_status'] == 2): ?>
                    <td style="color:red"><?php echo $statusList[$vo['user_status']]; ?></td>
                <?php else: ?>
                    <td style="color:green"><?php echo $statusList[$vo['user_status']]; ?></td>
                <?php endif; ?>
                    <td>todo</td>
                    <td><?php echo $vo['last_login_ip']; ?></td>
                    <td>
                        <?php if($vo['last_login_time'] == 0): ?>
                            <?php echo lang('USER_HAVE_NOT_LOGIN'); else: ?>
                            <?php echo date('Y-m-d H:i:s',$vo['last_login_time']); ?>
                        <?php endif; ?>
                    </td>
                    <td>
                        <?php if($vo['id'] == 1 || $vo['id'] == cmf_get_current_admin_id()): if($vo['user_status'] == 1): ?>
                                <span class="btn btn-xs btn-danger disabled"><?php echo $statusList[1]; ?></span>
                            <?php else: ?>
                                <span class="btn btn-xs btn-warning disabled"><?php echo lang('ACTIVATE_USER'); ?></span>
                            <?php endif; ?>
                            <a class="btn btn-xs btn-primary js-ajax-delete"
                               href="<?php echo url('user/customer',array('id'=>$vo['id'])); ?>">所属客户</a>
                            <a class="btn btn-xs btn-primary"
                               href="<?php echo url('user/resetPwd',array('id'=>$vo['id'])); ?>">重置密码</a>
                            <a class="btn btn-xs btn-primary" href='<?php echo url("user/edit",array("id"=>$vo["id"])); ?>'><?php echo lang('EDIT'); ?></a>
                            <span class="btn btn-xs btn-danger disabled"><?php echo lang('DELETE'); ?></span>

                            <?php else: if($vo['user_status'] == 1): ?>
                                <a class="btn btn-xs btn-danger js-ajax-dialog-btn"
                                   href="<?php echo url('user/ban',array('id'=>$vo['id'], 'type'=>2)); ?>"
                                   data-msg="您确定要停用此用户吗？"><?php echo $statusList[2]; ?></a>
                                <?php else: ?>
                                <a class="btn btn-xs btn-success js-ajax-dialog-btn"
                                   href="<?php echo url('user/ban',array('id'=>$vo['id'], 'type' => 1)); ?>"
                                   data-msg="<?php echo lang('ACTIVATE_USER_CONFIRM_MESSAGE'); ?>"><?php echo $statusList[1]; ?></a>
                            <?php endif; ?>
                            <a class="btn btn-xs btn-primary"
                               href="<?php echo url('customer/index',array('worker_uid'=>$vo['id'])); ?>">所属客户</a>
                            <a class="btn btn-xs btn-primary"
                               href="<?php echo url('user/resetpwd',array('id'=>$vo['id'])); ?>">重置密码</a>
                            <a class="btn btn-xs btn-primary" href='<?php echo url("user/edit",array("id"=>$vo["id"])); ?>'><?php echo lang('EDIT'); ?></a>
                            <a class="btn btn-xs btn-danger js-ajax-delete"
                               href="<?php echo url('user/delete',array('id'=>$vo['id'])); ?>"><?php echo lang('DELETE'); ?></a>

                        <?php endif; ?>
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
