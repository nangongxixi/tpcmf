<?php
// ☢ Author: Scalpel <373966902@qq.com> 2019/9/19 10:21
namespace app\admin\model;

/**
 * 记录日志
 * Class RecordLog
 * @package app\admin\model
 */
class RecordLogModel extends Base
{
    protected $pk = 'id';
    protected $table = 'dj_record_log';

    /**
     * @param $type int 类型
     * @param $infoId int 信息ID
     * @param null $remark string 备注
     */
    public function add($type, $infoId = null, $remark = null)
    {
        $logInfo = $this->getUserInfo();
        $post['uid'] = $logInfo['id'];
        $post['role_id'] = $logInfo['role_id'];
        $post['nickname'] = $logInfo['user_nickname'];
        $post['type'] = $type;
        $post['info_id'] = $infoId;
        $post['remark'] = $remark;
        $post['is_customer'] = Config::MESSAGE_SENDER_ROLE_KF; //默认

        $post['create_time'] = date('Y-m-d H:i:s');
        $post['c_year'] = date('Y');
        $post['c_month'] = date('m');
        $post['c_week'] = date('W');
        $post['c_day'] = date('Y-m-d');

        $record = new RecordLogModel();
        $record->data($post)->save();
    }

    public function customerAddLog($customer, $type, $remark = null)
    {
        $post['uid'] = $customer['id'];
        $post['nickname'] = $customer['user_name'];
        $post['type'] = $type;
        $post['remark'] = $remark;
        $post['is_customer'] = Config::MESSAGE_SENDER_ROLE_KH; //默认

        $post['create_time'] = date('Y-m-d H:i:s');
        $post['c_year'] = date('Y');
        $post['c_month'] = date('m');
        $post['c_week'] = date('W');
        $post['c_day'] = date('Y-m-d');

        $record = new RecordLogModel();
        $record->data($post)->save();
    }

    //关联客户表
    public function customer()
    {
        return $this->hasOne('CustomerModel', 'id', 'info_id')->field('id, user_name, phone');
    }

    //关联角色表
    public function role()
    {
        return $this->hasOne('RoleModel', 'id', 'info_id')->field('id, name');
    }

    //关联员工表
    public function user()
    {
        return $this->hasOne('UserModel', 'id', 'info_id')->field('id, user_nickname');
    }

}
