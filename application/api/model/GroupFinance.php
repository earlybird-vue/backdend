<?php
// +----------------------------------------------------------------------
// | Description: 集团财务信息model
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class GroupFinance extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如买家模块用oa作为数据表前缀
     */
    protected $name = 'group_finance_info';

    /**
     * 添加集团联系人信息
     * @param  array   $param  [入库信息数组]
     */
    public function createData($param)
    {
        try {
            //公司信息入库
            $this->insert($param);
            return true;
        } catch(\Exception $e) {
            $this->error = $e->getMessage();
            return false;
        }
    }

    /**
     * 通过code修改集团财务信息
     * @param  array   $param  [description]
     * @code   string
     * @return bool
     */
    public function update_data_by_code($param, $code)
    {
        $map['code'] = array('eq',$code);
        $checkData = $this->where($map)->find();
        if (!$checkData) {
            $this->error = '暂无此数据';
            return false;
        }
        try {
            $this->where($map)->update($param);
            return true;
        } catch(\Exception $e) {
            $this->error = '编辑失败';
            return false;
        }
    }

    /**
     * @desc 通过集团编码获取财务信息
     */
    public function get_data_by_groupcode($group_code)
    {
        $map['group_code'] = array('eq',$group_code);
        $field = "code finance_code,group_code,sale_volume_id,";
        $field .= "sale_volume,purhchase_volume_id,purhchase_volume,";
        $field .= "cashflow_volume_id,cashflow_volume,status";
        return $this->field($field)->where($map)->find();
    }

    /**
     * @desc 通过编码获取财务信息
     */
    public function get_data_by_code($code)
    {
        $map['code'] = array('eq',$code);
        $field = "code finance_code,group_code,sale_volume_id,";
        $field .= "sale_volume,purhchase_volume_id,purhchase_volume,";
        $field .= "cashflow_volume_id,cashflow_volume,status";
        return $this->field($field)->where($map)->find();
    }

    /**
     * @desc 获取唯一的uuid
     */
    public function buildUUID()
    {
        $num = $this->get_day_num();
        if($num<10){
            $num = '0'.$num;
        }
        return 'FINANCE_'.date('Ymd').'_'.$num;
    }

    /**
     * @desc 获取当天添加的序号
     */
    public function get_day_num()
    {
        $w['substring(create_time,1,10)'] = array('eq',date('Y-m-d'));
        $data = $this->field('count(*) count')->where($w)->find()->toArray();
        return $data['count']+1;
    }
}