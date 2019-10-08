<?php

namespace api\customer\controller;

use api\Base;
use app\admin\model\Config;
use app\admin\model\NoticeModel;
use app\admin\model\RecordLogModel;
use think\Db;

class IndexController extends Base
{
    /**
     * 客户忘记密码的提示语
     * @return array
     */
    public function forgetPwd()
    {
        $msg = cmf_get_option('site_info');
        $msg = $msg['forget_pwd'];
        return json([
            'code' => 200,
            'data' => $msg
        ]);
    }

    /**
     * 登录
     */
    public function login()
    {
        $account = $this->request->param('username');
        $password = $this->request->param('password');
        if (!$account || !$password) {
            return json([
                'code' => 404,
                'msg' => '用户名或密码不能为空'
            ]);
        }

        $customer = $this->getCustomerByAccount($account);
        if (!$customer) {
            return json([
                'code' => 404,
                'msg' => '无效客户！'
            ]);
        }

        $passwordToMd5 = cmf_password($password);
        if ($customer['customer_pass'] !== $passwordToMd5) {
            return json([
                'code' => 502,
                'msg' => '密码错误，请重新输入！'
            ]);
        }

        if (!$token = $this->resetToken($account)) {
            return json([
                'code' => 502,
                'msg' => '网络异常，请重试'
            ]);
        }

        return json([
            'code' => 200,
            'msg' => '登录成功',
            'data' => [
                'token' => $token,
                'nickname' => $customer['user_name'],
                'avatar' => $customer['avatar'] ?? 'assets/img/tx.jpg'
            ]
        ]);
    }

    /**
     * 修改密码
     */
    public function resetPwd()
    {
        $token = $this->request->param('token');
        $oldPwd = $this->request->param('oldPwd');
        $newPwd = $this->request->param('newPwd');

        $customer = $this->getCustomerInfoByToken($token);
        if (!$customer) {
            return json([
                'code' => 404,
                'msg' => '客户不存在！'
            ]);
        }

        $passwordToMd5 = cmf_password($oldPwd);
        if ($customer['customer_pass'] !== $passwordToMd5) {
            return json([
                'code' => 502,
                'msg' => '旧密码错误，请重新输入！'
            ]);
        }

        $newPasswordToMd5 = cmf_password($newPwd);
        $rs = DB::name('customer')->where(['id' => $customer['id']])->update(['customer_pass' => $newPasswordToMd5]);
        if (!$rs) {
            return json([
                'code' => 502,
                'msg' => '操作失败！'
            ]);
        }

        RecordLogModel::getSelfInstance()->customerAddLog($customer, Config::LOG_TYPE_41);//客户写日志
        NoticeModel::getSelfInstance()->customerAddLog($customer, Config::LOG_TYPE_41);//客户发通知

        return json([
            'code' => 200,
            'data' => '操作成功！'
        ]);
    }

    /**
     * 重置token
     */
    private function resetToken($account)
    {
        $newsToken = uniqid();
        $rs = DB::name('customer')->where(['account' => $account])->update(['login_token' => $newsToken]);
        if (!$rs) {
            return false;
        }
        return $newsToken;
    }

}
