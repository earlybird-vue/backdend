<?php
// +----------------------------------------------------------------------
// | Description: api请求信息model
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class Apilog extends Model
{

    /*
     * @param $param array
     * return bool
     */
    public function createLogs($param)
    {
        return Db::connect('db_self_manage')->table('oa_apilog')->insert($param);
    }

}