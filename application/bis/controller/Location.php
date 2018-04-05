<?php

namespace app\bis\controller;

use think\Controller;
use think\Request;

class Location extends Base
{
    /**
     * @return mixed
     * 
     */
    public function index(){

        $account=session('bisAccount','','bis');
        $id=$account['bis_id'];


        $bis=model('BisLocation')->getlocation($id);

        return $this->fetch('',[
            'bism'=>$bis,
        ]);
    }

    /**
     * @return mixed
     */
    public function add()
    {
        //获取一级城市数据
        $citys=model('City')->getNormalCityByParentId();
        //获取一级分类
        $categorys=model('Category')->getNormalFirstCategory();
        return $this->fetch('',[
            'citys'=>$citys,
            'categorys'=>$categorys,
        ]);
    }

    /**
     *
     */
    public function save()
    {
        if (!request()->isPost()){
            $this->error('请求错误');
        }
        //获取表单的值
        $data=input('post.');
        //检验数据
        $validate=validate('Bis');
        if(!$validate->scene('save')->check($data)){
            $this->error($validate->getError());
        }
        $data['cat']='';
        if(!empty($data['se_category_id'])) {
            $data['cat'] = implode('|', $data['se_category_id']);

        }
        //获取经纬度
        $lnglat=\Map::getLngLat($data['address']);
//        print_r($lnglat);die;
        if(empty($lnglat) || $lnglat['status'] != 0 ||$lnglat['result']['precise'] !=1){
            $this->error('无法获取地址数据');
        }

        $bisId=$this->getLoginUser()->bis_id;
        $locationData=[
            'bis_id'=>$bisId,
            'name'=>$data['name'],
            'logo'=>$data['logo'],
            'tel'=>$data['tel'],
            'contact'=>$data['contact'],
            'category_id'=>$data['category_id'],
            'category_path'=>$data['category_id'].','.$data['cat'],
            'city_id'=>$data['city_id'],
            'city_path'=>empty($data['se_city_id']) ? $data['city_id'] : $data['city_id'].','.$data['se_city_id'],
            'api_address'=>$data['address'],
            'open_time'=>$data['open_time'],
            'content'=>empty($data['content']) ? '' : $data['content'],
            'is_main'=>0,//代表是分店信息
            'xpoint'=>empty($lnglat['result']['location']['lng']) ? '' : $lnglat['result']['location']['lng'],
            'ypoint'=>empty($lnglat['result']['location']['lat']) ? '' : $lnglat['result']['location']['lat'],

        ];
        $locationId=model('BisLocation')->add($locationData);
        if ($locationId){
            return $this->success('门店申请成功');
        }else{
            return $this->error('门店申请失败');
        }
    }

    /**
     * @return mixed|void
     */
    public function detail()
    {
        $id=input('get.id');
        if(empty($id)){
            return $this->error('ID错误');
        }
        //获取一级城市数据
        $citys=model('City')->getNormalCityByParentId();
        //获取一级分类
        $categorys=model('Category')->getNormalFirstCategory();
        //获取商户数据
        $bisData=model('BisLocation')->get($id);

        return $this->fetch('',[
            'citys'=>$citys,
            'categorys'=>$categorys,
            'bisData'=>$bisData,
        ]);
    }

    /**
     *
     */
    public function update()
    {
        if(!request()->isPost()){
            $this->error('请求错误');
        }
        //获取表单的值
        $data=input('post.');
        //检验数据
        $validate=validate('Bis');
        if(!$validate->scene('update')->check($data)){
            $this->error($validate->getError());
        }
        $data['cat']='';
        if(!empty($data['se_category_id'])) {
            $data['cat'] = implode('|', $data['se_category_id']);

        }
        //获取经纬度
        $lnglat=\Map::getLngLat($data['address']);
//        print_r($lnglat);die;
        if(empty($lnglat) || $lnglat['status'] != 0 ||$lnglat['result']['precise'] !=1){
            $this->error('无法获取地址数据');
        }

//        $bisId=$this->getLoginUser()->bis_id;

        $locationData=[
//            'bis_id'=>$bisId,
            'name'=>$data['name'],

            'tel'=>$data['tel'],
            'contact'=>$data['contact'],
            'category_id'=>$data['category_id'],
            'category_path'=>$data['category_id'].','.$data['cat'],
            'city_id'=>$data['city_id'],
            'city_path'=>empty($data['se_city_id']) ? $data['city_id'] : $data['city_id'].','.$data['se_city_id'],
            'api_address'=>$data['address'],
            'open_time'=>$data['open_time'],
            'content'=>empty($data['content']) ? '' : $data['content'],
            'is_main'=>0,//代表是分店信息
            'xpoint'=>empty($lnglat['result']['location']['lng']) ? '' : $lnglat['result']['location']['lng'],
            'ypoint'=>empty($lnglat['result']['location']['lat']) ? '' : $lnglat['result']['location']['lat'],

        ];
        if($data['logo']){
            $locationData['logo']=$data['logo'];
        }
        $locationId=model('BisLocation')->allowField(true)->save($locationData,['id'=>$data['id']]);
        if ($locationId){
            return $this->success('更新成功');
        }else{
            return $this->error('更新失败');
        }
    }

    public function status()
    {
        $data=input('get.');
        $validate=validate('Bis');
        if(!$validate->scene('status')->check($data)){
            $this->error($validate->getError());
        }
        $res=model('BisLocation')->save(['status'=>$data['status']],['id'=>$data['id']]);
        if($res){
            $this->success('状态更新成功');
        }else{
            $this->error('状态更新失败');
        }

    }

}
