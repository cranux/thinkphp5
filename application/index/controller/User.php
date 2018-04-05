<?php
namespace app\index\controller;

use think\Controller;
use think\Request;

class User extends Controller
{
    public function login()
    {
        $user = session('o2o_user','','o2o');
        if($user && $user->id){
            $this->redirect(url('/'));
        }
        return  $this->fetch();
    }

    /**
     * @return mixed
     * 注册
     */
    public function register()
    {
        if (!request()->isPost()){
            return  $this->fetch();
        }
        $data = input('post.');

        $validate=validate('User');
        if(!$validate->scene('regis')->check($data)){
            $this->error($validate->getError());
        }

        if (!captcha_check($data['verifyCode'])){
            $this->error('验证码错误！');
        }
        if($data['password'] != $data['repassword']){
            $this->error('两次输入的密码不一致！');
        }
        //密码加盐字符串
        $data['code'] = mt_rand(100,10000);
        $data['password']=md5($data['password'].$data['code']);

        try {
            $res = model('User')->add($data);

        }catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        if($res){
            $this->success('注册成功!',url('user/login'));
        }else{
            $this->error('注册失败');
        }

    }


    public function logincheck()
    {
        if(!request()->isPost()){
            $this->error('提交不合法');
        }
        $data = input('post.');
        $validate=validate('User');
        if(!$validate->scene('login')->check($data)){
            $this->error($validate->getError());
        }

        try {

        $user = model('User')->getUserByUsername($data['username']);

        }catch (\Exception $e){
            $this->error($e->getMessage());
        }

        if (!$user || $user->status != 1){
            $this->error('该用户不存在');
        }
        //判断密码是否合理
        if(md5($data['password'].$user->code) != $user->password){
            $this->error('密码不正确');
        }
        //获取当前用户的ip地址
        $request = Request::instance();
        $ip = $request->ip();


        $res = model('User')->updateById(['last_login_time'=>time(),'last_login_ip'=>$ip],$user->id);

        //把信息记录到session
        session('o2o_user',$user,'o2o');
        $this->success('登录成功',url('/'));
    }

    public function logout()
    {
        session(null,'o2o');
        $this->redirect(url('user/login'));
    }
}
