<?php
namespace app\bis\controller;

use think\Controller;

class Login extends Controller
{
    public function index()
    {
        if(request()->isPost()){
            //登陆
            $data=input('post.');
            //通过用户名获取用户的相关信息
            $validate=validate('BisAccount');
            if(!$validate->scene('login')->check($data)){
                $this->error($validate->getError());
            }
            $ret=model('BisAccount')->get(['username'=>$data['username']]);
            if(!$ret || $ret->status!=1){
                $this->error('该用户不存在或为审核通过');
            }
            if($ret->password != md5($data['password'].$ret->code)){
                $this->error('密码不正确');
            }

            model('BisAccount')->updateById(['last_login_time'=>time()],$ret->id);
            //保存用户信息 bis是作用域
            session('bisAccount',$ret,'bis');
            return $this->success('登陆成功',url('index/index'));

        }else {
            $accpunt=session('bisAccount','','bis');
            if($accpunt && $accpunt->id){
                $this->redirect(url('index/index'));
            }
            return $this->fetch();
        }

    }

    public function logout()
    {
        //清除session
        session(null,'bis');
        $this->redirect(url('login/index'));
    }
}