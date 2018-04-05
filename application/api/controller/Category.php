<?php
/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2017/12/15
 * Time: 17:15
 */

namespace app\api\controller;


use think\Controller;

class Category extends Controller
{
    protected $obj;
    public function _initialize(){
        $this->obj=model('Category');
    }

    public function getCategoryByParentId()
    {
        $id=input('post.id',0,'intval');
        if(!$id){
            $this->error('ID不合法');
        }

        $citys=$this->obj->getNormalFirstCategory($id);
        if($citys){
            return show(1,'success',$citys);
        }else{
            return show(0,'error');
        }
    }
}