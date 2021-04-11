@extends('master')
@section('content')


<div class="inner-header">
	<div class="container">
		<div class="pull-left">
			<h6 class="inner-title">Sản phẩm {{$product_info -> name}}</h6>
		</div>
		<div class="pull-right">
			<div class="beta-breadcrumb font-large">
				<a href="{{route('index')}}">Trang chủ</a> / <span>Chi tiết sản phẩm</span>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>

<div class="container">
	<div id="content">
		<div class="row">
			<div class="col-sm-9">
				<div class="row">
					<div class="col-sm-4">
						<div class="ribbon-wrapper">
							@if($product_info -> promotion_price != 0)
							<div class="ribbon sale">Sale</div>
							@endif
						</div>
						<div class="single-item-header">
							<img src="source/image/product/{{$product_info -> image}}" alt="">
						</div>
					</div>
					<div class="col-sm-8">
						<div class="single-item-body">
							<p class="single-item-title">{{$product_info -> name}}</p><br>
							<p class="single-item-price">
								@if($product_info -> promotion_price == 0)
								<span class="flash-sell">Giá: {{number_format($product_info -> unit_price)}} VNĐ</span>
								@else
								<span class="flash-del">Giá gốc: {{number_format($product_info -> unit_price)}} VNĐ</span><br><br>
								<span class="flash-sell">Giá giảm: {{number_format($product_info -> promotion_price)}} VNĐ</span>
								@endif
							</p>
						</div>

						<div class="clearfix"></div>
						<div class="space20">&nbsp;</div>

						<div class="single-item-desc">
							<p>{{$product_info -> description}}</p>
						</div>
						<div class="space20">&nbsp;</div>

						<p>Số lượng:</p><br>
						<div class="single-item-options">
							<select class="wc-select" name="color">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
							<p>Hàng tồn kho:</p>
							<div class="clearfix"></div>
						</div><br>
						<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
					</div>
				</div>

				<div class="space40">&nbsp;</div>
				<div class="woocommerce-tabs">
					<ul class="tabs">
						<li><a href="#tab-description">Description</a></li>
					</ul>

					<div class="panel" id="tab-description">
						<p>{{$product_info -> description}}</p>
					</div>
				</div>
				<div class="space50">&nbsp;</div>
			</div>
			<div class="col-sm-3 aside">
				<div class="widget">
					<h3 class="widget-title">Sản phẩm khác cùng loại</h3>
					<div class="widget-body">
						<div class="beta-sales beta-lists">
							@foreach($product_tt as $product_tuongtu)
							<div class="media beta-sales-item">
								<a class="pull-left" href="product.html"><img src="source/image/product/{{$product_tuongtu -> image}}" alt=""></a>
								<div class="media-body">
									{{$product_tuongtu -> name}}
									@if($product_tuongtu -> promotion_price == 0)
									<span class="flash-sell">Giá: {{number_format($product_tuongtu -> unit_price)}} VNĐ</span>
									@else
									<span class="flash-del">Giá gốc: {{number_format($product_tuongtu -> unit_price)}} VNĐ</span>
									<span class="flash-sell">Giá giảm: {{number_format($product_tuongtu -> promotion_price)}} VNĐ</span>
									@endif
								</div>
							</div>
							@endforeach
						</div>
					</div>
				</div> <!-- best sellers widget -->
			</div>
		</div>
	</div> <!-- #content -->
</div> <!-- .container -->

@endsection