<?php
// ☢ Author: Scalpel <373966902@qq.com> 2019/9/19 10:21
namespace app\admin\model;

use app\admin\ext\SingletonTrait;
use think\Db;

/**
 * 记录日志
 * Class RecordLog
 * @package app\admin\model
 */
class MessageModel extends Base
{
    protected $pk = 'id';
    protected $table = 'dj_message';

    use SingletonTrait;

    /**
     * 添加消息记录
     * @param $formUid
     * @param $type
     * @param null $content
     * @param null $fileUrl
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function addData($postData)
    {
        $logInfo = $this->getUserInfo();
        $post['from_uid'] = $logInfo['id'];//第三人称
        $post['type'] = $postData['type'] ?? 1;
        $post['content'] = $postData['content'] ?? '';
        $post['file_url'] = $postData['file_url'] ?? '';
        $post['user_type'] = $postData['user_type'];

        $customerInfo = $this->getCustomerInfo($postData['login_token']);
        $post['uid'] = $customerInfo['id'];//第一人称

        $post['create_time'] = date('Y-m-d H:i:s');
        $post['c_year'] = date('Y');
        $post['c_month'] = date('m');
        $post['c_week'] = date('W');
        $post['c_day'] = date('Y-m-d');

        return MessageModel::getSelfInstance()->data($post)->save();
    }

    /**
     * 客户信息
     * @return array|\PDOStatement|string|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    private function getCustomerInfo($token)
    {
        if (!$token) {
            return '缺少参数token';
        }
        $info = DB::name('customer')->where("login_token", $token)->find();

        if (!$info) {
            return '用户不存在';
        }
        return $info;
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
