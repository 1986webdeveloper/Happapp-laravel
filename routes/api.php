<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::group(['middleware' => ['jwt.verify']], function() {
        Route::get('user', 'ApiController@getAuthenticatedUser');
        });
// $router->post('/login', 'ApiController@login');     
Route::post('/login', 'ApiController@login');     
Route::post('/logout', 'ApiController@logout');     
Route::get('quotes', 'ApiController@randomQuotes');
Route::post('video_list', 'ApiController@get_video_list');
Route::post('video_details','ApiController@get_video_details');
Route::post('video_favourite_unfavourite','ApiController@video_favourite_unfavourite');
Route::post('favourite_list','ApiController@favourite_list');

Route::get('page_list','ApiController@page_list');
Route::post('viewers_add','ApiController@viewers_add');
Route::post('add_feedback','ApiController@add_feedback');
Route::post('add_comment','ApiController@add_comment');
Route::post('edit_profile','ApiController@edit_profile');
Route::post('comment_list','ApiController@comment_list');
Route::post('comment_delete','ApiController@comment_delete');
Route::post('child_comment_listing','ApiController@child_comment_listing');
Route::post('comment_like_unlike','ApiController@comment_like_unlike');
Route::post('video_recommend','ApiController@video_recommend');
Route::post('flag_unflag_comment','ApiController@flag_unflag_comment');
Route::post('get_new_video_list', 'ApiController@get_new_video_list');
Route::post('user_status', 'ApiController@user_status');
Route::get('get_admin_mail_for_video_mail', 'ApiController@getAdminEmailForVideoMail');