<?php

namespace app\common\model;



class BisLocation extends BaseModel
{
    /**
     * @param int $status
     * @param int $is_main
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function getBisMain($status=0,$is_main=0)
    {
        $order=[
            'id'=>'desc',
        ];
        $data=[
            'status'=>$status,
            'is_main'=>$is_main,
        ];
        $result= $this->where($data)->order($order)->paginate();
        return $result;
    }

    /**
     * @param int $is_main
     * @return \think\Paginator
     * @throws \think\exception\DbException
     * 获取门店
     */
    public function getlocation($id=null)
    {
        $order=[
            'id'=>'desc',
        ];
        $data=[

            'bis_id'=>$id,

        ];
        $result=$this->where($data)->where('status!=-1')->order($order)->paginate();
        return $result;
    }

    public function getNormalLocationByBisId($bidId)
    {
        $order=[
            'id'=>'desc',
        ];
        $data=[
            'status'=>1,
            'bis_id'=>$bidId,
        ];
        $result=$this->where($data)->field('id,name')->order($order)->select();
        return $result;
    }

    public function getNormalLocationsInId($ids)
    {
        $data = [
            'id' => ['in',$ids],
            'status' => 1,
        ];
        return $this->where($data)->select();
    }


}
