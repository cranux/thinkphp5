<?php
namespace app\admin\controller;

use phpmailer\Email;
use think\Controller;

class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function welcome()
    {
        return $this->fetch('index/welcome');
    }

    public function test()
    {

        \Map::getLngLat('郑州市碧沙岗地铁');exit;
    }

    public function map()
    {

       return \Map::staticimage('郑州市碧沙岗地铁');

    }

    public function email()
    {
        \phpmailer\Email::send('tuplelist@126.com','tp5-email','success-hala');
        return '发送邮件成功';
    }
}
