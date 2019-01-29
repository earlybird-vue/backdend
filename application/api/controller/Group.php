<?php
// +----------------------------------------------------------------------
// | Description: 集团接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;
use  \think\Request;

use \app\api\controller\Country;
use \app\api\controller\Industry;
use \app\api\controller\Basetype;
use \app\api\controller\Baseapi;
use \think\config;

/**
 * @title 买家集团模块2.0
 * Class Group
 * @package app\api\controller
 */
class Group extends Baseapi
{

    /**
     * @title 集团列表
     * @desc  {"0":"请求方式：GET","1":"请求地址：http://api.master.com/group/list/page/1/size/10","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"list":[{"code":"jt_1548139507","name":"集团2","web_site":"www.jt2.com","country_name":"国家","industry_name":"行业","type_name":"类型","num":0}],"data_count":1},"error":""}}
     * @param {"name":"page","type":"int","required":false,"default":"1","desc":"页数"}
     * @param {"name":"size","type":"int","required":false,"default":10,"desc":"每页显示条数，默认为10"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","desc":"返回数据内容","level":1}
     * @return {"name":"list","type":"array","desc":"集团列表数据","level":2}
     * @return {"name":"code","type":"bigint","desc":"编号","level":3}
     * @return {"name":"name","type":"string","desc":"集团名称'","level":3}
     * @return {"name":"web_site","type":"string","desc":"公司网站'","level":3}
     * @return {"name":"country_name","type":"string","desc":"所属国家","level":3}
     * @return {"name":"industry_name","type":"string","desc":"所属行业","level":3}
     * @return {"name":"type_name","type":"string","desc":"所属类型","level":3}
     * @return {"name":"num","type":"int","desc":"市场个数","level":3}
     * @return {"name":"data_count","type":"int","required":true,"desc":"集团总数","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function index()
    {
        $groupModel = model('Group');
        $param = Request::instance()->param();
        //$param = $this->param;
        $page = !empty($param['page']) ? $param['page']: '1';
        $limit = !empty($param['size']) ? $param['size']: '10';
        if(isset($param['status'])){
            //前端可以增加筛选集团的状态,默认展示的是有效集团
            $w['status']  = int($param['status']);
        }
        $data = $groupModel->getDataList($w,$page, $limit);
        return resultArray(['data' => $data]);
    }

    /**
     * @title 添加集团/编辑集团初始化数据接口
     * @desc  {"0":"接口地址：http://api.master.com/group/get/jt_1548139507","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证","3":"接口说明：添加编辑集团初始化共用"}
     * @returnDemo {"0":{"code":200,"data":{"info": {"code": "jt_1548139507","name": "集团2","web_site": "www.jt2.com","group_number": "jituan002","address": "集团2的地址","industry_id":1,"country_id": 2,"type_id": 3,"contact_phone": "18588209091","fiscal_month": 4,"status": 1},"industrys":[{"id":1,"name": "快速消费型"},{"id":2,"name":"设备生产型"}],"countrys":[{"id":1,"name":"Afghanistan"},{"id":2,"name":"Albania"}],"types":[{"id": 1,"name": "股份制企业"},{"id": 2,"name": "上市公司"}]},"error":""}}
     * @param {"name":"code","type":"string","desc":"集团编码添加的时候传0即可"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回数据内容","level":1}
     * @return {"name":"info","type":"array","required":true,"desc":"集团信息","level":2}
     * @return {"name":"code","type":"string","desc":"集团编码","level":3}
     * @return {"name":"name","type":"string","desc":"集团名称","level":3}
     * @return {"name":"web_site","type":"string","desc":"集团网站","level":3}
     * @return {"name":"group_number","type":"string","desc":"集团编号","level":3}
     * @return {"name":"address","type":"string","desc":"集团地址","level":3}
     * @return {"name":"industry_id","type":"int","desc":"所属行业id","level":3}
     * @return {"name":"country_id","type":"int","desc":"所属国家id","level":3}
     * @return {"name":"type_id","type":"int","desc":"所属类型id","level":3}
     * @return {"name":"contact_phone","type":"string","desc":"总机","level":3}
     * @return {"name":"fiscal_month","type":"int","desc":"财年截至时间","level":3}
     * @return {"name":"status","type":"int","required":true,"desc":"集团状态1为有效,0为无效","level":3}
     * @return {"name":"industrys","type":"array","required":true,"desc":"行业基础数据列表","level":2}
     * @return {"name":"id","type":"int","required":true,"desc":"行业编号","level":3}
     * @return {"name":"name","type":"string","required":true,"desc":"行业名称","level":3}
     * @return {"name":"countrys","type":"array","required":true,"desc":"国家基础数据列表","level":2}
     * @return {"name":"id","type":"int","required":true,"desc":"国家编号","level":3}
     * @return {"name":"name","type":"string","required":true,"desc":"国家名称","level":3}
     * @return {"name":"types","type":"array","required":true,"desc":"公司类型列表","level":2}
     * @return {"name":"id","type":"int","required":true,"desc":"类型编号","level":3}
     * @return {"name":"name","type":"string","required":true,"desc":"类型名称","level":3}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function read()
    {
        $data['info'] = array();
        $param = Request::instance()->param();
        //$param = $this->param;
        if(isset($param['code']) && !empty($param['code'])){
            $gorupCode = $param['code'];
            $groupModel = model('group');
            $data['info'] = $groupModel->get_data_by_code($gorupCode);
        }
        $ict_data = $this->_get_ict_data();
        $data = array_merge($data,$ict_data);
        return resultArray(['data' => $data]);
    }

    /**
     * @title 新增集团数据接口(添加集团表单提交)
     * @desc {"0":"接口地址：http://api.master.com/group/create","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_name":"集团名称","f_web_site":"ces.com","f_group_number":"集团编号","f_industry_id":"3","f_country_id":"4","f_type_id":"2","f_contact_phone":"18588209001","f_address":"dizhi","f_fiscal_month":"3"}}
     * @returnDemo {"0":{"code":200,"data":{"code":"jt_98029314963931152","name":"ces.com","web_site":"集团网站","group_number":"集团编号"},"error":""}}
     * @param {"name":"f_name","type":"string","required":true,"desc":"集团名称","level":1}
     * @param {"name":"f_web_site","type":"string","required":true,"desc":"集团网站","level":1}
     * @param {"name":"f_group_number","type":"string","required":true,"desc":"集团编号","level":1}
     * @param {"name":"f_industry_id","type":"int","required":true,"desc":"集团所属行业id","level":1}
     * @param {"name":"f_country_id","type":"int","required":true,"desc":"集团所属国家id","level":1}
     * @param {"name":"f_type_id","type":"int","required":true,"desc":"集团类型id","level":1}
     * @param {"name":"f_contact_phone","type":"string","required":true,"desc":"集团总机","level":1}
     * @param {"name":"f_address","type":"string","required":true,"desc":"集团地址","level":1}
     * @param {"name":"f_fiscal_month","type":"int","desc":"财年截至时间","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"code","type":"bigint","desc":"集团唯一编码","level":2}
     * @return {"name":"name","type":"string","desc":"集团名称","level":2}
     * @return {"name":"web_site","type":"string","desc":"集团网站","level":2}
     * @return {"name":"group_number","type":"string","desc":"集团编号","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save()
    {
        $postData = Request::instance()->param();
        $groupModel = model('Group');
        $data = $this->_changeData($postData,1);
        $data['code'] = 'jt_'.$groupModel->buildUUID();
        $resData = $groupModel->createData($data);
        if (!$resData) {
            return resultArray(['error' => $groupModel->getError()]);
        }
        //返回的数据
        $returnData = array(
            'code'=>$data['code'],
            'name'=>$data['name'],
            'web_site'=>$data['web_site'],
            'group_number'=>$data['group_number']
        );
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 更新集团数据接口(更新集团表单提交)
     * @desc {"0":"接口地址：http://api.master.com/group/update","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_code":"jt_1548139507","f_name":"集团名称","f_web_site":"ces.com","f_group_number":"集团编号","f_industry_id":"3","f_country_id":"4","f_type_id":"2","f_contact_phone":"18588209001","f_address":"dizhi","f_fiscal_month":"3"}}
     * @returnDemo {"0":{"code":200,"data":{"code":"jt_98029314963931152","name":"ces.com","web_site":"集团网站","group_number":"集团编号"},"error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"集团编码","level":1}
     * @param {"name":"f_name","type":"string","required":true,"desc":"集团名称","level":1}
     * @param {"name":"f_web_site","type":"string","required":true,"desc":"集团网站","level":1}
     * @param {"name":"f_group_number","type":"string","required":true,"desc":"集团编号","level":1}
     * @param {"name":"f_industry_id","type":"int","required":true,"desc":"集团所属行业id","level":1}
     * @param {"name":"f_country_id","type":"int","required":true,"desc":"集团所属国家id","level":1}
     * @param {"name":"f_type_id","type":"int","required":true,"desc":"集团类型id","level":1}
     * @param {"name":"f_contact_phone","type":"string","required":true,"desc":"集团总机","level":1}
     * @param {"name":"f_address","type":"string","required":true,"desc":"集团地址","level":1}
     * @param {"name":"f_fiscal_month","type":"int","desc":"财年截至时间","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"code","type":"bigint","desc":"集团唯一编码","level":2}
     * @return {"name":"name","type":"string","desc":"集团名称","level":2}
     * @return {"name":"web_site","type":"string","desc":"集团网站","level":2}
     * @return {"name":"group_number","type":"string","desc":"集团编号","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function update()
    {
        $postData = Request::instance()->param();
        //$param = $this->param;
        $param = $this->_changeData($postData);
        if(!isset($param['code']) || empty($param['code'])){
            return resultArray(['error' => '编码参数出错']);
        }

        $code = $param['code'];
        $groupModel = model('Group');
        $data = $groupModel->update_data_by_code($param, $code);
        if (!$data) {
            return resultArray(['error' => $groupModel->getError()]);
        }

        //编辑成功返回的数据
        $returnData = array(
            'code'=>$param['code'],
            'name'=>$param['name'],
            'web_site'=>$param['web_site'],
            'group_number'=>$param['group_number']
        );
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 删除集团数据接口
     * @desc  {"0":"接口地址：http://api.master.com/group/delete","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证","3":"接口说明：添加编辑集团初始化共用"}
     * @postBody {"0":{"f_code":"jt_1548139507"}}
     * @returnDemo {"0":{"code":200,"data":"删除成功","error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"集团编码"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","desc":"返回的数据内容","level":1}
     * @return {"name":"err","type":"string","desc":"返回的错误信息","level":1}
     */
    public function delete()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
        $groupModel = model('Group');
        $data = $groupModel->del_data_by_code($param['f_code']);
        if (!$data) {
            return resultArray(['error' => $groupModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    /**
     * @title 批量删除集团数据接口
     * @desc  {"0":"接口地址：http://api.master.com/group/deletes","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证","3":"接口说明：添加编辑集团初始化共用"}
     * @postBody {"0":{"f_codes":["jt_1548139507","jt_98029314963931152"]}}
     * @returnDemo {"0":{"code":200,"data":"批量删除成功","error":""}}
     * @param {"name":"f_codes","type":"array","required":true,"desc":"批量删除的集团编码"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","desc":"返回的数据内容","level":1}
     * @return {"name":"err","type":"string","desc":"返回的错误信息","level":1}
     */
    public function deletes()
    {
        $param = Request::instance()->param();
        $groupModel = model('Group');
        $data = $groupModel->del_data_by_codes($param['f_codes']);
        if (!$data) {
            return resultArray(['error' => '删除失败']);
        }
        return resultArray(['data' => '批量删除成功']);
    }

    /**
     * @title 管理集团数据接口
     * @desc  {"0":"接口地址：http://api.master.com/group/show/jt_1548139507","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"code":200,"data":{"group_info":{"code":"jt_1548139507","name":"集团2","web_site":"www.jt2.com","group_number":"jituan013","address":"集团2的地址","industry_id":1,"country_id":2,"type_id":3,"contact_phone":"18588209091","fiscal_month":4,"status":1},"company_info":[{"company_code":"gs_98029314963931166","name":"腾讯u","en_name":"qqen","group_code":"jt_1548139507","status":1},{"company_code":"gs_1548153426","name":"百度","en_name":"baidu","group_code":"jt_1548139507","status":0},{"company_code":"gs_98029314963931183","name":"京东啊","en_name":"jda","group_code":"jt_1548139507","status":0}],"market_info":[{"market_code":"mk_1548232033","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"第一个市场","currency_sign":"$","currency_name":"USD","sync_type":1,"charge_user_name":"更新","status":0},{"market_code":"mk_98029314963931185","group_code":"jt_1548139507","company_code":"gs_1548153426","market_name":"第一个市场","currency_sign":"$","currency_name":"USD","sync_type":1,"charge_user_name":"更新","status":1}],"contact_info":[{"contact_code":"ct_1548212016","user_name":"刘军","user_position":"PHP管理","user_phone":"18588209321","user_email":"939942478@qq.com","user_role":"Financial","group_code":"jt_1548139507","status":1},{"contact_code":"ct_98029314963931168","user_name":"刘林燕","user_position":"PHP研发","user_phone":"18588209325","user_email":"187@qq.com","user_role":"Charge","group_code":"jt_1548139507","status":1},{"contact_code":"ct_98029314963931169","user_name":"将林燕","user_position":"PHP经理","user_phone":"18588209326","user_email":"15@qq.com","user_role":"Charge","group_code":"jt_1548139507","status":1},{"contact_code":"ct_98029314963931170","user_name":"王艳梅","user_position":"PHP经理","user_phone":"18588209326","user_email":"15@qq.com","user_role":"Charge","group_code":"jt_1548139507","status":1},{"contact_code":"ct_98029314963931179","user_name":"王总","user_position":"项目经理","user_phone":"18680890919","user_email":"1874299065@qq.com","user_role":"Financial","group_code":"jt_1548139507","status":1}],"finance_info":{"finance_code":"cash_15483096291974","group_code":"jt_1548139507","sale_volume_id":1,"sale_volume":"10001","purhchase_volume_id":2,"purhchase_volume":"20002","cashflow_volume_id":3,"cashflow_volume":"30003","status":0},"extend_info":{"extend_code":"ex_1548311813","group_code":"jt_1548139507","subdomain":"newapi.master.com","logo":"1","group_email":"email.liuliny.com","status":1}},"error":""}
     * @param {"name":"f_code","type":"string","required":true,"desc":"管理的集团编码"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","desc":"返回的数据内容","level":1}
     * @return {"name":"err","type":"string","desc":"返回的错误信息","level":1}
     */
    public function detail()
    {
        $param = Request::instance()->param();
        $gorupCode = $param['code'];
        $groupModel = model('group');
        //集团自身的信息
        $data['group_info'] = $groupModel->get_data_by_code($gorupCode);
        //集团下的公司信息
        $companyModel = model('Company');
        $group_w['group_code'] = $gorupCode;
        $company_infos = $companyModel->getDataList($group_w);
        $data['company_info'] = $company_infos['list'];
        //查看集团下的所有市场信息
        $marketModel = model('Market');
        $market_infos = $marketModel->getDataList($group_w);
        $data['market_info'] = $market_infos['list'];
        //查看集团下的所有联系人信息
        $contactModel = model('Contact');
        $contact_infos = $contactModel->getDataList($group_w);
        $data['contact_info'] = $contact_infos['list'];
        //查看集团下的财务信息
        $financeModel = model('GroupFinance');
        $data['finance_info'] = $financeModel->get_data_by_groupcode($gorupCode);
        //查看集团下的扩展信息
        $extandModel = model('GroupExtend');
        $data['extend_info'] = $extandModel->get_data_by_groupcode($gorupCode);
        return resultArray(['data'=>$data]);
    }


    /**
     * @title 集团激活接口
     * @desc  {"0":"接口地址：http://api.master.com/group/active/jt_1548139507","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"code":200,"data":"集团激活成功","error":""}
     * @param {"name":"code","type":"string","required":true,"desc":"管理的集团编码"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","desc":"返回的数据内容","level":1}
     * @return {"name":"err","type":"string","desc":"返回的错误信息","level":1}
     */
    public function active()
    {
        $param = Request::instance()->param();
        $gorupCode = $param['code'];
        //首先查看该集团下是否有被市场授权的有效邮箱
        $authorizedModel = model('AuthorizedUser');
        $active_data = $authorizedModel->get_emails_by_group_code($gorupCode);

        //获取邮件模板
        $extendModel = model("GroupExtend");
        $extendData = $extendModel->get_data_by_groupcode($gorupCode);
        $content = '您的二级域名为：'.$extendData['subdomain']."<br/>域名邮箱为：".$extendData['group_email'];

        $temp_name = 'register_invite';
        $language = 'chinese';
        $temp_info = $extendModel->get_email_template($temp_name,$language);

        if(!empty($temp_info)){
            $subject = $temp_info['subject'];
            $body = $temp_info['content'];
        }else{
            return resultArray(['error' => '未找到邮件模板']);
        }
        $emailModel = new \app\common\library\Email;
        $send_mail_logs = array();
        foreach($active_data as $email_info)
        {
            $to_email = $email_info['user_email'];
            $content .= "<br/>用户名为：".$email_info['user_name'];

            //发送日志
            $tmp_data['template_code'] = $temp_info['id'];
            $tmp_data['from_email'] = Config::get('site.mail_from');
            $tmp_data['to_email'] = $to_email;
            $tmp_data['subject'] = $subject;
            $tmp_data['content'] = $content;
            $tmp_data['status'] = '0';
            $tmp_data['createtime'] = time();
            //调用发送邮件函数
            $send_mail_result = $emailModel->subject($subject)->to($to_email)->message($content)->send();
            if($send_mail_result){
                $tmp_data['status'] = '1';
            }
            array_push($send_mail_logs,$tmp_data);
        }
        if($extendModel->createLogs($send_mail_logs)){
            return resultArray(['data' => '集团激活成功']);
        }else{
            return resultArray(['error' => '邮件日志记录失败']);
        }
    }




    /****************************************  私有方法star  ****************************************/

    //下拉框所需数据(行业、国家、公司)
    private function _get_ict_data()
    {
        //行业基础数据列表
        $industryC = new Industry();
        $industrys = $industryC->index();
        $data['industrys'] = $industrys['data'];
        //国家基础数据列表
        $countryC = new Country();
        $countrys = $countryC->index();
        $data['countrys'] = $countrys['data'];
        //公司类型列表
        $typeC = new Basetype();
        $types = $typeC->index();
        $data['types'] = $types['data'];
        return $data;
    }

    //前端数据处理


}
 