<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Base extends Controller
{


    public function status()
    {
        $data=input('get.');
        if (!is_numeric($data['id'])){
            $this->error('id不合法');
        }
        if (!is_numeric($data['status'])){
            $this->error('status不合法');
        }
        //获取控制器
        $model=request()->controller();

        $re=model($model)->save(['status'=>$data['status']],['id'=>$data['id']]);
        if($re){
            $this->success('状态更新成功');
        }else{
            $this->error('状态更新失败');
        }
    }


}
