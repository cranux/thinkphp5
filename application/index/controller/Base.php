<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

class Base extends Controller
{
    public $city;
    public $account;

    public function _initialize()
    {
        //城市数据
        $citys = model('City')->getNormalCitys();

        $this->getCity($citys);
        //获取首页分类数据
        $cats = $this->getRecommendCats();

        $this->assign('citys',$citys);
        $this->assign('city',$this->city);
        $this->assign('user',$this->getLoginUser());
        $this->assign('cats', $cats);
        $this->assign('controller', strtolower(request()->controller()));
        $this->assign('title', 'o2o团购网');
    }

    public function getCity($citys)
    {
        $defaultuname = '';
        foreach ($citys as $city){
            $city = $city->toArray();//对象转数组
//            print_r($city);die;
            if ($city['is_default'] == 1){
                $defaultuname  = $city['uname'];
                break;
            }
            $defaultuname = $defaultuname ? $defaultuname : 'nanchang';
            $cityuname = input('get.city',$defaultuname,'trim');
            if (session('cityuname','','o2o') && !input('get.city')){
                $cityuname = session('cityuname','','o2o');
            }else{
                session('cityuname',$cityuname,'o2o');
            }

            $this->city = model('City')->where(['uname'=>$cityuname])->find();

        }
    }


    public function getLoginUser()
    {
        if(!$this->account){
            $this->account=session('o2o_user','','o2o');
        }

        return $this->account;
    }

    /**
     * 获取首页推荐中的商品分类数据
     */
    public function getRecommendCats()
    {
        $parentIds = $sedcatArr = $recomCats = [];
        $cats = model('Category')->getNormalRecommendCategoryByParentId(0,5);
        foreach ($cats as $cat){
            $parentIds[] = $cat->id;
        }
        //获取二级分类下的数据
       $sedCats = model('Category')->getNormalCategoryIdParentId($parentIds);

        foreach ($sedCats as $sedCat){
            $sedcatArr[$sedCat->parent_id][] = [
                'id'=>$sedCat->id,
                'name'=>$sedCat->name,
            ];
        }


        //recomCats 代表是一级分类数据和二级数据， []I一个参数是 一级分类的name，第二个参数是此一级分类下面的所有二级分类数据
        foreach ($cats as $cat){
            $recomCats[$cat->id] = [
                $cat->name,
                empty($sedcatArr[$cat->id]) ? [] :$sedcatArr[$cat->id],
            ];
        }

        return $recomCats;
    }
}
