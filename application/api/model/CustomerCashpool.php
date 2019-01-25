<?php
// +----------------------------------------------------------------------
// | Description: 买家管理
// +----------------------------------------------------------------------
// | Author: jamesliu <jiames@james@eb-cf.com>
// +----------------------------------------------------------------------

namespace app\api\model;

use think\Model;

class CustomerCashpool extends Model
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'customer_cashpool';

    /**
     * [getCashpoolList 获取分类单位个数]
     * @return    [array]                             [获取单位个数]
     */
	public function getCashpoolList()
    {
        $map = [];
        $map['GroupId'] = array('gt',0);

        $list = $this->field('GroupId,count(GroupId) NUM')->where($map)->group('GroupId')->having('NUM>0')->select();
        //echo $this->getLastSql();
        //返回结果
        return $list;
    }

    /**
     * @desc 更新市场信息
     * @param  array   $param  [description]
     * @param  int   $id  [description]
     */
    public function updateDataById($param,$id)
    {
        $checkData = $this->get($id);
        if (!$checkData) {
            $this->error = '暂无此数据';
            return false;
        }
        try {
            return $this->allowField(true)->save($param, ['Id' => $id]);
        } catch(\Exception $e) {
            $this->rollback();
            $this->error = '编辑失败';
            return false;
        }
    }

    /**
     * @title 获取CashpoolCode
     */
    public function getPoolCode()
    {
        $count = $this->field('count(id)+1 length')->find();
        $code = 'xxxx-'.$count['length'].'-xxx';
        return $code;
    }

    /**
     * 创建市场信息
     * @param  array   $param  [description]
     */
    public function createData($param)
    {
        try {
            $this->data($param)->allowField(true)->save();
            return true;
        } catch(\Exception $e) {
            $this->rollback();
            $this->error = $e->getMessage(); // '添加市场失败';
            return false;
        }
    }

    //获取唯一的uuid
    public function buildUUID()
    {
        $uuid = $this->field('UUID_SHORT() id')->find();
        return $uuid['id'];
    }

    //根据市场id获取市场信息
    public function getDataById($id)
    {
        $field = "CompanyId,CompanyDivision,CurrencySign,CurrencyName,UserId,ReconciliationDate,SyncVendorDate,";
        $field .= "SyncVendorType,SyncInvoiceDate,SyncInvoiceType,Memo,GroupId,Id";
        $map['Id'] = array('eq',$id);
        return $this->field($field)->where($map)->find();
    }

}