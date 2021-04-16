@extends('master')
@section('content')
<div class="container">
	<div id="content" class="space-top-none">
		<div class="main-content">
			<div class="space60">&nbsp;</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="beta-products-list">
						<h4>Tìm kiếm</h4>
						<div class="beta-products-details">
							<p class="pull-left">Tìm thấy {{$product->total()}} sản phẩm</p>
							<div class="clearfix"></div>
						</div>
						<div class="row">
							@foreach($product as $new_prod)
							<div class="col-sm-3">
								<div class="single-item">
									<div class="ribbon-wrapper">
										@if($new_prod -> promotion_price != 0)
										<div class="ribbon sale">Sale</div>
										@endif
									</div>
									<div class="single-item-header">
										<a href="{{route('product_info',$new_prod -> id)}}"><img src="public/source/image/product/{{$new_prod -> image}}" alt="" height="250px"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$new_prod -> name}}</p>
										<p class="single-item-price">
											@if($new_prod -> promotion_price == 0)
											<span class="flash-sell">{{number_format($new_prod -> unit_price)}} VNĐ</span>
											@else
											<span class="flash-del">{{number_format($new_prod -> unit_price)}} VNĐ</span>
											<span class="flash-sell">{{number_format($new_prod -> promotion_price)}} VNĐ</span>
											@endif
										</p>
									</div>
									<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="{{route('addcart',$new_prod -> id)}}"><i class="fa fa-shopping-cart"></i></a>
										<a class="beta-btn primary" href="{{route('product_info',$new_prod -> id)}}">Details <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							@endforeach
						</div>
						<div class="row">{{$product-> links()}} </div>
						<div class="space10">&nbsp;</div>
					</div> <!-- .beta-products-list -->
					<div class="space50">&nbsp;</div>
				</div>
			</div>
		</div> <!-- end section with sidebar and main content -->
	</div> <!-- .main-content -->
</div> <!-- #content -->
@endsection