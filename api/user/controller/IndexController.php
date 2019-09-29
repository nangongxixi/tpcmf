<?php

namespace api\user\controller;

use \app\admin\model\Config;
use app\admin\model\CustomerModel;
use app\admin\model\MessageModel;
use think\Db;

class IndexController extends UserBase
{
    /**
     * 数量显示
     */
    public function index()
    {
        $admin = $this->getUserInfo();
        $admin['last_login_time'] = date('Y-m-d H:i:s', $admin['last_login_time']);
        return json([
            'code' => 200,
            'data' => $admin + $this->isRead() + $this->customerNums()
        ]);
    }

    /**
     * 已读未读数
     * @return array
     */
    public function isRead()
    {
        $readYes = MessageModel::where([
            'is_read' => Config::NOTICE_READ_YES,
            'uid' => cmf_get_current_admin_id(),
            'user_type' => Config::MESSAGE_SENDER_ROLE_KF
        ])->count();

        $readNo = MessageModel::where([
            'is_read' => Config::NOTICE_READ_NO,
            'uid' => cmf_get_current_admin_id(),
            'user_type' => Config::MESSAGE_SENDER_ROLE_KF
        ])->count();
        return [
            'readYes' => $readYes,
            'readNo' => $readNo,
        ];
    }

    /**
     * 意向客户数,待注册客户数,正常客户数,停用客户数
     * @return array
     */
    public function customerNums()
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
}
