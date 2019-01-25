<?php
// +----------------------------------------------------------------------
// | Description: 系统用户
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

class Index
{

    public function index()
    {
        return resultArray(['data' => 'aaa']);
        //echo 'aaa';die();
    }

    public function hello()
    {
        echo 'hello';
    }


    
}
 