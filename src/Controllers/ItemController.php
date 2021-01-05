<?php

namespace App\Controllers;

use App\Controllers\Controller;
use Illuminate\Database\Capsule\Manager as DB;
use App\Models\Item;

class ItemController extends Controller
{
    public function getAll($request, $response, $args)
    {
        $items = Item::all();
        
        $data = json_encode($items, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE);

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write($data);
    }
    
    public function getById($request, $response, $args)
    {
        $item = Item::where('id', $args['id'])->first();
                    
        $data = json_encode($item, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE);

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write($data);
    }
}
