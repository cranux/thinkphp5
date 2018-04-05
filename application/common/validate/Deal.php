<?php
/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2018/1/23
 * Time: 15:36
 */

namespace app\common\validate;


use think\Validate;

class Deal extends Validate
{
    protected $rule=[
        'name'=>'require',
        'city_id'=>'require',
//        'se_city_id'=>'require',
        'category_id'=>'require',
        'se_category_id'=>'require',
        'location_ids'=>'require',
        'image'=>'require',
        'start_time'=>'require',
        'end_time'=>'require',
        'total_count'=>'require',
        'origin_price'=>'require',
        'current_price'=>'require',
        'coupons_begin_time'=>'require',
        'coupons_end_time'=>'require',
        'description'=>'require',
        'notes'=>'require',
        'id'=>'number|require',
        'status'=>'number|require'
    ];
    protected $scene=[
        'save'=>['name','city_id','category_id','location_ids','image','start_time','end_time','total_count','origin_price','current_price','coupons_begin_time','coupons_end_time','description','notes'],
        'edit'=>['id'],
        'delete'=>['id','status'],
        'update'=>['name','category_id','location_ids','start_time','end_time','total_count','origin_price','current_price','coupons_begin_time','coupons_end_time','description','notes'],
    ];
}