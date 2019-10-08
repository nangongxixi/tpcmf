<?php
namespace api;

use api\ext\pageTrait;
use app\admin\model\Config;
use app\admin\model\CustomerModel;
use app\user\model\UserModel;
use cmf\controller\RestBaseController;
use think\Db;

class Base extends RestBaseController
{
    use pageTrait;

    public function getCustomerInfoByToken($token)
    {
        if (!$token) {
            $this->error('token不能为空');
        }
        $customerInfo = CustomerModel::where(['login_token' => $token])->find();
        if (!$customerInfo) {
            $this->error('客户不存在');
        }
        return $customerInfo;
    }

    public function getCustomerIdByToken($token)
    {
        $customerInfo = $this->getCustomerInfoByToken($token);
        return $customerInfo['id'];
    }

    public function getCustomerByAccount($account)
    {
        return DB::name('customer')->where([
                'account' => $account,
                'user_status' => Config::USER_STATUS_YES]
        )->find();
    }

    public function getCustomerInfoById($id)
    {
        if (!$id) {
            $this->error('客户ID不能为空');
        }
        $customerInfo = CustomerModel::where(['id' => $id])->find();
        if (!$customerInfo) {
            $this->error('客户不存在');
        }
        return $customerInfo;
    }

    public function getUid()
    {
        return cmf_get_current_admin_id() ?? 1; //没有客服登录时,默认发给超级管理员
    }

    public function getUserInfo()
    {
        $id = $this->getUid(); //没有客服登录时默认发给超级管理员
        return UserModel::where(['id' => $id])->find();
    }
}
