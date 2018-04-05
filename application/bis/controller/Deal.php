<?php

namespace app\bis\controller;

use think\Controller;
use think\Request;
use think\Validate;

class Deal extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $bisid=$this->getLoginUser()->bis_id;
        $deal=model('Deal')->where('bis_id',$bisid)->where('status!=-1')->order('id','desc')->select();

        return $this->fetch('',['deal'=>$deal]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function add()
    {
        //获取一级城市数据
        $citys=model('City')->getNormalCityByParentId();
        //获取一级分类
        $categorys=model('Category')->getNormalFirstCategory();

        $bisid=$this->getLoginUser()->bis_id;
        $bislocation=model('BisLocation')->getNormalLocationByBisId($bisid);
//        $sql=model('BisLocation')->getLastSql();

        return $this->fetch('',[
            'citys'=>$citys,
            'categorys'=>$categorys,
            'bislocation'=>$bislocation,
        ]);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save()
    {
        if (!request()->isPost()){
            $this->error('请求错误');
        }
        $data=input('post.');

        $validate=validate('Deal');
        if(!$validate->scene('save')->check($data)){
            $this->error($validate->getError());
        }
        $bisid=$this->getLoginUser()->bis_id;

        $location=model('BisLocation')->get($data['location_ids'][0]);

        $deals=[
            'bis_id'=>$bisid,
            'name'=>$data['name'],
            'image'=>$data['image'],
            'category_id'=>$data['category_id'],
            'se_category_id'=>empty($data['se_category_id']) ? '' :implode(',',$data['se_category_id']),
            'city_id'=>$data['city_id'],
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
            'bis_account_id'=>$this->getLoginUser()->id,
            'xpoint'=>$location->xpoint,
            'ypoint'=>$location->ypoint,

        ];
        $id=model('Deal')->add($deals);
        if($id){
            $this->success('添加成功',url('deal/index'));
        }else{
            $this->error('添加失败');
        }
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit()
    {
        $sename = [];

        //获取一级城市数据
        $citys=model('City')->getNormalCityByParentId();
        //获取一级分类
        $categorys=model('Category')->getNormalFirstCategory();

        $bisid=$this->getLoginUser()->bis_id;
        $bislocation=model('BisLocation')->getNormalLocationByBisId($bisid);
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

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete()
    {
        $data=input('get.');
        $validate=validate('Deal');
       if(!$validate->scene('delete')->check($data )){
            $this->error($validate->getError());
       }
       $re=model('Deal')->save(['status'=>$data['status']],['id'=>$data['id']]);
       if($re){
           $this->success('状态更新成功');
       }else{
           $this->error('状态更新失败');
       }
    }
}
