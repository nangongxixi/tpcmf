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

use app\admin\ext\Tools;
use app\admin\model\RecordLogModel;
use app\user\model\UserModel;
use cmf\controller\AdminBaseController;
use think\Db;
use think\db\Query;
use \app\admin\model\Config;

/**
 * Class UserController
 * @package app\admin\controller
 */
class UserController extends AdminBaseController
{
      use Tools;

    /**
     * 管理员列表
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $content = hook_one('admin_user_index_view');

        if (!empty($content)) {
            return $content;
        }

        /**搜索条件**/
        $userLogin = $this->request->param('user_login');
        $roleId = trim($this->request->param('role_id'));
        $status = trim($this->request->param('user_status'));

        $users = Db::name('user')
            ->where('user_type', 1)
            ->where(function (Query $query) use ($userLogin, $roleId, $status) {
                if ($userLogin) {
                    $query->where('user_login', 'like', "%$userLogin%");
                }
                if ($roleId) {
                    $query->where('role_id', '=', $roleId);
                }
                if ($status) {
                    $query->where('user_status', '=', $status);
                }
            })
            ->order("id DESC")
            ->paginate(10);
        $users->appends(['user_login' => $userLogin, 'role_id' => $roleId, 'user_status' => $status]);
        // 获取分页显示
        $page = $users->render();

        $rolesSrc = Db::name('role')->select();
        $roles = [];
        foreach ($rolesSrc as $r) {
            $roleId = $r['id'];
            $roles["$roleId"] = $r;
        }
        $this->assign("page", $page);
        $this->assign("roles", $roles);
        $this->assign("statusList", Config::getUserStatus());
        $this->assign("users", $users);
        $this->assign("args", $this->request->param());
        return $this->fetch();
    }

    /**
     * 管理员添加
     * @adminMenu(
     *     'name'   => '管理员添加',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '管理员添加',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $content = hook_one('admin_user_add_view');

        if (!empty($content)) {
            return $content;
        }
        $roles = Db::name('role')->where('status', 1)->where('id','>',1)->order("id DESC")->select();

        $this->assign("roles", $roles);
        $this->assign("sexs", Config::getSexs());
        $this->assign("cards", Config::getCardTypes());
        $this->assign("defaultCard", Config::CARD_TYPE_1);
        $this->assign("defaultSex", Config::SEX_1);
        return $this->fetch();
    }

    /**
     * 管理员添加提交
     * @adminMenu(
     *     'name'   => '管理员添加提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '管理员添加提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        $result = $this->validate($this->request->param(), 'User');
        if ($result !== true) {
            $this->error("{$result}");
        }

        //初始密码
        $siteInfo = cmf_get_option('site_info');
        $_POST['user_pass'] = cmf_password($siteInfo['worker_default_pwd']);
        //区域选择
        if (isset($_POST['area1']) || isset($_POST['area2']) || isset($_POST['area2'])) {
            $_POST['area'] = $_POST['area1'] . '-' . $_POST['area2'] . '-' . $_POST['area3'];
            unset($_POST['area1']);
            unset($_POST['area2']);
            unset($_POST['area3']);
        }

        $currRoleArr =  $_POST['role_id'];
        $_POST['sex'] = $_POST['sex'][0];
        $_POST['role_id'] = $_POST['role_id'][0];
        $_POST['card_type'] = $_POST['card_type'][0];
        $_POST['login_token'] = uniqid();

        $result = DB::name('user')->insertGetId($_POST);
        if ($result !== false) {
            foreach ($currRoleArr as $role_id) {
                if (cmf_get_current_admin_id() != 1 && $role_id == 1) {
                    $this->error("为了网站的安全，非网站创建者不可创建超级管理员！");
                }
                Db::name('RoleUser')->insert(["role_id" => $role_id, "user_id" => $result]);
            }
            RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_11, $result);//写日志
            $this->success("添加成功！", url("user/index"));
        } else {
            $this->error("添加失败！");
        }
    }

    /**
     * 管理员编辑
     * @adminMenu(
     *     'name'   => '管理员编辑',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '管理员编辑',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $content = hook_one('admin_user_edit_view');

        if (!empty($content)) {
            return $content;
        }

        $id = $this->request->param('id', 0, 'intval');
        $roles = DB::name('role')->where('status', 1)->where('id','>',1)->order("id DESC")->select();
        $this->assign("roles", $roles);

        $user = DB::name('user')->where("id", $id)->find();

        $this->assign("role_ids", $this->request->param('role_id/a'));

        $area= explode('-', $user['area']);

        $user['area1'] = $area[0];
        $user['area2'] = $area[1];
        $user['area3'] = $area[2];

        $this->assign("roles", $roles);
        $this->assign("sexs", Config::getSexs());
        $this->assign("cards", Config::getCardTypes());
        $this->assign($user);
        return $this->fetch();
    }

    /**
     * 管理员编辑提交
     * @adminMenu(
     *     'name'   => '管理员编辑提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '管理员编辑提交',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {
        $result = $this->validate($this->request->param(), 'User.edit');
        if ($result !== true) {
            $this->error("{$result}");
        }

        //区域选择
        if (isset($_POST['area1']) || isset($_POST['area2']) || isset($_POST['area2'])) {
            $_POST['area'] = $_POST['area1'] . '-' . $_POST['area2'] . '-' . $_POST['area3'];
            unset($_POST['area1']);
            unset($_POST['area2']);
            unset($_POST['area3']);
        }

        $_POST['sex'] = $_POST['sex'][0];
        $_POST['role_id'] = $_POST['role_id'][0];
        $_POST['card_type'] = $_POST['card_type'][0];

        $result = DB::name('user')->update($_POST);

        if ($result) {
            RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_12, $this->request->param('id'));//写日志
            $this->success("操作成功！", url("user/index"));
        } else {
            $this->error("操作失败！");
        }
    }

    public function resetpwd()
    {
        $this->assign('id', $this->request->param('id'));
        return $this->fetch();
    }

    public function resetpwdPost()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();
            if (empty($data['old_password'])) {
                $this->error("原始密码不能为空！");
            }
            if (empty($data['password'])) {
                $this->error("新密码不能为空！");
            }

            $userId = $this->request->param('id');
            $admin = Db::name('user')->where("id", $userId)->find();

            $oldPassword = $data['old_password'];
            $password    = $data['password'];
            $rePassword  = $data['re_password'];

            if (cmf_compare_password($oldPassword, $admin['user_pass'])) {
                if ($password == $rePassword) {
                    if (cmf_compare_password($password, $admin['user_pass'])) {
                        $this->error("新密码不能和原始密码相同！");
                    } else {
                        Db::name('user')->where('id', $userId)->update(['user_pass' => cmf_password($password)]);
                        RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_13, $userId);//写日志
                        $this->success("密码修改成功！", url("user/index"));
                    }
                } else {
                    $this->error("密码输入不一致！");
                }

            } else {
                $this->error("原始密码不正确！");
            }
        }
    }

    /**
     * 管理员个人信息修改
     * @adminMenu(
     *     'name'   => '个人信息',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '管理员个人信息修改',
     *     'param'  => ''
     * )
     */
    public function userInfo()
    {
        $id = cmf_get_current_admin_id();
        $user = Db::name('user')->where("id", $id)->find();
        $this->assign($user);
        return $this->fetch();
    }

    /**
     * 管理员个人信息修改提交
     * @adminMenu(
     *     'name'   => '管理员个人信息修改提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '管理员个人信息修改提交',
     *     'param'  => ''
     * )
     */
    public function userInfoPost()
    {
        if ($this->request->isPost()) {

            $data = $this->request->post();
            $data['birthday'] = strtotime($data['birthday']);
            $data['id'] = cmf_get_current_admin_id();
            $create_result = Db::name('user')->update($data);;
            if ($create_result !== false) {
                RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_12, $data['id']);//写日志
                $this->success("保存成功！");
            } else {
                $this->error("保存失败！");
            }
        }
    }

    /**
     * 管理员删除
     * @adminMenu(
     *     'name'   => '管理员删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '管理员删除',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        if ($id == 1) {
            $this->error("最高管理员不能删除！");
        }

        if (Db::name('user')->delete($id) !== false) {
            Db::name("RoleUser")->where("user_id", $id)->delete();
            RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_16, $id);//写日志
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }

    /**
     * 停用管理员
     * @adminMenu(
     *     'name'   => '停用管理员',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '停用管理员',
     *     'param'  => ''
     * )
     */
    public function ban()
    {
        $id = $this->request->param('id', Config::USER_STATUS_NO, 'intval');
        if (!empty($id)) {
            $result = Db::name('user')->where(["id" => $id, "user_type" => 1])->setField('user_status', Config::USER_STATUS_NO);
            if ($result !== false) {
                RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_14, $id);//写日志
                $this->success("管理员停用成功！", url("user/index"));
            } else {
                $this->error('管理员停用失败！');
            }
        } else {
            $this->error('数据传入失败！');
        }
    }

    /**
     * 启用管理员
     * @adminMenu(
     *     'name'   => '启用管理员',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '启用管理员',
     *     'param'  => ''
     * )
     */
    public function cancelBan()
    {
        $id = $this->request->param('id', 0, 'intval');
        if (!empty($id)) {
            $result = Db::name('user')->where(["id" => $id, "user_type" => 1])->setField('user_status', '1');
            if ($result !== false) {
                RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_15, $id);//写日志
                $this->success("管理员启用成功！", url("user/index"));
            } else {
                $this->error('管理员启用失败！');
            }
        } else {
            $this->error('数据传入失败！');
        }
    }
}