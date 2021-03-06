<div class="header-top">
	<div class="container">
		<div class="pull-right auto-width-right">
			<ul class="top-details menu-beta l-inline">
				@if(Auth::check())
				<li><a href="">Tài khoản: {{Auth::user()->full_name}}</a></li>
				<li><a href="{{route('logout')}}">Đăng xuất</a></li>
				@else
					<li><a href="{{route('login')}}">Đăng nhập</a></li>
				<li><a href="{{route('signup')}}">Đăng ký</a></li>
				@endif
			</ul>
		</div>
		<div class="clearfix"></div>
	</div> <!-- .container -->
</div> <!-- .header-top -->
<div class="header-body">
	<div class="container beta-relative">
		<div class="pull-left">
			<a href="index.html" id="logo"><img src="public/source/assets/dest/images/logo-cake.png" width="200px" alt=""></a>
		</div>
		<div class="pull-right beta-components space-left ov">
			<div class="space10">&nbsp;</div>
			<div class="beta-comp">
				<form role="search" method="get" id="searchform" action="{{route('search')}}">
					<input type="text" value="<?php echo isset($_GET['key'])?$_GET['key']:"" ?>" name="key" id="s" placeholder="Nhập từ khóa..." />
					<button class="fa fa-search" type="submit" id="searchsubmit"></button>
				</form>
			</div>

			<div class="beta-comp">
				
				<div class="cart">
					<div class="beta-select"><i class="fa fa-shopping-cart"></i>Giỏ hàng (
					@if(Session::has('cart'))
					có {{Session('cart') -> totalQty}} sản phẩm
					@else Trống
					@endif) 
					<i class="fa fa-chevron-down"></i></div> 
					@if(Session::has('cart'))
					<div class="beta-dropdown cart-body">
						@foreach($product_cart as $product)
						<div class="cart-item">
							<a href="{{route('dellcart',$product['item']['id'])}}" class="cart-item-delete"><i class="fa fa-times"></i></a>
							<div class="media">
								<a class="pull-left" href="#"><img src="public/source/image/product/{{$product['item']['image']}}" alt=""></a>
								<div class="media-body">
									<span class="cart-item-title">{{$product['item']['name']}}</span>
									<span class="cart-item-amount">
										{{$product['qty']}} * 
										<span>
										@if($product['item']['promotion_price']==0)
											{{number_format($product['item']['unit_price'])}}
										@else
											{{number_format($product['item']['promotion_price'])}}
										@endif
										</span>
									</span>
								</div>
							</div>
						</div>
						@endforeach
						<div class="cart-caption">
							<div class="cart-total text-right">Tổng tiền: <span class="cart-total-value">{{number_format(Session('cart') -> totalPrice)}} VNĐ</span></div>
							<div class="clearfix"></div>

							<div class="center">
								<div class="space10">&nbsp;</div>
								<a href="{{route('checkout')}}" class="beta-btn primary text-center">Đặt hàng <i class="fa fa-chevron-right"></i></a>
							</div>
						</div>
					</div>
				@endif
				</div> <!-- .cart -->
			</div>
		</div>
		<div class="clearfix"></div>
	</div> <!-- .container -->
</div> <!-- .header-body -->
<div class="header-bottom" style="background-color: #0277b8;">
	<div class="container">
		<a class="visible-xs beta-menu-toggle pull-right" href="#"><span class='beta-menu-toggle-text'>Menu</span> <i class="fa fa-bars"></i></a>
		<div class="visible-xs clearfix"></div>
		<nav class="main-menu">
			<ul class="l-inline ov">
				<li><a href="{{route('index')}}">Trang chủ</a></li>
				<li><a >Sản phẩm</a>
					<ul class="sub-menu">
						@foreach($type_prod as $type)
						<li><a href="{{route('type_product',$type -> id)}}">{{$type -> name}}</a></li>
						@endforeach
					</ul>
				</li>
				<li><a href="{{route('contact')}}">Giới thiệu</a></li>
				<li><a href="{{route('about')}}">Liên hệ</a></li>
			</ul>
			<div class="clearfix"></div>
		</nav>
	</div> <!-- .container -->
</div> <!-- .header-bottom -->