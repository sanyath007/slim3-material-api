<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $table = "items";

    public function itemType()
    {
        return $this->belongsTo(ItemType::class, 'item_type', 'id');
    }
}