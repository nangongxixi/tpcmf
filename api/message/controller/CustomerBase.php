<?php

namespace api\message\controller;

use app\admin\model\CustomerModel;
use app\admin\model\MessageModel;
use cmf\controller\BaseController;
use cmf\controller\RestBaseController;
use think\Db;

class CustomerBase extends RestBaseController
{
    public function initialize()
    {
        $customerLoginToken = $this->request->param('token');
        if (!$customerLoginToken) {
            $msg = cmf_get_option('site_info');
            $this->error($msg['forget_pwd']);
        }
        $currLoginCustomerInfo = CustomerModel::where(['login_token' => $customerLoginToken])->find();
        if (!$currLoginCustomerInfo) {
            $this->error('无效token');
        }
        return $currLoginCustomerInfo;
    }

    public function getCustomerInfo()
    {
        return $this->initialize();
    }
}
