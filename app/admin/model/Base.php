<?php
// ☢ Author: Scalpel <373966902@qq.com> 2019/9/19 14:01
namespace app\admin\model;

use app\admin\ext\SingletonTrait;
use think\Db;
use think\Model;

class Base extends Model
{
    use SingletonTrait;

    public function getUserInfo()
    {
        $uid = cmf_get_current_admin_id();
        if(!$uid){
            $uid = 1;
        }
        return Db::name('user')->get($uid);
    }
}
