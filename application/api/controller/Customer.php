<?php
// +----------------------------------------------------------------------
// | Description: 接口模块
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use app\api\model\BaseVolume;
use \think\Debug;
use \think\Collection;
use  \think\Request;
use \app\admin\controller\ApiCommon;

//引入行业基础数据类
use \app\api\controller\Industry;
//引入国家基础数据类
use \app\api\controller\Country;
//引入公司类型数据类
use \app\api\controller\Basetype;
//引入公司额外信息数据类
use \app\api\controller\Volume;
//引入公司货币信息数据类
use \app\api\controller\Currency;
//引入图片上传类
use \app\admin\controller\Upload;

/**
 * @title 买家集团模块
 * Class Customer
 * @package app\api\controller
 */
class Customer
{

    /**
     * @title 获取买家列表
     * @desc  {"0":"请求方式：GET","1":"请求地址：http://api.master.com/customer/list/page/1/size/10","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"list":[{"Id":"98019142233227639","CompanyName":"lly测试","CompanyWebsite":"暂无","Country":null,"Industry":null,"Ctype":null,"NUM":0},{"Id":"98019142233227630","CompanyName":"ces.com","CompanyWebsite":"www.baidu.com","Country":"American Samoa","Industry":"精密器件生产型","Ctype":"大型国企","NUM":0}],"dataCount":33},"error":""}}
     * @param {"name":"page","type":"int","required":false,"default":"1","desc":"页数"}
     * @param {"name":"size","type":"int","required":false,"default":10,"desc":"每页显示条数，默认为10"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","desc":"返回数据内容","level":1}
     * @return {"name":"list","type":"array","desc":"买家列表数据","level":2}
     * @return {"name":"id","type":"bigint","desc":"编号","level":3}
     * @return {"name":"CompanyName","type":"string","desc":"公司名称'","level":3}
     * @return {"name":"CompanyWebsite","type":"string","desc":"公司网站'","level":3}
     * @return {"name":"Country","type":"string","desc":"国家","level":3}
     * @return {"name":"Industry","type":"string","desc":"行业","level":3}
     * @return {"name":"Ctype","type":"string","desc":"类型","level":3}
     * @return {"name":"NUM","type":"int","desc":"市场个数","level":3}
     * @return {"name":"dataCount","type":"int","required":true,"desc":"买家总数","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */

    public function customer_list()
    {
        $customerModel = model('Customer');
        //$param = $this->param;
        $param = Request::instance()->param();
        $page = !empty($param['page']) ? $param['page']: '1';
        $limit = !empty($param['size']) ? $param['size']: '10';
        $data = $customerModel->getDataList($page, $limit);

        //处理返回的数据
        $data = json_decode(json_encode($data),true);
        $dataArray = $data['list'];
        $newdata = array_column($dataArray,NULL,'Id');

        //获取单位统计
        $cashpoolModel = model('CustomerCashpool');
        $cashData = $cashpoolModel->getCashpoolList();
        $cashData = json_decode(json_encode($cashData),true);
        $units = array_column($cashData,NULL,'GroupId');

        //采用闭包去除GroupID字段
        $newUnits = array_map(function($item){
            unset($item['GroupId']);
            return  $item;
        },$units);

        //循环改变数组的NUM值
        foreach($newdata as $k => &$obj) {
            if(isset($newUnits[$k])){
                $obj['NUM'] = $newUnits[$k]['NUM'];
            }
        }

        //重新填充list的数据
        $data['list'] = array_values($newdata);

        return resultArray(['data' => $data]);
    }

    /**
     * @title 添加集团初始化数据接口
     * @desc  {"0":"接口地址：http://api.master.com/customer/addInit","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @returnDemo {"0":{"code":200,"data":{"industry":[{"id":1,"name": "快速消费型"},{"id":2,"name":"设备生产型"}],"country":[{"id":1,"name":"Afghanistan"},{"id":2,"name":"Albania"}],"type":[{"id": 1,"name": "股份制企业"},{"id": 2,"name": "上市公司"}],"ext": [{"Id": 1,"name": "1000万以内"},{"Id": 2,"name": "1000~5000万"}],"cur": [{"sign": "￥","name": "RMB"},{"sign": "$","name": "USD"}]},"error":""}}
     * @param {"name":"NULL","type":"NULL","required":false,"desc":"不需要传参数"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回数据内容","level":1}
     * @return {"name":"industry","type":"array","required":true,"desc":"行业基础数据列表","level":2}
     * @return {"name":"id","type":"int","required":true,"desc":"行业编号","level":3}
     * @return {"name":"name","type":"string","required":true,"desc":"行业名称","level":3}
     * @return {"name":"country","type":"array","required":true,"desc":"国家基础数据列表","level":2}
     * @return {"name":"id","type":"int","required":true,"desc":"国家编号","level":3}
     * @return {"name":"name","type":"string","required":true,"desc":"国家名称","level":3}
     * @return {"name":"type","type":"array","required":true,"desc":"公司类型列表","level":2}
     * @return {"name":"id","type":"int","required":true,"desc":"类型编号","level":3}
     * @return {"name":"name","type":"string","required":true,"desc":"类型名称","level":3}
     * @return {"name":"ext","type":"array","required":true,"desc":"额外基础数据列表","level":2}
     * @return {"name":"id","type":"int","required":true,"desc":"额外信息编号","level":3}
     * @return {"name":"name","type":"string","required":true,"desc":"额外信息名称","level":3}
     * @return {"name":"cur","type":"array","required":true,"desc":"币别信息数据列表","level":2}
     * @return {"name":"sign","type":"int","required":true,"desc":"币别标识符","level":3}
     * @return {"name":"name","type":"string","required":true,"desc":"币别标识名称","level":3}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function add_customer_init()
    {
        $marketModel = model('Customer');
        $data = $marketModel->getAllDatas();
        return resultArray(['data' => $data]);
        //return view('market');
    }

    /**
     * @title 接收集团数据接口(添加、编辑集团表单提交)
     * @desc {"0":"接口地址：http://api.master.com/customer/save","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"contact":[{"h5id":1547431853000,"firstname":"刘","lastname":"名","title":"工程师","phone":"18588209302","email":"994233@qq.com","role":"Enterprise","status":1},{"h5id":1547431909000,"firstname":"fas","lastname":"dsdfd","title":"fdsf","phone":"18588209039","email":"839432@qq.com","role":"Financial","status":1},{"h5id":1547431931000,"firstname":"ewrew","lastname":"rwerw","title":"re","phone":"18690980918","email":"3243242@qq.com","role":"Charge","status":1}],"division":"bianhao","name":"ces.com","site":"www.baidu.com","trade":"3","country":"4","phone":"zongji","address":"dizhi","type":"3","endtime":"3","other1":"15554441","other2":"2222222","other3":"6222221","scope1":"2","scope2":"1","scope3":"3"}}
     * @returnDemo {"0":{"code":200,"data":{"companyId":25915147281236067,"companyName":"ces.com"},"error":""}}
     * @param {"name":"contact","type":"array","required":true,"desc":"联系信息","level":1}
     * @param {"name":"h5id","type":"int","required":false,"desc":"编号","level":2}
     * @param {"name":"firstname","type":"string","required":true,"desc":"姓","level":2}
     * @param {"name":"lastname","type":"string","required":true,"desc":"名","level":2}
     * @param {"name":"title","type":"string","required":true,"desc":"职位","level":2}
     * @param {"name":"phone","type":"string","required":true,"desc":"电话","level":2}
     * @param {"name":"email","type":"string","required":true,"desc":"邮箱","level":2}
     * @param {"name":"role","type":"string","required":true,"desc":"角色","level":2}
     * @param {"name":"status","type":"int","required":false,"desc":"状态","level":2}
     * @param {"name":"division","type":"string","required":true,"desc":"集团编号","level":1}
     * @param {"name":"name","type":"string","required":true,"desc":"集团名称","level":1}
     * @param {"name":"site","type":"string","required":true,"desc":"集团网站","level":1}
     * @param {"name":"trade","type":"int","required":true,"desc":"集团所属行业","level":1}
     * @param {"name":"country","type":"int","required":true,"desc":"集团所属国家","level":1}
     * @param {"name":"phone","type":"string","required":true,"desc":"集团总机","level":1}
     * @param {"name":"address","type":"string","required":true,"desc":"集团地址","level":1}
     * @param {"name":"type","type":"int","required":true,"desc":"集团类型","level":1}
     * @param {"name":"endtime","type":"int","required":true,"desc":"财年截至时间","level":1}
     * @param {"name":"other1","type":"string","required":true,"desc":"年销售额范围","level":1}
     * @param {"name":"other2","type":"string","required":true,"desc":"年采购额","level":1}
     * @param {"name":"other3","type":"string","required":true,"desc":"资金流状况","level":1}
     * @param {"name":"scope1","type":"int","required":true,"desc":"年销售额范围ID","level":1}
     * @param {"name":"scope2","type":"int","required":true,"desc":"年采购额范围ID","level":1}
     * @param {"name":"scope3","type":"int","required":true,"desc":"资金流范围ID","level":1}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"string","required":true,"desc":"返回的成功信息(待沟通)","level":1}
     * @return {"name":"companyId","type":"bigint","desc":"集团编号","level":2}
     * @return {"name":"companyName","type":"string","desc":"集团名称","level":2}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save_customer()
    {
        $postData = Request::instance()->param();
        //return resultArray(['data'=>$postData]);die();
        //print_r($postData);
        //$postData = '{"contact":[{"h5id":1547431853000,"firstname":"刘","lastname":"名","title":"工程师","phone":"18588209302","email":"994233@qq.com","role":"Enterprise","status":1},{"h5id":1547431909000,"firstname":"fas","lastname":"dsdfd","title":"fdsf","phone":"18588209039","email":"839432@qq.com","role":"Financial","status":1},{"h5id":1547431931000,"firstname":"ewrew","lastname":"rwerw","title":"re","phone":"18690980918","email":"3243242@qq.com","role":"Charge","status":1}],"division":"bianhao","name":"ces.com","site":"www.baidu.com","trade":"3","country":"4","phone":"zongji","address":"dizhi","type":"3","endtime":"3","other1":"15554441","other2":"2222222","other3":"6222221","scope1":"2","scope2":"1","scope3":"3"}';
        //file_put_contents('aa.txt',$postData);
        $marketModel = model('Customer');
        //数据拼装
        //基础信息
        $baseCompanysData = $this->combine_company_data($postData);
        //联系信息
        $contactData = $this->new_combine_contact_data($baseCompanysData['Id'],$postData['contact']);
        //额外信息
        $extraData = $this->combine_extra_data($baseCompanysData['Id'],$postData);
        $param = array();
        $param['base_companys'] = $baseCompanysData;
        $param['contact'] = $contactData;
        $param['extra'] = $extraData;
        if ( !isset($postData['id']) ) {
            $data = $marketModel->createData($param);
        }else{
            //$data = $this->updateCompany($company);
        }
        if (!$data) {
            return resultArray(['error' => $marketModel->getError()]);
        }
        //如果成功则返回集团的id
        $return_data = array('companyId'=>$baseCompanysData['Id'],'companyName'=>$baseCompanysData['CompanyName']);
        return resultArray(['data' => $return_data]);
    }

    /**
     * @title 读取单个集团数据接口
     * @desc {"0":"接口地址：http://api.master.com/customer/get/id/98019142233227706","1":"请求方式：GET","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @postBody {"0":{"id":"98019142233227706"}}
     */
    public function read()
    {
        $param = Request::instance()->param();
        $companyId = $param['id'];
        //$companyId = '98019142233227706';
        $marketModel = model('Customer');
        $data = $marketModel->getAllDatas($companyId);

        //对集团联系信息进行处理 使之成为box1、box2、box3
        //$data['contact'] = $this->change_contact_box($data['contact']);
        return resultArray(['data' => $data]);
    }

    /**
     * @title 接收其他设置数据接口(类似提交表单的目标接口)
     * @desc  {"0":"接口地址：http://api.master.com/customer/saveOther","1":"请求方式：POST","2":"接口备注：必须传入keys值用于通过加密验证"}
     * @param {"name":"user","type":"string","required":true,"desc":"账号"}
     * @param {"name":"pass","type":"string","required":true,"desc":"密码"}
     * @param {"name":"file","type":"file","required":false,"desc":"logo"}
     * @return {"name":"code","type":"int","required":true,"desc":"返回码：200成功,其他失败","level":1}
     * @return {"name":"data","type":"array","required":true,"desc":"返回数据(待定)","level":1}
     * @return {"name":"err","type":"string","required":true,"desc":"返回的错误信息","level":1}
     */
    public function save_other()
    {
        $uploadModel = new Upload();
        $uploadInfo = $uploadModel->index();
        //print_r($uploadInfo);
        //Array ( [code] => 200 [data] => uploads\20190115\12ffdd4581ce3c6704ad411b0843f878.png [error] => )
        //Array ( [code] => 400 [data] => [error] => 上传文件后缀不允许 )
        if($uploadInfo['error'] != '' && empty($uploadInfo['data']))
        {
            return resultArray(['error' => $uploadInfo['error']]);
        }
        //给logo赋值
        $data['logo'] = $uploadInfo['data'];
        $param = Request::instance()->param();
        $data['user'] = $param['user'];
        $data['pass'] = $param['pass'];
        //接下来进行入库操作了,这个要看看到时候保存到哪里了
        return resultArray(['data' => $data]);
    }


    /****************************************  私有方法star  ****************************************/
    private function combine_company_data($postData){
        //基础信息数据组装
        $unhaving = '暂无';
        $create_user = 'customer';//$this->getCreateUser();

        $id = $this->buildUUID();

        $baseCompanyData = array(
            'CompanyCode' => $postData['division'],
            'Id' => $id,
            'CreateUser' => $create_user,
            'CompanyName' => $postData['name'],
            'CompanyEnName' => $postData['name'],
            'CompanyWebsite' => $postData['site'],
            'CompanyAddress' => $postData['address'],
            'CompanyAddress' => $postData['address'],
            'IndustryId' => $postData['trade'],
            'CountryId' => $postData['country'],
            'TypeId' => $postData['type'],
            'FiscalMonth' => $postData['endtime'],
            'ContactPerson' => $unhaving,
            'ContactEmail' => $unhaving,
            'ContactPhone' => $postData['phone'],
            'CompanyInfo' => $unhaving,
            'ParentId' => 0
        );
        return $baseCompanyData;
    }

    //联系信息拼装
    private function combine_contact_data($base_company_id,$contact_data)
    {
        $roles = array(
            'box1' => 'Enterprise',
            'box2' => 'Financial',
            'box3' => 'Charge'
        );
        $create_user = 'customer';
        $contactDatas = array();
        foreach($contact_data as $k => $boxinfo) {
            foreach($boxinfo as $obj)
            {
                $tempData = array();
                $tempData['Uid'] = $this->buildUUID();
                $tempData['CreateUser'] = $create_user;
                $tempData['CompanyId'] = $base_company_id;
                $tempData['UserName'] = $obj['firstname'].' '.$obj['lastname'];
                $tempData['FirstName'] = $obj['firstname'];
                $tempData['LastName'] = $obj['lastname'];
                $tempData['UserRole'] = $roles[$k];
                $tempData['UserEmail'] = $obj['email'];
                $tempData['UserContact'] = $obj['phone'];
                $tempData['UserPosition'] = $obj['title'];
                array_push($contactDatas, $tempData);
            }
        }
        return $contactDatas;
    }

    //联系信息拼装
    private function new_combine_contact_data($base_company_id,$contact_data)
    {
        $create_user = 'customer';
        $contactDatas = array();
        foreach($contact_data as $k => $obj) {
            $tempData = array();
            $tempData['Uid'] = $this->buildUUID();
            $tempData['CreateUser'] = $create_user;
            $tempData['CompanyId'] = $base_company_id;
            $tempData['UserName'] = $obj['firstname'].' '.$obj['lastname'];
            $tempData['FirstName'] = $obj['firstname'];
            $tempData['LastName'] = $obj['lastname'];
            $tempData['UserRole'] = $obj['role'];
            $tempData['UserEmail'] = $obj['email'];
            $tempData['UserContact'] = $obj['phone'];
            $tempData['UserPosition'] = $obj['title'];
            array_push($contactDatas, $tempData);
            unset($contact_data[$k]);
        }
        return $contactDatas;
    }

    //额外信息拼装
    private function combine_extra_data($base_company_id,$postData)
    {
        $create_user = 'customer';
        $ext_id = $this->buildUUID();
        $extraData = array(
            'Id' => $ext_id,
            'CreateUser' => $create_user,
            'CompanyId' => $base_company_id,
            'SaleVolumeId' => $postData['scope1'],
            'SaleVolume' => $postData['other1'],
            'PurhchaseVolumeId' => $postData['scope2'],
            'PurhchaseVolume' => $postData['other2'],
            'CashflowVolumeId' => $postData['scope3'],
            'CashflowVolume' => $postData['other3']
        );
        return $extraData;
    }

    private function buildUUID()
    {
        $customerModel = model('Customer');
        $uuid = $customerModel->buildUUID();
        return $uuid;
    }

    /**
     * @param $data
     * @return array
     */
    private function change_contact_box($data){
        $contact= array(
            'box1'=>array(),
            'box2'=>array(),
            'box3'=>array(),
        );
        foreach($data as $item){
            if($item['UserRole'] == 'Enterprise'){
                array_push($contact['box1'],$item);
            }elseif($item['UserRole'] == 'Financial'){
                array_push($contact['box2'],$item);
            }elseif($item['UserRole'] == 'Charge'){
                array_push($contact['box3'],$item);
            }
        }
        return $contact;
    }

    /****************************************  私有方法end  ****************************************/



}
 