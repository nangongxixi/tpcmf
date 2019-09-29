<?php
// ☢ Author: Scalpel <373966902@qq.com> 2019/9/19 11:33
namespace app\admin\model;

use app\admin\ext\SingletonTrait;
use think\Model;

class CustomerModel extends Model
{
    protected $pk = 'id';
    protected $table = 'dj_customer';

    use SingletonTrait;
}
