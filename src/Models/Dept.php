<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dept extends Model
{
    protected $connection = "person";
    protected $table = "depart";

    public function order()
    {
        return $this->hasMany(Order::class, 'depart_id', 'order_dept');
    }
}