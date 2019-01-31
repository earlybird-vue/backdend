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
     * @returnDemo {"0":{"code":200,"data":{"data_count":2,"list":[{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"第一个市场","currency_sign":"$","currency_name":"USD","sync_type":1,"charge_user_name":"刘林燕","status":0}]},"error":""}}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"data_count","type":"int","desc":"市场总数","level":2}
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
     * @postBody {"0":[{"f_group_code":"jt_1548139507","f_company_code":"gs_1548153426","f_market_name":"市场名称","f_currency_sign":"$","f_currency_name":"USD","f_sync_type":"0","f_memo":"市场备注","f_charge_user_code":"ct_98029314963931168","f_charge_user_name":"刘林燕","f_authorized_user_code":["ct_98029314963931299","ct_98029314963931306"]},{"f_group_code":"jt_1548139507","f_company_code":"gs_1548153426","f_market_name":"市场名称","f_currency_sign":"$","f_currency_name":"USD","f_sync_type":"0","f_memo":"市场备注","f_charge_user_code":"ct_98029314963931168","f_charge_user_name":"刘林燕","f_authorized_user_code":["ct_98029314963931299"]}]}
     * @returnDemo {"0":{"code":200,"data":[{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"市场名称","currency_sign":"$","currency_name":"USD","sync_type":"0","memo":"市场备注","charge_user_code":"ct_98029314963931168","charge_user_name":"刘林燕","status":"0","authorized_user_code":["ct_98029314963931299","ct_98029314963931306"]},{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"市场名称","currency_sign":"$","currency_name":"USD","sync_type":"0","memo":"市场备注","charge_user_code":"ct_98029314963931168","charge_user_name":"刘林燕","status":"0","authorized_user_code":["ct_98029314963931299"]}],"error":""}}
     * @param {"name":"f_group_code","type":"string","required":true,"desc":"集团的唯一编码","level":1}
     * @param {"name":"f_company_code","type":"string","required":true,"desc":"公司的唯一编码","level":1}
     * @param {"name":"f_market_name","type":"string","required":true,"desc":"市场名称","level":1}
     * @param {"name":"f_currency_sign","type":"string","required":true,"desc":"币别标识符","level":1}
     * @param {"name":"f_currency_name","type":"string","required":true,"desc":"币别名称","level":1}
     * @param {"name":"f_sync_type","type":"int","required":true,"desc":"数据同步更新方式1为自动;0为手动","level":1}
     * @param {"name":"f_memo","type":"string","required":false,"desc":"备注","level":1}
     * @param {"name":"f_charge_user_code","type":"string","required":true,"desc":"清算负责人编号","level":1}
     * @param {"name":"f_charge_user_name","type":"string","required":true,"desc":"清算负责人名称","level":1}
     * @param {"name":"f_authorized_user_code","type":"array","required":false,"desc":"授权邮箱的用户编码","level":1}
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
     * @return {"name":"authorized_user_code","type":"array","required":false,"desc":"授权邮箱的用户编码","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save()
    {
        $param = Request::instance()->param();
        //使得支持单个添加
        if(!isset($param[0]))
        {
            $param = array($param);
        }
        $data  =  self::_changeDatas($param,1);
        $marketModel = model('Market');
        $result_data = $marketModel->createData($data);
        if(!$result_data){
            return resultArray(['error' => $marketModel->getError()]);
        }
        //查询返回的数据
        $market_codes = array_column($data,'code');
        $return_data = $marketModel->get_data_by_codes($market_codes);

        $return_data = json_decode(json_encode($return_data),true);

        $authorzedModel = model('AuthorizedUser');
        foreach($return_data as $k=>$v)
        {
            $w['market_code'] = $v['market_code'];
            $w['status'] = 1;
            $allcodes = json_decode(json_encode($authorzedModel->getDataList($w)),true);
            if(!empty($allcodes)){
                $v['authorized_user_code'] = array_column($allcodes,'user_code');
            }else{
                $v['authorized_user_code'] =  array();
            }
            $return_data[$k] = $v;
        }
        return resultArray(['data' => $return_data]);
    }

    /**
     * @title 读取市场信息接口(点击编辑市场的时候调用)
     * @desc  {"0":"接口地址：http://api.master.com/market/get/mk_1548232033","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @param {"name":"f_code","type":"int","required":true,"desc":"市场唯一编码","level":1}
     * @returnDemo {"0":{"code":200,"data":{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"第一个市场","currency_sign":"$","currency_name":"USD","sync_type":1,"memo":"备注信息","charge_user_code":"ct_98029314963931168","charge_user_name":"刘林燕","status":0,"charge_list":[{"contact_code":"ct_98029314963931168","user_name":"刘林燕"},{"contact_code":"ct_98029314963931169","user_name":"将**"},{"contact_code":"ct_98029314963931170","user_name":"将**"}],"emails_list":[{"user_code":"ct_98029314963931299","user_email":"123@qq.com","user_name":"王丽","user_phone":"18588209321"},{"user_code":"ct_98029314963931306","user_email":"125@qq.com","user_name":"李2","user_phone":"18588209321"}],"authorized_user_codes":["ct_98029314963931299"]},"error":""}}
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
     * @return {"name":"authorized_user_codes","type":"array","desc":"市场已授权邮箱的用户编码列表","level":2}
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
        $authorized_user_codes  = json_decode(json_encode($authorizedModel->getDataList($authorized_w)),true);
        if(!empty($authorized_user_codes)) {
            $authorized_user_codes = array_column($authorized_user_codes,'user_code');
        }
        $returnData['authorized_user_codes'] = $authorized_user_codes;
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 编辑市场信息
     * @desc  {"0":"接口地址：http://api.master.com/market/update","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_code":"mk_1548232033","f_group_code":"jt_1548139507","f_company_code":"gs_1548153426","f_market_name":"市场名称","f_currency_sign":"$","f_currency_name":"USD","f_sync_type":"0","f_memo":"市场备注","f_charge_user_code":"ct_98029314963931168","f_charge_user_name":"刘林燕","f_authorized_user_code":["ct_98029314963931299"]}}
     * @returnDemo {"0":{"code":200,"data":{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"市场名称","currency_sign":"$","currency_name":"USD","sync_type":"0","memo":"市场备注","charge_user_code":"ct_98029314963931168","charge_user_name":"刘林燕","status":"0","authorized_user_code":["ct_98029314963931299"]},"error":""}}
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
     * @return {"name":"authorized_user_code","type":"array","required":false,"desc":"授权邮箱的用户编码","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function update()
    {
        $param = Request::instance()->param();
        $data = $return_data =  self::_changeData($param,2);

        $marketModel = model('Market');
        $market_code = $data['code'];
        unset($data['code']);

        //默认为全部删除
        $data['delete_all_users'] = 1;
        if(isset($data['authorized_user_code']) && !empty($data['authorized_user_code'])){
            //如果授权邮箱不为空的情况下
            //是否删除取消所有邮箱的授权,修改为否
            $data['delete_all_users'] = 0;
            //先取出已经授权的邮箱
            $authorizedModel = model('AuthorizedUser');
            $authorized_w['market_code'] = $market_code;
            $exit_users = $authorizedModel->getDataList($authorized_w);
            if (!empty($exit_users)) {
                $exit_users = json_decode(json_encode($exit_users), true);
                $exit_users = array_column($exit_users, 'user_code');
                //需要先删除的邮箱数组为
                $data['delete_users'] = $exit_users;
            }
            //需要更新状态为有效的数组为
            $active_users = array_intersect($data['authorized_user_code'], $exit_users);
            if (!empty($active_users)) {
                $data['active_users'] = $active_users;
            }
            //需要新增的授权邮箱为
            $insert_users = array_diff($data['authorized_user_code'], $exit_users);
            if (!empty($insert_users)) {
                $data['insert_users'] = $this->_change_authorized_user_insert($market_code, $insert_users, $data['last_update_user']);
            }
        }
        unset($data['authorized_user_code']);
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
    private function _change_authorized_user_insert($market_code,$user_codes,$create_user)
    {
        $authorizedModel = model('AuthorizedUser');
        //获取
        //如果是新增市场操作,则直接添加即可
        $insert_data = array();
        foreach ($user_codes as $user_code) {
            $tmp_data = [];
            $tmp_data['code'] = 'sq_'.$authorizedModel->buildUUID();
            $tmp_data['market_code'] = $market_code;
            $tmp_data['user_code'] = $user_code;
            $tmp_data['create_user'] = $create_user;
            array_push($insert_data, $tmp_data);
        }
        return $insert_data;
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
        $marketModel = model('Market');
        $users_data = array();
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
            $data['last_update_user'] = $username;
            //如果是添加操作
            if( $act == 1 ){
                $data['create_user'] = $username;
                $data['code'] = 'mk_'.$marketModel->buildUUID();

                if(!empty($data['authorized_user_code'])) {
                    //市场授权表添加数据
                    $authorized_user_codes = $data['authorized_user_code'];
                    $users_data  = array_merge(self::_change_authorized_user_insert($data['code'],$authorized_user_codes,$username),$users_data);
                }
                unset($data['authorized_user_code']);
            }
            $datas[$key] = $data;
        }
        if($act==1 && !empty($users_data)){
            $datas['authorized_user_code'] = $users_data;
        }
        return $datas;
    }
}
 