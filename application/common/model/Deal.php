<?php

namespace app\common\model;

use think\Model;

class Deal extends BaseModel
{
    public function getNormalDeals($data = [])
    {
        $data['status'] = 1;
        $order = ['id'=>'desc'];
        $result = $this->where($data)
            ->order($order)
            ->paginate();
//        echo $this->getLastSql();
        return $result;
    }

    /**
     * 根据分类 以及城市来获取 商品数据
     * @param $cateId分类
     * @param $cityId 城市
     * @param int $limit 条数
     */
    public function getNormalDealByCategoryCityId($cateId,$cityId,$limit=10)
    {
        $data = [
            'end_time'=>['gt',time()],
            'category_id' => $cateId,
            'city_id' => $cityId,
            'status' => 1,
        ];
        $order = [
            'listorder'=>'desc',
            'id' => 'desc',
        ];
        $result = $this->where($data)
            ->order($order);
        if($limit){
            $result = $result->limit($limit);
        }
        return $result->select();
    }

    public function getDealByConditions($data=[],$orders)
    {
        $order = [];
        if (!empty($orders['order_sales'])) {
            $order['buy_count'] = 'desc';
        }
        if (!empty($orders['order_price'])) {
            $order['current_price'] = 'desc';
        }
        if (!empty($orders['order_time'])) {
            $order['create_time'] = 'desc';
        }

        $order['id'] = 'desc';

        $datas[] = "end_time > ".time();// linux crontab
        if (!empty($data['se_category_id'])) {
            $datas[] = "find_in_set(".$data['se_category_id'].",se_category_id)";
        }
        if (!empty($data['category_id'])) {
            $datas[] = 'category_id = '.$data['category_id'];
        }
        if (!empty($data['city_id'])) {
            $datas[] = 'city_id = '.$data['city_id'];
        }
        $datas[] = 'status=1';
        $result = $this->where(implode(' AND ', $datas))
            ->order($order)
            ->paginate();
//        echo $this->getLastSql();die;
        return $result;
    }

    public function updateBuyCountById($id,$buyCount)
    {
        return $this->where(['id'=>$id])->setInc('buy_copunt',$buyCount);
    }
}
