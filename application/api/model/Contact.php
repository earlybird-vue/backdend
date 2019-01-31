<?php
// +----------------------------------------------------------------------
// | Description: 集团联系人model
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class Contact extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如买家模块用oa作为数据表前缀
     */
    protected $name = 'group_user_info';

    /**
     * [getDataList 获取集团下的公司列表]
     * @param     [array]                    $w         [过滤条件]
     * @return    [array]                             [description]
     */
	public function getDataList($w=array())
	{
	    //定义搜索条件数组
        $map = [];
        if(isset($w['group_code']) && !empty($w['group_code'])){
            $map['group_code'] = array('eq',$w['group_code']);
        }
        $group = '';
        //如果是获取改集团下可用的联系人不同邮箱的话
        if(isset($w['is_distinct_email']) && $w['is_distinct_email'] ==1){
            $map['status'] = array('eq',1);
            $map['user_email'] = array('neq','');
            $group = 1;
        }
        $fields = "code contact_code,user_name,user_position,user_phone,user_email,";
        $fields .= "is_enterprise,is_financial,is_charge,group_code,status";
        //如果是获取清算负责人
        if(isset($w['user_role']) && $w['user_role']!="")
        {
            $map['status'] = array('eq',1);
            if($w['user_role'] == 'Charge')
            {
                $map['is_charge'] = array('eq',1);
            }
            $fields = "code contact_code,user_name";
        }
        //如果是筛选授权
        if($group){
            $data = $this->field("code user_code,user_email,user_name,user_phone")->where($map)->order('status desc')->select();
        }else{
            //获取满足条件的数据总数
            $dataCount = $this->where($map)->count();

            $list = $this->field($fields)->where($map)->order('status desc')->select();
            $data['list'] = $list;
            $data['data_count'] = $dataCount;
        }
        //echo $this->getLastSql();
        //返回数组
        return $data;
	}

    /**
     * 添加集团联系人信息
     * @param  array   $param  [入库信息数组]
     */
    public function createData($param)
    {
        try {
            //公司信息入库
            $this->insertAll($param);
            return true;
        } catch(\Exception $e) {
            $this->error = $e->getMessage();
            return false;
        }
    }

    /**
     * 通过code修改联系人信息
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
     * @desc 通过联系人编码获取联系人基础信息
     */
    public function get_data_by_code($contact_code)
    {
        $map['code'] = array('eq',$contact_code);
        $field = "code contact_code,last_name,first_name,user_name,user_position,user_phone,user_email,";
        $field .= "is_enterprise,is_financial,is_charge,group_code,status";
        return $this->field($field)->where($map)->find();
    }

    /**
     * @desc 通过联系人编码数组获取联系人基础信息
     */
    public function get_data_by_codes($contact_codes)
    {
        $map['code'] = array('in',$contact_codes);
        $field = "code contact_code,last_name,first_name,user_name,user_position,user_phone,user_email,";
        $field .= "is_enterprise,is_financial,is_charge,group_code,status";
        return $this->field($field)->where($map)->select();
    }

    /**
     * @desc 获取唯一的uuid
     */
    public function buildUUID()
    {
        $uuid = $this->field('UUID_SHORT() id')->find();
        if(empty($uuid)){
            return time().mt_rand(1000000,9999999);
        }else{
            return $uuid['id'];
        }
    }

    /**
     * @param $code string
     * @desc 根据编码改变公司信息
     * @return bool
     */
    public function del_data_by_code($code)
    {
        $map['code'] = array('eq',$code);
        return $this->where($map)->setField('status','0');
    }

}