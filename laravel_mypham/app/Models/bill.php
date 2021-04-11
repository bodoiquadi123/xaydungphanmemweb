<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class bill extends Model
{
	protected $table = "bills";

	public function BillDetail()
    {
    	return $this -> hasmany('App\Models\BillDetail','id_bill','id');
    }

    public function customer()
    {
    	return $this -> belongsto('App\Models\customer','id_customer','id');
    }
}
