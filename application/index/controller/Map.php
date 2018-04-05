<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

class Map extends Controller
{
    public function getMapImage($data)
    {
        return \Map::staticimage($data);
    }
   
}
