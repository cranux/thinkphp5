<?php
namespace app\index\controller;

use think\Controller;

class Index extends Base
{
    public function index()
    {
        $show0 = model('Featured')->where('type',0)->where('status',1)->select();
        $show1 = model('Featured')->where('type',1)->where('status',1)->select();
        //商品分类 数据-美食 推荐的数据
        $datas = model('Deal')->getNormalDealByCategoryCityId(1,$this->city->id);
        //获取4个子分类
        $meishicates = model('Category')->getNormalRecommendCategoryByParentId(1,4);
       /* print_r();
        die;*/
        return  $this->fetch('',[
            'show0'=>$show0,
            'show1'=>$show1,
            'datas'=>$datas,
            'meishicates'=>$meishicates,
        ]);
    }

    public function map()
    {
        $data=input('get.address');
        $lnglat=\Map::getLngLat($data);
//        print_r($lnglat);die;
        if(empty($lnglat) || $lnglat['status'] != 0 ||$lnglat['result']['precise'] !=1){
            $this->error('无法获取地址数据');
        }
        print_r($lnglat);
    }
}


/*
 * nginx的设置导致表单提交内容多出一个键值对 []'当前的路由名'=>''
 *
 * if (!-e $request_filename)
           {
               rewrite ^/(.*)$ /index.php?/$1 last;
                break;
           }
            if (!-d $request_filename)
            {
                rewrite ^/(.+)/$ /$1 permanent;
            }
            */

