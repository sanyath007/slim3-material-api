<?php

namespace App\Controllers;

use App\Controllers\Controller;
use Illuminate\Database\Capsule\Manager as DB;
use App\Models\ItemType;

class ItemTypeController extends Controller
{
    public function getAll($request, $response, $args)
    {
        $type = ItemType::all();

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write(json_encode($type, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
    }
    
    public function getById($request, $response, $args)
    {
        $type = ItemType::where('id', $args['id'])->first();

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write(json_encode($type, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
    }

    public function store($request, $response, $args)
    {
        $post = (array)$request->getParsedBody();

        $type = new ItemType;
        $type->name = $post['name'];
        $type->unit = $post['unit'];
        $type->cost = $post['cost'];
        $type->stock = $post['stock'];
        $type->min = $post['min'];
        $type->balance = $post['balance'];
        $type->item_type = $post['item_type'];
        
        if($type->save()) {
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write(json_encode($type, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }                    
    }

    public function update($request, $response, $args)
    {
        $post = (array)$request->getParsedBody();

        $type = ItemType::where('id', $args['id'])->first();
        $type->name = $post['name'];
        $type->unit = $post['unit'];
        $type->cost = $post['cost'];
        $type->stock = $post['stock'];
        $type->min = $post['min'];
        $type->balance = $post['balance'];
        $type->item_type = $post['item_type'];
        
        if($type->save()) {
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write(json_encode($type, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }
    }

    public function delete($request, $response, $args)
    {
        $type = ItemType::where('id', $args['id'])->first();
        
        if($type->delete()) {    
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write(json_encode($type, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }
    }
}
