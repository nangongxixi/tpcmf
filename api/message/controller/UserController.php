<?php

namespace api\message\controller;

use api\user\model\UserModel;
use \app\admin\model\Config;
use app\admin\model\CustomerModel;
use app\admin\model\MessageModel;
use cmf\controller\AdminBaseController;
use think\Db;

class UserController extends AdminBaseController
{



    /**
     * 多人聊天的所有客户列表
     */
    public function customerList()
    {
        $cond = ['user_status' => Config::USER_STATUS_YES];
        if ($worker = $this->request->param('worker_uid')) {
            $cond['worker_uid'] = $worker;
        }

        $area1 = $this->request->param('area1');
        $area2 = $this->request->param('area2');
        $area3 = $this->request->param('area3');
        $area = $area1 . '-' . $area2 . '-' . $area3;

        if ($area1) {
            $cond['area'] = $area;
        }

        $list = DB::name('customer')
            ->where($cond)
            ->select();
//        echo DB::name('customer')->getLastSql();
        return json([
            'code' => 200,
            'data' => $list
        ]);
    }

    public function userList()
    {
        $userList = UserModel::where(['status' => Config::USER_STATUS_YES])->select();
        return json([
            'code' => 200,
            'data' => $userList
        ]);
    }
}
