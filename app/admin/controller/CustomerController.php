<?php

namespace app\admin\controller;

use app\admin\model\CustomerModel;
use app\admin\model\MessageModel;
use app\admin\model\RecordLogModel;
use cmf\controller\AdminBaseController;
use think\Db;
use think\db\Query;
use \app\admin\model\Config;


/**
 * Class CustomerController
 * @package app\admin\controller
 * @method error(string $string)
 * @method success(string $string, string $url)
 */
class CustomerController extends AdminBaseController
{
    /**
     * 客户查询
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $content = hook_one('admin_customer_index_view');

        if (!empty($content)) {
            return $content;
        }
        /**搜索条件**/
        $userName = $this->request->param('user_name');
        $address = trim($this->request->param('address'));
        $workerId = trim($this->request->param('worker_uid'));
        $status = trim($this->request->param('check_status'));

        $customerList = Db::name('customer')
            ->where(function (Query $query) use ($userName, $address, $workerId, $status) {
                if ($userName) {
                    $query->where('user_name', 'like', "%$userName%");
                }
                if ($address) {
                    $query->where('address', 'like', "%$address%");
                }
                if ($workerId) {
                    $query->where('worker_uid', '=', $workerId);
                }
                if ($status) {
                    $query->where('check_status', '=', $status);
                }
            })
            ->order("id DESC")
            ->paginate(10);
        $customerList->appends([
            'user_name' => $userName,
            'address' => $address,
            'worker_uid' => $workerId,
            'check_status' => $status
        ]);
        // 获取分页显示
        $page = $customerList->render();
        $this->assign("page", $page);
        $this->assign("customerList", $customerList);
        $this->assign("statusColor", Config::$userStatusColor);
        $this->assign("workerList", $this->getUser('普通员工'));
        $this->assign("statusList", Config::getUserStatus());
        $this->assign("args", $this->request->param());
        return $this->fetch();
    }

    /**
     * 报单列表
     */
    public function unindex()
    {
        $content = hook_one('admin_customer_index_view');

        if (!empty($content)) {
            return $content;
        }

        /**搜索条件**/
        $userName = $this->request->param('user_name');
        $address = trim($this->request->param('address'));
        $workerId = trim($this->request->param('worker_uid'));
        $status = trim($this->request->param('check_status'));

        $customerList = Db::name('customer')
            ->where(function (Query $query) use ($userName, $address, $workerId, $status) {
                if ($userName) {
                    $query->where('user_name', 'like', "%$userName%");
                }
                if ($address) {
                    $query->where('address', 'like', "%$address%");
                }
                if ($workerId) {
                    $query->where('worker_uid', '=', $workerId);
                }
                if ($status) {
                    $query->where('check_status', '=', $status);
                }
            })
            ->order("id DESC")->paginate(10);
        $customerList->appends([
            'user_name' => $userName,
            'address' => $address,
            'worker_uid' => $workerId,
            'check_status' => $status
        ]);
        // 获取分页显示
        $page = $customerList->render();

        $this->assign("page", $page);
        $this->assign("customerList", $customerList);
        $this->assign("statusColor", Config::$customerStatusColor);
        $this->assign("workerList", $this->getUser('普通员工'));
        $this->assign("checkerList", $this->getUser('审核操作员'));
        $this->assign("statusList", Config::getCustomerStatus());
        $this->assign("args", $this->request->param());
        return $this->fetch();
    }

    /**
     * 客户添加
     */
    public function add()
    {
        $content = hook_one('admin_user_add_view');
        if (!empty($content)) {
            return $content;
        }

        $this->assign("workerList", $this->getUser('普通员工'));
        $this->assign("checkerList", $this->getUser('审核操作员'));
        $this->assign("sexs", Config::getSexs());
        $this->assign("cards", Config::getCardTypes());
        $this->assign("defaultCard", Config::CARD_TYPE_1);
        $this->assign("defaultSex", Config::SEX_1);
        return $this->fetch();
    }

    /**
     * 客户添加提交
     * @throws \Exception
     */
    public function addPost()
    {
        $result = $this->validate($this->request->param(), 'Customer');
        if ($result !== true) {
            $this->error("{$result}");
        }
        $this->selectFilter();

        //区域选择
        if (isset($_POST['area2']) || isset($_POST['area1']) || isset($_POST['area2'])) {
            $_POST['area'] = $_POST['area1'] . '-' . $_POST['area2'] . '-' . $_POST['area3'];
            unset($_POST['area1']);
            unset($_POST['area2']);
            unset($_POST['area3']);
        }
        $_POST['check_role_id'] = (DB::name('user')->get($_POST['check_uid']))['role_id'];
        //初始化
        $_POST['user_status'] = Config::USER_STATUS_YES; //启用
        $_POST['check_status'] = Config::CUSTOMER_STATUS_1;//审核中
        $_POST['login_token'] = uniqid();//登录token
        //初始密码
        $siteInfo = cmf_get_option('site_info');
        $_POST['customer_pass'] = cmf_password($siteInfo['customer_default_pwd']);

        $customerObj = DB::name('customer');
        $insertId = $customerObj->insertGetId($_POST);
        if ($insertId !== false) {
            $rs = $customerObj->update(['account' => $this->getSn($insertId)]);//登录账号
            if ($rs) {
                //写日志
                RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_21, $insertId);
                $this->success("添加成功！", url("customer/unindex"));
            }
            $this->error("添加失败！");
        } else {
            $this->error("添加失败！");
        }
    }

    private function getSn($val)
    {
        return 'DJ' . date('Ymd', time()) . str_pad($val, 3, "0", STR_PAD_LEFT);
    }

    /**
     * 编辑内容回填
     */
    public function edit()
    {
        $content = hook_one('admin_user_edit_view');
        if (!empty($content)) {
            return $content;
        }

        $id = $this->request->param('id', 0, 'intval');
        $customerInfo = DB::name('customer')->where("id", $id)->find();

        $this->assign("sexs", Config::getSexs());
        $this->assign("workerList", $this->getUser('普通员工'));
        $this->assign($customerInfo);
        return $this->fetch();
    }

    public function dialog()
    {
        if ($this->request->isPost()) {
            $id = $this->request->param('id');
            $workerUid = $this->request->param('worker_uid');
            if (!$id) {
                echo <<<STR
                        <script>alert('参数错误')</script>
STR;
                $this->assign("workerList", $this->getUser('普通员工'));
                $this->assign("id", $this->request->param('id'));
                $this->assign("wid", $this->request->param('wid'));
                return $this->fetch();
            }
            if (!$workerUid) {
                echo <<<STR
                        <script>alert('必须选择员工')</script>
STR;
                $this->assign("workerList", $this->getUser('普通员工'));
                $this->assign("id", $this->request->param('id'));
                $this->assign("wid", $this->request->param('wid'));
                return $this->fetch();
            }

            $customer = model('Customer');
            $rs = $customer->where("id", $id)->update(['worker_uid' => $workerUid]);
            if (!$rs) {
                echo <<<STR
                        <script>window.parent.location.reload();</script>
STR;
            }
            echo <<<STR
                        <script>window.parent.location.reload();</script>
STR;
        }
        $this->assign("workerList", $this->getUser('普通员工'));
        $this->assign("id", $this->request->param('id'));
        $this->assign("wid", $this->request->param('wid'));
        return $this->fetch();
    }

    public function selectFilter()
    {
        if (!$_POST['area1']) {
            $this->error("请选择省！");
        }
        if (!$_POST['area1']) {
            $this->error("请选择市！");
        }
        if (!$_POST['area1']) {
            $this->error("请选择区！");
        }
    }

    /**
     * 注册客户
     */
    public function editPost()
    {
        $result = $this->validate($this->request->param(), 'Customer.edit');
        if ($result !== true) {
            $this->error("{$result}");
        }
        if (!isset($_POST['phone']) || !$_POST['phone']) {
            $this->error("电话号码必填！");
        }
        $this->selectFilter();

        //区域选择
        if (isset($_POST['area1']) || isset($_POST['area2']) || isset($_POST['area2'])) {
            $_POST['area'] = $_POST['area1'] . '-' . $_POST['area2'] . '-' . $_POST['area3'];
            unset($_POST['area1']);
            unset($_POST['area2']);
            unset($_POST['area3']);
        }
        $_POST['sex'] = $_POST['sex'][0];

        $result = DB::name('customer')->update($_POST);
        if ($result) {
            RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_22, $this->request->param('id'));
            $this->success("操作成功！", url("user/index"));
        } else {
            $this->error("操作失败！");
        }
    }

    /**
     * 客户详情
     */
    public function info()
    {
        $id = $this->request->param('id', 0, 'intval');
        $user = Db::name('customer')->where("id", $id)->find();
        $this->assign($user);
        $this->assign('sexs', Config::getSexs());
        $this->assign('id', $id);
        return $this->fetch();
    }

    public function messageList()
    {
        $uid = $this->request->param('id', 0, 'intval');
        $userType = Config::MESSAGE_SENDER_ROLE_KF;
        $list = Db::name('message')
            ->where(['uid' => $uid, 'user_type' => $userType])
            ->whereOr(['from_uid' => $uid, 'user_type' => $userType])
            ->order("id DESC")
            ->paginate(10);

        $page = $list->render();

        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign("workerList", $this->getUser('普通员工'));
        $this->assign('id', $uid);
        return $this->fetch();
    }

    /**
     * 修改密码
     */
    public function password()
    {
        $uid = $this->request->param('id', 0, 'intval');
        $this->assign('id', $uid);
        return $this->fetch();
    }

    /**
     * 密码修改提交
     * @adminMenu(
     *     'name'   => '密码修改提交',
     *     'parent' => 'password',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '密码修改提交',
     *     'param'  => ''
     * )
     */
    public function passwordPost()
    {
        if ($this->request->isPost()) {

            $data = $this->request->param();
            if (empty($data['old_password'])) {
                $this->error("原始密码不能为空！");
            }
            if (empty($data['password'])) {
                $this->error("新密码不能为空！");
            }

            $userId = $this->request->param('id', 0, 'intval');

            $admin = Db::name('user')->where("id", $userId)->find();

            $oldPassword = $data['old_password'];
            $password = $data['password'];
            $rePassword = $data['re_password'];

            if (cmf_compare_password($oldPassword, $admin['customer_pass'])) {
                if ($password == $rePassword) {

                    if (cmf_compare_password($password, $admin['customer_pass'])) {
                        $this->error("新密码不能和原始密码相同！");
                    } else {
                        Db::name('customer')->where('id', $userId)->update(['customer_pass' => cmf_password($password)]);
                        $this->success("密码修改成功！");
                    }
                } else {
                    $this->error("密码输入不一致！");
                }

            } else {
                $this->error("原始密码不正确！");
            }
        }
    }

    public function log()
    {
        /**搜索条件**/
        $uid = trim($this->request->param('id'));

        $cond = [];
        if ($uid) {
            $cond[] = ['uid', '=', $uid];
        }

        $list = RecordLogModel::with('customer')
            ->where($cond)
            ->order("id DESC")
            ->paginate(10);
        $list->appends(['uid' => $uid]);

        // 获取分页显示
        $page = $list->render();

        $this->assign("page", $page);
        $this->assign("userList", Db::name('user')->all());
        $this->assign("list", $list);
        $this->assign("args", $this->request->param());
        $this->assign("logType", Config::logTypes());
        $this->assign('id', $uid);
        return $this->fetch();
    }


    /**
     * 删除客户
     */
    public
    function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        if (Db::name("Customer")->where("id", $id)->delete()) {
            RecordLogModel::getSelfInstance()->add(Config::LOG_TYPE_30, $id);
            $this->success("删除成功！");
        } else {
            $this->error("删除失败！");
        }
    }

    /**
     * 审核
     * @throws \Exception
     */
    public
    function check()
    {
        $id = $this->request->param('id', Config::CUSTOMER_STATUS_2, 'intval');
        $type = $this->request->param('type');
        if (array_search($type, [Config::CUSTOMER_STATUS_2, Config::CUSTOMER_STATUS_3]) === false) {
            $this->error('操作类型错误！');
        }
        if (empty($id)) {
            $this->error('数据传入失败！');
        }
        $result = Db::name('customer')->where([
            "id" => $id,
            "user_status" => Config::USER_STATUS_YES
        ])->setField('check_status', $type);
        if ($result !== false) {
            //写日志
            $logType = '';
            if ($type == Config::CUSTOMER_STATUS_2) {
                $logType = Config::LOG_TYPE_24;
            }
            if ($type == Config::CUSTOMER_STATUS_3) {
                $logType = Config::LOG_TYPE_25;
            }
            RecordLogModel::getSelfInstance()->add($logType, $id);

            $this->success("审核成功！", url("customer/unindex"));
        } else {
            $this->error('客户停用中！');
        }
    }

    /**
     * 修改客户状态
     */
    public
    function changeStatus()
    {
        $id = $this->request->param('id', '', 'intval');
        $type = $this->request->param('type');
        if (array_key_exists($type, Config::getUserStatus()) === false) {
            $this->error('操作类型错误！');
        }
        if (empty($id)) {
            $this->error('数据传入失败！');
        }
        $result = Db::name('customer')->where(["id" => $id])->setField('user_status', $type);
        if ($result !== false) {
            //写日志
            $logType = '';
            if ($type == Config::USER_STATUS_YES) {
                $logType = Config::LOG_TYPE_29;
            }
            if ($type == Config::USER_STATUS_NO) {
                $logType = Config::LOG_TYPE_28;
            }
            RecordLogModel::getSelfInstance()->add($logType, $id);

            $this->success("停用成功！", url("customer/index"));
        } else {
            $this->error('停用失败！');
        }
    }

    private
    function getUser(
        $name = null
    ) {
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
