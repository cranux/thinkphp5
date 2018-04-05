<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Deal extends Controller
{
    private $obj;

    public function _initialize()
    {
        $this->obj=model('Deal');
    }
    public function apply()
    {
        $data=model('Deal')->where('status!=1')->order('id','desc')->paginate();
        foreach ($data as $k=>$d){
            $bisname=model('Bis')->field('name')->find($d->bis_id);
            $data[$k]['bisname']=$bisname['name'];
        }

        return $this->fetch('',[
            'data'=>$data,
        ]);
    }
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $cityArrs=$categoryArrs=[];
        $categorys=model('Category')->getNormalFirstCategory();
        foreach ($categorys as $c){
            $categoryArrs[$c->id] = $c->name;
        }
        $citys = model('City')->getNormalCitys();
        foreach ($citys as $city){
            $cityArrs[$city->id] = $city->name;
        }
//        print_r($cityArrs);
        $data = input('get.');
        $sdata = [];
        if (!empty($data['start_time']) && !empty($data['end_time']) && strtotime($data['end_time']) > strtotime($data['start_time'])){
            $sdata['create_time'] = [
                ['gt',strtotime($data['start_time'])],
                ['lt',strtotime($data['end_time'])],
            ];
        }
        if (!empty($data['category_id'])){
            $sdata['category_id'] = $data['category_id'];
        }
        if(!empty($data['city_id'])){
            $sdata['city_id'] = $data['city_id'];
        }

        if(!empty($data['name'])){
            $sdata['name'] = ['like','%'.$data['name'].'%'];
        }
        $deals=$this->obj->getNormalDeals($sdata);
//        print_r($deals);die;

        return $this->fetch('',[
            'categorys'=>$categorys,
            'citys'=>$citys,
            'deals' => $deals,
            'category_id'=>empty($data['category_id']) ? '':$data['category_id'],
            'city_id'=>empty($data['city_id']) ? '' : $data['city_id'],
            'name'=>empty($data['name']) ? '' : $data['name'],
            'start_time'=>empty($data['start_time']) ? '' : $data['start_time'],
            'end_time'=>empty($data['end_time']) ? '' : $data['end_time'],
            'categoryArrs'=>$categoryArrs,
            'cityArrs'=>$cityArrs,
        ]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read()
    {
        $sename = [];

        //获取一级城市数据
        $citys=model('City')->getNormalCityByParentId();
        //获取一级分类
        $categorys=model('Category')->getNormalFirstCategory();



//        $sql=model('BisLocation')->getLastSql();
        $data=input('get.');
        $validate=validate('Deal');
        if(!$validate->scene('edit')->check($data)){
            $this->error($validate->getError());
        }
        $id=$data['id'];
        $deal=model('Deal')->find($id);
        $parent_id=model('City')->field('parent_id,name')->find($deal['city_id']);
        $deal['citys']=$parent_id['parent_id'];
        $deal['city_name']=$parent_id['name'];
        $secate=explode(',',$deal['se_category_id']);

        foreach ($secate as $s){
            $catename = model('Category')->field('name,id')->find($s);
            if (count($catename)){

                $sename[] = $catename;
            }
        }

        $deal['secate']=$sename;
        $bislocation=model('BisLocation')->getNormalLocationByBisId($deal['bis_id']);
//        $locationids=explode(',',$deal['location_ids']);

        /* print_r($deal);
         die;*/

        return $this->fetch('',[
            'citys'=>$citys,
            'categorys'=>$categorys,
            'bislocation'=>$bislocation,
            'deal'=>$deal,

        ]);
    }

    public function status()
    {
        $data=input('get.');
        $validate=validate('Deal');
        if(!$validate->scene('delete')->check($data)){
            $this->error($validate->getError());
        }

        $re=model('Deal')->save(['status'=>$data['status']],['id'=>$data['id']]);
        if($re){
            $this->success('状态更新成功');
        }else{
            $this->error('状态更新成功');
        }
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update()
    {
        if (!request()->isPost()){
            $this->error('请求错误');
        }
        $data=input('post.');

        $validate=validate('Deal');
        if(!$validate->scene('update')->check($data)){
            $this->error($validate->getError());
        }


        $location=model('BisLocation')->get($data['location_ids'][0]);

        $deals=[

            'name'=>$data['name'],
            'category_id'=>$data['category_id'],
            'se_category_id'=>empty($data['se_category_id']) ? '' :implode(',',$data['se_category_id']),

            'location_ids'=>empty($data['location_ids']) ? '' :implode(',',$data['location_ids']),
            'start_time'=>strtotime($data['start_time']),
            'end_time'=>strtotime($data['end_time']),
            'total_count'=>$data['total_count'],
            'origin_price'=>$data['origin_price'],
            'current_price'=>$data['current_price'],
            'coupons_begin_time'=>strtotime($data['coupons_begin_time']),
            'coupons_end_time'=>strtotime($data['coupons_end_time']),
            'description'=>$data['description'],
            'notes'=>$data['notes'],

            'xpoint'=>$location->xpoint,
            'ypoint'=>$location->ypoint,

        ];
        if ($data['image']){
            $deals['image'] = $data['image'];
        }
        if ($data['city_id']){
            $deals['city_id'] = $data['city_id'];
        }

        $deals['id'] = $data['id'];

        $id=model('Deal')->update($deals);
        if($id){
            $this->success('修改成功',url('deal/index'));
        }else{
            $this->error('修改失败');
        }
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
