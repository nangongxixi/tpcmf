<?php
// ☢ Author: 刘羽 <373966902@qq.com>  2019/9/19 10:37
namespace app\admin\ext;

trait SingletonTrait
{
    /**
     * @var static
     */
    protected static $instance;

    /**
     * @return static
     */
    public static function getSelfInstance()
    {
        if (!isset(static::$instance)) {
            static::$instance = new static();
        }
        return static::$instance;
    }
}
