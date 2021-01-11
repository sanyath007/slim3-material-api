<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ItemGroup extends Model
{
    protected $table = "item_groups";

    public function item()
    {
        return $this->hasMany(Item::class, 'id', 'item_group');
    }
}