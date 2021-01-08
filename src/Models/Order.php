<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = "orders";

    public function orderItem()
    {
        return $this->hasMany(OrderItem::class, 'order_id', 'id');
    }

    public function dept()
    {
        return $this->belongsTo(Dept::class, 'order_dept', 'depart_id');
    }
    
    public function orderBy()
    {
        return $this->belongsTo(Person::class, 'order_by', 'person_id');
    }
}