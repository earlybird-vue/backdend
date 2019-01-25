<?php
// +----------------------------------------------------------------------
// | Description: 集团的扩展信息接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use \think\Debug;
use \think\Collection;
use  \think\Request;
use \app\api\controller\Baseapi;

/**
 * @title 集团扩展信息模块2.0
 * Class Contact
 * @package app\api\controller
 */
class Extend extends Baseapi
{

    /**
     * @title 获取集团扩展信息明细接口
     * @desc  {"0":"接口地址：http://api.master.com/extend/get/jt_1548139507","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"extend_code":"ex_1548296601","group_code":"jt_1548139507","subdomain":"newapi.master.com","logo":"http:\/\/kelacms.kela.cn\/images\/SEO\/jiezhi\/1.jpg","group_email":"email.liuliny.com","status":1},"error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"集团编码","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"extend_code","type":"string","desc":"扩展信息的唯一编码","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编码","level":2}
     * @return {"name":"subdomain","type":"string","desc":"二级域名","level":2}
     * @return {"name":"logo","type":"string","desc":"用户logo图","level":2}
     * @return {"name":"group_email","type":"string","desc":"授予集团的域名邮箱","level":2}
     * @return {"name":"status","type":"string","desc":"扩展信息的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function read()
    {
        $param = Request::instance()->param();
        //$param = $this->param;
        $group_code = $param['code'];
        $extendModel = model("GroupExtend");
        $returnData = $extendModel->get_data_by_groupcode($group_code);
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 新增集团扩展数据接口(添加扩展信息表单提交)
     * @desc  {"0":"接口地址：http://api.master.com/extend/create","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_subdomain":"newapi.master.com","f_group_code":"jt_1548139507","f_logo":"ttm","f_group_email":"email.liulinyan.com"}}
     * @returnDemo {"0":{"code":200,"data":{"extend_code":"ex_1548296601","group_code":"jt_1548139507","subdomain":"newapi.master.com","logo":"http:\/\/kelacms.kela.cn\/images\/SEO\/jiezhi\/1.jpg","group_email":"email.liuliny.com","status":1},"error":""}}
     * @param {"name":"f_subdomain","type":"string","required":true,"desc":"二级域名","level":1}
     * @param {"name":"f_group_code","type":"string","required":true,"desc":"集团的唯一编码","level":1}
     * @param {"name":"f_logo","type":"string","required":true,"desc":"用户使用的logo图","level":1}
     * @param {"name":"f_group_email","type":"string","required":true,"desc":"域名邮箱","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"extend_code","type":"string","desc":"扩展信息的唯一编码","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编码","level":2}
     * @return {"name":"subdomain","type":"string","desc":"二级域名","level":2}
     * @return {"name":"logo","type":"string","desc":"用户logo图","level":2}
     * @return {"name":"group_email","type":"string","desc":"授予集团的域名邮箱","level":2}
     * @return {"name":"status","type":"string","desc":"扩展信息的状态","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save()
    {
        $postData = Request::instance()->param();
        $data = self::_changeData($postData,1);
        $extendModel = model('GroupExtend');

        $returnData = $extendModel->get_data_by_groupcode($data['group_code']);
        if(!empty($returnData))
        {
            return resultArray(['error' => '该集团已经存在扩展信息,请直接编辑']);
        }
        $data['code'] = 'ex_'.$extendModel->buildUUID();
        $resData = $extendModel->createData($data);
        if (!$resData) {
            return resultArray(['error' => $extendModel->getError()]);
        }
        $returnData = $extendModel->get_data_by_groupcode($data['group_code']);
        return resultArray(['data' => $returnData]);
    }

    /**
     * @title 更新扩展信息(类似提交表单的目标接口)
     * @desc  {"0":"接口地址：http://api.master.com/extend/update","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"f_code":"ex_1548296601","f_subdomain":"newapi.master.com","f_group_code":"jt_1548139507","f_logo":"ttm","f_group_email":"email.liulinyan.com","f_status":"0"}}
     * @returnDemo {"0":{"code":200,"data":{"extend_code":"ex_1548296601","group_code":"jt_1548139507","subdomain":"newapi.master.com","logo":"http:\/\/kelacms.kela.cn\/images\/SEO\/jiezhi\/1.jpg","group_email":"email.liuliny.com","status":1},"error":""}}
     * @param {"name":"f_code","type":"string","required":true,"desc":"扩展信息的唯一编码","level":1}
     * @param {"name":"f_subdomain","type":"string","required":true,"desc":"二级域名","level":1}
     * @param {"name":"f_group_code","type":"string","required":true,"desc":"集团的唯一编码","level":1}
     * @param {"name":"f_logo","type":"string","required":true,"desc":"用户使用的logo图","level":1}
     * @param {"name":"f_group_email","type":"string","required":true,"desc":"域名邮箱","level":1}
     * @param {"name":"f_status","type":"string","required":true,"desc":"扩展信息的状态","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回的成功信息","level":1}
     * @return {"name":"extend_code","type":"string","desc":"扩展信息的唯一编码","level":2}
     * @return {"name":"group_code","type":"string","desc":"集团的唯一编码","level":2}
     * @return {"name":"subdomain","type":"string","desc":"二级域名","level":2}
     * @return {"name":"logo","type":"string","desc":"用户logo图","level":2}
     * @return {"name":"group_email","type":"string","desc":"授予集团的域名邮箱","level":2}
     * @return {"name":"status","type":"string","desc":"扩展信息的状态1有效,0无效","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function update()
    {
        $postData = Request::instance()->param();
        //$param = $this->param;
        $data = self::_changeData($postData);
        $extendModel = model('GroupExtend');
        $code = $data['code'];
        unset($data['code']);
        $resData = $extendModel->update_data_by_code($data,$code);
        if(!$resData){
            return resultArray(['error' => $extendModel->getError()]);
        }
        $data['extend_code'] = $code;
        return resultArray(['data' => $data]);
    }
}
 