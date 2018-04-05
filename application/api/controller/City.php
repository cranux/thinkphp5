<?php
/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2017/12/15
 * Time: 16:46
 */

namespace app\api\controller;

use function Psy\sh;
use think\Controller;

class City extends Controller
{
    protected $obj;
    public function _initialize(){
        $this->obj=model('City');
    }

    public function getCityByParentId()
    {
        $id=input('post.id');
        if(!$id){
            $this->error('ID不合法');
        }

        $citys=$this->obj->getNormalCityByParentId($id);
        if($citys){
            return show(1,'success',$citys);
        }else{
            return show(0,'error');
        }
    }
}