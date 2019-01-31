<?php
// +----------------------------------------------------------------------
// | Description: 集团的财务接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use \think\Debug;
use \think\Collection;
use  \think\Request;
use \app\api\controller\Baseapi;

/**
 * @title 集团财务模块2.0
 * Class Finance
 * @package app\api\controller
 */
class Finance extends Baseapi
{
    /**
     * @title 获取集团财务明细数据接口
     * @desc  {"0":"接口地址：http://api.master.com/finance/get/jt_1548139507","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"finance_code":"cash_15483096291974","group_code":"jt_1548139507","sale_volume_id":1,"sale_volume":"10000","purhchase_volume_id":2,"purhchase_volume":"20000","cashflow_volume_id":3,"cashflow_volume":"30000","status":0},"error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"集团编码","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"finance_code","type":"string","desc":"集团财务的唯一编码","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编码","level":2}
     * @return {"name":"sale_volume_id","type":"string","desc":"年销售额范围ID","level":2}
     * @return {"name":"sale_volume","type":"string","desc":"年销售额","level":2}
     * @return {"name":"purhchase_volume_id","type":"string","desc":"年采购额范围ID","level":2}
     * @return {"name":"purhchase_volume","type":"string","desc":"年采购额","level":2}
     * @return {"name":"cashflow_volume_id","type":"string","desc":"资金流范围ID","level":2}
     * @return {"name":"cashflow_volume","type":"string","desc":"资金流状况","level":2}
     * @return {"name":"status","type":"string","desc":"财务的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function read()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
        $group_code = $param['code'];
        $financeModel = model("GroupFinance");
        $returnData = $financeModel->get_data_by_groupcode($group_code);
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 新增集团财务数据接口
     * @desc  {"0":"接口地址：http://api.master.com/contact/create","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_group_code":"jt_1548139507","f_sale_volume_id":"1","f_sale_volume":"10000","f_purhchase_volume_id":"2","f_purhchase_volume":"20000","f_cashflow_volume_id":"2","f_cashflow_volume":"30000"}}
     * @returnDemo {"0":{"code":200,"data":{"finance_code":"cash_15483096291974","group_code":"jt_1548139507","sale_volume_id":1,"sale_volume":"10000","purhchase_volume_id":2,"purhchase_volume":"20000","cashflow_volume_id":3,"cashflow_volume":"30000","status":1},"error":""}}
     * @param {"name":"f_group_code","type":"string","required":true,"desc":"集团的唯一编码","level":1}
     * @param {"name":"f_sale_volume_id","type":"string","required":true,"desc":"年销售额范围ID","level":1}
     * @param {"name":"f_sale_volume","type":"string","required":true,"desc":"年销售额","level":1}
     * @param {"name":"f_purhchase_volume_id","type":"string","required":true,"desc":"年采购额范围ID","level":1}
     * @param {"name":"f_purhchase_volume","type":"string","required":true,"desc":"年采购额","level":1}
     * @param {"name":"f_cashflow_volume_id","type":"string","required":true,"desc":"资金流范围ID","level":1}
     * @param {"name":"f_cashflow_volume","type":"string","required":true,"desc":"资金流状况","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"finance_code","type":"string","desc":"集团财务的唯一编码","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编码","level":2}
     * @return {"name":"sale_volume_id","type":"string","desc":"年销售额范围ID","level":2}
     * @return {"name":"sale_volume","type":"string","desc":"年销售额","level":2}
     * @return {"name":"purhchase_volume_id","type":"string","desc":"年采购额范围ID","level":2}
     * @return {"name":"purhchase_volume","type":"string","desc":"年采购额","level":2}
     * @return {"name":"cashflow_volume_id","type":"string","desc":"资金流范围ID","level":2}
     * @return {"name":"cashflow_volume","type":"string","desc":"资金流状况","level":2}
     * @return {"name":"status","type":"string","desc":"财务的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save()
    {
        $postData = Request::instance()->param();
        $financeModel = model('GroupFinance');
        $data = self::_changeData($postData,1);
        $returnData = $financeModel->get_data_by_groupcode($data['group_code']);
        if(!empty($returnData))
        {
            return resultArray(['error' => '该集团已经存在财务息,请直接编辑']);
        }
        $data['code'] = 'cw_'.$financeModel->buildUUID();
        $resData = $financeModel->createData($data);
        if (!$resData) {
            return resultArray(['error' => $financeModel->getError()]);
        }
        $returnData = $financeModel->get_data_by_code($data['code']);
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 更新集团财务数据接口
     * @desc  {"0":"接口地址：http://api.master.com/contact/update","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_code":"cash_15483096291974","f_group_code":"jt_1548139507","f_sale_volume_id":"1","f_sale_volume":"10000","f_purhchase_volume_id":"2","f_purhchase_volume":"20000","f_cashflow_volume_id":"2","f_cashflow_volume":"30000","status":0}}
     * @returnDemo {"0":{"code":200,"data":{"finance_code":"cash_15483096291974","group_code":"jt_1548139507","sale_volume_id":1,"sale_volume":"10000","purhchase_volume_id":2,"purhchase_volume":"20000","cashflow_volume_id":3,"cashflow_volume":"30000","status":0},"error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"集团的财务唯一编码","level":1}
     * @param {"name":"f_group_code","type":"string","required":true,"desc":"集团的唯一编码","level":1}
     * @param {"name":"f_sale_volume_id","type":"string","required":true,"desc":"年销售额范围ID","level":1}
     * @param {"name":"f_sale_volume","type":"string","required":true,"desc":"年销售额","level":1}
     * @param {"name":"f_purhchase_volume_id","type":"string","required":true,"desc":"年采购额范围ID","level":1}
     * @param {"name":"f_purhchase_volume","type":"string","required":true,"desc":"年采购额","level":1}
     * @param {"name":"f_cashflow_volume_id","type":"string","required":true,"desc":"资金流范围ID","level":1}
     * @param {"name":"f_cashflow_volume","type":"string","required":true,"desc":"资金流状况","level":1}
     * @param {"name":"f_status","type":"int","required":true,"desc":"财务的状态","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"finance_code","type":"string","desc":"集团财务的唯一编码","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编码","level":2}
     * @return {"name":"sale_volume_id","type":"string","desc":"年销售额范围ID","level":2}
     * @return {"name":"sale_volume","type":"string","desc":"年销售额","level":2}
     * @return {"name":"purhchase_volume_id","type":"string","desc":"年采购额范围ID","level":2}
     * @return {"name":"purhchase_volume","type":"string","desc":"年采购额","level":2}
     * @return {"name":"cashflow_volume_id","type":"string","desc":"资金流范围ID","level":2}
     * @return {"name":"cashflow_volume","type":"string","desc":"资金流状况","level":2}
     * @return {"name":"status","type":"string","desc":"财务的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function update()
    {
        $postData = Request::instance()->param();
        //$param = $this->param;
        $data = self::_changeData($postData);
        $code = $data['code'];
        unset($data['code']);
        $financeModel = model('GroupFinance');
        $resData = $financeModel->update_data_by_code($data,$code);
        if(!$resData){
            return resultArray(['error' => $financeModel->getError()]);
        }
        $data['finance_code'] = $code;
        return resultArray(['data' => $data]);
    }
}
 