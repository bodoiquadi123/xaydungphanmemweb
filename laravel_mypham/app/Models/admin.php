<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
class admin extends Authenticatable
{
	use Notifiable;
    protected $table = 'admin';
    protected $guard = 'admins';
}
