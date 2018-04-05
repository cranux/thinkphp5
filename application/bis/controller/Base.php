<?php

namespace app\bis\controller;

use think\Controller;
use think\Request;

class Base extends Controller
{
    public $account;
    public function _initialize()
    {
        //判断用户是否登录
        $isLogin=$this->isLogin();
        if(!$isLogin){
            $this->redirect(url('login/index'));
        }
    }

    public function isLogin()
    {
        //获取session
        $user=$this->getLoginUser();
        if ($user && $user->id){
            return true;
        }
    }

    public function getLoginUser()
    {
        if(!$this->account){
            $this->account=session('bisAccount','','bis');
        }

        return $this->account;
    }
}
