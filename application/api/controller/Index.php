<?php
// +----------------------------------------------------------------------
// | Description: 接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;
use \app\admin\controller\ApiCommon;
use \app\api\controller\Baseapi;
use  \think\Request;

class Index extends Baseapi
{
    public function index()
    {

        $userModel = model('User');
        $param = $this->param;
        $keywords = !empty($param['keywords']) ? $param['keywords']: '';
        $page = !empty($param['page']) ? $param['page']: '';
        $limit = !empty($param['limit']) ? $param['limit']: '';
        $data = $userModel->getDataList($keywords, $page, $limit);
        return resultArray(['data' => $data]);
        //echo 'aaa';die();
    }

    //集团demo
    public function group()
    {
        return view('group');
    }

    //公司demo
    public function company()
    {
        return view('company');
    }

    //联系人demo
    public function contact()
    {
        return view('contact');
    }

    //市场demo
    public function market()
    {
        return view('market');
    }

    //扩展信息
    public function extend()
    {
        return view('extend');
    }

    //财务信息
    public function finance()
    {
        return view('finance');
    }

    //邮件信息
    public function sendmail()
    {
        return view('mail');
    }


}
 