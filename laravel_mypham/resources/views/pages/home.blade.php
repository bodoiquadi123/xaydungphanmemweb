@extends('master')
@section('content')

<div class="container">
	<div class="fullwidthbanner">
		<div class="bannercontainer" >
			<div class="banner" >
				<ul>
					@foreach($slide as $slider)
					<!-- THE FIRST SLIDE -->
					<li data-transition="boxfade" data-slotamount="20" class="active-revslide" style="width: 100%; height: 100%; overflow: hidden; z-index: 18; visibility: hidden; opacity: 0;">
						<div class="slotholder" style="width:100%;height:100%;" data-duration="undefined" data-zoomstart="undefined" data-zoomend="undefined" data-rotationstart="undefined" data-rotationend="undefined" data-ease="undefined" data-bgpositionend="undefined" data-bgposition="undefined" data-kenburns="undefined" data-easeme="undefined" data-bgfit="undefined" data-bgfitend="undefined" data-owidth="undefined" data-oheight="undefined">
							<div class="tp-bgimg defaultimg" data-lazyload="undefined" data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat" data-lazydone="undefined" src="source/image/slide/{{$slider -> image}}" data-src="source/image/slide/{{$slider -> image}}" style="background-color: rgba(0, 0, 0, 0); background-repeat: no-repeat; background-image: url('source/image/slide/{{$slider -> image}}'); background-size: cover; background-position: center center; width: 100%; height: 100%; opacity: 1; visibility: inherit;">
							</div>
						</div>
					</li>
					@endforeach
				</ul>
			</div>
		</div>
		<div class="tp-bannertimer"></div>
	</div>
</div>
<!--slider-->
</div>
<div class="container">
	<div id="content" class="space-top-none">
		<div class="main-content">
			<div class="space60">&nbsp;</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="beta-products-list">
						<h4>New Products</h4>
						<div class="beta-products-details">
							<p class="pull-left">Sản phẩm thứ {{$new_product->firstItem()}} - {{$new_product->lastItem()}} trong tất cả {{$new_product->total()}} sản phẩm</p>
							<div class="clearfix"></div>
						</div>
						<div class="row">
							@foreach($new_product as $new_prod)
								<div class="col-sm-3">
									<div class="single-item">
										<div class="ribbon-wrapper">
											@if($new_prod -> promotion_price != 0)
											<div class="ribbon sale">Sale</div>
											@endif
										</div>
										<div class="single-item-header">
											<a href="{{route('product_info',$new_prod -> id)}}"><img src="source/image/product/{{$new_prod -> image}}" alt="" height="250px"></a>
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
											<a class="beta-btn primary" href="{{route('product_info',$new_prod -> id)}}">Chi tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							@endforeach
						</div>	
						<div class="space10">&nbsp;</div>
						<div class="row">{{$new_product-> links()}}</div>
					</div> <!-- .beta-products-list -->

					<div class="space50">&nbsp;</div>

					<div class="beta-products-list">
						<h4>Sale Products</h4>
						<div class="beta-products-details">
							<p class="pull-left">Sản phẩm thứ {{$sale_product->firstItem()}} - {{$sale_product->lastItem()}} trong tất cả {{$sale_product->total()}} sản phẩm</p>
							<div class="clearfix"></div>
						</div>
						<div class="row">
							@foreach($sale_product as $sale_prod)
							<div class="col-sm-3">
								<div class="single-item">
									<div class="ribbon-wrapper">
										@if($sale_prod -> promotion_price != 0)
										<div class="ribbon sale">Sale</div>
										@endif
									</div>
									<div class="single-item-header">
										<a href="{{route('product_info',$sale_prod -> id)}}"><img src="source/image/product/{{$sale_prod -> image}}" alt="" height="250px"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$sale_prod -> name}}</p>
										<p class="single-item-price">
											@if($sale_prod -> promotion_price == 0)
											<span class="flash-sell">{{number_format($sale_prod -> unit_price)}} VNĐ</span>
											@else
											<span class="flash-del">{{number_format($sale_prod -> unit_price)}} VNĐ</span>
											<span class="flash-sell">{{number_format($sale_prod -> promotion_price)}} VNĐ</span>
											@endif
										</p>
									</div>
									<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="{{route('addcart',$sale_prod -> id)}}"><i class="fa fa-shopping-cart"></i></a>
										<a class="beta-btn primary" href="{{route('product_info',$sale_prod -> id)}}">Chi tiết <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							@endforeach
						</div>
						<div class="row">{{$sale_product-> links()}} </div>
						<div class="space40">&nbsp;</div>
					</div> <!-- .beta-products-list -->
				</div>
			</div>
		</div> <!-- end section with sidebar and main content -->
	</div> <!-- .main-content -->
</div> <!-- #content -->


@endsection