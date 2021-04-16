<?php

namespace App\Http\Controllers;

use App\Models\slide; 

use App\Models\product; 

use App\Models\ProductType;

use Session; 

use App\Models\Cart;

use App\Models\customer;

use App\Models\bill;

use App\Models\BillDetail;

use App\Models\User;

use Hash;

use Auth;

use Illuminate\Http\Request;

class page_controller extends Controller
{
    public function getIndex()
    {
        $slide = slide::all(); // lay du lieu slide
        $new_product = product::where ('new',1) -> paginate(4, ['*'], 'page_new');
        $sale_product = product::where ('promotion_price','<>',0) -> paginate(4, ['*'], 'page_sale');
        return view('pages.home',compact('slide','new_product','sale_product'));
    }

    public function getType_Product($type)
    {
        $type_prod = product :: where ('id_type',$type)->get();
        $pro_dif = product :: where ('id_type','<>',$type)->paginate(4);   //danh sach sp khac
        $product_by_type = ProductType:: all();
        $name_type = ProductType :: where('id',$type) -> first();  //ten sp
        return view('pages.type_product',compact('type_prod','product_by_type','name_type','pro_dif'));
    }

    public function getProduct(Request $req)
    {
        $product_info = product::where('id',$req -> id)->first();
        $product_tt = product::where('id_type',$product_info -> id_type)->paginate(5);
        return view('pages.product',compact('product_info','product_tt'));
    }

    public function getContact()
    {
    	return view('pages.contact');
    }

    public function getAbout()
    {
        return view('pages.about');
    }

    public function getAddtoCart(request $req ,$id)
    {
        $product = product::find($id,);
        $oldCart = Session('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $cart -> add ($product,$id);
        $req -> session() -> put('cart',$cart);
        return redirect()->back();
    }

    public function getDellCart($id)
    {
        $oldCart = Session('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $cart -> reduceByOne($id);
        if (count($cart->items)>0) {
            Session::put('cart',$cart);
        }
        else{
            Session::forget('cart');
        }
        return redirect()->back();
    }

    public function getSearch(Request $req)
    {
        $product = product :: where ('name','like','%'.$req -> key.'%')->orwhere('unit_price',$req -> key)-> paginate(4, ['*'], 'search');
        
        return view('pages.search',compact('product'));
    }

    public function getCheckOut()
    {
        return view('pages.checkout');
    }

    public function postCheckOut(request $req)
    {
        $cart = Session::get('cart');

        $customer = new customer;
        $customer -> name = $req -> name;
        $customer -> gender = $req -> gender;
        $customer -> email = $req -> email;
        $customer -> address = $req -> address;
        $customer -> phone_number = $req -> phone;
        $customer -> note = $req -> note;
        $customer -> save();

        $bill = new bill;
        $bill -> id_customer = $customer -> id;
        $bill -> date_order = date('Y-m-d');
        $bill -> total = $cart -> totalPrice;
        $bill -> payment = $req -> payment_method;
        $bill -> note = $req -> note;
        $bill -> save();

        foreach ($cart -> items  as $key => $value) {
            $bill_detail = new BillDetail();
            $bill_detail -> id_bill = $bill -> id;
            $bill_detail -> id_product = $key;
            $bill_detail -> quantity = $value['qty'];
            $bill_detail -> unit_price = $value['price']/$value['qty'];
            $bill_detail -> save();   
        }
        Session::forget('cart');
        return redirect()->back()-> with ('mess','Đặt hàng thành công');
    }

    public function getLogin()
    {
        return view('pages.login');
    }

    public function getSignUp()
    {
        return view('pages.signup');
    }

    public function postSignUp(Request $req)
    {
        $this -> validate($req,
            [
                'email'=>'required|email|unique:users,email',
                'pw'=>'required|min:3|max:20',
                'fullname' => 'required', 
                're_pw' => 'required|same:pw',
                'phone' => 'required|numeric|digits:10',
            ],
            [
                'email.required' => 'Vui lòng nhập email',
                'email.email' => 'Email không đúng VD: binhle@gmail.com',
                'email.unique' => 'Email đã có người sử dụng',
                'pw.required' => 'Vui lòng nhập password',
                'phone.required' => 'Vui lòng nhập số điện thoại',
                'phone.numeric' => 'Nhập sai số điện thoại',
                'phone.digits' => 'Số điện thoại phải đủ 10 số',
                'pw.min' => 'Vui lòng nhập password > 3 ký tự',
                'pw.max' => 'Vui lòng nhập password < 20 ký tự',
                'fullname.required' => 'Vui lòng nhập tên',
                're_pw.same' => 'Mật khẩu không trùng',
            ]);
        $user = new User();
        $user -> email = $req -> email;
        $user -> full_name = $req -> fullname;
        $user -> password = Hash::make($req -> pw);
        $user -> phone = $req -> phone;
        $user -> address = $req -> address; 
        $user -> save();
        return redirect() -> back() -> with ('mess_dk','Đã đăng ký thành công');
    }

    public function postLogin(Request $req)
    {
        $this -> validate($req,
            [
                'email'=>'required|email',
                'password'=>'required|min:3|max:20',
            ],
            [
                'email.required' => 'Vui lòng nhập email',
                'email.email' => 'Email không đúng VD: binhle@gmail.com',
                'password.required' => 'Vui lòng nhập password',
                'password.min' => 'Vui lòng nhập password > 3 ký tự',
                'password.max' => 'Vui lòng nhập password < 20 ký tự',
            ]);
        $credentials = array('email' => $req -> email, 'password' => $req -> password );
        if(Auth::attempt($credentials))
        {
            return redirect() -> route('index') -> with(['flag'=>'Success','mess'=>'Bạn đã đăng nhập thành công']); 
        }
        else{
            return redirect() -> back() -> with(['flag'=>'Fail','mess'=>'Bạn đã sai email or password']);
        }
    }

    public function getLogOut()
    {
        Auth::logout();
        return redirect() -> route('index');
    }
}
