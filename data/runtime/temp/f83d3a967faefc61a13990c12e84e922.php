<?php /*a:2:{s:82:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/admin\customer\edit.html";i:1569631099;s:76:"D:\phpstudy_pro\WWW\tpcmf\public/themes/admin_simpleboot3/public\header.html";i:1569631100;}*/ ?>
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
        <li><a href="<?php echo url('customer/index'); ?>">客户查询</a></li>
        <li class="active"><a>注册客户</a></li>
    </ul>
    <form method="post" class="form-horizontal js-ajax-form margin-top-20" action="<?php echo url('Customer/editPost'); ?>">
        <input value="<?php echo $worker_uid; ?>" type="hidden" name="worker_uid">
        <input value="<?php echo $check_uid; ?>" type="hidden" name="check_uid">
        <div class="form-group">
            <label for="input-user_login" class="col-sm-1 control-label"><span class="form-required">*</span>姓名</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" value="<?php echo $user_name; ?>" placeholder="请输入姓名" id="input-user_login"
                       name="user_name">
            </div>
            <label for="input-user_sex" class="col-sm-1 control-label"><span class="form-required">*</span>性别</label>
            <div class="col-md-3 col-sm-10">
                <?php if(is_array($sexs) || $sexs instanceof \think\Collection || $sexs instanceof \think\Paginator): if( count($sexs)==0 ) : echo "" ;else: foreach($sexs as $k=>$vo): 
                        $defaultSelected = '';
                        if (isset($sex)) {
                        $defaultSelected = $k == $sex ? "checked" : "";
                        } else {
                        $defaultSelected = $k == 1 ? "checked" : "";
                        }
                     ?>
                    <label class="radio-inline">
                        <input value="<?php echo $k; ?>" type="radio" <?php echo $defaultSelected; ?> name="sex[]"><?php echo $vo; ?>
                    </label>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_pass" class="col-sm-1 control-label"><span class="form-required">*</span>登录账号</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" disabled placeholder="请输入登录账号" value="<?php echo $account; ?>"
                       id="input-user_pass"
                       name="account">
            </div>
            <label for="input-user_mobile" class="col-sm-1 control-label"><span
                    class="form-required">*</span>联系电话</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" value="<?php echo $phone; ?>" placeholder="请输入手机号" id="input-user_mobile"
                       name="phone">
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_area" class="col-sm-1 control-label"><span class="form-required">*</span>所在区域</label>
            <div class="col-md-6 col-sm-10">
                <div class="form-inline" data-toggle="distpicker">
                    <select class="form-control" id="area1" name="area1"></select>
                    <select class="form-control" id="area2" name="area2"></select>
                    <select class="form-control" id="area3" name="area3"></select>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_login" class="col-sm-1 control-label"><span
                    class="form-required">*</span>详细地址</label>
            <div class="col-md-7 col-sm-10">
                <input type="text" class="form-control" value="<?php echo $address; ?>" placeholder="请输入详细地址" name="address">
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_pass" class="col-sm-1 control-label">QQ</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" value="<?php echo $qq; ?>" id="input-user_pass" name="qq"
                       placeholder="请输入QQ">
            </div>
            <label for="input-user_login" class="col-sm-1 control-label">邮箱</label>
            <div class="col-md-3 col-sm-10">
                <input type="text" class="form-control" value="<?php echo $email; ?>" placeholder="请选择电子邮箱" name="email">
            </div>
        </div>
        <div class="form-group">
            <label for="input-user_role_id" class="col-sm-1 control-label"><span
                    class="form-required">*</span>所属员工</label>
            <div class="col-md-2 col-sm-10">
                <select class="form-control" name="worker_uid">
                    <option value="">-- 请选择所属员工 --</option>
                    <?php if(is_array($workerList) || $workerList instanceof \think\Collection || $workerList instanceof \think\Paginator): if( count($workerList)==0 ) : echo "" ;else: foreach($workerList as $key=>$vo): ?>
                        <option value="<?php echo $key; ?>" <?php if($key==$worker_uid): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
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


