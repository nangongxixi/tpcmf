<?php /*a:2:{s:78:"D:\phpstudy8\WWW\thinkcmf\public/themes/admin_simpleboot3/admin\user\edit.html";i:1568476277;s:76:"D:\phpstudy8\WWW\thinkcmf\public/themes/admin_simpleboot3/public\header.html";i:1568811789;}*/ ?>
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
            width: 400px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <ul class="nav nav-tabs">
        <li><a href="<?php echo url('user/index'); ?>"><?php echo lang('ADMIN_USER_INDEX'); ?></a></li>
        <li><a href="<?php echo url('user/add'); ?>"><?php echo lang('ADMIN_USER_ADD'); ?></a></li>
        <li class="active"><a>编辑员工</a></li>
    </ul>
    <form method="post" class="form-horizontal js-ajax-form margin-top-20" action="<?php echo url('User/editPost'); ?>">
        <div class="form-group">
            <label for="input-user_login" class="col-sm-1 control-label"><span class="form-required">*</span>姓名</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" value="<?php echo $user_login; ?>" placeholder="请输入姓名" id="input-user_login"
                       name="user_login">
            </div>
            <label for="input-user_pass" class="col-sm-1 control-label"><span class="form-required">*</span>工号</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" placeholder="请输入工号" value="<?php echo $account; ?>" id="input-user_pass"
                       name="account">
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_sex" class="col-sm-1 control-label"><span class="form-required">*</span>性别</label>
            <div class="col-md-3 col-sm-10">
                <?php if(is_array($sexs) || $sexs instanceof \think\Collection || $sexs instanceof \think\Paginator): if( count($sexs)==0 ) : echo "" ;else: foreach($sexs as $k=>$vo): $defaultSelected=$k==$sex?"checked":""; ?>
                    <label class="radio-inline">
                        <input value="<?php echo $k; ?>" type="radio" <?php echo $defaultSelected; ?> name="sex[]"><?php echo $vo; ?>
                    </label>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            <label for="input-user_mobile" class="col-sm-1 control-label"><span class="form-required">*</span>手机</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" value="<?php echo $mobile; ?>" placeholder="请输入手机号" id="input-user_mobile"
                       name="mobile">
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_login" class="col-sm-1 control-label">证件类型</label>
            <div class="col-md-3 col-sm-10">
                <?php if(is_array($cards) || $cards instanceof \think\Collection || $cards instanceof \think\Paginator): if( count($cards)==0 ) : echo "" ;else: foreach($cards as $k=>$vo): $defaultChecked=$card_type==$k?"checked":""; ?>
                    <label class="radio-inline">
                        <input value="<?php echo $k; ?>" type="radio" <?php echo $defaultChecked; ?> name="card_type[]"><?php echo $vo; ?>
                    </label>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            <label for="input-user_pass" class="col-sm-1 control-label">证件号码</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" value="<?php echo $card_id; ?>" id="input-user_pass" name="card_id"
                       placeholder="请输入证件号码">
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_area" class="col-sm-1 control-label">住址</label>
            <div class="col-md-6 col-sm-10">
                <div class="form-inline" data-toggle="distpicker">
                    <select class="form-control" id="area1" name="area1"></select>
                    <select class="form-control" id="area2" name="area2"></select>
                    <select class="form-control" id="area3" name="area3"></select>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_login" class="col-sm-1 control-label">入职时间</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control js-bootstrap-date" value="<?php echo $join_time; ?>" placeholder="请选择入职时间"
                       id="input-user_login"
                       name="join_time">
            </div>
            <label for="input-user_pass" class="col-sm-1 control-label">QQ</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" value="<?php echo $qq; ?>" id="input-user_pass" name="qq"
                       placeholder="请输入QQ">
            </div>
        </div>
        <div class="form-group" >
            <label for="input-user_role_id" class="col-sm-1 control-label"><span class="form-required">*</span><?php echo lang('ROLE'); ?></label>
            <div class="col-md-6 col-sm-10">
                <?php if(is_array($roles) || $roles instanceof \think\Collection || $roles instanceof \think\Paginator): if( count($roles)==0 ) : echo "" ;else: foreach($roles as $key=>$vo): $defaultRole = $vo['id'] == $role_id ? "checked" : ""; ?>
                    <label class="radio-inline">
                        <input value="<?php echo $vo['id']; ?>" type="radio" <?php echo $defaultRole; ?> name="role_id[]" <?php if(cmf_get_current_admin_id() == 1 && $role_id == 1): ?>disabled="true"<?php endif; ?>><?php echo $vo['name']; ?>
                    </label>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_login" class="col-sm-1 control-label">备注</label>
            <div class="col-md-7 col-sm-10">
                <textarea type="textarea" rows="5" class="form-control" id="input-user_login"
                          name="remark"><?php echo $remark; ?></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="hidden" name="id" value="<?php echo $id; ?>"/>
                <button type="submit" class="btn btn-primary js-ajax-submit"><?php echo lang('SAVE'); ?></button>
                <a class="btn btn-default" href="javascript:history.back(-1);"><?php echo lang('BACK'); ?></a>
            </div>
        </div>
    </form>
</div>
<script src="/static/js/admin.js"></script>
</body>
</html>


