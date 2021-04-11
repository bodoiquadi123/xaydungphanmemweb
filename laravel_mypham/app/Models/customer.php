<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class customer extends Model
{
    protected $table = "customer";

    public function bill()
    {
    	return $this -> hasmany('App\Models\bill','id_customer','id');
    }
}
