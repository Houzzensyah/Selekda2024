<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::prefix('v1/auth')->group(function () {
   Route::post('register', [\App\Http\Controllers\AuthController::class, 'register']);
   Route::post('login', [\App\Http\Controllers\AuthController::class, 'login']);
   Route::post('logout', [\App\Http\Controllers\AuthController::class, 'logout'])->middleware('auth:sanctum');

});

Route::prefix('v1')->middleware(['auth:sanctum', 'admin'])->group(function () {
    Route::get('banners', [\App\Http\Controllers\BannerController::class, 'index']);
    Route::post('banners', [\App\Http\Controllers\BannerController::class, 'store']);
    Route::put('banners/{id}', [\App\Http\Controllers\BannerController::class, 'update']);
    Route::delete('banners/{id}', [\App\Http\Controllers\BannerController::class, 'destroy']);

    //blog
    Route::get('blogs', [\App\Http\Controllers\BlogController::class, 'index']);
    Route::post('blogs', [\App\Http\Controllers\BlogController::class, 'store']);
    Route::put('blogs/{id}', [\App\Http\Controllers\BlogController::class, 'update']);
    Route::delete('blogs/{id}', [\App\Http\Controllers\BlogController::class, 'destroy']);

    //portfolio
    Route::get('portfolios', [\App\Http\Controllers\PortfolioController::class, 'index']);
    Route::post('portfolios', [\App\Http\Controllers\PortfolioController::class, 'store']);
    Route::put('portfolios/{id}', [\App\Http\Controllers\PortfolioController::class, 'update']);
    Route::delete('portfolios/{id}', [\App\Http\Controllers\PortfolioController::class, 'destroy']);

    //user admin control
    Route::get('users/admin', [\App\Http\Controllers\UserAdminController::class, 'index']);
    Route::post('users', [\App\Http\Controllers\UserAdminController::class, 'store']);
    Route::put('users/{id}/admin', [\App\Http\Controllers\UserAdminController::class, 'update']);
    Route::delete('users/{id}', [\App\Http\Controllers\UserAdminController::class, 'destroy']);
});



Route::prefix('v1')->middleware('auth:sanctum')->group(function() {
   Route::put('users/{id}', [\App\Http\Controllers\UserController::class, 'update']);
   Route::get('users', [\App\Http\Controllers\UserController::class, 'getUserProfile']);

   //blogComment
    Route::get('blog/comments', [\App\Http\Controllers\BlogCommentController::class, 'index']);
    Route::post('blog/comments', [\App\Http\Controllers\BlogCommentController::class, 'store']);
    Route::put('blog/comments/{id}', [\App\Http\Controllers\BlogCommentController::class, 'update']);
    Route::delete('blog/comments/{id}', [\App\Http\Controllers\BlogCommentController::class, 'destroy']);
});


Route::fallback(function () {
    return response()->json([
        'status' => 'not-found'
    ],404);
});


