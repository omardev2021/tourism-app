<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ActivitiesController;
use App\Http\Controllers\BookingsController;
use App\Http\Controllers\TripsController;
use App\Http\Controllers\HotelsController;
use App\Http\Controllers\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::post('/activities', [ActivitiesController::class, 'store']);
Route::get('/activities', [ActivitiesController::class, 'index']);

Route::post('/trips', [TripsController::class, 'store']);
Route::get('/trips', [TripsController::class, 'index']);

Route::post('/hotels', [HotelsController::class, 'store']);
Route::get('/hotels', [HotelsController::class, 'index']);

Route::post('/bookings', [BookingsController::class, 'store']);
Route::get('/bookings', [BookingsController::class, 'index']);
Route::post('/confirm/{id}', [BookingsController::class, 'confirm']);
Route::post('/reject/{id}', [BookingsController::class, 'reject']);


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
