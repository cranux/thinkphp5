<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

class Detail extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($id)
    {
        if (!intval($id)) {
            $this->error('ID不合法');
        }
        //根据id 查询商品数据
        $deal = model('Deal')->find($id);
        if (!$deal || $deal->status !=1) {
            $this->error('该商品不存在');
        }
        //获取分类信息
        $category = model('Category')->get($deal->category_id);
        // 获取分店信息
        $locations = model('BisLocation')->getNormalLocationsInId($deal->location_ids);
        //总店信息
        $bisname = model('Bis')->where('id',$deal->bis_id)->field('name,description')->find();
        /*print_r($bisname['name']);
        die;*/
        $flag = 0;
        if ($deal->start_time > time()) {
            $flag = 1;
            $dtime = $deal->start_time - time();
            $timedata = '';
            $d = floor($dtime/(3600*24));
            if ($d) {
                $timedata .= $d . "天 ";
            }
            $h = floor($dtime%(3600*24)/3600);
            if ($h) {
                $timedata .= $h . "小时 ";
            }
            $m = floor($dtime%(3600*24)%3600/60);
            if ($m) {
                $timedata .= $m . "分 ";
            }
            $this->assign('timedata',$timedata);
        }
       /* print_r($deal['notes']);
        $deal['notes'] = htmlspecialchars_decode($deal['notes']);
        print_r($deal['notes']);
        die;*/
        return $this->fetch('',[
            'title' => $deal->name,
            'category' => $category,
            'locations' => $locations,
            'deal' => $deal,
            'overplus' => $deal->total_count-$deal->buy_count,
            'flag' => $flag,
            'mapstr' => $locations[0]['xpoint'].','.$locations[0]['ypoint'],
            'bisname' => $bisname,
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
