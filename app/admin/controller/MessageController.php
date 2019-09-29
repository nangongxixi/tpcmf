<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\admin\model\Config;
use cmf\controller\AdminBaseController;
use think\Db;
use app\admin\model\AdminMenuModel;

class MessageController extends AdminBaseController
{
    /**
     * 通知列表
     */
    public function notice()
    {
        $result = Db::name('notice')
            ->where(["uid" => cmf_get_current_admin_id()])
            ->select();

        $list = [];
        foreach ($result as $index=>$item) {
            $list[$index]['content'] = Config::logTypes($item['type']);
            $list[$index]['id'] = $item['id'];
            $list[$index]['nickname'] = $item['nickname'];
            $list[$index]['create_time'] = $item['create_time'];
        }

        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 消息列表
     */
    public function search()
    {
        $result = Db::name('notice')
            ->where(["uid" => cmf_get_current_admin_id()])
            ->select();

        $this->assign("list", $result);
        $this->assign("workerList", $this->getUser());
        return $this->fetch();
    }

    private function getUser($name = null)
    {
        $cond = ['user_status' => Config::USER_STATUS_YES];
        if ($name) {
            $roleArr = Db::name('role')->get(['name' => $name]);
            $cond['role_id'] = $roleArr['id'];
        }
        $list = Db::name('user')
            ->where($cond)
            ->select()
            ->column('user_nickname', 'id');

        return $list;
    }
}
