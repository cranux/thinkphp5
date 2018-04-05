<?php

namespace app\admin\controller;



use think\Request;

class Featured extends Base
{
    private $obj;

    public function _initialize()
    {
        $this->obj=model('Featured');
    }
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $types = config('featured.featured_type');
        $type = input('get.type',0,'intval');
        $data = $this->obj->getFeaturedsByType($type);

        return $this->fetch('',[
            'types' => $types,
            'data' => $data,
            'type' => $type,
        ]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function add()
    {
        //获取推荐位类别
        $types = config('featured.featured_type');
        return $this->fetch('',[
            'types'=> $types,

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
            $this->error('错误!');
        }
        $data = input('post.');
        $validate=validate('Featured');
        if(!$validate->scene('save')->check($data)){
            $this->error($validate->getError());
        }
        $re=model('Featured')->add($data);
        if($re){
            $this->success('添加成功');
        }else{
            $this->error('添加失败');
        }
    }

    /**
     * 修改状态
     */
   /* public function status()
    {
        $data=input('get.');
        $validate=validate('Featured');
        if(!$validate->scene('status')->check($data)){
            $this->error($validate->getError());
        }

        $re=model('Featured')->save(['status'=>$data['status']],['id'=>$data['id']]);
        if($re){
            $this->success('状态更新成功');
        }else{
            $this->error('状态更新失败');
        }
    }*/
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
        //获取推荐位类别
        $types = config('featured.featured_type');
        //获取编辑id
        $id = input('get.id');
        $data = model('Featured')->find($id);

        return $this->fetch('',[
            'types'=> $types,
            'data' => $data,
        ]);
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
            $this->error('错误!');
        }
        $data = input('post.');
        $validate=validate('Featured');
        if(!$validate->scene('updata')->check($data)){
            $this->error($validate->getError());
        }
        if (!$data['image']){
            unset($data['image']);
        }

        $re=model('Featured')->Update($data);
        if($re){
            $this->success('修改成功');
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
