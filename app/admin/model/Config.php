<?php

namespace app\admin\model;

class Config
{

    /** 性别 */
    const SEX_0 = 0;
    const SEX_1 = 1;
    const SEX_2 = 2;

    public static function getSexs($key = null, $default = null)
    {
        $arr = [
            self::SEX_1 => '男',
            self::SEX_2 => '女',
        ];
        if ($key === null) {
            return $arr;
        }
        return $arr[$key] ?? $default;
    }

    /** 证件类型 */
    const CARD_TYPE_1 = 1;
    const CARD_TYPE_2 = 2;

    public static function getCardTypes($key = null, $default = null)
    {
        $arr = [
            self::CARD_TYPE_1 => '身份证',
            self::CARD_TYPE_2 => '驾驶证',
        ];
        if ($key === null) {
            return $arr;
        }
        return $arr[$key] ?? $default;
    }

    /** 员工状态 */
    const USER_STATUS_YES = 1;
    const USER_STATUS_NO = 2;

    public static function getUserStatus($key = null, $default = null)
    {
        $arr = [
            self::USER_STATUS_YES => '正常',
            self::USER_STATUS_NO => '停用',
        ];
        if ($key === null) {
            return $arr;
        }
        return $arr[$key] ?? $default;
    }

    /** 客户审核状态：1.审核中，2.通过，3.驳回*/
    const CUSTOMER_STATUS_1 = 1;
    const CUSTOMER_STATUS_2 = 2;
    const CUSTOMER_STATUS_3 = 3;

    public static function getCustomerStatus($key = null, $default = null)
    {
        $arr = [
            self::CUSTOMER_STATUS_1 => '审核中',
            self::CUSTOMER_STATUS_2 => '通过',
            self::CUSTOMER_STATUS_3 => '驳回',
        ];
        if ($key === null) {
            return $arr;
        }
        return $arr[$key] ?? $default;
    }

    public static $customerStatusColor = [
        self::CUSTOMER_STATUS_1 => 'orange',
        self::CUSTOMER_STATUS_2 => 'green',
        self::CUSTOMER_STATUS_3 => 'red'
    ];

    public static $userStatusColor = [
        self::USER_STATUS_YES => 'green',
        self::USER_STATUS_NO => 'red',
    ];

    /**
     * 日志类型
     */
    const LOG_TYPE_0 = 0;
    const LOG_TYPE_1 = 1;
    const LOG_TYPE_2 = 2;
    const LOG_TYPE_3 = 3;
    const LOG_TYPE_4 = 4;
    const LOG_TYPE_5 = 5;
    const LOG_TYPE_6 = 6;
    const LOG_TYPE_7 = 7;

    const LOG_TYPE_11 = 11;
    const LOG_TYPE_12 = 12;
    const LOG_TYPE_13 = 13;
    const LOG_TYPE_14 = 14;
    const LOG_TYPE_15 = 15;
    const LOG_TYPE_16 = 16;

    const LOG_TYPE_21 = 21;
    const LOG_TYPE_22 = 22;
    const LOG_TYPE_23 = 23;
    const LOG_TYPE_24 = 24;
    const LOG_TYPE_25 = 25;
    const LOG_TYPE_26 = 26;
    const LOG_TYPE_27 = 27;
    const LOG_TYPE_28 = 28;
    const LOG_TYPE_29 = 29;
    const LOG_TYPE_30 = 30;

    public static function logTypes($key = null, $default = null)
    {
        $arr = [
            /** 个位数 系统部分 */
            self::LOG_TYPE_0 => ' ',
            self::LOG_TYPE_1 => '登录了系统',
            self::LOG_TYPE_2 => '退出了登录',
            self::LOG_TYPE_3 => '新增了角色',
            self::LOG_TYPE_4 => '修改了角色',
            self::LOG_TYPE_5 => '修改了权限',
            self::LOG_TYPE_6 => '修改了系统设置',
            self::LOG_TYPE_7 => '删除了角色',
            /** 10以上 员工部分 */
            self::LOG_TYPE_11 => '新增了员工',
            self::LOG_TYPE_12 => '修改了员工',
            self::LOG_TYPE_13 => '重置了员工密码',
            self::LOG_TYPE_14 => '停用了员工',
            self::LOG_TYPE_15 => '启用了员工',
            self::LOG_TYPE_16 => '删除了员工',
            /** 20以上 客户部分 */
            self::LOG_TYPE_21 => '添加了意向客户',
            self::LOG_TYPE_22 => '编辑了意向客户',
            self::LOG_TYPE_23 => '调整了所属员工',
            self::LOG_TYPE_24 => '通过了意向客户',
            self::LOG_TYPE_25 => '驳回了意向客户',
            self::LOG_TYPE_26 => '重新报单',
            self::LOG_TYPE_27 => '注册了客户',
            self::LOG_TYPE_28 => '停用了客户',
            self::LOG_TYPE_29 => '启用了客户',
            self::LOG_TYPE_30 => '删除了客户',
        ];
        if ($key === null) {
            return $arr;
        }
        return $arr[$key] ?? $default;
    }

    /** 消息通知状态 */
    const NOTICE_READ_YES = 1;
    const NOTICE_READ_NO = 2;

    public static function getNoticeStatus($key = null, $default = null)
    {
        $arr = [
            self::NOTICE_READ_YES => '已读',
            self::NOTICE_READ_NO => '未读',
        ];
        if ($key === null) {
            return $arr;
        }
        return $arr[$key] ?? $default;
    }

    /** 消息发送者角色 */
    const MESSAGE_SENDER_ROLE_KF = 1;
    const MESSAGE_SENDER_ROLE_KH = 2;

    public static function getMessageSenderRole($key = null, $default = null)
    {
        $arr = [
            self::MESSAGE_SENDER_ROLE_KF => '客服',
            self::MESSAGE_SENDER_ROLE_KH => '客户',
        ];
        if ($key === null) {
            return $arr;
        }
        return $arr[$key] ?? $default;
    }


}
