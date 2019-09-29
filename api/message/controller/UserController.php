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
     * 未读的通知数s
     */
    public function nums()
    {
        $noticeNums = Db::name('notice')->where(['is_read' => Config::NOTICE_READ_NO])->count();
        $messageNums = 26;
        $data = [
            'code' => $noticeNums ? 200 : 404,
            'data' => [
                'notice' => $noticeNums,
                'message' => $messageNums,
            ]
        ];
        return json($data);
    }

    /**
     * 消息列表
     */
    public function messageList()
    {
        $uid = cmf_get_current_admin_id();
        $userType = Config::MESSAGE_SENDER_ROLE_KF;
        $list = MessageModel::where(['id' => $uid, 'user_type' => $userType])->whereOr([
            'from_uid' => $uid,
            'user_type' => $userType
        ])->select();
        return json([
            'code' => 200,
            'data' => $list
        ]);
    }

    public function sendMessage()
    {
        $data = $this->request->param();
        $data['user_type'] = Config::MESSAGE_SENDER_ROLE_KF; //标识发送者是客服
        if (!$data) {
            $this->error('没有传递任何参数');
        }
        $rs = $this->insertMessage($data);
        if (!$rs) {
            return json([
                'code' => 501,
                'data' => '信息格式错误'
            ]);
        }
        return json([
            'code' => 200,
            'data' => 'success'
        ]);
    }

    private function insertMessage($postData)
    {
        $post['uid'] = cmf_get_current_admin_id();
        $post['type'] = $postData['type'] ?? 1;
        $post['content'] = $postData['content'] ?? '';
        $post['file_url'] = $postData['file_url'] ?? '';
        $post['user_type'] = Config::MESSAGE_SENDER_ROLE_KF; //标识发送者是客服

//        $customerInfo = $this->getCustomerInfo($postData['login_token']);
        $post['from_uid'] = $postData['from_uid'];

        $post['create_time'] = date('Y-m-d H:i:s');
        $post['c_year'] = date('Y');
        $post['c_month'] = date('m');
        $post['c_week'] = date('W');
        $post['c_day'] = date('Y-m-d');

        return MessageModel::getSelfInstance()->data($post)->save();
    }

    //客户聊天记录总条数
    public function totalNums()
    {
        return json([
            'code' => 200,
            'data' => MessageModel::where(['uid' => cmf_get_current_admin_id()])
                ->whereOr(['from_uid' => cmf_get_current_admin_id()])
                ->count()
        ]);
    }

    /**
     * 分页
     * @param array $cond
     * @return array
     */
    public function getCondPageDef($cond = [])
    {
        $pageNums = $this->request->param('nums') ?? 10;
        $page = $this->request->param('page') ?? 1;

        if ($pageNums > 200 || $pageNums < 0) {
            $pageNums = 10;
        }
        if ($page < 1 || $page > 10000) {
            $page = 1;
        }

        $cond['page'] = $page;
        $cond['nums'] = $pageNums;
        $cond['offset'] = ($page - 1) * $pageNums;

        return $cond;
    }

    public function delNotice()
    {
        $id = $this->request->param('id', 0, 'intval');
        if (!$id) {
            return json([
                'code' => 502,
                'msg' => 'ID不能为空'
            ]);
        }

        $result = Db::name('notice')->delete($id);
//        $result = Db::name('slideItem')->delete($id);
        if ($result) {
            return json([
                'code' => 200,
                'msg' => '删除成功'
            ]);
        } else {
            return json([
                'code' => 502,
                'msg' => '删除失败'
            ]);
        }
    }

    public function customerList()
    {
        $cond = ['user_status' => Config::USER_STATUS_YES];
        $workerUid = cmf_get_current_admin_id();
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
