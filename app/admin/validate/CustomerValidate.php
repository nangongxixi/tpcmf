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
namespace app\admin\validate;

use think\Validate;

class CustomerValidate extends Validate
{
    protected $rule = [
        'user_name' => 'require|unique:customer,user_name|max:6',
        'address' => 'require|max:30',
        'worker_uid' => 'require',
        'check_uid' => 'require',
//        'sex' => 'require',
    ];
    protected $message = [
        'user_name.require' => '客户姓名不能为空',
        'user_name.unique'  => '客户姓名已存在',
        'user_name.max'  => '客户姓名最多6个字',
        'address.require'  => '地址不能为空',
        'address.max'  => '地址最多30个字',
        'worker_uid.require' => '必须选择所属员工',
        'check_uid.require' => '必须选择审核操作员',
    ];

    protected $scene = [
        'addPost'  => ['user_name',  'address', 'worker_uid', 'check_uid'],
        'edit'  => ['address', 'worker_uid', 'check_uid', 'sex'],
    ];
}