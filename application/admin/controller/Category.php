<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Category extends Controller
{
    protected $obj;
    public function _initialize()
    {
        $this->obj=model('Category');
    }
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $parent_id=input('get.parent_id',0,'intval');

        $categorys=$this->obj->getFirstCategorys($parent_id);
        return $this->fetch('',[
            'categorys'=>$categorys,
        ]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        $categorys=$this->obj->getNormalFirstCategory();

        return $this->fetch('add',[
            'categorys'=>$categorys
        ]);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
//        print_r($_POST);
//        print_r(input('post.'));
//        print_r(request()->post())
        if(!request()->isPost()){//判断当前是否为post提交数据的
            return $this->error('请求失败');
        }
        $data=$request->post();

        $validate=validate('Category');
        if(!$validate->scene('add')->check($data)){
            $this->error($validate->getError());
        }
        if(!empty($data['id'])){

            return $this->update($data);
        }else {
            //
            $res = $this->obj->add($data);
            if ($res) {
                $this->success('新增成功');
            } else {
                $this->error('新增失败');
            }
        }


    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id,$listorder)//排序
    {
       $res= $this->obj->save(['listorder'=>$listorder],['id'=>$id]);
       if($res){
           $this->result($_SERVER['HTTP_REFERER'],1,'success');
       }else{
           $this->result($_SERVER['HTTP_REFERER'],0,'更新失败');
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
        if(intval($id)<1){
            $this->error('参数不合法');
        }
        $category=$this->obj->get($id);

        $categorys=$this->obj->getNormalFirstCategory();

        return $this->fetch('',[
            'categorys'=>$categorys,
            'category'=>$category
        ]);
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update($data)
    {
        $res=$this->obj->save($data,['id'=>intval($data['id'])]);
        if($res){
            $this->success('更新成功');
        }else{
            $this->error('更新失败');
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
    //修改状态
    public function status()
    {
        $data=input('get.');

        $validate=validate('Category');
        if(!$validate->scene('status')->check($data)){
            $this->error($validate->getError());
        }

        $res=$this->obj->save(['status'=>$data['status']],['id'=>$data['id']]);
        if($res){
            $this->success('状态更新成功');
        }else{
            $this->success('状态更新失败');
        }
    }
}
