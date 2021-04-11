<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BillDetail extends Model
{
    protected $table = "bill_detail";


    public function bill()
    {
    	return $this -> belongsto('App\Models\bill','id_bill','id');
    }

    public function product()
    {
    	return $this -> belongsto('App\Models\product','id_product','id');
    }

}
