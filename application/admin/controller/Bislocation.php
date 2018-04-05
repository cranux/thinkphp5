<?php

namespace app\admin\controller;

use phpmailer\Email;
use think\Controller;
use think\Request;

class Bislocation extends Controller
{
    private $obj;
    public function _initialize(){
        $this->obj=model('BisLocation');
    }

    /**
     * 入驻申请列表
     * @return mixed
     */
    public function apply()
    {

        $data=model('BisLocation')->getBisMain(0,0);
        foreach ($data as $k=>$d){
            $bisname=model('Bis')->field('name')->find($d->bis_id);
            $data[$k]['bisname']=$bisname['name'];
        }

        return $this->fetch('',['bis'=>$data]);
    }

    public function status()
    {
        $data=input('get.');

        $validate=validate('Bis');
        if(!$validate->scene('status')->check($data)){
            $this->error($validate->getError());
        }
        $bisId=$this->obj->field('bis_id')->find($data['id']);

        $bisemail=model('Bis')->field('email')->find($bisId['bis_id']);
//       print_r($bisemail['email']);
//        print_r($data['status']);

        $res=$this->obj->save(['status'=>$data['status']],['id'=>$data['id']]);
        if($res){
            $email=$bisemail['email'];
            if($data['status']==1){
                $title='平台审核通知';
                $content='恭喜你，您的门店申请已审核通过，可以登陆';
                Email::send($email,$title,$content);
            }else if($data['status']==2){
                $title='平台审核通知';
                $content='恭喜你，您的门店申请因不符合要求，未通过审核，请重新提交';
                Email::send($email,$title,$content);
            }else if($data['status']== -1){
                $title='平台审核通知';
                $content='恭喜你，您的门店申请因不符合要求，已被删除，请重新提交';
                Email::send($email,$title,$content);
            }



            $this->success('状态更新成功');
        }else{
            $this->error('状态更新成功');
        }
    }
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $data=model('BisLocation')->where('is_main',0)->where('status',1)->paginate();
        foreach ($data as $k=>$d){
            $bisname=model('Bis')->field('name')->find($d->bis_id);
            $data[$k]['bisname']=$bisname['name'];
        }
        return $this->fetch('',[
            'bis'=>$data,
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
        $id=input('get.id');

        if(empty($id)){
            return $this->error('ID错误');
        }
        //获取一级城市数据
        $citys=model('City')->getNormalCityByParentId();
        //获取一级分类
        $categorys=model('Category')->getNormalFirstCategory();
        //获取门店信息
        $data=$this->obj->find($id);


        return $this->fetch('',[
            'citys'=>$citys,
            'categorys'=>$categorys,
            'data'=>$data
        ]);
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
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 显示删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete()
    {
        $data=model('BisLocation')->where('is_main',0)->where('status',2)->whereOr('status',-1)->paginate();
//        $sql=model('BisLocation')->getLastSql();

        return $this->fetch('',[
            'bis'=>$data,
        ]);
    }
}
