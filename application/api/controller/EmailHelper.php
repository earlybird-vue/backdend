<?php
// +----------------------------------------------------------------------
// | Description: 集团接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;
use  \think\Request;
use \think\config;
use app\common\library\Email;

/**
 * @title 邮件辅助类2.0
 * Class EmailHelper
 * @package app\api\controller
 */
class EmailHelper extends Baseapi
{

    /**
     * 邮件发送接口
     * @desc {"0":"接口地址：http://api.master.com/email/send","1":"请求方式：POST"}
     * @postBody {"0":{"app_code":"jt_1548139507","tpl_name":"register_invite","company_name":"腾讯科技有限公司","user_list":[{"id":"1","to_user":"939942478@qq.com","user_name": "张三"}]}}
     * @returnDemo {"0":{"code":200,"data":"邮件发送成功","error":""}}
     * @param {"name":"app_code","type":"string","required":true,"desc":"集团编码","level":1}
     * @param {"name":"tpl_name","type":"string","required":true,"desc":"邮件模板名称","level":1}
     * @param {"name":"company_name","type":"string","required":true,"desc":"公司名称","level":1}
     * @param {"name":"user_list","type":"array","required":true,"desc":"用户信息","level":1}
     * @param {"name":"id","type":"int","required":true,"desc":"用户编号","level":2}
     * @param {"name":"to_user","type":"string","required":true,"desc":"用户邮箱","level":2}
     * @param {"name":"user_name","type":"string","required":true,"desc":"用户名称","level":2}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","desc":"返回的数据内容","level":1}
     * @return {"name":"err","type":"string","desc":"返回的错误信息","level":1}
     */
    public function sendEmail()
    {
        $param = Request::instance()->param();

        $groupCode = $param['app_code'];
        if(!$groupCode){
            return resultArray(['error' => 'app_code不能为空']);
        }

        //获取发送主题的邮箱信息
        $extendModel = model('GroupExtend');
        $mail_info = $extendModel->get_data_by_groupcode($groupCode);
        //print_r(json_decode(json_encode($mail_info),true));die();

        if(empty($mail_info)){
            return resultArray(['error' => 'app_code'.$groupCode.'为能找到相关的邮件信息']);
        }else{
            $mail_info = json_decode(json_encode($mail_info),true);
        }
        //eg获取到的mail_info是array('group_email'=>'james@eb-cf.com','pwd'=>'Jlwe3400');
        $mail_info = array('group_email'=>'james@eb-cf.com','pwd'=>'JIwe3400');

        //获取邮件模板
        //eg:$param['tpl_name'];

        $tpl_name = $param['tpl_name'];
        $tpl_name = 'register_invite';
        $language = 'chinese';
        $temp_info = $extendModel->get_email_template($tpl_name,$language);

        if(!empty($temp_info)){
            $subject = $temp_info['subject'];
            $body = $temp_info['content'];
        }else{
            return resultArray(['error' => '未找到邮件模板']);
        }

        $mailconfig = array(
            'mail_smtp_user' => $mail_info['group_email'],
            'mail_from' => $mail_info['group_email'],
            'mail_smtp_host' => 'smtp.exmail.qq.com',
            'mail_smtp_port' => '465',
            'mail_verify_type' => '2',
            'mail_smtp_pass' => $mail_info['pwd']
        );
        //实例化邮件类
        $email = new Email($mailconfig);

        $user_info = $param['user_info'];
        //eg获取到的信息是{"company_name":"腾讯科技有限公司","user_list":[{"id":"1","to_user":"939942478@qq.com","user_name": "张三"}]}
        $user_info = json_decode('{"company_name":"腾讯科技有限公司","user_list":[{"id":"1","to_user":"939942478@qq.com","user_name": "张三"}]}',true);
        //如果是用户激活
        $send_mail_logs = array();
        if($tpl_name=='register_invite'){
            $company_name = $user_info['company_name'];
            $emails_info = $user_info['user_list'];
            foreach($emails_info as $obj)
            {
                $str = str_replace('{name}',$obj['user_name'],$body);
                $str = str_replace('{company_name}',$company_name,$str);
                $str = str_replace('{usdt}',$obj['id'],$str);
                //开始发送吧
                $res = $email->to($obj['to_user'])
                    ->subject("高效的企业运营资金无风险交易平台")
                    ->message($str)
                    ->send();

                $tmp_data = [];
                $tmp_data['template_code'] = $temp_info['id'];
                $tmp_data['from_email'] = $mail_info['group_email'];
                $tmp_data['to_email'] = $obj['to_user'];
                $tmp_data['subject'] = $subject;
                $tmp_data['content'] = $str;
                $tmp_data['status'] = '1';
                $tmp_data['createtime'] = time();
                if(!$res){
                    $tmp_data['status'] = '0';
                }
                array_push($send_mail_logs,$tmp_data);
            }
        }
        if($extendModel->createLogs($send_mail_logs)){
            return resultArray(['data' => '邮件发送成功']);
        }else{
            return resultArray(['error' => '邮件发送失败']);
        }
    }

}
 