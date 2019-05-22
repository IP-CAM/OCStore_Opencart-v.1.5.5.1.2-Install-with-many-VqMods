	<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/backup.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
	  <!-- <a onclick="$('#form').submit();" class="button"><span><?php echo $button_import; ?></span></a> -->
	  <a onclick="location='<?php echo $export; ?>'" class="button"><span><?php echo $button_export; ?></span></a></div>
    </div>
    <div class="content">
	  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          
		  <tr>
            <td colspan="2"><div class="warning">ВНИМАНИЕ! Модуль находится в режиме бета-тестирования, поэтому рекомендую предварительно создать резервную копию базы данных!</div></td>
          </tr>
		  <tr>
            <td colspan="2"><?php echo $entry_description; ?></td>
          </tr>
          <tr>
            <td width="25%"><?php echo $entry_restore; ?></td>
            <td><input id="uploadButton" type="file" name="upload" class="button"/></td>
          </tr>
		  <tr>

          </tr>
        </table>
      </form>

	   <div>
        <img style="display:none; float:left;" id="load" /> 
		<div id="status" style="display:none; background: #fff url(<?php echo HTTP_SERVER.'view/image/'?>load.gif) no-repeat; hieght: 20px; margin-left: 10px; padding-left: 25px;  font-size:17px; height:20px;">Загрузка файла...</div>
		<div id="ajax_content" style="margin-left: 10px; color: red;"></div>
	   </div>
	<div>
		<iframe frameborder="0" allowtransparency="true" scrolling="no" src="https://money.yandex.ru/embed/donate.xml?account=41001238028155&quickpay=donate&payment-type-choice=on&default-sum=100&targets=%D0%94%D0%BB%D1%8F+%D0%BC%D0%BE%D1%82%D0%B8%D0%B2%D0%B0%D1%86%D0%B8%D0%B8+%3A)&project-name=&project-site=&button-text=05&comment=on&hint=%D0%95%D1%81%D1%82%D1%8C+%D0%B8%D0%B4%D0%B5%D1%8F+%D0%BA%D0%B0%D0%BA+%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C+%D0%BC%D0%BE%D0%B4%D1%83%D0%BB%D1%8C+%D0%BB%D1%83%D1%87%D1%88%D0%B5%3F+%D0%9F%D0%B8%D1%88%D0%B8!" width="507" height="150"></iframe>
	</div>
	<span>Есть вопросы? Пишите в Skype: havisaid</span>
    </div>
	<script>
	jQuery.fn.fileupload = function(opt){
	  $this = $(this);
	  set = {
		'url':'<?php echo HTTP_SERVER."controller/tool"?>/ajax.php',
		'dataType':'json'
	  }
	  if(opt){ $.extend(set,opt); }
	  return this.each(function(){
		$this.change(function(){
			  $("img#load").attr("src", "<?php echo HTTP_SERVER."view/image/"?>load.gif");
				$("#status").text("Загрузка файла");
				$("#status").show();
		  xhr = new XMLHttpRequest;
		  xhr.open("POST", set.url+'?qqfile='+$this.val(), true);
		  xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
		  xhr.setRequestHeader("X-File-Name", encodeURIComponent($this.val()));
		  xhr.setRequestHeader("Content-Type", "application/octet-stream");
		  xhr.send(this.files[0]);
		  xhr.onreadystatechange = function(){            
			if (xhr.readyState == 4){ 
			  if(set.dataType == 'json'){
				  response = $.parseJSON(xhr.responseText);
				  if(response == null) { response = {}; } 
			  }else{
				response = xhr.responseText;
			  }
			  set.success.call("",response);
			}
		  }
		});
	  });
	};

	function repeat_import(file) {
 	var fileName = file;
		$.ajax({
				url: "<?php echo HTTP_SERVER;?>index.php?route=tool/import&token=<?php echo $_GET['token'];?>&file="+fileName,
				timeout: 30000,
				success: function(data, textStatus){
							
							$("#files").hide();
							$("#status").text("Импорт данных в базу...");
							//$("#progress-bar").append("I");
							//alert(fileName);
							
							if (data.indexOf('The End') != -1) {
								$("#status").hide();
								$("#ajax_content").html("<div class=\"success\">Поздравляем! Импорт успешно завершен!</div>");
								//alert(data);

							}
							else if (data.indexOf('Ошибка') != -1) {
								//alert(data);
								$("#load").hide();
								$("#status").text('Не удалось выполнить импорт!');
								$("#ajax_content").append("Текст ошибки: " + data);
							}
							else if (data.indexOf('продолжаем') != -1) {
								//alert(data);
								$("#ajax_content").html("<p>" + data + "</p>");
								repeat_import(fileName);
							} else {
								$("#load").hide();
								$("#status").text('ОШИБКА! Что-то пошло не так...');
								$("#ajax_content").text("Текст ошибки: " + data);
							}								
						}
		});
	}
    </script>
	<script>
	  $("input[type=file]").fileupload({
		url:"<?php echo HTTP_SERVER."controller/tool"?>/ajax.php",
		success:function(dat){
		  if(dat.status == 'ok') { 							
			// убираем картинку загрузки файла
			  $("#status").text('Загрузка завершена!');
			  $("img#load").hide(); 
			  //alert('Загрузка завершена!');
		      repeat_import(dat.file);
		  }
		},
		dataType:'json'
	  });
	</script>
	<div id="progress-bar">
    </div>
  </div>
</div>
<?php echo $footer; ?>