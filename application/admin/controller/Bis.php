<?php

namespace app\admin\controller;

use phpmailer\Email;
use think\Controller;
use think\Request;

class Bis extends Controller
{
    private $obj;
    public function _initialize(){
        $this->obj = model('Bis');
    }
    /**
     * 入驻申请列表
     * @return mixed
     */
    public function apply()
    {
        $bis=$this->obj->getBisByStatus();
        return $this->fetch('',[
            'bis'=>$bis,
        ]);
    }


    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $bis=$this->obj->getBisByStatus(1);
        return $this->fetch('',[
            'bis'=>$bis,
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
        $bisData=model('Bis')->get($id);
        $locationData=model('BisLocation')->get(['bis_id'=>$id,'is_main'=>1]);
        $bisAcction=model('BisAccount')->get(['bis_id'=>$id,'is_main'=>1]);
        /*print_r($locationData);
        exit;*/
        return $this->fetch('',[
            'citys'=>$citys,
            'categorys'=>$categorys,
            'bisData'=>$bisData,
            'locationData'=>$locationData,
            'bisAcction'=>$bisAcction,
        ]);
    }
    //修改状态
    public function status()
    {
        $data=input('get.');

        $validate=validate('Bis');
        if(!$validate->scene('status')->check($data)){
            $this->error($validate->getError());
        }


        $res=$this->obj->save(['status'=>$data['status']],['id'=>$data['id']]);

        $location=model('BisLocation')->save(['status'=>$data['status']],['bis_id'=>$data['id']]);
        $account=model('BisAccount')->save(['status'=>$data['status']],['bis_id'=>$data['id']]);

        if($res && $location && $account){
            //发送邮件 status 1,2,-1
            $emailname=$this->obj->field('email')->find($data['id']);
            $email=$emailname['email'];
            if($data['status']==1){
                $title='平台审核通知';
                $content='恭喜你，您的入住申请已审核通过，可以登陆';
                Email::send($email,$title,$content);
            }else if($data['status']==2){
                $title='平台审核通知';
                $content='恭喜你，您的入住申请因不符合要求，未通过审核，请重新提交';
                Email::send($email,$title,$content);
            }else if($data['status']== -1){
                $title='平台审核通知';
                $content='恭喜你，您的入住申请因不符合要求，已被删除，请重新提交';
                Email::send($email,$title,$content);
            }


            $this->success('状态更新成功');
        }else{
            $this->success('状态更新失败');
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
    {        $data=model('Bis')->where('status',2)->whereOr('status',-1)->paginate();
        return $this->fetch('',[
            'bis'=>$data,
        ]);
    }


}
