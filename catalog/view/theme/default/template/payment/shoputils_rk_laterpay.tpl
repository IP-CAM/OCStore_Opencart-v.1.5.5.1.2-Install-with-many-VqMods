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
<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en">
  <head>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  </head>
  <body>
    <form action="<?php echo $action ?>" method="post" id="checkout">
        <?php foreach ($parameters as $key => $value) { ?>
          <?php if (is_array($value)) { ?>
            <?php foreach ($value as $val) { ?>
              <input type="hidden" name="<?php echo $key; ?>" value="<?php echo $val; ?>"/>
            <?php } ?>
          <?php } else { ?>
              <input type="hidden" name="<?php echo $key; ?>" value="<?php echo $value; ?>"/>
          <?php } ?>
        <?php } ?>
    </form>
    <script type="text/javascript"><!--
    $(document).ready(function() {
      document.forms['checkout'].submit();
    });
    //--></script>
  </body>
</html>