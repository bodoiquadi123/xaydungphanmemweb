<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
	public $items = null;
	public $totalQty = 0;
	public $totalPrice = 0;

	public function __construct($oldCart){
		if($oldCart){
			$this->items = $oldCart->items;
			$this->totalQty = $oldCart->totalQty;
			$this->totalPrice = $oldCart->totalPrice;
		}
	}
	// Giỏ hàng chỉ lấy giá gốc khi tính tổng items
	// public function add($item, $id){
	// 	$giohang = ['qty'=>0, 'price' => $item->unit_price, 'item' => $item];
	// 	if($this->items){
	// 		if(array_key_exists($id, $this->items)){
	// 			$giohang = $this->items[$id];
	// 		}
	// 	}
	// 	$giohang['qty']++;
	// 	$giohang['price'] = $item->unit_price * $giohang['qty'];
	// 	$this->items[$id] = $giohang;
	// 	$this->totalQty++;
	// 	$this->totalPrice += $item->unit_price;
	// }
	// Giỏ hàng cập nhật lại giá khuyến mãi
	public function add($item, $id){
		$price_unit_or_promo = $item->unit_price;
		if($item->promotion_price != 0){
			$price_unit_or_promo = $item->promotion_price;
		}

		$giohang = ['qty'=>0, 'price' => $price_unit_or_promo, 'item' => $item];
		if($this->items){
			if(array_key_exists($id, $this->items)){
				$giohang = $this->items[$id];
			}
		}
		$giohang['qty']++;
		$giohang['price'] = $price_unit_or_promo * $giohang['qty'];

		$this->items[$id] = $giohang; 
		$this->totalQty++; 
		$this->totalPrice += $price_unit_or_promo; 
	}

	//xóa 1
	public function reduceByOne($id){
		$this->items[$id]['qty']--;
		$this->items[$id]['price'] -= $this->items[$id]['item']['price'];
		$this->totalQty--;
		$this->totalPrice -= $this->items[$id]['item']['price'];
		if($this->items[$id]['qty']<=0){
			unset($this->items[$id]);
		}
	}
	//xóa nhiều
	public function removeItem($id){
		$this->totalQty -= $this->items[$id]['qty'];
		$this->totalPrice -= $this->items[$id]['price'];
		unset($this->items[$id]);
	}
}
