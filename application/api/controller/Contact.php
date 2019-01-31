<?php
// +----------------------------------------------------------------------
// | Description: 集团的联系人接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use \think\Debug;
use \think\Collection;
use  \think\Request;
use \app\api\controller\Baseapi;

/**
 * @title 集团联系人模块2.0
 * Class Contact
 * @package app\api\controller
 */
class Contact extends Baseapi
{

    /**
     * @title 读取集团下的联系人列表
     * @desc  {"0":"接口地址：http://api.master.com/contact/list/jt_1548139507","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"list":[{"contact_code":"gs_1548139507","user_name":"刘林燕","user_position":"PHP研发","user_phone":"18588209320","user_email":"939942478@qq.com","is_enterprise":1,"is_financial":1,"is_charge":1,"group_code":"jt_1548139507","status":1}]},"error":""}}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"list","type":"array","desc":"联系人列表数据","level":2}
     * @return {"name":"contact_code","type":"string","desc":"联系人的唯一编码","level":3}
     * @return {"name":"user_name","type":"string","desc":"联系人的称呼","level":3}
     * @return {"name":"user_position","type":"string","desc":"用户职位","level":3}
     * @return {"name":"user_phone","type":"string","desc":"联系电话","level":3}
     * @return {"name":"user_email","type":"string","desc":"用户邮箱","level":3}
     * @return {"name":"is_enterprise","type":"int","desc":"是否是企业负责人","level":2}
     * @return {"name":"is_financial","type":"int","desc":"是否是财务负责人","level":2}
     * @return {"name":"is_charge","type":"int","desc":"是否是清算负责人","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编码","level":2}
     * @return {"name":"status","type":"string","desc":"用户的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function index()
    {
        $param = Request::instance()->param();
        if(!isset($param['code']) || empty($param['code'])){
            return resultArray(['error' => '集团编码出错']);
        }
        $w['group_code'] = $param['code'];
        $contactModel = model('Contact');
        $data = $contactModel->getDataList($w);
        return resultArray(['data' => $data]);
    }

    /**
     * @title 获取联系人明细数据接口
     * @desc  {"0":"接口地址：http://api.master.com/contact/get/ct_1548383615","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"contact_code":"ct_1548383615","last_name":"刘","first_name":"林燕","user_name":"刘林燕","user_position":"PHP研发","user_phone":"18588209320","user_email":"939942478@qq.com","is_enterprise":1,"is_financial":1,"is_charge":1,"group_code":"jt_1548139507","status":1},"error":""}}
     * @param {"name":"code","type":"string","required":true,"desc":"联系人编码","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"contact_code","type":"string","desc":"联系人的唯一编码","level":2}
     * @return {"name":"last_name","type":"string","desc":"联系人姓氏","level":2}
     * @return {"name":"first_name","type":"string","desc":"联系人名字","level":2}
     * @return {"name":"user_name","type":"string","desc":"联系人称呼","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编号","level":2}
     * @return {"name":"user_position","type":"string","desc":"联系人职位","level":2}
     * @return {"name":"user_phone","type":"string","desc":"联系人电话","level":2}
     * @return {"name":"user_email","type":"string","desc":"联系人邮箱","level":2}
     * @return {"name":"is_enterprise","type":"int","desc":"是否是企业负责人","level":2}
     * @return {"name":"is_financial","type":"int","desc":"是否是财务负责人","level":2}
     * @return {"name":"is_charge","type":"int","desc":"是否是清算负责人","level":2}
     * @return {"name":"status","type":"string","desc":"联系人状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function read()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
        $company_code = $param['code'];
        $companyModel = model("Contact");
        $returnData = $companyModel->get_data_by_code($company_code);
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 新增联系人数据接口(添加联系人表单提交)
     * @desc  {"0":"接口地址：http://api.master.com/contact/create","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":[{"f_last_name":"刘","f_first_name":"林燕","f_user_position":"PHP研发","f_user_phone":"18588209320","f_user_email":"939942478@qq.com","f_user_role":["enterprise","financial","charge"],"f_group_code":"jt_1548139507"},{"f_last_name":"李","f_first_name":"林燕","f_user_position":"PHP研发","f_user_phone":"18588209320","f_user_email":"939942478@qq.com","f_user_role":["enterprise","financial"],"f_group_code":"jt_1548139507"}]}
     * @returnDemo {"0":{"code":200,"data":[{"contact_code":"ct_1548212016","last_name":"刘","first_name":"林燕","user_name":"刘林燕","user_position":"PHP研发","user_phone":"18588209320","user_email":"939942478@qq.com","is_enterprise":1,"is_financial":1,"is_charge":1,"group_code":"jt_1548139507","status":1},{"contact_code":"ct_1548212016","last_name":"李","first_name":"林燕","user_name":"李林燕","user_position":"PHP研发","user_phone":"18588209320","user_email":"939942478@qq.com","is_enterprise":1,"is_financial":1,"is_charge":0,"group_code":"jt_1548139507","status":1}],"error":""}}
     * @param {"name":"f_last_name","type":"string","required":true,"desc":"联系人姓氏","level":1}
     * @param {"name":"f_first_name","type":"string","required":true,"desc":"联系人名字","level":1}
     * @param {"name":"f_user_position","type":"string","required":true,"desc":"联系人职位","level":1}
     * @param {"name":"f_user_phone","type":"string","required":true,"desc":"联系人电话","level":1}
     * @param {"name":"f_user_email","type":"string","required":true,"desc":"联系人邮箱","level":1}
     * @param {"name":"f_user_role","type":"array","required":true,"desc":"联系人拥有的角色","level":1}
     * @param {"name":"f_group_code","type":"string","required":true,"desc":"联系人所属的集团编号","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"contact_code","type":"string","desc":"联系人的唯一编码","level":2}
     * @return {"name":"last_name","type":"string","desc":"联系人姓氏","level":2}
     * @return {"name":"first_name","type":"string","desc":"联系人名字","level":2}
     * @return {"name":"user_name","type":"string","desc":"联系人称呼","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编号","level":2}
     * @return {"name":"user_position","type":"string","desc":"联系人职位","level":2}
     * @return {"name":"user_phone","type":"string","desc":"联系人电话","level":2}
     * @return {"name":"user_email","type":"string","desc":"联系人邮箱","level":2}
     * @return {"name":"is_enterprise","type":"string","desc":"是否是企业负责人","level":2}
     * @return {"name":"is_financial","type":"string","desc":"是否是财务负责人","level":2}
     * @return {"name":"is_charge","type":"string","desc":"是否是清算负责人","level":2}
     * @return {"name":"status","type":"string","desc":"联系人状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save()
    {
        $post_datas = Request::instance()->param();
        //使得支持单个添加
        if(!isset($post_datas[0]))
        {
            $post_datas = array($post_datas);
        }

        $contactModel = model('Contact');
        $datas = self::_changeDatas($post_datas,1);
        $resData = $contactModel->createData($datas);
        if (!$resData) {
            return resultArray(['error' => $contactModel->getError()]);
        }
        $codes = array_column($datas,'code');
        $return_datas = $contactModel->get_data_by_codes($codes);
        return resultArray(['data' => $return_datas]);
    }

    /**
     * @title 更新联系人信息(类似提交表单的目标接口)
     * @desc  {"0":"接口地址：http://api.master.com/contact/update","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_code":"ct_1548383615","f_last_name":"刘","f_first_name":"林燕","f_user_position":"PHP研发","f_user_phone":"18588209320","f_user_email":"939942478@qq.com","f_user_role":["enterprise","financial"],"f_status":"1"}}
     * @returnDemo {"0":{"code":200,"data":{"contact_code":"ct_1548212016","last_name":"刘","first_name":"林燕","user_name":"刘林燕","user_position":"PHP研发","user_phone":"18588209320","user_email":"939942478@qq.com","is_enterprise":1,"is_financial":1,"is_charge":0,"group_code":"jt_1548139507","status":1},"error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"联系人唯一编码","level":1}
     * @param {"name":"f_last_name","type":"string","required":true,"desc":"联系人姓氏","level":1}
     * @param {"name":"f_first_name","type":"string","required":true,"desc":"联系人名字","level":1}
     * @param {"name":"f_user_position","type":"string","required":true,"desc":"联系人职位","level":1}
     * @param {"name":"f_user_phone","type":"string","required":true,"desc":"联系人电话","level":1}
     * @param {"name":"f_user_email","type":"string","required":true,"desc":"联系人邮箱","level":1}
     * @param {"name":"f_user_role","type":"array","required":true,"desc":"联系人拥有的角色","level":1}
     * @param {"name":"f_status","type":"string","required":true,"desc":"联系人状态1为已经激活,0为已被禁用","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"contact_code","type":"string","desc":"联系人的唯一编码","level":2}
     * @return {"name":"last_name","type":"string","desc":"联系人姓氏","level":2}
     * @return {"name":"first_name","type":"string","desc":"联系人名字","level":2}
     * @return {"name":"user_name","type":"string","desc":"联系人称呼","level":2}
     * @return {"name":"user_position","type":"string","desc":"联系人职位","level":2}
     * @return {"name":"is_enterprise","type":"string","desc":"是否是企业负责人","level":2}
     * @return {"name":"is_financial","type":"string","desc":"是否是财务负责人","level":2}
     * @return {"name":"is_charge","type":"string","desc":"是否是清算负责人","level":2}
     * @return {"name":"status","type":"string","desc":"联系人状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function update()
    {
        $postData = Request::instance()->param();
        //$param = $this->param;
        $data = self::_changeData($postData);
        $code = $data['code'];
        unset($data['code']);
        //角色处理
        $data['is_financial'] =  $data['is_enterprise'] = $data['is_charge'] = 0;
        if(isset($data['user_role'])){
            if(in_array("financial",$data['user_role'])){
                $data['is_financial'] = 1;
            }
            if(in_array("enterprise",$data['user_role'])){
                $data['is_enterprise'] = 1;
            }
            if(in_array("charge",$data['user_role'])){
                $data['is_charge'] = 1;
            }
            unset($data['user_role']);
        }
        $data['user_name'] = $data['last_name'].$data['first_name'];
        $companyModel = model('Contact');
        $resData = $companyModel->update_data_by_code($data,$code);
        if(!$resData){
            return resultArray(['error' => $companyModel->getError()]);
        }
        $data['contact_code'] = $code;
        return resultArray(['data' => $data]);
    }

    /**
     * @title 删除联系人数据接口
     * @desc  {"0":"接口地址：http://api.master.com/contact/delete","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证","3":"接口说明：添加编辑集团初始化共用"}
     * @postBody {"0":{"f_code":"ct_1548212016"}}
     * @returnDemo {"0":{"code":200,"data":"删除成功","error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"联系人编码"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","desc":"返回的数据内容","level":1}
     * @return {"name":"err","type":"string","desc":"返回的错误信息","level":1}
     */
    public function delete()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
        $contactModel = model('Contact');
        $data = $contactModel->del_data_by_code($param['f_code']);
        if (!$data) {
            return resultArray(['error' => $contactModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    /**
     * @title 获取该集团下可用被授权的联系人邮箱列表
     * @desc  {"0":"接口地址：http://api.master.com/contact/simplelist/jt_1548139507","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":[{"user_code":"ct_98029314963931299","user_email":"939942478@qq.com","user_name":"刘林燕","user_phone":"18588209321"},{"user_code":"ct_1548383615","user_email":"1874299065@qq.com","user_name":"刘林燕","user_phone":"18588209321"}],"error":""}}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","desc":"返回的成功信息","level":1}
     * @return {"name":"user_code","type":"string","desc":"用户唯一编码","level":2}
     * @return {"name":"user_email","type":"string","desc":"用户邮箱","level":2}
     * @return {"name":"user_name","type":"string","desc":"用户名称","level":2}
     * @return {"name":"user_phone","type":"string","desc":"用户联系电话","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function simple_list()
    {
        $param = Request::instance()->param();
        if(!isset($param['code']) || empty($param['code'])){
            return resultArray(['error' => '集团编码出错']);
        }
        $w['group_code'] = $param['code'];
        $w['is_distinct_email'] = 1;
        $contactModel = model('Contact');
        $data = $contactModel->getDataList($w);
        return resultArray(['data' => $data]);
    }

    /**
     * @title 添加市场信息中获取集团清算负责人以及授权邮箱接口
     * @desc  {"0":"接口地址：http://api.master.com/contact/getCharge/jt_1548139507","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @param {"name":"f_code","type":"int","required":true,"desc":"集团唯一编码","level":1}
     * @returnDemo {"0":{"code":200,"data":{"charge_list":[{"contact_code":"ct_98029314963931168","user_name":"刘林燕"},{"contact_code":"ct_98029314963931169","user_name":"将**"},{"contact_code":"ct_98029314963931170","user_name":"刘**"}],"emails_list":[{"user_code":"ct_98029314963931299","user_email":"939942478@qq.com","user_name":"刘林燕","user_phone":"18588209321"},{"user_code":"ct_1548383615","user_email":"1874299065@qq.com","user_name":"刘林燕","user_phone":"18588209321"}]},"error":""}}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"charge_list","type":"array","desc":"集团清算负责人列表","level":2}
     * @return {"name":"contact_code","type":"string","desc":"清算负责人编码","level":3}
     * @return {"name":"user_name","type":"array","desc":"清算负责人姓名","level":3}
     * @return {"name":"emails_list","type":"array","desc":"集团联系人邮箱列表","level":2}
     * @return {"name":"user_code","type":"string","desc":"用户唯一编码","level":2}
     * @return {"name":"user_email","type":"string","desc":"用户邮箱","level":2}
     * @return {"name":"user_name","type":"string","desc":"用户名称","level":2}
     * @return {"name":"user_phone","type":"string","desc":"用户联系电话","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function get_charge()
    {
        $param = Request::instance()->param();
        $group_code = $param['code'];
        $contactModel = model('Contact');
        $contact_w['group_code'] = $group_code;
        //清算负责人筛选列表
        $contact_w['user_role'] = 'Charge';
        $charge_info = $contactModel->getDataList($contact_w);
        $returnData['charge_list'] = $charge_info['list'];
        //授权邮箱筛选列表
        unset($contact_w['user_role']);
        $contact_w['is_distinct_email'] = 1;
        $returnData['emails_list'] = $contactModel->getDataList($contact_w);
        return resultArray(['data' => $returnData]);
    }


    /**
     * @param $data
     * @param int $act   多条数据添加、编辑操作 1为添加
     * @return array
     */
    private static function _changeDatas($datas,$act=0){

        //如果为空
        if(empty($datas)){
            return array();
        }
        $contactModel = model('Contact');
        $username = empty($GLOBALS['userInfo']) ? 'admin' : $GLOBALS['userInfo']['username'];
        foreach($datas as $key => $data)
        {
            foreach($data as $k=>$v)
            {
                $dataK = $k;
                if(strpos($k,'f_')!==false){
                    $k = substr($k,2,strlen($k));
                    unset($data[$dataK]);
                    $data[$k] = $v;
                }
            }
            $data['is_financial'] = 0;
            $data['is_enterprise'] = 0;
            $data['is_charge'] = 0;
            if(isset($data['user_role']) && !empty($data['user_role'])){
                //角色添加
                if(in_array("financial",$data['user_role'])){
                    $data['is_financial'] = 1;
                }
                if(in_array("enterprise",$data['user_role'])){
                    $data['is_enterprise'] = 1;
                }
                if(in_array("charge",$data['user_role'])){
                    $data['is_charge'] = 1;
                }
            }
            if(isset($data['user_role'])){
                unset($data['user_role']);
            }
            $data['code'] = 'ct_'.$contactModel->buildUUID();
            $data['user_name'] = $data['last_name'].$data['first_name'];
            //如果是添加操作
            if( $act == 1 ){
                $data['create_user'] = $username;
            }elseif( $act == 2 ){
                $data['last_update_user'] = $username;
            }
            $datas[$key] = $data;
        }
        return $datas;
    }
}
 