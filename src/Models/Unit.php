<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    protected $table = "units";

    public function item()
    {
        return $this->hasMany(Item::class, 'unit', 'unit_id');
    }
}