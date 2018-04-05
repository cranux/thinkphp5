<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function status($status){
    if($status==1){
        $str="<span class='label label-success redius'>正常</span>";
    }elseif ($status==0){
        $str="<span class='label label-danger redius'>待审</span>";
    }else{
        $str="<span class='label label-success redius'>删除</span>";
    }
    return $str;
}
/**
 * @param $url
 * @param int $type 0 get   1 post
 * @param array $data
 */
function doCurl($url,$type=0,$data=[]){
    $ch=curl_init();//初始化
    //设置选项
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
    curl_setopt($ch,CURLOPT_HEADER,0);
    if($type==1){
        //post
        curl_setopt($ch,CURLOPT_POST,1);
        curl_setopt($ch,CURLOPT_POSTFIELDS,$data);
    }

    //执行并获取内容
    $output=curl_exec($ch);
    //释放curl句柄
    curl_close($ch);
    return $output;
}
/**
 * 商户入驻申请的文案
 * */
function bisRegister($status){
    if ($status==1){
        $str="入驻成功";
    }elseif ($status==0){
        $str="待审核，审核后平台会发送邮件通知";
    }elseif($status==2){
        $str="非常抱歉，您提交的材料不符合条件，请重新提交";
    }else{
        $str="该申请已被删除";
    }
    return $str;
}

/**
 * 公共的分页样式
 * @param $obj
 */
function pagination($obj){
    if(!$obj){
        return '';
    }
    $params = request()->param();//获取url地址中的参数
    return '<div class="cl pd-5 bg-1 bk-gray mt-20 tp5-o2o">'.$obj->appends($params)->render().'</div>';
}

/**
 * 城市分类查看
 * @param $path
 * @return bool|string
 */
function getSeCityName($path){
    if(empty($path)){
        return '';
    }
    if(preg_match('/,/',$path)){
        $citypath=explode(',',$path);
        $cityId=$citypath[1];
    }else{
        $cityId=$path;
    }
    $city=model('City')->get($cityId);
    return $city['name'];

}

function getSeCategoryName($path){
    if(empty($path)){
        return '';
    }
    if(preg_match('/,/',$path)){
        $categorypath=explode(',',$path);
        $categoryName=$categorypath[1];
    }else{
        $categoryName=$path;
    }
    if(!$categoryName){
        return '';
    }
    $str='';
    if(preg_match('/|/',$categoryName)){
        $pathname=explode('|',$categoryName);
    }else{
        $pathname[]=$categoryName[0];
    }

    foreach ($pathname as $v){
        $category=model('Category')->get($v);

        $str .= '<input name="se_category_id[]" type="checkbox" checked="checked" id="checkbox-moban" value="'.$category->id.'">'.$category->name.'&nbsp;&nbsp;';
    }


    return $str;
}


function coountLocation($ids){
    if (!$ids) {
        return 1;
    }
    if (preg_match('/,/',$ids)) {
        $arr = explode(',',$ids);
        $count = count($arr);
    }else{
        $count = 1;
    }
    return $count;
}

//设置订单号
function setOrderSn() {
    list($t1, $t2) = explode(' ',microtime());
    $t3 = explode('.',$t1*10000);
//    print_r($t3);die;
    $orderSn = $t2.$t3[0].rand(10000,99999);
    return $orderSn;
}
