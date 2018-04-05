<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

class Order extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function confirm()
    {
        if (!$this->getLoginUser()) {
            $this->error('请登录','user/login');
        }

        $id = input('get.id',0,'intval');
        if (!$id) {
            $this->error('参数不合法');
        }
        $count = input('get.count',1,'intval');
        $deal = model('Deal')->get($id);
        if (!$deal || $deal->status !=1) {
            $this->error('商品不存在');
        }
        $deal = $deal->toArray();
        return $this->fetch('',[
            'controller' => 'pay',//加载css
            'title' => '订单支付',
            'deal' => $deal,
            'count' => $count,
        ]);
    }

    public function index()
    {
//        dump(input('get.'));
        $user = $this->getLoginUser();
        if (!$user) {
            $this->error('请登录','user/login');
        }
        $id = input('get.id',0,'intval');
        if (!$id) {
            $this->error('参数不合法');
        }
        $dealCount = input('get.deal_count',0,'intval');
        $totalPrice = input('get.total_price');
        $deal = model('Deal')->find($id);
        if (!$deal || $deal->status !=1) {
            $this->error('商品不存在');
        }

        if (empty($_SERVER['HTTP_REFERER'])) {
            $this->error('请求不合法');
        }
        //入库
        $orderSn = setOrderSn();

        $data = [
            'out_trade_no' => $orderSn,//订单号
            'user_id' => $user->id,
            'username' => $user->username,
            'deal_id' => $id,
            'deal_count' => $dealCount,
            'total_price' => $totalPrice,
            'referer' => $_SERVER['HTTP_REFERER'],
        ];
        try {
            $orderId = model('Order')->add($data);
        } catch (\Exception $e) {
            $this->error('订单处理失败');
        }

        $this->redirect(url('pay/index',['id'=>$orderId]));
    }

}
