<?php
/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2018/2/3
 * Time: 15:07
 */

namespace app\common\validate;


use think\Validate;

class Featured extends Validate
{
    protected $rule = [
        'title'=>'require',
        'image'=>'require',
        'type'=>'require',
        'url'=>'require',
        'description'=>'require',
        'id'=>'require',
        'status'=>'require'
    ];
    protected $scene=[
        'save'=>['title','image','type','url','description'],
        'status'=>['id','status'],
        'updata'=>['title','type','url','description'],
    ];
}