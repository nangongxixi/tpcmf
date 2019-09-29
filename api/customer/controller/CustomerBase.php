<?php

namespace api\customer\controller;

use app\admin\model\Config;
use app\admin\model\CustomerModel;
use app\admin\model\MessageModel;
use cmf\controller\BaseController;
use cmf\controller\RestBaseController;
use think\Db;

class CustomerBase extends RestBaseController
{
    public function initialize()
    {

    }

    public function getCustomerByAccount($account)
    {
        return DB::name('customer')->where([
                'account' => $account,
                'user_status' => Config::USER_STATUS_YES]
        )->find();
    }

    public function getCustomerByToken($token)
    {
        if (!$token) {
            $this->error('必须传入token');
        }
        $currLoginCustomerInfo = CustomerModel::where(['login_token' => $token])->find();
        if (!$currLoginCustomerInfo) {
            $this->error('无效token');
        }
        return $currLoginCustomerInfo;
    }
}