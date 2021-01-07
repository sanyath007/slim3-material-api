<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = "orders";

    public function orderItem()
    {
        return $this->hasMany(OrderItem::class, 'id', 'order_id');
    }
}