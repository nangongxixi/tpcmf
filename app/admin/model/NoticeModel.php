<?php
// ☢ Author: Scalpel <373966902@qq.com> 2019/9/19 10:21
namespace app\admin\model;

/**
 * 通知消息
 * Class NoticeModel
 * @package app\admin\model
 */
class NoticeModel extends Base
{
    protected $pk = 'id';
    protected $table = 'dj_notice';

    /**
     * @param $type int 类型
     * @param $infoId int 信息ID
     * @param null $remark string 备注
     */
    public function add($type, $infoId, $remark = null)
    {
        $logInfo = $this->getUserInfo();
        $post['uid'] = $logInfo['id'];
        $post['role_id'] = $logInfo['role_id'];
        $post['nickname'] = $logInfo['user_nickname'];
        $post['type'] = $type;
        $post['info_id'] = $infoId;
        $post['remark'] = $remark;
        $post['is_read'] = Config::NOTICE_READ_NO; //默认未读
        $post['is_customer'] = Config::MESSAGE_SENDER_ROLE_KF; //默认

        $post['create_time'] = date('Y-m-d H:i:s');
        $post['c_year'] = date('Y');
        $post['c_month'] = date('m');
        $post['c_week'] = date('W');
        $post['c_day'] = date('Y-m-d');

        $record = new NoticeModel();
        $record->data($post)->save();
    }

    public function customerAddLog($customer, $type, $remark = null)
    {
        $post['uid'] = $customer['id'];
        $post['nickname'] = $customer['user_name'];
        $post['type'] = $type;
        $post['remark'] = $remark;
        $post['is_read'] = Config::NOTICE_READ_NO; //默认未读
        $post['is_customer'] = Config::MESSAGE_SENDER_ROLE_KH; //默认

        $post['create_time'] = date('Y-m-d H:i:s');
        $post['c_year'] = date('Y');
        $post['c_month'] = date('m');
        $post['c_week'] = date('W');
        $post['c_day'] = date('Y-m-d');

        $record = new NoticeModel();
        $record->data($post)->save();
    }
}
