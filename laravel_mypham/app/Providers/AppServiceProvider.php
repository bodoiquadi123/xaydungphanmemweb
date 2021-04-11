<?php
namespace App\Providers;

use Illuminate\Support\ServiceProvider;

use Illuminate\Pagination\Paginator;

use App\Models\ProductType;

use App\Models\Cart;

use Session;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useBootstrap();
        
        view() -> composer ('header',function($view){

            $type_prod = ProductType::all();
            $view -> with('type_prod',$type_prod);
        });

        view() -> composer (['header','pages.checkout'],function($view){
            if (Session('cart')) {
                $oldCart = Session::get('cart');
                $cart = new Cart($oldCart);
                $view -> with(['cart'=> Session::get('cart'),'product_cart'=> $cart -> items,'totalPrice'=> $cart-> totalPrice,'totalQty'=>$cart-> totalQty]);
            }
        });
    }
}
