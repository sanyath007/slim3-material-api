<?php

$app->get('/', 'HomeController:home')->setName('home');

$app->post('/login', 'LoginController:login')->setName('login');

$app->get('/dashboard/or-visit/{month}', 'DashboardController:orVisitMonth');
$app->get('/dashboard/or-type/{month}', 'DashboardController:orTypeMonth');

$app->get('/or/visit/{year}', 'OrController:orvisit');
$app->get('/or/or-type/{year}', 'OrController:orType');
$app->get('/or/num-day/{sdate}/{edate}', 'OrController:numDay');
$app->get('/or/expenses/{sdate}/{edate}', 'OrController:expenses');
$app->get('/or/expenses/{income}/{sdate}/{edate}', 'OrController:expensesDetail');

$app->group('/api', function(Slim\App $app) { 
    $app->get('/users', 'UserController:index')->setName('userList');
    $app->get('/users/{loginname}', 'UserController:getUser')->setName('getUser');
});
