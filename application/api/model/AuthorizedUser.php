<?php
// +----------------------------------------------------------------------
// | Description: 市场授权model
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class AuthorizedUser extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'market_authorized_user';

    /**
     * [getDataList 获取市场下的授权emails列表]
     * @param     [array]                    $w         [过滤条件]
     * @return    [array]                             [description]
     */
    public function getDataList($w=array())
    {
        //定义搜索条件数组
        $map = [];
        if(isset($w['market_code']) && !empty($w['market_code'])){
            $map['market_code'] = array('eq',$w['market_code']);
        }

        //如果需要过滤状态
        if(isset($w['status'])){
            $map['status'] = array('eq',(int)$w['status']);
        }
        return  $this->field('user_code')->where($map)->select();
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
            return time().mt_rand(1000000,9999999);
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