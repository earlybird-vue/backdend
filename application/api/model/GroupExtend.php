<?php
// +----------------------------------------------------------------------
// | Description: 集团扩展信息model
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class GroupExtend extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如买家模块用oa作为数据表前缀
     */
    protected $name = 'group_extend_info';

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
        $fields = "code extend_code,group_code,subdomain,logo,group_email,status";
        return  $this->field($fields)->where($map)->find();
	}

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
     * 通过code修改扩展信息
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
     * @desc 通过集团编码获取扩展信息
     */
    public function get_data_by_groupcode($group_code)
    {
        $map['group_code'] = array('eq',$group_code);
        $field = "code extend_code,group_code,subdomain,logo,group_email,status";
        return $this->field($field)->where($map)->find();
    }

    /**
     * @desc 获取唯一的uuid
     */
    public function buildUUID()
    {
        $uuid = $this->field('UUID_SHORT() id')->find();
        if(empty($uuid)){
            return time();
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

    /**
     * @param $name string
     * @param $language string
     * @desc 拿取模板的内容
     * @return array
     */
    public function get_email_template($name,$language)
    {
        $map['name'] = array('eq',$name);
        $map['language'] = array('eq',$language);
        $map['status'] = array('eq','normal');
        return Db::connect('db_self_manage')->table('oa_email_templates')->where($map)->find();
    }

    public function createLogs($param)
    {
        return Db::connect('db_self_manage')->table('oa_email_logs')->insertAll($param);
    }

}