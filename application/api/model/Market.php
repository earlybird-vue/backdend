<?php
// +----------------------------------------------------------------------
// | Description: 市场model
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class Market extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'market_info';

    /**
     * [getDataList 获取集团/公司下的市场列表]
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

        //如果是获取某个公司下的市场信息
        if(isset($w['company_code']) && !empty($w['company_code'])){
            $map['company_code'] = array('eq',$w['company_code']);
        }

        //如果需要过滤状态
        if(isset($w['status'])){
            $map['status'] = array('eq',(int)$w['status']);
        }

        //获取满足条件的数据总数
        $data['data_count'] = $this->where($map)->count();

        $fields = "code market_code,group_code,company_code,market_name,currency_sign,currency_name,";
        $fields .= "sync_type,charge_user_name,status";
        $data['list'] = $this->field($fields)->where($map)->order('status asc')->select();
        //echo $this->getLastSql();
        //返回数组
        return $data;
    }

    /**
     * @param $param array
     * @desc 添加市场信息
     * @return  bool
     */
    public function createData($param)
    {
        $this->startTrans();
        try {
            //授权邮箱信息
            $authorized_data = $param['authorized_user_code'];
            unset($param['authorized_user_code']);
            //市场基础表信息入库
            $this->insertAll($param);
            //授权邮箱信息表入库
            if(!empty($authorized_data)){
                Db::name('market_authorized_user')->insertAll($authorized_data);
            }
            $this->commit();
            return true;
        } catch(\Exception $e) {
            $this->rollback();
            $this->error =  $e->getMessage();//'集团信息添加失败';
            return false;
        }
    }

    /**
     * @desc 通过联系人编码获取市场基础信息
     */
    public function get_data_by_code($market_code)
    {
        $map['code'] = array('eq',$market_code);
        $field = "code market_code,group_code,company_code,market_name,currency_sign,currency_name,";
        $field .= "sync_type,memo,charge_user_code,charge_user_name,status";
        return $this->field($field)->where($map)->find();
    }

    /**
     * @desc 通过联系人编码获取市场基础信息
     */
    public function get_data_by_codes($market_codes)
    {
        $map['code'] = array('in',$market_codes);
        $field = "code market_code,group_code,company_code,market_name,currency_sign,currency_name,";
        $field .= "sync_type,memo,charge_user_code,charge_user_name,status";
        return $this->field($field)->where($map)->select();
    }

    /**
     * @param $param array
     * @param $market_code string
     * @desc 通过市场编码更新信息
     */
    public function update_data_by_code($param,$market_code)
    {
        $this->startTrans();
        try {
            $map['market_code'] = $market_code;
            //第一步看是否取消邮箱授权
            if($param['delete_all_users']){
                Db::name('market_authorized_user')->where($map)->setField('status','0');
            }else{
                //如果存在取消授权的并且不为空
                if(isset($param['delete_users']) && !empty($param['delete_users'])){
                    $map['user_code'] = array('in',$param['delete_users']);
                    Db::name('market_authorized_user')->where($map)->setField('status','0');
                    unset($param['delete_users']);
                }
                if(isset($param['active_users']) && !empty($param['active_users'])){
                    $map['user_code'] = array('in',$param['active_users']);
                    Db::name('market_authorized_user')->where($map)->setField('status','1');
                    unset($param['active_users']);
                }
                if(isset($param['insert_users']) && !empty($param['insert_users'])){
                    Db::name('market_authorized_user')->insertAll($param['insert_users']);
                    unset($param['insert_users']);
                }
            }
            $market_w['code'] = $market_code;
            unset($param['delete_all_users']);
            $this->where($market_w)->update($param);
            $this->commit();
            return true;
        } catch(\Exception $e) {
            $this->rollback();
            $this->error =  $e->getMessage();//'集团信息添加失败';
            return false;
        }
    }

    /**
     * @desc 通过市场编码删除市场信息
     */
    public function del_data_by_code($code)
    {
        $this->startTrans();
        try {
            //取消市场的所有授权邮箱
            $authorized_w['market_code'] = $code;
            Db::name('market_authorized_user')->where($authorized_w)->setField('status','0');
            //让市场状态失效 0: 正常，活跃; 1: 不活跃
            $map['code'] = $code;
            $this->where($map)->setField('status',1);
            $this->commit();
            return true;
        } catch(\Exception $e) {
            $this->rollback();
            $this->error =  $e->getMessage();//'市场信息删除失败';
            return false;
        }
    }

    /**
     * @desc 获取唯一的uuid
     */
    public function buildUUID()
    {
        return 'MARKET_'.date('Ymd').'_';
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