<?php
// +----------------------------------------------------------------------
// | Description: 买家管理
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class BaseCountry extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'base_country';

    /**
     * [getDataList 获取国家列表]
     * @return    [array]                             [description]
     */
	public function getDataList()
	{
        $data = $this->field('id,name')->select();
        //返回数组
        return json_decode(json_encode($data),true);
	}

}