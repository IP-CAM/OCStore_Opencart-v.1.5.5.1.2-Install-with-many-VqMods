<?php echo $header; ?>
<script type="text/javascript" src="../catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js"></script>
<link href="../catalog/view/javascript/jquery/colorbox/colorbox.css" rel="stylesheet">
<style>
.autor {
	text-align: left;
  font-size: 11px;
  font-style: normal;
  color: GREEN;
  padding: 15px 0px 0px 0px;
}
.box > .heading .buttons {
padding-top: 0;
margin-top: -25px;
}
</style>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="autor">&nbsp;&nbsp;Разработчик: Игорь Голубев (www.igg-eco.ru, ambalocha69@yandex.ru). Официальная страница модуля: http://igg-eco.ru/modul-multy-curr-1-5.html</div>
    <div class="buttons"><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span>Выйти</span></a></div>
  </div>
  <div class="content">
    <div id="tabs" class="htabs"><a href="#tab-valuta">Валюты</a><a href="#tab-help">Утилиты</a><a href="#tab-options">Настройка</a><a href="#tab-history">История</a><a href="#tab-notes">Версия</a></div>
      <div id="tab-valuta"><table class="list">
        <thead>
          <tr>
            <td class="left" WIDTH="5%">ID</td>
            <td class="left" WIDTH="5%">Код</td>
            <td class="left" WIDTH="20%">Валюта</td>
            <td class="left" WIDTH="20%" colspan="2">Курс к валюте по умолчанию</td>
            <td class="left" WIDTH="15%">Товаров с данной валютой</td>
            <td class="left" WIDTH="15%">Задать новый курс</td>
            <td class="right">Действие:</td>
          </tr>
          <tr><td colspan="8"></td></tr>
        </thead>
      <?php foreach ($currencies as $curr) { ?>
        <tbody>
          <tr>
            <td class="left"><?php echo $curr['currency_id']; ?></td>
            <td class="left"><?php echo $curr['code']; ?></td>
            <td class="left"><?php echo $curr['title']; ?></td>
            <td class="left" id="td_val1<?php echo $curr['currency_id']; ?>"><?php echo $curr['value']; ?></td>
            <td class="left" id="td_val2<?php echo $curr['currency_id']; ?>">(<?php echo (1/$curr['value']); ?>)</td>
            <td class="left"><input type="text" disabled="disabled" value="<?php echo $curr['total']; ?>"></td>
            <td class="left"><input type="text" <?php if ($curr['value']==1) { ?>disabled="disabled" <?php } ?>id="mkurs_<?php echo $curr['currency_id']; ?>" value="<?php echo $curr['last']; ?>"></td>
            <td class="right"><?php if ($curr['value']!=1) { ?><img id="mimg_<?php echo $curr['currency_id']; ?>" style="display:none;" src="view/image/loading.gif"/><a onclick="SendKurs (<?php echo $curr['currency_id']; ?>,'mkurs_<?php echo $curr['currency_id']; ?>', 'mimg_<?php echo $curr['currency_id']; ?>');" class="button"><span>Пересчитать цены по новому курсу!</span></a><?php } ?></td>
          </tr>
        </tbody>  
      <?php } ?>
        <tbody>
          <tr><td class="left" colspan="7"></td>
          <td class="right"><a id="addcurr" onclick="AddCurrency ();" class="colorbox button"><span>Добавить валюту</span></a></td>
          </tr>
        </tbody>  
      </table>
    </div>
      
    <div id="tab-help">
      <b>Вы можете сделать пересчет цен каждого производителя по индивидуальному курсу (общий пересчет по выбранной валюте установит общий курс для всех производителей):</b>
      <table class="list">
        <thead>
          <tr>
            <td class="left" WIDTH="10%"></td>
            <td class="left" WIDTH="5%">Код</td>
            <td class="left" WIDTH="10%">Валюта</td>
            <td class="left" WIDTH="10%">Производитель</td>
            <td class="left" WIDTH="15%" colspan="2">Курс к валюте по умолчанию</td>
            <td class="left" WIDTH="15%">Товаров с данной валютой</td>
            <td class="left" WIDTH="10%">Задать новый курс</td>
            <td class="right">Действие:</td>
          </tr>
          <tr><td colspan="8"></td></tr>
        </thead>
      <?php foreach ($currencies as $curr) { ?>
        <?php if ($curr['value']!=1) { ?>
          <?php foreach ($manufacturer as $vendor) { ?>
            <?php if ($vendor['totals'][$curr['currency_id']]['total']) { ?>
              <tbody>
                <tr>
              <td class="right">Задать свой курс для:&nbsp;&nbsp;&nbsp;</td>
              <td class="left"><?php echo $curr['code']; ?></td>
              <td class="left"><?php echo $curr['title']; ?></td>
              <td class="left"><?php echo $vendor['name']; ?></td>
              <td class="left"><?php echo $curr['value']; ?></td>
              <td class="left">(<?php echo (1/$curr['value']); ?>)</td>
              <td class="left"><input type="text"  disabled="disabled" value="<?php echo $vendor['totals'][$curr['currency_id']]['total']; ?>"></td>
              <td class="left"><input type="text" id="vendor_kurs_<?php echo $curr['currency_id']; ?>" value="<?php echo $curr['value']; ?>"></td>
              <td class="right"><?php if ($curr['value']!=1) { ?><img id="img_<?php echo $curr['currency_id']; ?>_<?php echo $vendor['manufacturer_id']; ?>" style="display:none;" src="view/image/loading.gif"/><?php } ?><a onclick="SendKursVendor (<?php echo $curr['currency_id']; ?>,'vendor_kurs_<?php echo $curr['currency_id']; ?>', 'img_<?php echo $curr['currency_id']; ?>_<?php echo $vendor['manufacturer_id']; ?>', <?php echo $vendor['manufacturer_id']; ?>);" class="button"><span>Пересчитать цены по новому курсу!</span></a></td>
                </tr>
              </tbody>  
            <?php } ?>
          <?php } ?>
        <?php } ?>
      <?php } ?>
      </table>
</div>
    
    <div id="tab-options">
      <b>Дополнительные настройки:</b>
      <p>Округление цен при пересчете:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="round_mode">
          <option <?php if ($round_mode==-2) { ?> selected="selected"<?php } ?> value="-2">До сотен</option>
          <option <?php if ($round_mode==-1) { ?> selected="selected"<?php } ?> value="-1">До десятков</option>
          <option <?php if ($round_mode==0)  { ?> selected="selected"<?php } ?> value="0">До ближайшего целого</option>
          <option <?php if ($round_mode==1)  { ?> selected="selected"<?php } ?> value="1">До одного знака после запятой</option>
          <option <?php if ($round_mode==2)  { ?> selected="selected"<?php } ?> value="2">До двух знаков после запятой</option>
          <option <?php if ($round_mode==3)  { ?> selected="selected"<?php } ?> value="3">До трех знаков после запятой</option>
        </select>
      </p>
      <p>Сохранять новый курс в <b>"Сиcтема>Локализация->Валюты"</b>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="save_mode">
          <option <?php if ($save_mode==0)  { ?> selected="selected"<?php } ?> value="0">Не сохранять</option>
          <option <?php if ($save_mode==1)  { ?> selected="selected"<?php } ?> value="1">Сохранять</option>
        </select>
      </p>
      <div>
      <img id="img_save" style="display:none;" src="view/image/loading.gif"/>
      <a onclick="SaveSettings('img_save');" class="button"><span>Сохранить настройки</span></a>
      </div>
    </div>

    <div id="tab-history">
      <b>История операций:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
      <img id="img_his" style="display:none;" src="view/image/loading.gif"/>
      <a onclick="delHistory('img_his');" class="button"><span>Очистить</span></a></b>
      <table class="list">
        <thead>
          <tr>
            <td class="left" WIDTH="20%">Дата</td>
            <td class="left" WIDTH="20%">Инициатор</td>
            <td class="left" WIDTH="20%">Валюта (ID)</td>
            <td class="left" WIDTH="20%">Курс к валюте по умолчанию</td>
            <td class="left" WIDTH="20%">Пересчитано товаров с данной валютой</td>
          </tr>
        </thead>
        <tbody id="history">
          <?php foreach ($history as $his) { ?>
          <tr>
            <td class="left"><?php echo $his['date']; ?></td>
            <td class="left"><?php echo $his['user']; ?></td>
            <td class="left"><?php echo $his['code']; ?></td>
            <td class="left"><?php echo $his['kurs']; ?></td>
            <td class="left"><?php echo $his['total']; ?></td>
         </tr>
          <?php } ?>
        </tbody>  
    </table></div>

    <div id="tab-notes">
      <b>Список изменений:</b>
      <table class="list">
        <thead>
          <tr>
            <td class="left" WIDTH="10%">Версия</td>
            <td class="left" WIDTH="10%">Дата</td>
            <td class="left" WIDTH="80%">Изменение</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1.5.5.1</td>
            <td>13.01.2015</td>
            <td class="left">Добавлена функция добавления валют в "Сиcтема>Локализация->Валюты"</td>
         </tr>
            <td>1.5.5.1</td>
            <td>13.01.2015</td>
            <td class="left">Отключена очистка таблиц при переустановке модуля</td>
         </tr>
          <tr>
            <td>1.5.5.1</td>
            <td>13.01.2015</td>
            <td class="left">Добавлена дополнительная настройка "Сохранять новый курс в Сиcтема>Локализация->Валюты"</td>
         </tr>
          <tr>
            <td>1.5.5</td>
            <td>11.01.2015</td>
            <td class="left">В графе "Задать новый курс" отображается последний установленный курс</td>
         </tr>
          <tr>
            <td>1.5.5</td>
            <td>11.01.2015</td>
            <td class="left">Добавлена возможность задать индивидуальный курс пересчета для каждого производителя</td>
         </tr>
          <tr>
            <td>1.5.5</td>
            <td>11.01.2015</td>
            <td class="left">Добавлена возможность копирования товара с сохранением валютных настроек</td>
         </tr>
          <tr>
            <td>1.5.5</td>
            <td>11.01.2015</td>
            <td class="left">Добавлен автопересчет цены опций, скидок и акций при изменении их валютной цены</td>
         </tr>
          <tr>
            <td>1.5.5</td>
            <td>11.01.2015</td>
            <td class="left">Добавлена возможность указания различных режимов округления при пересчете цен</td>
         </tr>
          <tr>
            <td>1.5.5</td>
            <td>11.01.2015</td>
            <td class="left">Добавлена возможность очистки истории изменений курсов</td>
         </tr>
          <tr>
            <td>1.5.5</td>
            <td>11.01.2015</td>
            <td class="left">Добавлен английский язык для страницы списка модулей.</td>
         </tr>
          <tr>
            <td>1.5.5</td>
            <td>11.01.2015</td>
            <td class="left">Полностью переработан интерфейс модуля</td>
         </tr>
          <tr>
            <td>1.5.5</td>
            <td>11.01.2015</td>
            <td class="left">Выявлена и исправлена ошибка сохранения валютной цены для основной цены продукта при создании нового товара</td>
         </tr>
          <tr>
            <td>1.5</td>
            <td>02.12.2014</td>
            <td class="left">Добавлена возможность задать валютную цену для акций и скидок</td>
         </tr>
          <tr>
            <td>1.5</td>
            <td>02.12.2014</td>
            <td class="left">Добавлена история  изменений курсов</td>
         </tr>
        </tbody>  
    </table></div>


  </div>
</div>
<script>   
$('#tabs a').tabs(); 

function delHistory(img_load) {
$.ajax({
type:'post',
url: 'index.php?route=module/multycurrgoods&token=<?php echo $token; ?>',
data: 'id=delhis',
dataType: 'html',
beforeSend: function() { document.getElementById(img_load).style.display="inline"; },
success: function() {
  alert ("История удалена");
  $( '#history' ).replaceWith('');
  document.getElementById(img_load).style.display="none";
  },
error: function(xhr, ajaxOptions, thrownError) {
  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
  }
});
}

function SaveSettings(img_load) {
$.ajax({
type:'post',
url: 'index.php?route=module/multycurrgoods&token=<?php echo $token; ?>',
data: 'id=save&round_mode=' + $('select[name=\'round_mode\']').attr('value') + '&save_mode=' + $('select[name=\'save_mode\']').attr('value'),
dataType: 'html',
beforeSend: function() { document.getElementById(img_load).style.display="inline"; },
success: function(html) {
  document.getElementById(img_load).style.display="none";
  alert ("Настройки сохранены");
  },
error: function(xhr, ajaxOptions, thrownError) {
  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
  }
});
}

function SendKursVendor(id,kurs, img_load, vendor) {
    $.ajax({
    url: 'index.php?route=module/multycurrgoods&token=<?php echo $token; ?>',
    data: 'id=' + id + '&kurs=' + document.getElementById(kurs).value + '&vendor=' + vendor,      
    dataType: 'json',
    beforeSend: function() { document.getElementById(img_load).style.display="inline"; },
    success: function(json) {
      document.getElementById(img_load).style.display="none";
      alert ("Завершено!"); 
      html = '<tbody id="history">';
      for(var i = 0; i < json.length; i++) {
        html += ' <tr><td class="left">'+json[i]['date']+'</td>';
        html += '     <td class="left">'+json[i]['user']+'</td>';
        html += '     <td class="left">'+json[i]['code']+'</td>';
        html += '     <td class="left">'+json[i]['kurs']+'</td>';
        html += '     <td class="left">'+json[i]['total']+'</td></tr>';
        }
      html += '</tbody>';
      $( '#history' ).replaceWith(html);
      <?php if ($save_mode==1)  { ?> 
        var sel1 = '#td_val1' + json[json.length-1]['code'];
        var sel2 = '#td_val2' + json[json.length-1]['code'];
        html = '<td class="left" id="' + 'td_val1' + json[json.length-1]['code'] + '">' + json[json.length-1]['kurs'] + '</td>';
        $( sel1 ).replaceWith(html);
        html = '<td class="left" id="' + 'td_val2' + json[json.length-1]['code'] + '">(' + 1/json[json.length-1]['kurs'] + ')' + '</td>';
        $( sel2 ).replaceWith(html);
      <?php } ?> 
      },
    error: function(xhr, ajaxOptions, thrownError) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
    });
    };
function SendKurs(id,kurs, img_load) {
    $.ajax({
    url: 'index.php?route=module/multycurrgoods&token=<?php echo $token; ?>',
    data: 'id=' + id + '&kurs=' + document.getElementById(kurs).value + '&vendor=0',      
    dataType: 'json',
    beforeSend: function() { document.getElementById(img_load).style.display="inline"; },
    success: function(json) {
      document.getElementById(img_load).style.display="none";
      alert ("Завершено!"); 
      html = '<tbody id="history">';
      for(var i = 0; i < json.length; i++) {
        html += ' <tr><td class="left">'+json[i]['date']+'</td>';
        html += '     <td class="left">'+json[i]['user']+'</td>';
        html += '     <td class="left">'+json[i]['code']+'</td>';
        html += '     <td class="left">'+json[i]['kurs']+'</td>';
        html += '     <td class="left">'+json[i]['total']+'</td></tr>';
        }
      html += '</tbody>';
      $( '#history' ).replaceWith(html);
      <?php if ($save_mode==1)  { ?> 
        var sel1 = '#td_val1' + json[json.length-1]['code'];
        var sel2 = '#td_val2' + json[json.length-1]['code'];
        html = '<td class="left" id="' + 'td_val1' + json[json.length-1]['code'] + '">' + json[json.length-1]['kurs'] + '</td>';
        $( sel1 ).replaceWith(html);
        html = '<td class="left" id="' + 'td_val2' + json[json.length-1]['code'] + '">(' + 1/json[json.length-1]['kurs'] + ')' + '</td>';
        $( sel2 ).replaceWith(html);
      <?php } ?> 
      },
    error: function(xhr, ajaxOptions, thrownError) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
    });
    }
    
function AddCurrency() {
    var s = '<div style="text-align: center;">';
    s    += 'ДОБАВЛЕНИЕ ВАЛЮТЫ';    
    s    += '</div><br />';

    s    += '<table>';    

    s    += '<tr style="height: 40px;">';    
    s    += '<td style="text-align: left;padding-left: 20px;">';
    s    += 'Название валюты:</td><td>';    
    s    += '<input  name="field1" style="margin-left: 100px;width: 220px;" type="text" value="">';    
    s    += '</td>';
    s    += '</tr>';    

    s    += '<tr style="height: 40px;">';    
    s    += '<td style="text-align: left;padding-left: 20px;">';
    s    += 'Код:</td><td>';    
    s    += '<input  name="field2" style="margin-left: 100px;width: 220px;" type="text" value="">';   
    s    += '</td>';
    s    += '</tr>';    

    s    += '<tr style="height: 40px;">';    
    s    += '<td style="text-align: left;padding-left: 20px;">';
    s    += 'Символ слева:</td><td>';    
    s    += '<input  name="field3" style="margin-left: 100px;width: 220px;" type="text" value="">';    
    s    += '</td>';
    s    += '</tr>';    

    s    += '<tr style="height: 40px;">';    
    s    += '<td style="text-align: left;padding-left: 20px;">';
    s    += 'Символ справа:</td><td>';    
    s    += '<input  name="field4" style="margin-left: 100px;width: 220px;" type="text" value="">';    
    s    += '</td>';
    s    += '</tr>';    

    s    += '<tr style="height: 40px;">';    
    s    += '<td style="text-align: left;padding-left: 20px;">';
    s    += 'Количество знаков после запятой:</td><td>';    
    s    += '<input  name="field5" style="margin-left: 100px;width: 220px;" type="text" value="">';
    s    += '</td>';
    s    += '</tr>';    

    s    += '<tr style="height: 40px;">';    
    s    += '<td style="text-align: left;padding-left: 20px;">';
    s    += 'Значение:</td><td>';    
    s    += '<input  name="field6" style="margin-left: 100px;width: 220px;" type="text" value="">';
    s    += '</td>';
    s    += '</tr>';    

    s    += '<tr style="height: 40px;">';    
    s    += '<td style="text-align: left;padding-left: 20px;">';
    s    += 'Статус:</td><td>';    
    s    += '<select name="field7" style="margin-left: 100px;width: 225px;">';    
    s    += '<option value="0">Отключено</option>';    
    s    += '<option value="1">Включено</option>';    
    s    += '</select>';    
    s    += '</td>';
    s    += '</tr>';    

    s    += '<tr style="height: 40px;">';    
    s    += '<td style="text-align: center;">';
    s    += '<div class="buttons"><img id="img_addcurr" style="display:none;" src="view/image/loading.gif"/><a onclick="AddCurrencyToSystem();" class="button">Сохранить</a></div>';
    s    += '</td>';
    s    += '<td><div class="buttons"><a onclick="AddCurrencyClose();" class="button" style="margin-left: 95px;">Выход</a></div>';    
    s    += '</td>';
    s    += '</tr>';    

    s    += '</table>';    

    $('#addcurr').colorbox({html:s,width:"600px", height:"400px", title:"ВАЛЮТЫ"});
  }
function AddCurrencyToSystem() {
  var field1 = $('input[name=\'field1\']').attr('value');
  if (!field1) {alert("Ошибка: не задано название валюты!"); return;}
  <?php foreach ($currencies as $curr) { ?>
        if (field1=="<?php echo $curr['title']; ?>") {alert("Ошибка: валюта с таким названием уже существует!"); return;}
  <?php } ?>
  var field2 = $('input[name=\'field2\']').attr('value');
  if (!field2) {alert("Ошибка: не задан код валюты!"); return;}
  var field3 = $('input[name=\'field3\']').attr('value');
  var field4 = $('input[name=\'field4\']').attr('value');
  var field5 = $('input[name=\'field5\']').attr('value');
  var field6 = $('input[name=\'field6\']').attr('value');
  if (!field6) {alert("Ошибка: не задано значение валюты!"); return;}
  var field7 = $('select[name=\'field7\']').attr('value');

    $.ajax({
    url: 'index.php?route=module/multycurrgoods&token=<?php echo $token; ?>',
    data: 'addcurr=1' + '&field1=' + field1 + '&field2=' + field2 + '&field3=' + field3 + '&field4=' + field4 + '&field5=' + field5 + '&field6=' + field6 + '&field7=' + field7,      
    beforeSend: function() { document.getElementById('img_addcurr').style.display="inline"; },
    success: function() {
      location = 'index.php?route=module/multycurrgoods&token=<?php echo $token; ?>';
      },
    error: function(xhr, ajaxOptions, thrownError) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
    });

  }  
function AddCurrencyClose() { $('.colorbox').colorbox.close();  }  
</script> 
<?php echo $footer; ?>