<?php

namespace api\admin\controller;

use api\admin\Base;
use \app\admin\model\Config;
use app\admin\model\CustomerModel;
use app\admin\model\MessageModel;
use think\Db;

class UserController extends Base
{
    /**
     * 消息已读，未读数
     * @param bool $isArr 是否返回数组
     * @return array
     */
    public function isReadMessage($isArr = false)
    {
        $cond = [
            'uid' => cmf_get_current_admin_id(),
            'user_type' => Config::MESSAGE_SENDER_ROLE_KF
        ];
        $readYes = MessageModel::where(array_merge($cond, ['is_read' => Config::NOTICE_READ_YES]))->count();
        $readNo = MessageModel::where(array_merge($cond, ['is_read' => Config::NOTICE_READ_NO]))->count();
        $arr = [
            'readYes' => $readYes,
            'readNo' => $readNo,
        ];

        if ($isArr) {
            return $arr;
        }
        return json($arr);
    }

    /**
     * 首页数量显示
     */
    public function infoNums()
    {
        $userInfo = $this->getUserInfo();
        $login['last_login_time'] = date('Y-m-d H:i:s', $userInfo['last_login_time']);
        $login['last_login_ip'] = $userInfo['last_login_ip'];

        $admin = Db::name("user")->where('id', cmf_get_current_admin_id())->find();
        $login['user_login'] = $admin['user_nickname'];
        $info = $this->isReadMessage(true) + $login + $this->customerNums();
        return json([
            'code' => 200,
            'data' => $info
        ]);
    }

    /**
     * 意向客户数,待注册客户数,正常客户数,停用客户数
     * @return array
     */
    private function customerNums()
    {
        $customerYX = CustomerModel::where([
            'check_status' => Config::CUSTOMER_STATUS_1,
            'user_status' => Config::USER_STATUS_YES,
            'worker_uid' => cmf_get_current_admin_id()
        ])->count();

        $customerDZC = CustomerModel::where([
            'check_status' => Config::CUSTOMER_STATUS_2,
            'user_status' => Config::USER_STATUS_YES,
            'worker_uid' => cmf_get_current_admin_id()
        ])->count();

        $customerZC = CustomerModel::where([
            'user_status' => Config::USER_STATUS_YES,
            'worker_uid' => cmf_get_current_admin_id()
        ])->count();

        $customerTY = CustomerModel::where([
            'user_status' => Config::USER_STATUS_NO,
            'worker_uid' => cmf_get_current_admin_id()
        ])->count();

        return [
            'customerYX' => $customerYX,
            'customerDZC' => $customerDZC,
            'customerZC' => $customerZC,
            'customerTY' => $customerTY,
        ];
    }

    private function getUserInfo()
    {
        $admin = Db::name("user")->where('id', cmf_get_current_admin_id())->find();
        return $admin;
    }
}
