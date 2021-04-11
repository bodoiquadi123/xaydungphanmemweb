@extends('master')
@section('content')

<div class="inner-header">
	<div class="container">
		<div class="pull-right">
			<div class="beta-breadcrumb font-large">
				<a href="index.html">Home</a> / <span>Sản phẩm</span>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div class="container">
	<div id="content" class="space-top-none">
		<div class="main-content">
			<div class="space60">&nbsp;</div>
			<div class="row">
				<div class="col-sm-3">
					<h3 class="inner-title" style="margin: 20px 0px;text-align: center;">Danh sách sản phẩm</h3>
					<ul class="aside-menu">
						@foreach($product_by_type as $type)
							<li><a href="{{route('type_product',$type -> id)}}">{{$type -> name}}</a></li>
						@endforeach
					</ul>
				</div>
				<div class="col-sm-9">
					<div class="beta-products-list">
						<h4>Sản phẩm {{$name_type -> name}}</h4>
						<div class="beta-products-details">
							<p class="pull-left">Có {{count($type_prod)}} sản phẩm</p>
							<div class="clearfix"></div>
						</div>

						<div class="row">
							@foreach($type_prod as $type)
								<div class="col-sm-4">
									<div class="single-item">
										<div class="ribbon-wrapper">
											@if($type -> promotion_price != 0)
											<div class="ribbon sale">Sale</div>
											@endif
										</div>
										<div class="single-item-header">
											<a href="{{route('product_info',$type -> id)}}"><img src="source/image/product/{{$type->image}}" alt="" height="250px" width = "250px"></a>
										</div>
										<div class="single-item-body">
										<p class="single-item-title">{{$type -> name}}</p>
										<p class="single-item-price">
											@if($type -> promotion_price == 0)
											<span class="flash-sell">{{number_format($type -> unit_price)}} VNĐ</span>
											@else
											<span class="flash-del">{{number_format($type -> unit_price)}} VNĐ</span>
											<span class="flash-sell">{{number_format($type -> promotion_price)}} VNĐ</span>
											@endif
										</p>
									</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="{{route('addcart',$type -> id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{route('product_info',$type -> id)}}">Chi tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							@endforeach
						</div>
					</div> <!-- .beta-products-list -->

					<div class="space50">&nbsp;</div>
				</div>
				<!-- sản phẩm khác -->
				{{-- <div class="col-sm-12">
					<div class="beta-products-list">
						<h4>Sản phẩm khác</h4>
						<div class="beta-products-details">
							<p class="pull-left">Có {{(count($pro_dif))}} sản phẩm khác</p>
							<div class="clearfix"></div>
						</div>

						<div class="row">
							@foreach($pro_dif as $dif_pro)
								<div class="col-sm-3">
									<div class="single-item">
										<div class="ribbon-wrapper">
											@if($dif_pro -> promotion_price != 0)
											<div class="ribbon sale">Sale</div>
											@endif
										</div>
										<div class="single-item-header">
											<a href="product.html"><img src="source/image/product/{{$dif_pro->image}}" alt="" height="250px" ></a>
										</div>
										<div class="single-item-body">
										<p class="single-item-title">{{$dif_pro -> name}}</p>
										<p class="single-item-price">
											@if($type -> promotion_price == 0)
											<span class="flash-sell">{{number_format($dif_pro -> unit_price)}} VNĐ</span>
											@else
											<span class="flash-del">{{number_format($dif_pro -> unit_price)}} VNĐ</span>
											<span class="flash-sell">{{number_format($dif_pro -> promotion_price)}} VNĐ</span>
											@endif
										</p>
									</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="shopping_cart.html"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="product.html">Details <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							@endforeach
						</div>
						<div class="row">{{$pro_dif -> links()}}</div>
					</div> <!-- .beta-products-list -->
					<div class="space50">&nbsp;</div>
				</div>  san pham khac--}} 
			</div> <!-- end section with sidebar and main content -->
		</div> <!-- .main-content -->
	</div> <!-- #content -->
</div> <!-- .container -->

@endsection