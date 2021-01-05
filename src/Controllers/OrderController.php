<?php

namespace App\Controllers;

use App\Controllers\Controller;
use Illuminate\Database\Capsule\Manager as DB;
use App\Models\Order;

class OrderController extends Controller
{
    public function getAll($request, $response, $args)
    {
        $orders = Order::all();
        
        $data = json_encode($orders, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE);

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write($data);
    }
    
    public function getById($request, $response, $args)
    {
        $order = Order::where('id', $args['id'])->first();
                    
        $data = json_encode($order, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE);

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write($data);
    }
}
