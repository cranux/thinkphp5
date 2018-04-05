<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

class Lists extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $firstCatIds = $sedcategorys = $data = $orders = [];
        $categoryParentId = 0;
        // 首先获取一级栏目
        $categorys = model('Category')->getNormalFirstCategory();
        foreach ($categorys as $category) {
            $firstCatIds[] = $category->id;
        }
        $id = input('id',0,'intval');
        //id=0 一级分类  二级分类
        if (in_array($id,$firstCatIds)) {//一级分类
            $categoryParentId = $id;
            $data['category_id'] = $id;
        }elseif ($id) {//二级分类
            //获取二级分类的数据
            $category = model('Category')->get($id);
            if (!$category || $category->status != 1) {
                $this->error('数据不合法');
            }
            $categoryParentId = $category->parent_id;

            $data['se_category_id'] = $id;
        }else {//0

        }
        //获取分类下的所有子分类
        if ($categoryParentId) {
            $sedcategorys = model('Category')->getNormalFirstCategory($categoryParentId);
        } else {//id 是一级分类或者为0 显示所有的子分类
            $sedcategorys = model('Category')->where('parent_id != 0')->where('status',1)->select();
        }
        // 排序数据的逻辑
        $order_sales = input('order_sales','');
        $order_price = input('order_price','');
        $order_time = input('order_time','');
        if (!empty($order_sales)) {
            $orderflag = 'order_sales';
            $orders['order_sales'] = $order_sales;
        }elseif (!empty($order_price)) {
            $orderflag = 'order_price';
            $orders['order_price'] = $order_price;
        }elseif (!empty($order_time)) {
            $orderflag = 'order_time';
            $orders['order_time'] = $order_time;
        }else{
            $orderflag = '';
        }

        $data['city_id'] = $this->city->id;
        //根据条件来查询商品列表的数据
        $deals = model('Deal')->getDealByConditions($data,$orders);
//        print_r($deals);die;
        return $this->fetch('',[
            'categorys' => $categorys,
            'sedcategorys' => $sedcategorys,
            'id' => $id,
            'categoryParentId' => $categoryParentId,
            'orderflag' => $orderflag,
            'deals' => $deals,
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
