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
    
    public function itemGroup()
    {
        return $this->belongsTo(ItemGroup::class, 'item_group', 'id');
    }
    
    public function unit()
    {
        return $this->belongsTo(Unit::class, 'unit', 'unit_id');
    }
}