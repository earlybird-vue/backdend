<?php
// +----------------------------------------------------------------------
// | Description: 买家管理
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Db;
use think\Model;

class Customer extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'base_companys';

    /**
     * [getDataList 获取买家列表]
     * @param     [number]                   $page     [当前页数]
     * @param     [number]                   $limit    [t每页数量]
     * @return    [array]                             [description]
     */
	public function getDataList($page, $limit)
	{
	    //定义搜索条件数组
	    $map = array();
        $map['customer.ParentId'] = array('eq', 0);
        $map['customer.CompanyStatus'] = array('eq', 1);

        //获取满足条件的数据总数
        $dataCount = $this->alias('customer')->where($map)->count();

        $list = $this
            ->alias('customer')
            ->join('__BASE_INDUSTRY__ i', 'customer.IndustryId = i.id', 'LEFT')
            ->join('__BASE_COUNTRY__ ct', 'customer.CountryId = ct.id', 'LEFT')
            ->join('__BASE_TYPE__ t', 'customer.TypeId = t.id', 'LEFT');

        // 若有分页
        if ($page && $limit) {
            $list = $list->page($page, $limit);
        }

        $list = $list
                ->field('customer.Id,customer.CompanyName,customer.CompanyWebsite,ct.name Country,i.name Industry,t.name Ctype,0 NUM')
                ->where($map)->order('customer.Id DESC')
                ->select();
        //echo $this->getLastSql();
        $data['list'] = $list;
        $data['dataCount'] = $dataCount;

        //返回数组
        return $data;
	}

    /**
     * 添加集团信息
     * @param  array   $param  [description]
     */
    public function createData($param)
    {
        $this->startTrans();
        try {
            //基础表信息入库
            $this->insert($param['base_companys']);
            //联系信息表入库
            Db::name('customer_user')->insertAll($param['contact']);
            //额外信息入库
            Db::name('customer_extra')->insert($param['extra']);
            $this->commit();
            return true;
        } catch(\Exception $e) {
            $this->rollback();
            $this->error =  $e->getMessage();//'集团信息添加失败';
            return false;
        }
    }

    //获取唯一的uuid
    public function buildUUID()
    {
        $uuid = $this->field('UUID_SHORT() id')->find();
        return $uuid['id'];
    }

    /**
     * 添加/编辑集团信息所需要的初始化信息
     */
    public function getAllDatas($companyid=0)
    {
        $data = array();
        $data['industry'] = Db::name('base_industry')->field('id,name')->select();
        $data['country'] = Db::name('base_country')->field('id,name')->select();
        $data['type'] = Db::name('base_type')->field('id,name')->select();
        $map['volumetype'] = array('eq','cash');
        $data['ext'] = Db::name('base_volume')->field('Id,name')->where($map)->select();
        $data['cur'] = Db::name('base_currency')->field('CurrencySign as sign,CurrencyName as name')->select();
        if($companyid==0){
            return json_decode(json_encode($data),true);
        }else{
            //获取集团信息
            $company_w['Id'] = array('eq',$companyid);
            $data['group'] = $this->where($company_w)->find();
            //获取集团额外信息
            $extra_w['CompanyId'] =  array('eq',$companyid);
            $data['ext_value'] = Db::name('customer_extra')->where($extra_w)->find();
            //获取集团联系信息
            $data['contact'] = Db::name('customer_user')->where($extra_w)->select();
            //获取公司信息
            $company_w = [];
            $company_w['ParentId'] = array('eq',$companyid);
            $data['company'] =  $this->where($company_w)->select();
            //获取市场信息
            $market_w['b.ParentId'] = array('eq',$companyid);
            $market = $this
                ->alias('b')
                ->join('__CUSTOMER_CASHPOOL__ a', 'b.Id = a.CompanyId', 'LEFT')
                ->join('__CUSTOMER_USER__ u', 'a.UserId = u.Uid', 'LEFT')
                ->field("a.*")->where($market_w)->select();
            $data['market'] = $market;
            //获取清算负责人
            $data['charge'] = $this->get_charge_by_companyid($companyid);
            return json_decode(json_encode($data),true);
        }
    }

    /**
     * @desc 添加新公司
     */
    public function seva_company($data)
    {
        return  $this->insert($data);
    }
    /**
     * 通过id修改公司信息
     * @param  array   $param  [description]
     * @id      int
     * @return bool
     */
    public function updateDataById($param, $id)
    {
        $checkData = $this->get($id);
        if (!$checkData) {
            $this->error = '暂无此数据';
            return false;
        }
        try {
            $this->allowField(true)->save($param, ['Id' => $id]);
            return true;
        } catch(\Exception $e) {
            $this->rollback();
            $this->error = '编辑失败';
            return false;
        }
    }

    /**
     * @desc 获取公司清算负责人
     */
    public function get_charge_by_companyid($companyid)
    {
        $tmp_w = array();
        $tmp_w['UserRole'] = array('eq','Charge');
        $tmp_w['UserStatus'] = array('eq','1');
        $tmp_w['CompanyId'] = array('eq',$companyid);
        return Db::name('customer_user')->field('Uid,UserName')->where($tmp_w)->select();
    }

    public function getDataById($id)
    {
        $map['Id'] = array('eq',$id);
        return $this->field('Id id,CompanyName name,CompanyEnName enname')->where($map)->find();
    }

}