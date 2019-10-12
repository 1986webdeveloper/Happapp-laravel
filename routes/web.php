<?php

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


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    // Route::get('posts/create', ['uses' => 'Voyager\PostsController@create',     'as' => 'create']);
    Route::post('voyager.posts.store', 'Voyager\PostsController@store')->name('voyager.posts.store');
    Route::post('voyager.posts.status', 'Voyager\PostsController@UpdateStatus')->name('voyager.posts.status');
    Route::put('{id}', 'Voyager\PostsController@update')->name('voyager.posts.update');
    Route::delete('{id}','Voyager\PostsController@delete')->name('voyager.posts.delete');
    Route::delete('{id}','Voyager\PostsController@delete_user')->name('voyager.users.delete_user');
    // Route::post('/', ['uses' => $namespacePrefix.'VoyagerBreadController@store',   'as' => 'store']);
});


Route::get('term_conditions','PageController@term_conditions');
Route::get('privacy_policy','PageController@privacy_policy');
Route::get('support','PageController@support');
Route::get('marketing','PageController@marketing');
Route::get('feedback','PageController@feedback');
Route::get('videoDetail','PageController@redirectDeepLink');


// Route::get('/',function(){
// 	$array = ['name'=>'test'];

// 		$last = array_pluck($array,'name');
// 		dd($last);
// });