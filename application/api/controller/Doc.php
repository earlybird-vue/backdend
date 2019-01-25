<?php
// +----------------------------------------------------------------------
// | Description: 接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;
use \app\admin\controller\ApiCommon;

class Doc
{
    /**
     * @title 公司额外信息基础数据
     * @desc  {"0":"接口地址：http://api.master.com/basetype/list","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @return {"name":"img","type":"array","required":true,"desc":"行业数据列表","level":2}
     */
    public function get_list()
    {
        $baseTypeModel = model('BaseVolume');
        $param = array(
            'volumetype' => 'cash'
        );
        $data = $baseTypeModel->getDataList($param);
        return $data;
    }
    
}
 