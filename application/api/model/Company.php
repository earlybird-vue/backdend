<?php
// +----------------------------------------------------------------------
// | Description: 公司model
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class Company extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如买家模块用oa作为数据表前缀
     */
    protected $name = 'company_info';

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
        //获取满足条件的数据总数
        $dataCount = $this->where($map)->count();

        $list = $this->field('code company_code,name,en_name,group_code,status')->where($map)->order('status desc')->select();
        //echo $this->getLastSql();
        $data['list'] = $list;
        $data['data_count'] = $dataCount;
        //返回数组
        return $data;
	}

    /**
     * 添加公司信息
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
     * 通过code修改公司信息
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
     * @desc 通过公司编码获取公司基础信息
     */
    public function get_data_by_code($company_code)
    {
        $map['code'] = array('eq',$company_code);
        $field = "code company_code,name,en_name,group_code,status";
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

}