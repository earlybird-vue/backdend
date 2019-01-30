<?php
// +----------------------------------------------------------------------
// | Description: 市场授权同步的财务账套信息model
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class AuthorizedBook extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'market_authorized_book';

    /**
     * [getDataList 获取需要授权的市场列表]
     * @param     [array]                    $w         [过滤条件]
     * @return    [array]                             [description]
     */
    public function get_data_by_groupcode($groupcode)
    {

    }


    public function get_auto_authorized_list($w=array())
    {
        //定义搜索条件数组
        //市场的状态为正常
        $map['market.status'] = array('eq','0');
        //市场的数据同步更新方式为自动
        $map['market.sync_type'] = array('eq','1');
        //数据同步的授权状态是正常
        $map['book.status'] = array('eq','1');
        $field = "market.code market_code";
        $list = $this->alias('book')
                ->join('__MARKET_INFO__ market', 'book.market_code = market.code', 'LEFT')
                ->field($field)->where($map)->select();
        echo $this->getLastSql();
        return $list;
    }

    /**
     * [getDataList 获取集团下的授权emails列表供激活用]
     * @param     [array]                    $w         [过滤条件]
     * @return    [array]                             [description]
     */
    public function get_emails_by_group_code($group_code)
    {
        //定义搜索条件数组
        $map = [];

        $map['market.group_code'] = array('eq',$group_code);
        $map['market.status'] = array('eq',0);

        $map['authorized.status'] = array('eq',1);
        $field = "market.code market_code,market.company_code,market.group_code,market.market_name,";
        $field .= "user.user_name,user.user_email,user.user_phone,";
        $field .= "authorized.user_code,authorized.code authorized_code,authorized.status authorized_status";
        $list = $this
            ->alias('authorized')
            ->join('__MARKET_INFO__ market', 'authorized.market_code = market.code', 'LEFT')
            ->join('__GROUP_USER_INFO__ user','authorized.user_code = user.code','LEFT')
            ->field($field)->where($map)->select();
        return  json_decode(json_encode($list),true);
    }


    /**
     * @desc 获取唯一的uuid
     */
    public function buildUUID()
    {
        $uuid = $this->field('UUID_SHORT() id')->find();
        if(empty($uuid)){
            return time().mt_rand(1,9999);
        }else{
            return $uuid['id'];
        }
    }

    /**
     * @param $datas array
     * @desc 批量录入市场授权email信息
     */
    public function batch_create_data($datas)
    {
        return $this->saveAll($datas);
    }

}