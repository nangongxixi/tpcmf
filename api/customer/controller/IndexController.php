<?php

namespace api\customer\controller;

use think\Db;

class IndexController extends CustomerBase
{
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

        $customer = DB::name('customer')->where(['account' => $account])->find();
        if (!$customer) {
            return json([
                'code' => 404,
                'msg' => '客户不存在！'
            ]);
        }

        $customer = $this->getCustomerByAccount($account);
        if (!$customer) {
            return json([
                'code' => 404,
                'msg' => '客户禁用中！'
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
                'avatar' => $customer['avatar'],
            ]
        ]);
    }

    /**
     * 重置token
     */
    public function resetToken($account)
    {
        $newsToken = uniqid();
        $rs = DB::name('customer')->where(['account' => $account])->update(['login_token' => $newsToken]);
        if (!$rs) {
            return false;
        }
        return $newsToken;
    }

    /**
     * 修改密码
     */
    public function resetPwd()
    {
        $token = $this->request->param('token');
        $oldPwd = $this->request->param('oldPwd');
        $newPwd = $this->request->param('newPwd');

        $customer = $this->getCustomerByToken($token);
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
                'msg' => '操作！'
            ]);
        }

        return json([
            'code' => 200,
            'msg' => 'success'
        ]);
    }
}
