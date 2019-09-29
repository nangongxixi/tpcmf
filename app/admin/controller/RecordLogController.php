<?php

namespace app\admin\controller;

use app\admin\model\Config;
use app\admin\model\RecordLogModel;
use cmf\controller\AdminBaseController;
use think\Db;

class RecordLogController extends AdminBaseController
{
    /**
     * 非操作日志
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        /**搜索条件**/
        $beginTime = $this->request->param('begin_time');
        $endTime = $this->request->param('end_time');
        $uid = trim($this->request->param('uid'));

        $cond = [];
        if ($beginTime) {
            $cond[] = ['create_time', '>', $beginTime];
        }
        if ($endTime) {
            $cond[] = ['create_time', '<', $endTime];
        }
        if ($uid) {
            $cond[] = ['uid', '=', $uid];
        }

        $list = RecordLogModel::with('role')
            ->where($cond)
            ->order("id DESC")
            ->paginate(10);
        $list->appends(['uid' => $uid, 'create_time' => ['>', $beginTime]]);

        // 获取分页显示
        $page = $list->render();

        $this->assign("page", $page);
        $this->assign("userList", Db::name('user')->all());
        $this->assign("list", $list);
        $this->assign("args", $this->request->param());
        $this->assign("logType", Config::logTypes());
        return $this->fetch();
    }
}
