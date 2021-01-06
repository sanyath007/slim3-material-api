<?php

namespace App\Controllers;

use App\Controllers\Controller;
use Illuminate\Database\Capsule\Manager as DB;
use App\Models\Unit;

class UnitController extends Controller
{
    public function getAll($request, $response, $args)
    {
        $unit = Unit::all();

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write(json_encode($unit, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
    }
    
    public function getById($request, $response, $args)
    {
        $unit = Unit::where('unit_id', $args['id'])->first();

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write(json_encode($unit, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
    }

    public function store($request, $response, $args)
    {
        $post = (array)$request->getParsedBody();

        $unit = new Unit;
        $unit->name = $post['unit_name'];
        
        if($unit->save()) {
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write(json_encode($unit, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }                    
    }

    public function update($request, $response, $args)
    {
        $post = (array)$request->getParsedBody();

        $unit = Unit::where('unit_id', $args['id'])->first();
        $unit->name = $post['unit_name'];
        
        if($unit->save()) {
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write(json_encode($unit, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }
    }

    public function delete($request, $response, $args)
    {
        $unit = Unit::where('unit_id', $args['id'])->first();
        
        if($unit->delete()) {    
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write(json_encode($unit, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }
    }
}
