<?php
// +----------------------------------------------------------------------
// | Description: 集团市场接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use \think\Debug;
use \think\Collection;
use  \think\Request;
use \app\api\controller\Baseapi;

/**
 * @title 公司的市场模块2.0
 * Class Market
 * @package app\api\controller
 */
class Market extends Baseapi
{

    /**
     * @title 读取公司下的市场列表
     * @desc  {"0":"接口地址：http://api.master.com/market/list/gs_1548153426","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"list":[{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"第一个市场","currency_sign":"$","currency_name":"USD","sync_type":1,"charge_user_name":"刘林燕","status":0}]},"error":""}}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"list","type":"array","desc":"联系人列表数据","level":2}
     * @return {"name":"market_code","type":"string","desc":"市场的唯一编码","level":3}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编码","level":3}
     * @return {"name":"company_code","type":"string","desc":"公司的唯一编码","level":3}
     * @return {"name":"market_name","type":"string","desc":"市场名称","level":3}
     * @return {"name":"currency_sign","type":"string","desc":"币别标识符","level":3}
     * @return {"name":"currency_name","type":"string","desc":"币别名称","level":3}
     * @return {"name":"sync_type","type":"int","desc":"数据同步更新方式1为自动;0为手动","level":3}
     * @return {"name":"charge_user_name","type":"string","desc":"清算负责人名称","level":3}
     * @return {"name":"status","type":"int","desc":"市场状态;0:正常活跃;1:不活跃","level":3}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function index()
    {
        $param = Request::instance()->param();
        if(!isset($param['code']) || empty($param['code'])){
            return resultArray(['error' => '公司编码出错']);
        }
        $w['company_code'] = $param['code'];
        $marketModel = model('Market');
        $data = $marketModel->getDataList($w);
        return resultArray(['data' => $data]);
    }

    /**
     * @title 添加市场信息
     * @desc  {"0":"接口地址：http://api.master.com/market/create","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_group_code":"jt_1548139507","f_company_code":"gs_1548153426","f_market_name":"市场名称","f_currency_sign":"$","f_currency_name":"USD","f_sync_type":"0","f_memo":"市场备注","f_charge_user_code":"ct_98029314963931168","f_charge_user_name":"刘林燕","f_authorized_user_email":["15@qq.com","1874299065@qq.com"]}}
     * @returnDemo {"0":{"code":200,"data":{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"市场名称","currency_sign":"$","currency_name":"USD","sync_type":"0","memo":"市场备注","charge_user_code":"ct_98029314963931168","charge_user_name":"刘林燕","status":"0","authorized_user_email":["15@qq.com","1874299065@qq.com"]},"error":""}}
     * @param {"name":"f_group_code","type":"string","required":true,"desc":"集团的唯一编码","level":1}
     * @param {"name":"f_company_code","type":"string","required":true,"desc":"公司的唯一编码","level":1}
     * @param {"name":"f_market_name","type":"string","required":true,"desc":"市场名称","level":1}
     * @param {"name":"f_currency_sign","type":"string","required":true,"desc":"币别标识符","level":1}
     * @param {"name":"f_currency_name","type":"string","required":true,"desc":"币别名称","level":1}
     * @param {"name":"f_sync_type","type":"int","required":true,"desc":"数据同步更新方式1为自动;0为手动","level":1}
     * @param {"name":"f_memo","type":"string","required":false,"desc":"备注","level":1}
     * @param {"name":"f_charge_user_code","type":"string","required":true,"desc":"清算负责人编号","level":1}
     * @param {"name":"f_charge_user_name","type":"string","required":true,"desc":"清算负责人名称","level":1}
     * @param {"name":"f_authorized_user_email","type":"array","required":false,"desc":"授权的用户邮箱","level":1}
     * @return {"name":"code","type":"string","required":true,"desc":"返回的错误信息","level":1}
     * @return {"name":"data","type":"string","array":true,"desc":"操作返回提示","level":1}
     * @return {"name":"market_code","type":"string","required":true,"desc":"市场的唯一编码","level":2}
     * @return {"name":"group_code","type":"string","required":true,"desc":"集团的唯一编码","level":2}
     * @return {"name":"company_code","type":"string","required":true,"desc":"公司的唯一编码","level":2}
     * @return {"name":"market_name","type":"string","required":true,"desc":"市场名称","level":2}
     * @return {"name":"currency_sign","type":"string","required":true,"desc":"币别标识符","level":2}
     * @return {"name":"currency_name","type":"string","required":true,"desc":"币别名称","level":2}
     * @return {"name":"sync_type","type":"int","required":true,"desc":"数据同步更新方式1为自动;0为手动","level":2}
     * @return {"name":"memo","type":"string","required":false,"desc":"备注","level":2}
     * @return {"name":"charge_user_code","type":"string","required":true,"desc":"清算负责人编号","level":2}
     * @return {"name":"charge_user_name","type":"string","required":true,"desc":"清算负责人名称","level":2}
     * @return {"name":"status","type":"string","required":true,"desc":"市场状态;0:正常活跃;1:不活跃","level":2}
     * @return {"name":"authorized_user_email","type":"array","required":false,"desc":"授权的用户邮箱","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save()
    {
        $param = Request::instance()->param();
        $data = $return_data =  self::_changeData($param,1);
        $data['last_update_user'] = $data['create_user'];
        $marketModel = model('Market');
        $data['code'] = 'mk_'.$marketModel->buildUUID();
        if(!empty($data['authorized_user_email'])) {
            //市场授权表添加数据
            $authorized_user_emails = $data['authorized_user_email'];
            $data['authorized_user_email'] = $this->_change_authorized_user_insert($data['code'],$authorized_user_emails,$data['create_user']);
        }
        $result_data = $marketModel->createData($data);
        if(!$result_data){
            return resultArray(['error' => $marketModel->getError()]);
        }
        $return_data['market_code'] = $data['code'];
        unset($return_data['create_user']);
        $return_data['status'] = 0;
        return resultArray(['data' => $return_data]);
    }

    /**
     * @title 读取市场信息接口(点击编辑市场的时候调用)
     * @desc  {"0":"接口地址：http://api.master.com/market/get/mk_1548232033","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @param {"name":"f_code","type":"int","required":true,"desc":"市场唯一编码","level":1}
     * @returnDemo {"0":{"code":200,"data":{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"第一个市场","currency_sign":"$","currency_name":"USD","sync_type":1,"memo":"备注信息","charge_user_code":"ct_98029314963931168","charge_user_name":"刘林燕","status":0,"charge_list":[{"contact_code":"ct_98029314963931168","user_name":"刘林燕"},{"contact_code":"ct_98029314963931169","user_name":"将**"},{"contact_code":"ct_98029314963931170","user_name":"将**"}],"emails_":[{"user_email":"939942478@qq.com"},{"user_email":"187@qq.com"},{"user_email":"15@qq.com"}],"authorized_user_emails":[{"user_email":"187@qq.com"},{"user_email":"15@qq.com"}]},"error":""}}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"market_code","type":"string","desc":"市场的唯一编码","level":2}
     * @return {"name":"group_code","type":"string","required":true,"desc":"集团唯一编码","level":2}
     * @return {"name":"company_code","type":"string","required":true,"desc":"公司唯一编码","level":2}
     * @return {"name":"market_name","type":"string","required":true,"desc":"市场名称","level":2}
     * @return {"name":"currency_sign","type":"string","required":true,"desc":"币别标识符","level":2}
     * @return {"name":"currency_name","type":"string","required":true,"desc":"币别名称","level":2}
     * @return {"name":"sync_type","type":"int","required":true,"desc":"数据同步更新方式1为自动;0为手动","level":2}
     * @return {"name":"memo","type":"string","required":true,"desc":"备注","level":2}
     * @return {"name":"charge_user_code","type":"int","required":true,"desc":"清算负责人唯一编码","level":2}
     * @return {"name":"charge_user_name","type":"int","required":true,"desc":"清算负责人唯一名称","level":2}
     * @return {"name":"status","type":"string","required":true,"desc":"市场状态;0:正常活跃;1:不活跃","level":2}
     * @return {"name":"charge_list","type":"array","desc":"集团清算负责人列表","level":2}
     * @return {"name":"contact_code","type":"string","desc":"清算负责人编码","level":3}
     * @return {"name":"user_name","type":"array","desc":"清算负责人姓名","level":3}
     * @return {"name":"emails_list","type":"array","desc":"集团联系人邮箱列表","level":2}
     * @return {"name":"user_email","type":"string","desc":"联系人邮箱","level":3}
     * @return {"name":"authorized_user_emails","type":"array","desc":"市场已授权邮箱列表","level":2}
     * @return {"name":"user_email","type":"string","desc":"已经授权邮箱","level":3}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function read()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
        $market_code = $param['code'];
        $marketModel = model("Market");
        $returnData = $marketModel->get_data_by_code($market_code);

        $contactModel = model('Contact');
        $contact_w['group_code'] = $returnData['group_code'];
        //清算负责人筛选列表
        $contact_w['user_role'] = 'Charge';
        $charge_info = $contactModel->getDataList($contact_w);
        $returnData['charge_list'] = $charge_info['list'];
        //授权邮箱筛选列表
        unset($contact_w['user_role']);
        $contact_w['is_distinct_email'] = 1;
        $returnData['emails_list'] = $contactModel->getDataList($contact_w);
        //市场已经授权的邮箱列表
        $authorizedModel = model('AuthorizedUser');
        $authorized_w['market_code'] = $market_code;
        $authorized_w['status'] = 1;
        $returnData['authorized_user_emails'] = $authorizedModel->getDataList($authorized_w);
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 编辑市场信息
     * @desc  {"0":"接口地址：http://api.master.com/market/update","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_code":"mk_1548232033","f_group_code":"jt_1548139507","f_company_code":"gs_1548153426","f_market_name":"市场名称","f_currency_sign":"$","f_currency_name":"USD","f_sync_type":"0","f_memo":"市场备注","f_charge_user_code":"ct_98029314963931168","f_charge_user_name":"刘林燕","f_authorized_user_email":["15@qq.com","1874299065@qq.com"]}}
     * @returnDemo {"0":{"code":200,"data":{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"市场名称","currency_sign":"$","currency_name":"USD","sync_type":"0","memo":"市场备注","charge_user_code":"ct_98029314963931168","charge_user_name":"刘林燕","status":"0","authorized_user_email":["15@qq.com","1874299065@qq.com"]},"error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"市场的唯一编码","level":1}
     * @param {"name":"f_group_code","type":"string","required":true,"desc":"集团的唯一编码","level":1}
     * @param {"name":"f_company_code","type":"string","required":true,"desc":"公司的唯一编码","level":1}
     * @param {"name":"f_market_name","type":"string","required":true,"desc":"市场名称","level":1}
     * @param {"name":"f_currency_sign","type":"string","required":true,"desc":"币别标识符","level":1}
     * @param {"name":"f_currency_name","type":"string","required":true,"desc":"币别名称","level":1}
     * @param {"name":"f_sync_type","type":"int","required":true,"desc":"数据同步更新方式1为自动;0为手动","level":1}
     * @param {"name":"f_memo","type":"string","required":false,"desc":"备注","level":1}
     * @param {"name":"f_charge_user_code","type":"string","required":true,"desc":"清算负责人编号","level":1}
     * @param {"name":"f_charge_user_name","type":"string","required":true,"desc":"清算负责人名称","level":1}
     * @param {"name":"f_status","type":"int","required":true,"desc":"市场的状态 0正常活跃;1:不活跃","level":1}
     * @param {"name":"f_authorized_user_email","type":"array","required":false,"desc":"授权的用户邮箱","level":1}
     * @return {"name":"code","type":"string","required":true,"desc":"返回的错误信息","level":1}
     * @return {"name":"data","type":"string","array":true,"desc":"操作返回提示","level":1}
     * @return {"name":"market_code","type":"string","desc":"市场的唯一编码","level":2}
     * @return {"name":"group_code","type":"string","required":true,"desc":"集团的唯一编码","level":2}
     * @return {"name":"company_code","type":"string","required":true,"desc":"公司的唯一编码","level":2}
     * @return {"name":"market_name","type":"string","required":true,"desc":"市场名称","level":2}
     * @return {"name":"currency_sign","type":"string","required":true,"desc":"币别标识符","level":2}
     * @return {"name":"currency_name","type":"string","required":true,"desc":"币别名称","level":2}
     * @return {"name":"sync_type","type":"int","required":true,"desc":"数据同步更新方式1为自动;0为手动","level":2}
     * @return {"name":"memo","type":"string","required":false,"desc":"备注","level":2}
     * @return {"name":"charge_user_code","type":"string","required":true,"desc":"清算负责人编号","level":2}
     * @return {"name":"charge_user_name","type":"string","required":true,"desc":"清算负责人名称","level":2}
     * @return {"name":"status","type":"string","required":true,"desc":"市场状态;0:正常活跃;1:不活跃","level":2}
     * @return {"name":"authorized_user_email","type":"array","required":false,"desc":"授权的用户邮箱","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function update()
    {
        $param = Request::instance()->param();
        $data = $return_data =  self::_changeData($param,2);

        $marketModel = model('Market');
        $market_code = $data['code'];
        unset($data['code']);

        //是否删除取消所有邮箱的授权,默认为否
        $data['delete_all_emails'] = 0;

        if(isset($data['authorized_user_email']) && empty($data['authorized_user_email'])){
            $data['delete_all_emails'] = 1;
        }elseif(isset($data['authorized_user_email']) && !empty($data['authorized_user_email'])){
            //如果授权邮箱不为空的情况下
            //先取出已经授权的邮箱
            $authorizedModel = model('AuthorizedUser');
            $authorized_w['market_code'] = $market_code;
            $exit_emails = $authorizedModel->getDataList($authorized_w);
            if(!empty($exit_emails)){
                $exit_emails = json_decode(json_encode($exit_emails),true);
                $exit_emails = array_column($exit_emails,'user_email');
                //需要先删除的邮箱数组为
                $data['delete_emails'] = $exit_emails;
            }
            //需要更新状态为有效的数组为
            $active_emails = array_intersect($data['authorized_user_email'],$exit_emails);
            if(!empty($active_emails)){
                $data['active_emails'] = $active_emails;
            }
            //需要新增的授权邮箱为
            $insert_emails = array_diff($data['authorized_user_email'],$exit_emails);
            if(!empty($insert_emails)){
                $data['insert_emails'] = $this->_change_authorized_user_insert($market_code,$insert_emails,$data['last_update_user']);
            }
        }
        unset($data['authorized_user_email']);
        $result_data = $marketModel->update_data_by_code($data,$market_code);
        if(!$result_data){
            return resultArray(['error' => $marketModel->getError()]);
        }
        unset($return_data['last_update_user']);
        $return_data['market_code'] = $return_data['code'];
        unset($return_data['code']);
        return resultArray(['data' => $return_data]);
    }


    /**
     * @title 删除市场数据接口
     * @desc  {"0":"接口地址：http://api.master.com/market/delete","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_code":"mk_1548232033"}}
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
        $marketModel = model('Market');
        $data = $marketModel->del_data_by_code($param['f_code']);
        if (!$data) {
            return resultArray(['error' => $marketModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    /**
     * @desc 内部使用方法,给我一组市场的授权邮箱,组装成要添加的数据
     * @param $market_code
     * @param $emails
     * @param $create_user
     * @return array
     */
    private function _change_authorized_user_insert($market_code,$emails,$create_user)
    {
        $authorizedModel = model('AuthorizedUser');
        //如果是新增市场操作,则直接添加即可
        $insert_data = array();
        foreach ($emails as $email) {
            $tmp_data = [];
            $tmp_data['code'] = 'sq_'.$authorizedModel->buildUUID();
            $tmp_data['market_code'] = $market_code;
            $tmp_data['user_email'] = $email;
            $tmp_data['create_user'] = $create_user;
            array_push($insert_data, $tmp_data);
        }
        return $insert_data;
    }
}
 