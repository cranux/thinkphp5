<?php
/**
 * Created by PhpStorm.
 * User: wk
 * Date: 2017/12/21
 * Time: 10:17
 */

namespace app\common\validate;


use App\Http\Controllers\agentcompany\passwordController;
use think\Validate;

class BisAccount extends Validate
{
    protected $rule=[
        'username'=>'require',
        'password'=>'require',
    ];
    protected $scene=[
        'login'=>['username','password'],
    ];
}