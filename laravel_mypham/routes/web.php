<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', [
	'as' => 'index',
	'uses' => 'page_controller@getIndex'
]);

Route::get('trang-chu', [
	'as' => 'index',
	'uses' => 'page_controller@getIndex'
]);

Route::get('loai-san-pham/{type}', [
	'as' => 'type_product',
	'uses' => 'page_controller@getType_Product'
]);

Route::get('san-pham/{id}', [
	'as' => 'product_info',
	'uses' => 'page_controller@getProduct'
]);

Route::get('lien-he', [
	'as' => 'contact',
	'uses' => 'page_controller@getContact'
]);

Route::get('gioi-thieu', [
	'as' => 'about',
	'uses' => 'page_controller@getAbout'
]);

Route::get('add-to-cart/{id}', [
	'as' => 'addcart',
	'uses' => 'page_controller@getAddtoCart'
]);

Route::get('del-cart/{id}', [
	'as' => 'dellcart',
	'uses' => 'page_controller@getDellCart'
]);

Route::get('tim-kiem', [
	'as' => 'search',
	'uses' => 'page_controller@getSearch'
]);

Route::get('dat-hang', [
	'as' => 'checkout',
	'uses' => 'page_controller@getCheckOut'
]);

Route::post('dat-hang', [
	'as' => 'checkout',
	'uses' => 'page_controller@postCheckOut'
]);

Route::get('dang-nhap', [
	'as' => 'login',
	'uses' => 'page_controller@getLogin'
]);

Route::post('dang-nhap', [
	'as' => 'login',
	'uses' => 'page_controller@postLogin'
]);

Route::get('dang-ky', [
	'as' => 'signup',
	'uses' => 'page_controller@getSignUp'
]);

Route::post('dang-ky', [
	'as' => 'signup',
	'uses' => 'page_controller@postSignUp'
]);

Route::get('dang-xuat', [
	'as' => 'logout',
	'uses' => 'page_controller@getLogOut'
]);


//// Admin


Route::get('/admin', 'admin_controller@index');
Route::get('/dashboard', 'admin_controller@show_dashboard');
Route::get('/logout', 'admin_controller@logout');
Route::post('/admin-dashboard', 'admin_controller@dashboard');

//Catory Product
Route::get('/add-category-product', 'CategoryProduct@add_category_product');
Route::get('/edit-category-product/{category_product_id}', 'CategoryProduct@edit_category_product');
Route::get('/delete-category-product/{category_product_id}', 'CategoryProduct@delete_category_product');
Route::get('/all-category-product', 'CategoryProduct@all_category_product');

Route::get('/unactive-category-product/{category_product_id}', 'CategoryProduct@unactive_category_product');
Route::get('/active-category-product/{category_product_id}', 'CategoryProduct@active_category_product');

Route::post('/save-category-product', 'CategoryProduct@save_category_product');
Route::post('/update-category-product/{category_product_id}', 'CategoryProduct@update_category_product');