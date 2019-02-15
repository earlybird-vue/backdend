<?php
// +----------------------------------------------------------------------
// | Description: 买家管理
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class Group extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如买家模块用oa作为数据表前缀
     */
    protected $name = 'group_info';

    /**
     * [getDataList 获取集团列表]
     * @param     [array]                    $w         [过滤条件]
     * @param     [number]                   $page     [当前页数]
     * @param     [number]                   $limit    [t每页数量]
     * @return    [array]                             [description]
     */
	public function getDataList($w=array(),$page=1, $limit=10)
	{
	    //定义搜索条件数组
        $map['group.status'] = array('eq', 1);
        if(!empty($w) && isset($w['status'])){
            $map['group.status'] = array('eq', $w['status']);
        }
        //获取满足条件的数据总数
        $dataCount = $this->alias('group')->where($map)->count();

        $list = $this
            ->alias('group')
            ->join('__BASE_INDUSTRY__ i', 'group.industry_id = i.id', 'LEFT')
            ->join('__BASE_COUNTRY__ ct', 'group.country_id = ct.id', 'LEFT')
            ->join('__BASE_TYPE__ t', 'group.type_id = t.id', 'LEFT');

        // 若有分页
        if ($page && $limit) {
            $list = $list->page($page, $limit);
        }

        $list = $list
                ->field('group.code,group.name,group.web_site,ct.name country_name,i.name industry_name,t.name type_name,0 num')
                ->where($map)->order('group.id desc')
                ->select();
        //echo $this->getLastSql();
        $data['list'] = $list;
        $data['data_count'] = $dataCount;
        //返回数组
        return $data;
	}

    /**
     * 添加集团信息
     * @param  array   $param  [入库信息数组]
     */
    public function createData($param)
    {
        $this->startTrans();
        try {
            //基础表信息入库
            $this->insert($param);
            $this->commit();
            return true;
        } catch(\Exception $e) {
            $this->rollback();
            $this->error =  $e->getMessage();//'集团信息添加失败';
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
     * @desc 通过编码获取集团基础信息
     */
    public function get_data_by_code($groupCode)
    {
        $map['code'] = array('eq',$groupCode);
        $field = "code,name,web_site,group_number,address,industry_id,";
        $field .= "country_id,type_id,contact_phone,fiscal_month,status";
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
        return 'GROUP_'.date('Ymd').'_'.$num;
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



    /**
     * @param $code string
     * @desc 根据编码改变集团信息
     * @return bool
     */
    public function del_data_by_code($code)
    {
        $map['code'] = array('eq',$code);
        return $this->where($map)->setField('status','0');
    }

    /**
     * @param $code array
     * @desc 根据编码数组批量改变集团信息
     * @return bool
     */
    public function del_data_by_codes($codes=array())
    {
        $map['code'] = array('in',$codes);
        return $this->where($map)->setField('status','0');
    }

}