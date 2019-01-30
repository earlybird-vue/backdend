<?php
// +----------------------------------------------------------------------
// | Description: 公司授权同步的密钥信息model
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class CompanyKey extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'company_secrekey_info';

    /**
     * @desc [get_data_by_companyCode 获取公司的的授权信息]
     * @param  $company_code string
     * @return array
     */
    public function get_data_by_companyCode($company_code)
    {
        //定义搜索条件数组
        $map['company_code'] = array('eq',$company_code);
        $field = 'app_id,app_secret,api_uri';
        $list = $this->field($field)->where($map)->find();
        $list = json_decode(json_encode($list),true);
        return $list;
    }

    /**
     * @param $param array
     * @desc 录入公司授权密钥信息
     * @return bool
     */
    public function createData($param)
    {
        try {
            //信息入库
            $this->insert($param);
            return true;
        } catch(\Exception $e) {
            $this->error =  $e->getMessage();
            return false;
        }
    }

    /**
     * @param $companycode string
     * @param $secret string
     * @desc 更新公司的secret
     * @return bool
     */
    public function update_secret($companycode,$secret)
    {
        $map['company_code'] = $companycode;
        return $this->where($map)->setField('app_secret',$secret);
    }

}