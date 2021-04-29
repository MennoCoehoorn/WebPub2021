<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\XSLTController; 
use App\Http\Controllers\AssigmentController; 

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/transform', [XSLTController::class, 'index']);
Route::get('/asg', [AssigmentController::class, 'index']);
Route::get('/plot', [AssigmentController::class, 'grafik']);
Route::get('/plot2', [AssigmentController::class, 'grafik2']);
