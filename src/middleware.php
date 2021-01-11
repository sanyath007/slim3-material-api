<?php

use Tuupola\Middleware\HttpBasicAuthentication;

$container = $app->getContainer();

$container['errorHandler'] = function ($c) {
    return function ($request, $response, $exception) use ($c) {
        return $response
                ->withStatus(500)
                ->withHeader("Content-Type", "application/json")
                ->write($exception->getMessage());
    };
};

$capsule = new Illuminate\Database\Capsule\Manager;
$capsule->addConnection($container['settings']['db']);
$capsule->addConnection($container['settings']['db_hos'], 'hos');
$capsule->addConnection($container['settings']['db_person'], 'person');
$capsule->setAsGlobal();
$capsule->bootEloquent();

$container['db'] = function($c) use ($capsule) {
    return $capsule;
};

$container['auth'] = function($c) {
    return new App\Auth\Auth;
};

$container['logger'] = function($c) {
    $logger = new Monolog\Logger('My_logger');
    $file_handler = new Monolog\Handler\StreamHandler('../logs/app.log');
    $logger->pushHandler($file_handler);

    return $logger;
};

$container['jwt'] = function($c) {
    return new StdClass;
};

$app->add(new Slim\Middleware\JwtAuthentication([
    "path"          => '/api',
    "logger"        => $container['logger'],
    "passthrough"   => ["/test"],
    "secret"        => getenv("JWT_SECRET"),
    "callback"      => function($req, $res, $args) use ($container) {
        $container['jwt'] = $args['decoded'];
    },
    "error"         => function($req, $res, $args) {
        $data["status"] = "0";
        $data["message"] = $args["message"];
        $data["data"] = "";
        
        return $res
                ->withHeader("Content-Type", "application/json")
                ->write(json_encode($data, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));
    }
]));

$container['HomeController'] = function($c) {
    return new App\Controllers\HomeController($c);
};

$container['UserController'] = function($c) {
    return new App\Controllers\UserController($c);
};

$container['LoginController'] = function($c) {
    return new App\Controllers\Auth\LoginController($c);
};

$container['DashboardController'] = function($c) {
    return new App\Controllers\DashboardController($c);
};

$container['OrderController'] = function($c) {
    return new App\Controllers\OrderController($c);
};

$container['ItemController'] = function($c) {
    return new App\Controllers\ItemController($c);
};

$container['ItemTypeController'] = function($c) {
    return new App\Controllers\ItemTypeController($c);
};

$container['ItemGroupController'] = function($c) {
    return new App\Controllers\ItemGroupController($c);
};

$container['UnitController'] = function($c) {
    return new App\Controllers\UnitController($c);
};

/** Person Controllers */
$container['PersonController'] = function($c) {
    return new App\Controllers\PersonController($c);
};

$container['DeptController'] = function($c) {
    return new App\Controllers\DeptController($c);
};

/** Hosxp Controllers */
$container['OrController'] = function($c) {
    return new App\Controllers\OrController($c);
};
