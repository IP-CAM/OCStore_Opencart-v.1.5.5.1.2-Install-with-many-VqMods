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
<?php echo $header; ?>
<div id="content">
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/payment/shoputils_robokassa.png"><?php echo $heading_title; ?></h1>
            <div class="buttons">
              <?php if ($loader) { ?>
                <a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
              <?php } ?>
                <a onclick="location='<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
            </div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td colspan="2">
                            <a href="http://opencart.shoputils.ru" target="_blank"><img src="http://opencart.shoputils.ru/image/data/logo/logo-for-modules.png" alt="http://opencart.shoputils.ru" /></a>
                            <?php if ($loader) { ?>
                                <br /><br /><?php echo $entry_key; ?>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <?php if ($loader) { ?>
                            <td>
                                <textarea rows="13" cols="50" name="lic_data"></textarea>
                            </td>
                        <?php } else { ?>
                            <td colspan="2">
                                <?php echo $error_loader; ?>
                            </td>
                        <?php } ?>
                        <td style="vertical-align:top;">
                            <?php if ($loader) { ?>
                            <?php echo $text_get_key; ?>
                            <?php } ?>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<?php echo $footer; ?>