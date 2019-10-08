<?php
// ☢ Author: Scalpel <373966902@qq.com> 2019/9/19 10:21
namespace app\admin\model;

use app\admin\ext\SingletonTrait;
use think\Db;

/**
 * 发送消息
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
     */
    public function addData($post)
    {
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
        return $this->hasOne('CustomerModel', 'id', 'uid')->field('id, user_name, avatar');
    }

    //关联角色表
    public function role()
    {
        return $this->hasOne('RoleModel', 'id', 'info_id')->field('id, name');
    }

    //关联员工表
    public function user()
    {
        return $this->hasOne('UserModel', 'id', 'uid')->field('id, user_nickname, avatar');
    }
}
