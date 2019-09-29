<?php

namespace api\user\controller;

use app\user\model\UserModel;
use cmf\controller\AdminBaseController;
use think\Db;

class UserBase extends AdminBaseController
{
    public function getUserInfo()
    {
        $admin = Db::name("user")->where('id', cmf_get_current_admin_id())->find();
        return $admin;
    }
}
