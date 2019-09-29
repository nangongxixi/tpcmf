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

class UserValidate extends Validate
{
    protected $rule = [
        'user_login' => 'require|unique:user,user_login|max:6',
        'account' => 'require',
        'mobile' => 'require|mobile',
        'card_id' => 'max:18|alphaNum',
    ];
    protected $message = [
        'user_login.require' => '姓名不能为空',
        'user_login.unique'  => '姓名已存在',
        'user_login.max'  => '姓名最多6个字',
        'mobile.require'  => '手机号不能为空',
        'mobile.mobile'  => '手机号格式错误',
        'account.require' => '工号不能为空',
        'card_id.max' => '证件号码最多18位',
        'card_id.alphaNum' => '证件号码必须是字母或数字',
    ];

    protected $scene = [
        'addPost'  => ['user_login',  'account', 'mobile', 'card_id'],
        'edit' => ['user_login',  'account', 'mobile', 'card_id'],
    ];
}