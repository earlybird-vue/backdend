<?php
// +----------------------------------------------------------------------
// | Description: 基础框架路由配置文件
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honghaiweb.com>
// +----------------------------------------------------------------------

return [
    // 定义资源路由
    '__rest__'=>[
        'index'		   =>'api/index',
        'customer'		   =>'api/customer',
    ],

	//  【基础】首页
	'index/index/' => ['api/index/index', ['method' => 'GET']],

    //  【买家】集团列表
    'customer/list' => ['api/customer/customer_list', ['method' => 'GET']],
    //  【买家】添加集团初始化数据
    'customer/addInit' => ['api/customer/add_customer_init',['method'=>'GET']],
    //  【买家】读取集团信息
    'customer/get' => ['api/customer/read',['method'=>'GET']],
    //  【买家】添加集团信息
    'customer/create' => ['api/customer/save_customer',['method'=>'POST']],
    //  【买家】更新集团信息
    'customer/update' => ['api/customer/save_customer',['method'=>'POST']],
    //  【买家】添加集团其他设置
    'customer/saveOther' => ['api/customer/save_other',['method'=>'POST']],


    //  【买家】读取市场信息

    //  【买家】添加市场信息

    //  【买家】更新市场信息


    //  【买家】【添加市场】获取清算负责人
    'market/getCharge' => ['api/market/get_charge',['method'=>'GET']],
    //  【买家】【添加/编辑市场】
    'market/save' => ['api/market/save',['method'=>'POST']],
    'market/getcash' => ['api/market/getcash',['method'=>'GET']],



    /**********  以下是ok的了  **********/
    //  【买家】读取公司信息
    //'company/get' => ['api/company/read',['method'=>'GET']],
    //  【买家】添加公司信息
    //  【买家】更新公司信息


    /**********  以下是最新的接口路由 **********/
    'group/list' => ['api/group/index',['method'=>'GET']],
    'group/get/:code' => ['api/group/read',['method'=>'GET']],
    'group/create' => ['api/group/save',['method'=>'POST']],
    'group/update' => ['api/group/update',['method'=>'POST']],
    'group/delete' => ['api/group/delete',['method'=>'POST']],
    'group/batchdelete' => ['api/group/deletes',['method'=>'POST']],
    'group/show/:code' => ['api/group/detail',['method'=>'GET']],
    'group/active/:code' => ['api/group/active',['method'=>'GET']],

    'mail/send' => ['api/emailHelper/sendEmail',['method'=>'POST']],


    'company/list/:code' => ['api/company/index',['method'=>'GET']],
    'company/get/:code' => ['api/company/read',['method'=>'GET']],
    'company/create' => ['api/company/save',['method'=>'POST']],
    'company/update' => ['api/company/update',['method'=>'POST']],
    'company/delete' => ['api/company/delete',['method'=>'POST']],
    'company/gettoken/:code' => ['api/company/gettoken',['method'=>'GET']],
    'company/flushkey/:code' => ['api/company/reflushk_key',['method'=>'GET']],




    'contact/list/:code' => ['api/contact/index',['method'=>'GET']],
    'contact/simplelist/:code' => ['api/contact/simple_list',['method'=>'GET']],
    'contact/get/:code' => ['api/contact/read',['method'=>'GET']],
    'contact/getCharge/:code' => ['api/contact/get_charge',['method'=>'GET']],
    'contact/create' => ['api/contact/save',['method'=>'POST']],
    'contact/update' => ['api/contact/update',['method'=>'POST']],
    'contact/delete' => ['api/contact/delete',['method'=>'POST']],

    'market/list/:code' => ['api/market/index',['method'=>'GET']],
    'market/get/:code' => ['api/market/read',['method'=>'GET']],
    'market/create' => ['api/market/save',['method'=>'POST']],
    'market/update' => ['api/market/update',['method'=>'POST']],
    'market/delete' => ['api/market/delete',['method'=>'POST']],

    'extend/get/:code' => ['api/extend/read',['method'=>'GET']],
    'extend/create' => ['api/extend/save',['method'=>'POST']],
    'extend/update' => ['api/extend/update',['method'=>'POST']],

    'finance/get/:code' => ['api/finance/read',['method'=>'GET']],
    'finance/create' => ['api/finance/save',['method'=>'POST']],
    'finance/update' => ['api/finance/update',['method'=>'POST']],


    'index/group'   =>  ['api/index/group',['method'=>'GET']],
    'index/company' =>  ['api/index/company',['method'=>'GET']],
    'index/contact' =>  ['api/index/contact',['method'=>'GET']],
    'index/market'  =>  ['api/index/market',['method'=>'GET']],
    'index/extend' => ['api/index/extend',['method'=>'GET']],
    'index/finance' => ['api/index/finance',['method'=>'GET']],
    'index/sync' => ['api/index/auto_sync',['method'=>'GET']],
    'index/mail' => ['api/index/sendmail',['method'=>'GET']],
    'index/mail' => ['api/index/sendmail',['method'=>'GET']],
    'index/order' => ['api/index/groupOrder',['method'=>'GET']],

    'authorize' => ['api/oAuth/authorize',['method'=>'POST']],
    'token' => ['api/oAuth/token',['method'=>'POST']],
    'resource' => ['api/oAuth/resource',['method'=>'GET']]
];