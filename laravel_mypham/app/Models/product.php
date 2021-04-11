<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class product extends Model
{
    protected $table = "products";

    public function ProductType()
    {
    	return $this -> belongsto('App\Models\ProductType','id_type','id');
    }
    public function bill_detail()
    {
    	return $this -> hasmany('App\Models\BillDetail','id_product','id');
    }
}
