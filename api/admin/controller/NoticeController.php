<?php
namespace api\admin\controller;

use api\admin\Base;
use app\admin\model\Config;
use app\admin\model\NoticeModel;
use think\Db;

class NoticeController extends Base
{
    /**
     * 通知已读，未读数
     * @return array
     */
    public function isReadNotice()
    {
        $cond = [
            'uid' => cmf_get_current_admin_id(),
//            'user_type' => Config::MESSAGE_SENDER_ROLE_KF
        ];
        $readYes = NoticeModel::where(array_merge($cond + ['is_read' => Config::NOTICE_READ_YES]))->count();
        $readNo = NoticeModel::where(array_merge($cond, ['is_read' => Config::NOTICE_READ_NO]))->count();

        return json([
            'readYes' => $readYes,
            'readNo' => $readNo,
        ]);
    }

    /**
     * 通知列表
     */
    public function search()
    {
        $page = $this->getCondPageDef();
        $list = NoticeModel::limit($page['offset'], $page['nums'])
            ->where(['uid' => cmf_get_current_admin_id()])
            ->order('id', 'desc')
            ->select();
        return json([
            'code' => 200,
            'data' => $list
        ]);
    }

    /**
     * 删除通知
     */
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
        if (!$result) {
            return json([
                'code' => 502,
                'msg' => '删除失败'
            ]);
        }

        return json([
            'code' => 200,
            'data' => '删除成功'
        ]);
    }
}
