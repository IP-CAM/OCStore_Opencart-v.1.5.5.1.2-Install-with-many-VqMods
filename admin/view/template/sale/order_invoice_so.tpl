<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />
</head>
<body>
<?php $iteration=1;
			foreach ($orders as $order) { 
			if ($iteration < count($orders)){?>
<div style="page-break-after: always;">
<?php }else{?>
<div>
<?php }?>
<?php $iteration++;?>
 <h1><span style="margin:0 auto">IMPLANTGROUP.RU</span><!--<img style="margin-right:15%" title="" alt="" src="view/image/logo_1.png">-->Счет на оплату</h1>
  <table class="store">
    <tr>
      <td width="30%">Банк получателя:<br />
        ОАО "Росгосстрах Банк" г. Новосибирск<br />
        ИНН  5402551920  КПП 540201001 <br />
        ООО "АБИР-Плюс"<br />
        <!--Получатель: <?php echo $order['payment_address']; ?>-->
      <td align="left" valign="top"><table>
          <tr>
            <td>БИК </td>
            <td>045004794</td>
          </tr>
          <tr>
            <td>Сч. №</td>
            <td>30101810800000000794</td>
          </tr>
          <tr>
            <td>Сч. №</td>
            <td>40702810500030004707</td>
          </tr>
        </table></td>
    </tr>
  </table>
                <b style="font-size: 16px;">Счет на оплату № <?php echo $order['order_id']; ?> от <?php echo $order['date_added']; ?></b>
  <table class="address">
    <tr >
      <td style="font-size: 16px;" width="30%">Поставщик:</td>
      <td ><b>ООО "АБИР-Плюс", ИНН 5402551920, КПП 540201001, 630111, Россия, Новосибирская область, Новосибирск, ул. Кропоткина, дом 271, офис 409, тел.: +7 (383) 303-43-32</b></td>
    </tr>
    <tr>
      <td style="font-size: 16px;">Грузоотправитель:</td>
      <td ><b>ООО "АБИР-Плюс", ИНН 5402551920, КПП 540201001, 630111, Россия, Новосибирская область, Новосибирск, ул. Кропоткина, дом 271, офис 409, тел.: +7 (383) 303-43-32</b></td>
    </tr>
    <tr>
      <td style="font-size: 16px;">Покупатель:</td>
      <td ><b><?php echo $order['payment_address']; ?></b></td>
    </tr>
    <tr>
      <td style="font-size: 16px;">Грузополучатель:</td>
      <td ><b><?php echo $order['payment_address']; ?></b></td>
    </tr>
  </table><br />
  <table class="product">
    <tr class="heading">
      <td><b>№</b></td>
      <td><b><?php echo $column_model; ?></b></td>
      <td><b><?php echo $column_product; ?></b></td>
      <td ><b><?php echo $column_quantity; ?></b></td>
      <td ><b><?php echo $column_price; ?></b></td>
      <td ><b><?php echo $column_total; $n=0;?></b></td>
    </tr>
    <?php foreach ($order['product'] as $product) { ?>
    <tr>
      <td><?php echo $n=$n+1; ?></td>
      <td><?php echo $product['model']; ?></td>
      <td><?php echo $product['name']; ?>
      <td align="right"><?php echo $product['quantity']; ?></td>
      <td align="right"><?php echo $product['price']; ?></td>
      <td align="right"><?php echo $product['total']; ?></td>
    </tr>
    <?php } ?>
    <?php foreach ($order['total'] as $total) { ?>
    <tr>
      <td align="right" colspan="5"><b><?php echo $total['title']; ?>:</b></td>
      <td align="right"><?php echo $total['text']; ?></td>
    </tr>
    <?php } ?>
  </table>
<br />
  Всего наименований <?php echo $n; ?> на сумму <?php echo $total_text; ?><br />
  <b><?php echo $total_2_str; ?></b><br /><br />
  <table width="100%">
    <tr >
      <td><b>Руководитель</b></td>
      <td><b>Генеральный директор</b></td>
      <td><b></b></td>
      <td align="right"><b>Федяев И.Е.</b></td>
    </tr>
    <tr>
      <td><b></b></td>
      <td>должность</td>
      <td>подпись</td>
      <td align="right">расшифровка подписи</td>
    </tr>
    <tr >
      <td></td>
      <td><b>Главный бухгалтер</b></td>
      <td><b></b></td>
      <td align="right"><b>Федяев И.Е.</b></td>
    </tr>
    <tr>
      <td><b></b></td>
      <td>должность</td>
      <td>подпись</td>
      <td align="right">расшифровка подписи</td>
    </tr>
  </table>
</div>
<?php } ?>
</body>
</html>