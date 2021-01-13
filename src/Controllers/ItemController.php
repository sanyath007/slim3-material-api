<?php

namespace App\Controllers;

use App\Controllers\Controller;
use Illuminate\Database\Capsule\Manager as DB;
use Respect\Validation\Validator as v;
use App\Models\Item;

class ItemController extends Controller
{
    public function getAll($request, $response, $args)
    {
        $page = (int)$request->getQueryParam('page');

        if ($page) {
            $link = 'http://localhost'. $request->getServerParam('REDIRECT_URL');
            $data = paginate(Item::with('itemType', 'itemGroup', 'unit')->orderBy('item_group'), 10, $page, $link);
        } else {
            $data = [
                'items' => Item::with('itemType', 'itemGroup', 'unit')->orderBy('item_group')->get()
            ];
        }

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write(json_encode($data, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
    }
    
    public function getById($request, $response, $args)
    {
        $item = Item::where('id', $args['id'])->first();
                    
        $data = json_encode($item, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE);

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write($data);
    }

    public function store($request, $response, $args)
    {
        $validation = $this->validator->validate($request, [
            'name' => v::notEmpty(),
            'unit' => v::notEmpty()->numeric(),
            'cost' => v::notOptional()->floatVal(),
            'stock' => v::notOptional()->numeric(),
            'min' => v::notOptional()->numeric(),
            'balance' => v::notOptional()->numeric(),
            'item_type' => v::notEmpty()->numeric(),
            'item_group' => v::notEmpty()->numeric(),
        ]);
        
        if ($validation->failed()) {
            $data = [
                'status' => 0,
                'errors' => $validation->getMessages(),
                'message' => 'Validation Error!!'
            ];

            return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write(json_encode($data, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }

        $post = (array)$request->getParsedBody();

        $item = new Item;
        $item->name = $post['name'];
        $item->unit = $post['unit'];
        $item->cost = $post['cost'];
        $item->stock = $post['stock'];
        $item->min = $post['min'];
        $item->balance = $post['balance'];
        $item->item_type = $post['item_type'];
        $item->item_group = $post['item_group'];
        
        if($item->save()) {
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write(json_encode($item, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }                    
    }

    public function update($request, $response, $args)
    {
        $post = (array)$request->getParsedBody();

        $item = Item::where('id', $args['id'])->first();
        $item->name = $post['name'];
        $item->unit = $post['unit'];
        $item->cost = $post['cost'];
        $item->stock = $post['stock'];
        $item->min = $post['min'];
        $item->balance = $post['balance'];
        $item->item_type = $post['item_type'];        
        $item->item_group = $post['item_group'];
        
        if($item->save()) {    
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write(json_encode($item, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }
    }

    public function delete($request, $response, $args)
    {
        $item = Item::where('id', $args['id'])->first();
        
        if($item->delete()) {
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write(json_encode($item, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE));
        }
    }
}
