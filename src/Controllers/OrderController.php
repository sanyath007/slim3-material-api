<?php

namespace App\Controllers;

use App\Controllers\Controller;
use Illuminate\Database\Capsule\Manager as DB;
use App\Models\Order;

class OrderController extends Controller
{
    public function getAll($request, $response, $args)
    {
        $page = (int)$request->getQueryParam('page');
        $link = 'http://localhost'. $request->getServerParam('REDIRECT_URL');
        $orders = paginate(Order::with('orderItem'), 10, $page, $link);
        
        $data = json_encode($orders, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE);

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write($data);
    }
    
    public function getById($request, $response, $args)
    {
        $order = Order::where('id', $args['id'])->first();

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write(json_encode($order, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
    }
}
