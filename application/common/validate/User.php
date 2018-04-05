<?php
/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2018/2/5
 * Time: 16:08
 */

namespace app\common\validate;


use think\Validate;

class User extends Validate
{
    protected $rule = [
        'username'=>'require',
        'email'=>'require',
        'password'=>'require',
        'repassword'=>'require',
        'verifyCode'=>'require',

    ];
    protected $scene=[
        'regis'=>['username','email','password','repassword','verifyCode'],
        'login'=>['username','password'],
    ];
}