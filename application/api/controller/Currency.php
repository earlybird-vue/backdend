<?php
// +----------------------------------------------------------------------
// | Description: 接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;
use \app\admin\controller\ApiCommon;

class Currency
{
    /**
     * @title 货币信息基础数据
     * @desc  {"0":"接口地址：http://api.master.com/currenty/list","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @return {"name":"img","type":"array","required":true,"desc":"货币信息数据列表","level":2}
     */
    public function get_list()
    {
        $currencyModel = model('BaseCurrency');
        return $currencyModel->getDataList();
    }
    
}
 