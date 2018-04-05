<?php

namespace app\api\controller;

use function Psy\sh;
use think\Controller;
use think\Request;

class Order extends Controller
{
    protected $obj;
    public function _initialize(){
        $this->obj=model('Order');
    }
    public function paystatus()
    {
        $id = input('post.id',0,'intval');
        if (!session('o2o_user','','o2o')) {
            $this->error('请登录','user/login');
        }
        $order = $this->obj->get($id);
        if ($order->pay_status == 1) {
            return show(1,'success');
        }
        return show(0,'error');
    }
}
