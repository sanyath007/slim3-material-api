<?php

namespace App\Controllers;

use App\Controllers\Controller;
use Illuminate\Database\Capsule\Manager as DB;
use App\Models\Item;

class ItemController extends Controller
{
    public function getAll($request, $response, $args)
    {
        $page = (int)$request->getQueryParam('page');
        $link = 'http://localhost'. $request->getServerParam('REDIRECT_URL');
        
        $count = Item::count();
        
        $perPage = 10;
        $page = ($page == 0 ? 1 : $page);
        $offset = ($page - 1) * $perPage;
        $lastPage = ceil($count / $perPage);
        $prev = ($page != $offset + 1) ? $page - 1 : null;
        $next = ($page != $lastPage) ? $page + 1 : null;
        $lastRecordPerPage = ($page != $lastPage) ? ($page * $perPage) : ($count - $offset) + $offset;

        $items = Item::with('itemType')
                    ->skip($offset)
                    ->take($perPage)
                    ->orderBy('id')
                    ->get();

        $data = [
            'items' => $items,
            'pager' => [
                'total' => $count,
                'per_page' => $perPage,
                'current_page' => $page,
                'last_page' => $lastPage,
                'from' => $offset + 1,
                'to' => $lastRecordPerPage,
                'path'  => $link,
                'first_page_url' => $link. '?page=1',
                'prev_page_url' => (!$prev) ? $prev : $link. '?page=' .$prev,
                'next_page_url' => (!$next) ? $next : $link. '?page=' .$next,
                'last_page_url' => $link. '?page=' .$lastPage
            ]
        ];

        return $response->withStatus(200)
                ->withHeader("Content-Type", "application/json")
                ->write(
                    json_encode($data, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE)
                );
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
        $post = (array)$request->getParsedBody();

        $item = new Item;
        $item->name = $post['name'];
        $item->unit = $post['unit'];
        $item->cost = $post['cost'];
        $item->stock = $post['stock'];
        $item->min = $post['min'];
        $item->balance = $post['balance'];
        $item->item_type = $post['item_type'];
        
        if($item->save()) {
            $data = json_encode($item, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE);
    
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write($data);
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
        
        if($item->save()) {
            $data = json_encode($item, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE);
    
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write($data);
        }
    }

    public function delete($request, $response, $args)
    {
        $item = Item::where('id', $args['id'])->first();
        
        if($item->delete()) {
            $data = json_encode($item, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT |  JSON_UNESCAPED_UNICODE);
    
            return $response->withStatus(200)
                    ->withHeader("Content-Type", "application/json")
                    ->write($data);
        }
    }
}
