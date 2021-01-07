<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $table = "order_items";

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }

    public function item()
    {
        return $this->hasMany(Item::class, 'id', 'item_id');
    }
}