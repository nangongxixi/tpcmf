<?php

namespace api\message\controller;

use app\admin\model\MessageModel;
use cmf\controller\RestAdminBaseController;
use \app\admin\model\Config;
use think\Db;

class IndexController extends CustomerBase
{
    /**
     * 未读的通知数
     * @return \think\response\Json
     */
    public function index()
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
     * 发送消息
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function sendMessage()
    {
        $data = $this->request->param();
        $data['user_type'] = 2; //标识发送者是客户
        $data['login_token'] = $data['token'];
        if (!$data) {
            $this->error('没有传递任何参数');
        }
        $rs = MessageModel::getSelfInstance()->addData($data);
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

    /**
     * 消息列表
     */
    public function messageList()
    {
        $customerInfo = $this->getCustomerInfo();
        $currLoginCustomerId = $customerInfo['id'];

        $page = $this->getCondPageDef();

        $list = MessageModel::where(['uid' => $currLoginCustomerId])
            ->whereOr(['from_uid' => $currLoginCustomerId])
            ->limit($page['offset'], $page['nums'])
            ->order('id', 'desc')
            ->select();
        return json([
            'code' => 200,
            'data' => $list
        ]);
    }

    //客户聊天记录总条数
    public function totalNums()
    {
        $customerInfo = $this->getCustomerInfo();
        $currLoginCustomerId = $customerInfo['id'];
        return json([
            'code' => 200,
            'data' => MessageModel::where(['uid' => $currLoginCustomerId])
                ->whereOr(['from_uid' => $currLoginCustomerId])
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
}
