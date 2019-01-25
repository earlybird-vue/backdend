<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/13 0013
 * Time: 下午 12:27
 */
return [
    'title' => "公司内部系统接口文档",
    'description' => 'master运营系统 | api接口文档。',
    'template' => 'apple', // 苹果绿:apple 葡萄紫:grape
    'class' => [
        'app\api\controller\Customer',
        'app\api\controller\Group',
        'app\api\controller\Company',
        'app\api\controller\Market',
        'app\api\controller\Contact',
        'app\api\controller\Extend',
        'app\api\controller\Finance'
        // ...
    ],
];