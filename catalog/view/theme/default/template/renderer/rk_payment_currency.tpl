<?php 
/*
 * Shoputils
 *
 * ПРИМЕЧАНИЕ К ЛИЦЕНЗИОННОМУ СОГЛАШЕНИЮ
 *
 * Этот файл связан лицензионным соглашением, которое можно найти в архиве,
 * вместе с этим файлом. Файл лицензии называется: LICENSE.1.5.x.RUS.txt
 * Так же лицензионное соглашение можно найти по адресу:
 * http://opencart.shoputils.ru/LICENSE.1.5.x.RUS.txt
 * 
 * =================================================================
 * OPENCART 1.5.x ПРИМЕЧАНИЕ ПО ИСПОЛЬЗОВАНИЮ
 * =================================================================
 *  Этот файл предназначен для Opencart 1.5.x. Shoputils не
 *  гарантирует правильную работу этого расширения на любой другой 
 *  версии Opencart, кроме Opencart 1.5.x. 
 *  Shoputils не поддерживает программное обеспечение для других 
 *  версий Opencart.
 * =================================================================
*/
?>
<style type="text/css">
a.im_expand {
    color: #000;
}
</style>
<?php if ($payment_currencies) { ?>
<label for="shoputils_rk">
<ul style="padding: 2px 0; margin: 0">
<?php foreach ($payment_currencies as $key => $data) { ?>
        <li<?php echo !$data['expand'] ? ' style="list-style: none"' : ''; ?>><?php echo $data['expand'] ? '<a class="im_expand_' . $id . '" id="'.$key.'">' : ''; ?>
                <?php echo $data['name'];?>
            <?php echo $data['expand'] ? '</a>' : ''; ?>
            <div style="<?php echo $data['expand'] ? 'display:none; ' : ' '?>text-align: left; margin: 5px;"<?php echo $data['expand'] ? ' class="blocks"' : ''?> id="block-<?php echo $id?>-<?php echo $key;?>">
                <?php foreach ($data['currencies'] as $key => $currency) { ?>
                <div style="display: inline-block; font-size: 8px; padding: 0 4px 4px 4px; text-align: center">
                    <!-- <a href="<?php //echo $currency['url'];?>" title="<?php //echo $currency['name']; ?>" target="_blank"> -->
                    <img style="padding: 2px 2px 3px 2px; vertical-align: middle;" width="<?php echo $currency['image_width'];?>" height="<?php echo $currency['image_height'];?>" src="<?php echo $currency['image'];?>" title="<?php echo $currency['name']; ?>"/>
                    <!-- </a> -->
                    <br>
                    <span style="border-top: dotted 1px;">
                        <?php echo $currency['name']; ?>
                    </span>
                </div>
                <?php } ?>
            </div>
        </li>
<?php } ?>
</ul>
</label>
<?php } ?>
<script type="text/javascript">
    $('.im_expand_<?php echo $id?>').click(function() {
        var id = $(this).attr('id');
        if ($('#block-<?php echo $id?>-' + id).is(":visible")) {
            $('#block-<?php echo $id?>-' + id).hide(200);
        } else {
            $('.blocks').hide(200);
            $('#block-<?php echo $id?>-' + id).show(200);
        }
    });
</script>