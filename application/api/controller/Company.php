<?php
// +----------------------------------------------------------------------
// | Description: 集团旗下的公司接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use \think\Debug;
use \think\Collection;
use  \think\Request;
use \app\api\controller\Baseapi;

/**
 * @title 集团公司模块2.0
 * Class Customer
 * @package app\api\controller
 */
class Company extends Baseapi
{

    /**
     * @title 读取集团下的公司列表
     * @desc  {"0":"接口地址：http://api.master.com/company/list/jt_1548139507","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"list":[{"company_code":"gs_1548139507","name":"公司中文名","en_name":"公司英文名","group_code":"jt_1548139507","status":"0"}],"data_count":"2"},"error":""}}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"list","type":"array","desc":"集团列表数据","level":2}
     * @return {"name":"company_code","type":"string","desc":"公司的唯一编码","level":3}
     * @return {"name":"name","type":"string","desc":"公司中文名称","level":3}
     * @return {"name":"en_name","type":"string","desc":"公司英文名称","level":3}
     * @return {"name":"group_code","type":"string","desc":"集团的编码","level":3}
     * @return {"name":"status","type":"string","desc":"公司的状态","level":3}
     * @return {"name":"data_count","type":"string","desc":"集团下的公司总数","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function index()
    {
        $param = Request::instance()->param();
        if(!isset($param['code']) || empty($param['code'])){
            return resultArray(['error' => '集团编码出错']);
        }
        $w['group_code'] = $param['code'];
        $companyModel = model('Company');
        $data = $companyModel->getDataList($w);
        return resultArray(['data' => $data]);
    }

    /**
     * @title 编辑公司初始化数据接口
     * @desc  {"0":"接口地址：http://api.master.com/company/get/gs_1548153426","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"company_code":"gs_1548153426","name":"公司名称","en_name":"公司英文名称","group_code":"jt_1548139507","status":"公司的状态1为已经激活,0为已被禁用"},"error":""}}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"company_code","type":"string","desc":"公司的编号","level":2}
     * @return {"name":"name","type":"string","desc":"公司中文名称","level":2}
     * @return {"name":"en_name","type":"string","desc":"公司英文名称","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编号","level":2}
     * @return {"name":"status","type":"string","desc":"公司的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function read()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
        $company_code = $param['code'];
        $companyModel = model("Company");
        $returnData = $companyModel->get_data_by_code($company_code);
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 新增公司数据接口(添加公司表单提交)
     * @desc  {"0":"接口地址：http://api.master.com/company/create","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":[{"f_name":"公司中文名称","f_en_name":"公司中文名称","f_group_code":"jt_1548139507"},{"f_name":"公司中文名称","f_en_name":"公司中文名称","f_group_code":"jt_1548139507"}]}
     * @returnDemo {"0":{"code":200,"data":[{"company_code":"98019142233227734","name":"公司名称","en_name":"公司英文名称","group_code":"公司所属的集团编码","status":"公司的状态1为已经激活,0为已被禁用"},{"company_code":"98019142233227734","name":"公司名称","en_name":"公司英文名称","group_code":"公司所属的集团编码","status":"公司的状态1为已经激活,0为已被禁用"}],"error":""}}
     * @param {"name":"f_name","type":"string","required":true,"desc":"公司中文名称","level":1}
     * @param {"name":"f_en_name","type":"string","required":true,"desc":"公司中文名称","level":1}
     * @param {"name":"f_group_code","type":"int","required":true,"desc":"公司所属的集团编号","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"company_code","type":"string","desc":"公司的编号","level":2}
     * @return {"name":"name","type":"string","desc":"公司中文名称","level":2}
     * @return {"name":"en_name","type":"string","desc":"公司英文名称","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编号","level":2}
     * @return {"name":"status","type":"string","desc":"公司的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save()
    {
        $postData = Request::instance()->param();
        $companyModel = model('Company');
        $data = self::_changeDatas($postData,1);
        $resData = $companyModel->createData($data);
        if (!$resData) {
            return resultArray(['error' => $companyModel->getError()]);
        }
        $company_codes = array_column($data,'code');
        $returnData = $companyModel->get_data_by_codes($company_codes);
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 更新公司信息(类似提交表单的目标接口)
     * @desc  {"0":"接口地址：http://api.master.com/company/update","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_code":"gs_1548153426","f_name":"公司中文名称","f_en_name":"公司中文名称","f_status":0}}
     * @returnDemo {"0":{"code":200,"data":{"company_code":"gs_1548153426","name":"公司名称","en_name":"公司英文名称","status":"公司的状态1为已经激活,0为已被禁用"},"error":""}}
     * @param {"name":"f_company_code","type":"string","required":true,"desc":"公司编号","level":1}
     * @param {"name":"f_name","type":"string","required":true,"desc":"公司中文名称","level":1}
     * @param {"name":"f_en_name","type":"string","required":true,"desc":"公司中文名称","level":1}
     * @param {"name":"f_status","type":"int","required":true,"desc":"公司的状态","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"company_code","type":"string","desc":"公司的编号","level":2}
     * @return {"name":"name","type":"string","desc":"公司中文名称","level":2}
     * @return {"name":"en_name","type":"string","desc":"公司英文名称","level":2}
     * @return {"name":"status","type":"string","desc":"公司的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function update()
    {
        $postData = Request::instance()->param();
        //$param = $this->param;
        $data = self::_changeData($postData);
        $code = $data['code'];
        unset($data['code']);
        $companyModel = model('Company');
        $resData = $companyModel->update_data_by_code($data,$code);
        if(!$resData){
            return resultArray(['error' => $companyModel->getError()]);
        }
        $data['company_code'] = $code;
        return resultArray(['data' => $data]);
    }

    /**
     * @title 删除公司数据接口
     * @desc  {"0":"接口地址：http://api.master.com/group/delete","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证","3":"接口说明：添加编辑集团初始化共用"}
     * @postBody {"0":{"f_code":"jt_1548139507"}}
     * @returnDemo {"0":{"code":200,"data":"删除成功","error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"公司编码"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","desc":"返回的数据内容","level":1}
     * @return {"name":"err","type":"string","desc":"返回的错误信息","level":1}
     */
    public function delete()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
        $companyModel = model('Company');
        $data = $companyModel->del_data_by_code($param['f_code']);
        if (!$data) {
            return resultArray(['error' => $companyModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    /**
     * @param $datas
     * @param int $act   添加还是编辑操作 1为添加
     * @return array
     */
    private static function _changeDatas($datas,$act=0){
        //如果为空
        if(empty($datas)){
            return array();
        }
        $username = empty($GLOBALS['userInfo']) ? 'admin' : $GLOBALS['userInfo']['username'];
        $companyModel = model('Company');
        foreach($datas as $key=>$data)
        {
            foreach($data as $k=>$v) {
                $dataK = $k;
                if (strpos($k, 'f_') !== false) {
                    $k = substr($k, 2, strlen($k));
                    unset($data[$dataK]);
                    $data[$k] = $v;
                }
            }
            //如果是添加操作
            if( $act == 1 ){
                $data['create_user'] = $username;
            }elseif( $act == 2 ){
                $data['last_update_user'] = $username;
            }
            $data['code'] = 'gs_'.$companyModel->buildUUID();
            $datas[$key] = $data;
        }
        return $datas;
    }
    /****************************************  私有方法end  ****************************************/
}
 