<?php
/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2018/2/3
 * Time: 14:51
 */

namespace app\common\model;


class Featured extends BaseModel
{
    public function getFeaturedsByType($type)
    {
        $data = [
            'type' => $type,
            'status' => ['neq',-1],
        ];
        $order = [
            'id' => 'desc',
        ];
        $result = $this->where($data)
            ->order($order)
            ->paginate();
        return $result;
    }
}