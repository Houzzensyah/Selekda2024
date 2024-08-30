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

Route::prefix('v1')->middleware(['auth:sanctum', 'admin'])->group([

]);

Route::prefix('v1')->middleware('auth:sanctum')->group(function() {
   Route::put('users/{id}', [\App\Http\Controllers\UserController::class, 'update']);
   Route::get('users', [\App\Http\Controllers\UserController::class, 'getUserProfile']);

   //blogComment
    Route::get('blog/comments', [\App\Http\Controllers\BlogCommentController::class, 'index']);
    Route::post('blog/comments', [\App\Http\Controllers\BlogCommentController::class, 'store']);
    Route::put('blog/comments/{id}', [\App\Http\Controllers\BlogCommentController::class, 'update']);
    Route::delete('blog/comments/{id}', [\App\Http\Controllers\BlogCommentController::class, 'destroy']);
});


