<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Person extends Model
{
    protected $connection = "person";
    protected $table = "personal";

    public function order()
    {
        return $this->hasMany(Order::class, 'person_id', 'order_by');
    }
}