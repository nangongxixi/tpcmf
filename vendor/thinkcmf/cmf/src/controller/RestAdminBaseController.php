<?php

namespace cmf\controller;

use think\Db;

class RestAdminBaseController extends RestBaseController
{
    public function initialize()
    {
        $userInfo = Db::name('user')->where(['id' => cmf_get_current_admin_id()])->find();
        if (!$userInfo) {
            $this->error(['code' => 10001, 'msg' => '用户未登录!']);
        }

        if (!session('login_token') || session('login_token') !== $userInfo['login_token']) {
            $this->error(['code' => 10001, 'msg' => '登录已失效!']);
        }

        return true;
    }
}