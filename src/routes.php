<?php

$app->options('/{routes:.+}', function($request, $response, $args) {
    return $response;
});

$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
            ->withHeader('Access-Control-Allow-Origin', 'http://localhost:3000')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

$app->get('/', 'HomeController:home')->setName('home');

$app->post('/login', 'LoginController:login')->setName('login');

$app->get('/dashboard/or-visit/{month}', 'DashboardController:orVisitMonth');
$app->get('/dashboard/or-type/{month}', 'DashboardController:orTypeMonth');

$app->get('/items', 'ItemController:getAll');
$app->get('/items/{id}', 'ItemController:getById');
$app->post('/items', 'ItemController:store');
$app->put('/items', 'ItemController:update');
$app->delete('/items/{id}', 'ItemController:delete');

$app->get('/orders', 'OrderController:getAll');
$app->get('/orders/{id}', 'OrderController:getById');

$app->group('/api', function(Slim\App $app) { 
    $app->get('/users', 'UserController:index');
    $app->get('/users/{loginname}', 'UserController:getUser');
    
    /** Hosxp Routes */
    $app->get('/or/visit/{year}', 'OrController:orvisit');
    $app->get('/or/or-type/{year}', 'OrController:orType');
    $app->get('/or/num-day/{sdate}/{edate}', 'OrController:numDay');
    $app->get('/or/expenses/{sdate}/{edate}', 'OrController:expenses');
    $app->get('/or/expenses/{income}/{sdate}/{edate}', 'OrController:expensesDetail');
});

// Catch-all route to serve a 404 Not Found page if none of the routes match
// NOTE: make sure this route is defined last
$app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function($req, $res) {
    $handler = $this->notFoundHandler; // handle using the default Slim page not found handler
    return $handler($req, $res);
});
