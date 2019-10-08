<?php

namespace api\message\controller;

use api\Base;
use app\admin\model\MessageModel;
use \app\admin\model\Config;
use think\Db;

class IndexController extends Base
{
    /**
     * 读的通知数 或 未读消息数
     */
    public function notReadNums($uid = null)
    {
        $cond = ['is_read' => Config::NOTICE_READ_NO];
        if ($uid) {
            $cond['uid'] = $uid;
        }

        $noticeNums = Db::name('notice')->where($cond)->count();
        $messageNums = Db::name('message')->where($cond)->count();
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
     * 客户聊天记录总条数(总条数变化，则追加)
     */
    public function customerMessageNums()
    {
        $token = $this->request->param('token');
        $customerId = $this->getCustomerIdByToken($token);
        return json([
            'code' => 200,
            'data' => MessageModel::where(['user_type' => Config::MESSAGE_SENDER_ROLE_KH, 'uid' => $customerId])
                ->whereOr(['from_uid' => $customerId])
                ->count()
        ]);
    }

    /**
     * 客服总聊天记录总条数(总条数变化，则追加)
     */
    public function userMessageNums()
    {
        $uid = $this->getUid();
        return json([
            'code' => 200,
            'data' => MessageModel::where(['user_type' => Config::MESSAGE_SENDER_ROLE_KF, 'uid' => $uid])
                ->whereOr(['from_uid' => $uid])
                ->count()
        ]);
    }

    /**
     * 客服和某客户聊天记录总条数(总条数变化，则追加)
     */
    public function userToCustomerMessageNums()
    {
        $uid = $this->getUid();
        $token = $this->request->param('token');
        $customerId = $this->getCustomerIdByToken($token);
        return json([
            'code' => 200,
            'data' => MessageModel::where(['user_type' => Config::MESSAGE_SENDER_ROLE_KF, 'uid' => $uid, 'from_uid' => $customerId])
                ->whereOr(['user_type' => Config::MESSAGE_SENDER_ROLE_KH, 'uid' => $customerId, 'from_uid' => $uid])
                ->count()
        ]);
    }

    /**
     * 客服发送消息
     */
    public function userSendMessage()
    {
        $token = $this->request->param('token');
        $sender = $this->getUserInfo();
        $acceptor = $this->getCustomerInfoByToken($token);

        $acceptor['nickname'] = $acceptor['user_name'];
        $sender['nickname'] = $sender['user_nickname'];

        $rs = $this->sendMessage(Config::MESSAGE_SENDER_ROLE_KF, $sender, $acceptor);
        if (!$rs) {
            return json([
                'code' => 501,
                'msg' => 'fail'
            ]);
        }
        return json([
            'code' => 200,
            'data' => 'success'
        ]);
    }

    /**
     * 客户发送消息
     */
    public function customerSendMessage()
    {
        $token = $this->request->param('token');
        $sender = $this->getCustomerInfoByToken($token);
        $acceptor = $this->getUserInfo();

        $sender['nickname'] = $sender['user_name'];
        $acceptor['nickname'] = $acceptor['user_nickname'];

        $rs = $this->sendMessage(Config::MESSAGE_SENDER_ROLE_KH, $sender, $acceptor);
        if (!$rs) {
            return json([
                'code' => 501,
                'msg' => 'fail'
            ]);
        }
        return json([
            'code' => 200,
            'data' => 'success'
        ]);
    }

    /**
     * 客户和所有客服的聊天记录
     * @doc select * from dj_message where user_type=2 and (uid=1 or from_uid=1);
     */
    public function customerMessageListAll()
    {
        $token = $this->request->param('token');
        $customerId = $this->getCustomerIdByToken($token);

        $page = $this->getCondPageDef();

        $list = MessageModel::where(['uid' => $customerId, 'user_type' => Config::MESSAGE_SENDER_ROLE_KH])
            ->whereOr(['from_uid' => $customerId])
            ->limit($page['offset'], $page['nums'])
            ->order('id', 'desc')
            ->select();
        return json([
            'code' => 200,
            'data' => $list
        ]);
    }

    /**
     * 客服和某客户的消息记录
     * @doc select * from dj_message where (user_type=1 and uid=1 and from_uid=9) or (user_type=2 and uid=9 and from_uid=1)
     */
    public function userMessageList()
    {
        $uid = $this->getUid();
        $token = $this->request->param('token');
        $customerId = $this->getCustomerIdByToken($token);
        $page = $this->getCondPageDef();

        $sql = "
                    SELECT * FROM dj_message
                    WHERE
                        (
                            uid = {$uid}
                            AND from_uid = {$customerId}
                            AND user_type = 1
                        )
                    OR (
                        uid = {$customerId}
                        AND from_uid = {$uid}
                        AND user_type = 2
                    )
                    ORDER BY id DESC 
                    LIMIT {$page['offset']},{$page['nums']}";

        $list = Db::query($sql);

        /*$list = MessageModel::where(['user_type' => Config::MESSAGE_SENDER_ROLE_KF, 'uid' => $uid, 'from_uid' => $customerId])
            ->whereOr(['user_type' => Config::MESSAGE_SENDER_ROLE_KH, 'uid' => $customerId, 'from_uid' => $uid])
            ->limit($page['offset'], $page['nums'])
            ->order('id', 'desc')
            ->select();*/

        //echo DB::name('customer')->getLastSql();

        return json([
            'code' => 200,
            'data' => $list
        ]);
    }

    /**
     * 客服和所有人的消息记录
     * @doc select * from dj_message where user_type=1 and (uid=1 or from_uid=1);
     */
    public function userMessageListAll()
    {
        $uid = $this->getUid();
        $page = $this->getCondPageDef();

        $list = MessageModel::where(['uid' => $uid, 'user_type' => Config::MESSAGE_SENDER_ROLE_KF])
            ->whereOr(['from_uid' => $uid])
            ->limit($page['offset'], $page['nums'])
            ->order('id', 'desc')
            ->select();

        return json([
            'code' => 200,
            'data' => $list
        ]);
    }

    /**
     * 发送消息的动作
     */
    private function sendMessage($usertType, $sender, $acceptor)
    {
        $fileUrl = $this->request->param('file_url');
        $content = $this->request->param('content');
        $type = $this->request->param('type');

        $data['uid'] = $sender['id'];
        $data['from_uid'] = $acceptor['id'];
        $data['user_type'] = $usertType;

        $data['file_url'] = $fileUrl ?? '';
        $data['content'] = $content ?? '';
        $data['type'] = $type ?? 1;

        $data['sender_avatar'] = $sender['avatar'] ?? 'assets/img/tx.jpg';
        $data['sender_nickname'] = $sender['nickname'];
        $data['accepter_avatar'] = $acceptor['avatar'] ?? 'assets/img/tx.jpg';
        $data['accepter_nickname'] = $acceptor['nickname'];

        return MessageModel::getSelfInstance()->addData($data);
    }
}
