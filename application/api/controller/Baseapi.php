<?php
// +----------------------------------------------------------------------
// | Description: 接口基础入口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use \app\admin\controller\ApiCommon;
use  \think\Request;

/**
 * @title 接口基类 以免每个api都继承
 * Class Baseapi
 * @package app\api\controller
 */
class Baseapi
{
    public function __construct()
    {
        $paramModel = Request::instance();
        $param['name'] = $paramModel->baseUrl();
        $content = is_array($paramModel->param()) ? json_encode($paramModel->param()) : $paramModel->param();
        if(!empty($content)){
            $param['apicontent'] = $content;
        }
        $param['ip'] = $paramModel->ip();
        $param['createtime'] = time();
        $apiModel = model('Apilog');
        $apiModel->createLogs($param);
    }
    /**
     * @param $data
     * @param int $act   添加还是编辑操作 1为添加
     * @return array
     */
    public static function _changeData($data,$act=0){
        //如果为空
        if(empty($data)){
            return array();
        }
        foreach($data as $k=>$v)
        {
            $dataK = $k;
            if(strpos($k,'f_')!==false){
                $k = substr($k,2,strlen($k));
                unset($data[$dataK]);
                $data[$k] = $v;
            }
        }
        $username = empty($GLOBALS['userInfo']) ? 'admin' : $GLOBALS['userInfo']['username'];
        //如果是添加操作
        if( $act == 1 ){
            $data['create_user'] = $username;
        }elseif( $act == 2 ){
            $data['last_update_user'] = $username;
        }
        return $data;
    }
    /****************************************  私有方法end  ****************************************/
}
 