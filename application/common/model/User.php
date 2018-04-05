<?php
/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2018/2/5
 * Time: 16:49
 */

namespace app\common\model;


class User extends BaseModel
{
    public function add($data = [])
    {
        //如果提交的数据不是数组
        if (!is_array($data)){
            exception('传递的数据不是数组');
        }

        $data['status'] = 1;
        return $this->data($data)->allowField(true)
            ->save();
    }

    /**
     * @param $username
     * 根据用户名获取用户信息
     */
    public function getUserByUsername($username)
    {
        if (!$username){
            exception('用户名不合法！');
        }
        $data = ['username' => $username];
        return $this->where($data)->find();

    }

    public function updateById($data , $id)
    {
        return $this->allowField(true)->save($data,['id'=>$id]);
    }
}
