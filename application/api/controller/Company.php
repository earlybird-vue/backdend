<?php
// +----------------------------------------------------------------------
// | Description: 集团旗下的公司接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use think\Config;
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
     * @desc  {"0":"接口地址：http://api.master.com/company/list/jt_1548139507","1":"请求方式：GET"}
     * @returnDemo {"0":{"code":200,"data":{"list":[{"company_code":"gs_1548139507","name":"公司中文名","en_name":"公司英文名","group_code":"jt_1548139507","sync_type":"1","status":"0"}],"data_count":"2"},"error":""}}
     * @return {"name":"code","type":"int","desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"list","type":"array","desc":"集团列表数据","level":2}
     * @return {"name":"company_code","type":"string","desc":"公司的唯一编码","level":3}
     * @return {"name":"name","type":"string","desc":"公司中文名称","level":3}
     * @return {"name":"en_name","type":"string","desc":"公司英文名称","level":3}
     * @return {"name":"group_code","type":"string","desc":"集团的编码","level":3}
     * @return {"name":"sync_type","type":"int","desc":"数据同步方式1自动,0手动","level":3}
     * @return {"name":"status","type":"string","desc":"公司的状态","level":3}
     * @return {"name":"data_count","type":"string","desc":"集团下的公司总数","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function index()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
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
     * @desc  {"0":"接口地址：http://api.master.com/company/get/gs_15488370176758973","1":"请求方式：GET"}
     * @returnDemo {"0":{"code":200,"data":{"company_code":"gs_15488370176758973","name":"腾讯","en_name":"tx","group_code":"jt_1548139507","sync_type":"1","status":"公司的状态1为已经激活,0为已被禁用"},"error":""}}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"company_code","type":"string","desc":"公司的编号","level":2}
     * @return {"name":"name","type":"string","desc":"公司中文名称","level":2}
     * @return {"name":"en_name","type":"string","desc":"公司英文名称","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编号","level":2}
     * @return {"name":"sync_type","type":"string","desc":"数据同步方式1自动,0手动","level":2}
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
     * @desc  {"0":"接口地址：http://api.master.com/company/create","1":"请求方式：POST"}
     * @postBody {"0":[{"f_name":"腾讯","f_en_name":"tx","f_group_code":"jt_1548139507","f_sync_type":"1"},{"f_name":"百度","f_en_name":"bd","f_group_code":"jt_1548139507","f_sync_type":"0"}]}
     * @returnDemo {"0":{"code":200,"data":[{"company_code":"gs_15488370176758973","name":"腾讯","en_name":"tx","group_code":"jt_1548139507","sync_type":"1","status":"1"},{"company_code":"gs_15488370171166977","name":"百度","en_name":"bd","group_code":"jt_1548139507","sync_type":"0","status":"1"}],"error":""}}
     * @param {"name":"f_name","type":"string","required":true,"desc":"公司中文名称","level":1}
     * @param {"name":"f_en_name","type":"string","required":true,"desc":"公司中文名称","level":1}
     * @param {"name":"f_group_code","type":"string","required":true,"desc":"公司所属的集团编号","level":1}
     * @param {"name":"f_sync_type","type":"int","required":true,"desc":"数据同步方式1自动0手动","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"company_code","type":"string","desc":"公司的编号","level":2}
     * @return {"name":"name","type":"string","desc":"公司中文名称","level":2}
     * @return {"name":"en_name","type":"string","desc":"公司英文名称","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编号","level":2}
     * @return {"name":"sync_type","type":"string","desc":"数据同步方式1自动,0手动","level":2}
     * @return {"name":"status","type":"string","desc":"公司的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save()
    {
        $postData = Request::instance()->param();
        //$param = $this->param;

        //增加判断使得支持单个公司添加
        if(!isset($postData[0]))
        {
            $postData = array($postData);
        }

        $companyModel = model('Company');
        //$postData = json_decode('[{"f_name":"腾讯","f_en_name":"tx","f_group_code":"jt_1548139507","f_sync_type":"1"},{"f_name":"百度","f_en_name":"bd","f_group_code":"jt_1548139507","f_sync_type":"0"}]',true);
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
     * @postBody {"0":{"f_code":"gs_15488370171166977","f_name":"百度","f_en_name":"bd","f_sync_type":1,"f_status":1}}
     * @returnDemo {"0":{"code":200,"data":{"company_code":"gs_15488370171166977","name":"百度","en_name":"bd","group_code":"jt_1548139507","sync_type":"1","status":"1"},"error":""}}
     * @param {"name":"f_company_code","type":"string","required":true,"desc":"公司编号","level":1}
     * @param {"name":"f_name","type":"string","required":true,"desc":"公司中文名称","level":1}
     * @param {"name":"f_en_name","type":"string","required":true,"desc":"公司中文名称","level":1}
     * @param {"name":"f_sync_type","type":"int","required":true,"desc":"数据同步方式1自动,0手动","level":1}
     * @param {"name":"f_status","type":"int","required":true,"desc":"公司的状态","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"company_code","type":"string","desc":"公司的编号","level":2}
     * @return {"name":"name","type":"string","desc":"公司中文名称","level":2}
     * @return {"name":"en_name","type":"string","desc":"公司英文名称","level":2}
     * @return {"name":"group_code","type":"string","desc":"公司所属集团的编码","level":2}
     * @return {"name":"sync_type","type":"int","desc":"数据同步方式1自动,0手动","level":2}
     * @return {"name":"status","type":"int","desc":"公司的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function update()
    {
        $postData = Request::instance()->param();
        //$param = $this->param;
        //$postData = json_decode('{"f_code":"gs_15488370171166977","f_name":"百度","f_en_name":"bd","f_sync_type":1,"f_status":1}',true);
        $data = self::_changeData($postData);
        $code = $data['code'];
        unset($data['code']);
        //看看数据更新方式是否是自动
        if($data['sync_type'] ==1)
        {
            //查找授权key表是否存在记录
            $companyKeyModel = model('CompanyKey');
            $res_data = $companyKeyModel->get_data_by_companyCode($code);
            //如果不存在
            if(empty($res_data)){
                $data['apikeys'] = self::create_company_key($code);
            }
        }
        $companyModel = model('Company');
        $resData = $companyModel->update_data_by_code($data,$code);
        if(!$resData){
            return resultArray(['error' => $companyModel->getError()]);
        }
        $returnData = $companyModel->get_data_by_code($code);
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 删除公司数据接口
     * @desc  {"0":"接口地址：http://api.master.com/group/delete","1":"请求方式：POST"}
     * @postBody {"0":{"f_code":"gs_15488370176758973"}}
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
     * @title 读取公司的secret
     * @desc  {"0":"接口地址：http://api.master.com/company/gettoken/gs_15488370176758973","1":"请求方式：GET","2":"接口备注：获取授权key相关信息"}
     * @postBody {"0":{"f_code":"gs_15488370176758973"}}
     * @returnDemo {"0":{"code":200,"data":{"app_id":"授权appId","app_secret":"私钥","api_uri":"可访问的接口URI地址"},"error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"公司编码"}
     * @return {"name":"code","type":"int","desc":"返回码：200成功其他失败","level":1}
     * @return {"name":"data","type":"array","desc":"返回的数据内容","level":1}
     * @return {"name":"app_id","type":"array","desc":"授权appId","level":2}
     * @return {"name":"app_secret","type":"array","desc":"私钥","level":2}
     * @return {"name":"api_uri","type":"array","desc":"可访问的接口URI地址","level":2}
     * @return {"name":"err","type":"string","desc":"返回的错误信息","level":1}
     */
    public function gettoken()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
        if(!isset($param['code']) || empty($param['code'])){
            return resultArray(['error' => '公司编码出错']);
        }
        $companyCode = $param['code'];
        $companyKeyModel = model('CompanyKey');
        $result_data = $companyKeyModel->get_data_by_companyCode($companyCode);
        return resultArray(['data' => $result_data]);
    }

    /**
     * @title 更新公司的secret
     * @desc  {"0":"接口地址：http://api.master.com/company/flushkey/gs_15488370176758973","1":"请求方式：GET","2":"接口备注：刷新授权密钥"}
     * @returnDemo {"0":{"code":200,"data":"更新成功,请通过读取接口获取","error":""}}
     * @return {"name":"code","type":"int","desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","desc":"更新成功,请通过读取接口获取","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function reflushk_key()
    {
        $param = Request::instance()->param();
        if(!isset($param['code']) || empty($param['code'])){
            return resultArray(['error' => '公司编码出错']);
        }
        $secret = self::get_rand_code(40);
        $companyKeyModel = model('CompanyKey');
        $result_data = $companyKeyModel->update_secret($param['code'],$secret);
        if(!$result_data){
            return resultArray(['error' => '更新公司secret出错']);
        }
        return resultArray(['error' => '更新公司secret成功,请通过读取接口获取']);
    }


    /****************************************  私有方法start  ****************************************/

    private static function get_rand_code($len=40)
    {
        $string = '0123456789abcdefghigklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $name=substr(str_shuffle($string),5,$len);
        return 'SK'.$name;
    }


    /**
     * @param $datas
     * @param int $act   1为添加
     * @return array
     */
    private static function _changeDatas($datas,$act=0){
        //如果为空
        if(empty($datas)){
            return array();
        }
        $username = empty($GLOBALS['userInfo']) ? 'admin' : $GLOBALS['userInfo']['username'];
        $companyModel = model('Company');
        $apikeys = array();
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
                $data['code'] = 'gs_'.$companyModel->buildUUID();
                $data['create_user'] = $username;
                //默认为自动同步数组了
                if(isset($data['sync_type']) && $data['sync_type']==1)
                {
                    array_push($apikeys,self::create_company_key($data['code']));
                }
            }
            $datas[$key] = $data;
        }
        $datas['apikeys'] = $apikeys;
        return $datas;
    }

    /**
     * @param $companyCode string  公司编码
     * @return array
     */
    private static function create_company_key($companyCode)
    {
        $return_data = array();
        if(!empty($companyCode))
        {
            $app_id = 'wxb11529c136998cb6';
            //$app_secret = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFG';
            $app_secret = self::get_rand_code(40);
            $api_uri = 'api.master.com';
            $return_data['company_code'] = $companyCode;
            $return_data['app_id'] = $app_id;
            $return_data['app_secret'] = $app_secret;
            $return_data['api_uri'] = $api_uri;
            $return_data['create_user'] = 'admin';
        }
        return $return_data;
    }
    /****************************************  私有方法end  ****************************************/
}
 