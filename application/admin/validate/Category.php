<?php
/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2017/12/11
 * Time: 17:51
 */
namespace app\admin\validate;

use think\Validate;

class Category extends Validate
{
    protected $rule=[
        ['name','require|max:10','分类名必须传递|分类名不能超过10个字符'],
        ['parent_id','number'],
        ['id','number'],
        ['status','number|in:-1,0,1','状态必须是数字|状态范围不合法'],
        ['listorder','number'],
    ];
    /*场景设置*/
    protected $scene=[
        'add'=>['name','parent_id','id'],//添加功能
        'listorder'=>['id','listorder'],
        'status'=>['id','status'],
    ];
}