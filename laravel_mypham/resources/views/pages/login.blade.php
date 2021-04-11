@extends('master')
@section('content')
<div class="inner-header">
	<div class="container">
		<div class="pull-left">
			<h6 class="aler">
				@if(count($errors)>0)
					@foreach($errors->all() as $err)
						{{$err}}
					@endforeach
				@endif
				@if(Session::has('flag'))
					{{Session::get('mess')}}
				@endif
			</h6>
		</div>
		<div class="pull-right">
			<div class="beta-breadcrumb">
				<a href="index.html">Home</a> / <span>Đăng nhập</span>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>

<div class="container">
	<div id="content">
		
		<form action="{{route('login')}}" method="post" class="beta-form-checkout">
			<input class="hidden" name="_token" value="{{csrf_token()}}">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<h4>Đăng nhập</h4>
					<div class="space20">&nbsp;</div>
					<div class="form-block">
						<label for="email">Email address*</label>
						<input type="email" id="email" name="email" required>
					</div>
					<div class="form-block">
						<label for="password">Password*</label>
						<input type="password" name="password" id="password" required>
					</div>
					<div class="">
						<p style="text-align: center;"><button type="submit" class="btn btn-primary">Đăng nhập</button></p>
					</div><br>
					<div class="">
						<p style="text-align: center;"><a href="{{route('signup')}}" class="btn btn-primary">Chưa có tài khoản?<br> Đăng ký ngay</a></p>
					</div>
					<div class="social-auth-links text-center mb-3">
						<p style="padding: 20px;">----- OR -----</p>
						<button type="button" href="" class="btn btn-block btn-primary">
							 Đăng nhập bằng Facebook
						</button>
					</div>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</form>
	</div> <!-- #content -->
</div> <!-- .container -->
@endsection