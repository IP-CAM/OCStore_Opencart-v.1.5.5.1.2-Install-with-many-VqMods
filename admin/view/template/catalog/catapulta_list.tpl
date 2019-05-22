<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if ($module_install) { ?>
	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<?php if ($success) { ?>
	<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons">
				<a onclick="$('#form').attr('action', '<?php echo $delete; ?>');
						$('#form').attr('target', '_self');
						$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>
		</div>
		<div class="content">
			<form action="" method="post" enctype="multipart/form-data" id="form">
				<table class="list">
					<thead>
						<tr>
							<td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
							<td class="right"><?php if ($sort == 'order_id') { ?>
								<a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_order_id; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_order; ?>"><?php echo $column_order_id; ?></a>
								<?php } ?></td>
							<td class="right"><?php if ($sort == 'contact') { ?>
								<a href="<?php echo $sort_contact; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_contact; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_contact; ?>"><?php echo $column_contact; ?></a>
								<?php } ?></td>
							<td class="right"><?php if ($sort == 'product_name') { ?>
								<a href="<?php echo $sort_product_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_product_name; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_product_name; ?>"><?php echo $column_product_name; ?></a>
								<?php } ?></td>
							<td class="right"><?php if ($sort == 'total') { ?>
								<a href="<?php echo $sort_total; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_total; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_total; ?>"><?php echo $column_total; ?></a>
								<?php } ?></td>
							<td class="left"><?php if ($sort == 'date_added') { ?>
								<a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
								<?php } else { ?>
								<a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
								<?php } ?></td>
							<td class="right"><?php echo $column_action; ?></td>
						</tr>
					</thead>
					<tbody>
						<tr class="filter">
							<td></td>
							<td align="right"><input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" size="4" style="text-align: right;" /></td>
							<td align="right"><input type="text" name="filter_contact" value="<?php echo $filter_contact; ?>" /></td>
							<td align="right"><input type="text" name="filter_product_name" value="<?php echo $filter_product_name; ?>" /></td>
							<td align="right"><input type="text" name="filter_total" value="<?php echo $filter_total; ?>" size="4" style="text-align: right;" /></td>
							<td><input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" size="12" class="date" /></td>
							<td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
						</tr>
						<?php if ($orders) { ?>
						<?php foreach ($orders as $order) { ?>
						<tr>
							<td style="text-align: center;"><?php if ($order['selected']) { ?>
								<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
								<?php } else { ?>
								<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
								<?php } ?></td>
							<td class="right"><?php echo $order['order_id']; ?></td>
							<td class="right"><?php echo $order['contact']; ?></td>
							<td class="right"><a href="<?php echo $order['product_href']; ?>"><?php echo $order['product_name']; ?></a></td>
							<td class="right"><?php echo $order['total']; ?></td>
							<td class="left"><?php echo $order['date_added']; ?></td>
							<td class="right"><?php foreach ($order['action'] as $action) { ?>
								[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
								<?php } ?></td>
						</tr>
						<?php } ?>
						<?php } else { ?>
						<tr>
							<td class="center" colspan="7"><?php echo $text_no_results; ?></td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
			</form>
			<div class="pagination"><?php echo $pagination; ?></div>
		</div>
	</div>
	<?php } else { ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/arbitrage.png" alt="" /> <?php echo $heading_title; ?></h1>
		</div>
		<div class="content">
			<div class="warning"><?php echo $text_module_not_exists; ?></div>
		</div>
	</div>
	<?php } ?>
</div>
<script type="text/javascript"><!--
function filter() {
		url = 'index.php?route=catalog/catapulta&token=<?php echo $token; ?>';

		var filter_order_id = $('input[name=\'filter_order_id\']').attr('value');

		if (filter_order_id) {
			url += '&filter_order_id='+encodeURIComponent(filter_order_id);
		}

		var filter_contact = $('input[name=\'filter_contact\']').attr('value');

		if (filter_contact) {
			url += '&filter_contact='+encodeURIComponent(filter_contact);
		}

		var filter_product_name = $('input[name=\'filter_product_name\']').attr('value');

		if (filter_product_name) {
			url += '&filter_product_name='+encodeURIComponent(filter_product_name);
		}

		var filter_total = $('input[name=\'filter_total\']').attr('value');

		if (filter_total) {
			url += '&filter_total='+encodeURIComponent(filter_total);
		}

		var filter_date_added = $('input[name=\'filter_date_added\']').attr('value');

		if (filter_date_added) {
			url += '&filter_date_added='+encodeURIComponent(filter_date_added);
		}

		location = url;
	}
//--></script>
<script type="text/javascript"><!--
	$(document).ready(function () {
		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	});
//--></script>
<script type="text/javascript"><!--
	$('#form input').keydown(function (e) {
		if (e.keyCode==13) {
			filter();
		}
	});
//--></script>
<?php echo $footer; ?>