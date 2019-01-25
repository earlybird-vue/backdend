<?php
// +----------------------------------------------------------------------
// | Description: 接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;
use \app\admin\controller\ApiCommon;

class Basetype
{
    /**
     * @title 公司类型基础数据列表
     * @desc {"0":"接口地址：http://api.master.com/country/list","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"code":200,"data":[{"id":1,"name":"Afghanistan"}],"error":""}
     * @return {"name":"code","type":"int","desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","desc":"返回的数据列表","level":1}
     * @return {"name":"id","type":"int","desc":"类型编号","level":2}
     * @return {"name":"name","type":"string","desc":"类型名称","level":2}
     * @return {"name":"error","type":"string","desc":"返回的错误信息","level":1}
     */
    public function index()
    {
        $baseCountryModel = model('BaseType');
        $data = $baseCountryModel->getDataList();
        return resultArray(['data' => $data]);
    }
    
}
 