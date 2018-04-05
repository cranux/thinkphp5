<?php
namespace app\common\validate;
use think\Validate;

/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2017/12/16
 * Time: 16:32
 */

class Bis extends Validate
{
    protected $rule=[
        'name'=>'require|max:50',
        'email'=>'email',
        'logo'=>'require',
        'licence_logo'=>'require',
        'city_id'=>'require',
//        'se_city_id'=>'require',
        'bank_info'=>'require',
        'bank_name'=>'require',
        'bank_user'=>'require',
        'faren'=>'require',
        'faren_tel'=>'require',
        'description'=>'require',


        'tel'=>'require',
        'contact'=>'require',
        'category_id'=>'require',
//        'se_category_id'=>'require',
        'address'=>'require',
        'open_time'=>'require',
        'content'=>'require',


        'username'=>'require',
        'password'=>'require',

        'id'=>'require',
        'status'=>'require',

    ];
    //场景设置
    protected $scene=[
        'add'=>['name','email','logo','licence_logo','city_id','bank_info','bank_name','bank_user','faren','faren_tel','description','tel','contact','category_id','address','open_time','content','username','password'],
        'save'=>['tel','name','city_id','logo','category_id','address','tel','contact','open_time','content'],
        'status'=>['id','status'],
        'update'=>['tel','name','city_id','category_id','address','tel','contact','open_time','content'],
    ];
}