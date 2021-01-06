<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ItemType extends Model
{
    protected $table = "item_types";

    public function item()
    {
        return $this->hasMany(Item::class, 'id', 'item_type');
    }
}