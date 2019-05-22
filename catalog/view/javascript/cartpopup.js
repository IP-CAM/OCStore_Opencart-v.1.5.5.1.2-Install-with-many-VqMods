$(document).ready(function(){
	$('#button-cart').unbind('click');
	$('#button-cart').bind('click', function () { addToCart();});
});

function addToCart(product_id, quantity) {
	var productpage = true;

	if (typeof(product_id) != 'undefined') {
		var productpage = false;
		var quantity = typeof(quantity) != 'undefined' ? quantity : 1;
		var data = 'product_id=' + product_id + '&quantity=' + quantity;
	} else {
		var quantity = $('input[name=\'quantity\']').val();
		var data =  $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea');
	}

	$('#text-added').text(quantity + ' '+declination(parseInt(quantity)));

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: data,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect'] && !productpage) {
				location = json['redirect'];
			}

			if (json['error'] && productpage) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#cart-total, .cart-total').html(json['total']);
				$('#cartpopup .cart').load('index.php?route=module/cart .mini-cart-info', function() {

					$('#cartpopup .mini-cart-info td.remove img').each(function(i,e){
						var $this = $(this);
						var product_id = $this.attr('onclick').match(/remove=(\d+(?::[\w=\+\\]+)?)/)[1];
						this.onclick = function () {
							$('#cart').load('index.php?route=module/cart&remove=' + product_id + ' #cart > *', function(){$('.cart-total').text($('#cart-total').text());});
							$this.parent().parent().hide();
							if ($('#cartpopup .mini-cart-info tr').filter(':visible').length == 0) {
								$('#cartpopup').popup('hide');
							}							
						}
					});

					$('#cartpopup').popup('show');
					
				});
			}	
		}
	});
}