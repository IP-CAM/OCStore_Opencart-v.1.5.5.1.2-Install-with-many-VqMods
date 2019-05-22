<div id="product_comments_<?php echo $product_id; ?>" style="display: view;">

  <?php
  if ($comment_status) {
  ?>



<?php if (isset($settings_widget['signer']) && $settings_widget['signer']) { ?>
<div id="record_signer" class="marginbottom5">
<div id="js_signer"></div>

<form id="form_signer">
<label>
<input id="comments_signer" type="checkbox" <?php if (isset($signer_status) && $signer_status) echo 'checked'; ?>/>
<ins class="fontsize_15 hrefajax"><?php echo $this->language->get('text_signer'); ?></ins>
</label>
</form>

</div>

<?php } ?>

<a class="textdecoration_none" onclick="$('a[href=\'#tab-comment\']').trigger('click');" href="<?php echo $href; ?>#comment-title"><ins class="fontsize_15 hrefajax textdecoration_none"><?php echo $this->language->get('text_write_review'); ?></ins></a>

  <div id="div_comment_<?php echo $product_id; ?>" >

    <div id="comment_<?php echo $product_id; ?>" >

     <?php
		echo $html_comment;
	 ?>

    </div>

    <a href="#" onclick="comment_reply('0'); return false;" id="comment_id_reply_0" class="comment_buttons">
	    <div id="comment-title"><ins id="reply_0"><?php echo $this->language->get('text_write_review'); ?></ins></div>
    </a>

   <div class="comment_work" id="comment_work_0"></div>

 <div id="reply_comments" style="display:none">

 <div id="comment_work_" class="width100 margintop10">
<?php if (isset($signer_code) && $signer_code=='customer_id') { ?>


	<div id="form_customer_none" style="display:none;"></div>
		<div class="form_customer" id="form_customer" style="display:none;">
		      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		        <div class="form_customer_content">
				  <a href="#" style="float: right;"  class="hrefajax"  onclick="$('.form_customer').hide('slide', {direction: 'up' }, 'slow'); return false;"><?php echo $this->language->get('hide_block'); ?></a>
		          <!-- <p><?php echo $text_i_am_returning_customer; ?></p> -->
		          <b><?php echo $entry_email; ?></b><br />
		          <input type="text" name="email" value="<?php echo $email; ?>" />
		          <br />
		          <br />
		          <b><?php echo $entry_password; ?></b><br />
		          <input type="password" name="password" value="<?php echo $password; ?>" />
		          <br />
		          <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
		          <br />
		          <input type="submit" value="<?php echo $button_login; ?>" class="button" />
				  <a href="<?php echo $register; ?>" class="marginleft10"><?php echo $this->language->get('error_register'); ?></a>
		          <?php if ($redirect) { ?>
		          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>#tabs" />
		          <?php } ?>
		        </div>
		      </form>

		</div>









<?php } ?>



   <form id="form_work_">
    <b><ins class="color_entry_name"><?php   echo $this->language->get('entry_name'); ?></ins></b>
    <br>
    <input type="text" name="name"  value="<?php echo $text_login; ?>" <?php

    if (isset($customer_id) && $customer_id)
    {
     //echo 'readonly="readonly" style="background-color:#DDD; color: #555;"';
    }

    ?>>

    <?php
    if (isset($customer_id) && !$customer_id)   {
     ?>
<ins><a href="#" class="textdecoration_none"><ins  id="customer_enter" class="hrefajax"><?php echo $this->language->get('text_customer_enter'); ?></ins></a>
     <?php echo $text_welcome; ?>
</ins>

     <?php

    }

    ?>
    <div style="overflow: hidden; line-height:1px; margin-top: 5px;"></div>

<?php if (isset($fields) && !empty($fields)) { ?>
<div class="marginbottom5">

<a href="#" class="hrefajax" onclick="$('.addfields').toggle(); return false;"><?php echo $this->language->get('entry_addfields_begin');  ?>
<ins class="lowercase">
<?php
  foreach   ($fields as $af_name => $af_value) {
?>
<?php echo str_replace('?','',$af_value['title']); ?>&nbsp;<?php
  }
?> </ins>
<?php echo $this->language->get('entry_addfields_end');  ?></a>
</div>

<div class="addfields" style="<?php if (!$fields_view) echo 'display: none;'; ?>">
    <?php
  foreach   ($fields as $af_name => $af_value) {
?>
 <b><ins class="color_entry_name"><?php echo $af_value['title']; ?></ins></b><br>
<textarea name="af[<?php echo $af_name; ?>]" cols="40" rows="1" class="blog-record-textarea"></textarea><br>
<?php
  }
?>
</div>
<?php   } ?>


    <b><ins class="color_entry_name"><?php echo $this->language->get('entry_comment');  ?></ins></b><br>

    <textarea name="text" id="editor_" class="blog-record-textarea editor blog-textarea_height" cols="40"></textarea>
    <br>
    <span class="text_note"><?php echo $this->language->get('text_note'); ?></span>


  <div class="bordernone overflowhidden margintop5 lineheight1"></div>


    <b><ins class="color_entry_name"><?php echo $this->language->get('entry_rating_review'); ?></ins></b>&nbsp;&nbsp;
 <?php if ($visual_editor) { ?>
<div>
    <input type="radio" class="visual_star" name="rating" alt="#8c0000" title="<?php echo $this->language->get('entry_bad'); ?> 1" value="1" >
    <input type="radio" class="visual_star" name="rating" alt="#8c4500" title="<?php echo $this->language->get('entry_bad'); ?> 2" value="2" >
    <input type="radio" class="visual_star" name="rating" alt="#b6b300" title="<?php echo $this->language->get('entry_bad'); ?> 3" value="3" >
    <input type="radio" class="visual_star" name="rating" alt="#698c00" title="<?php echo $this->language->get('entry_good'); ?> 4" value="4" >
    <input type="radio" class="visual_star" name="rating" alt="#008c00" title="<?php echo $this->language->get('entry_good'); ?> 5" value="5" >
   <div class="floatleft"  style="padding-top: 5px; "><b><ins class="color_entry_name marginleft10"><span id="hover-test" ></span></ins></b></div>
   <div  class="bordernone overflowhidden clearboth lineheight1"></div>
</div>
<?php } else { ?>
<span><ins class="color_bad"><?php echo $this->language->get('entry_bad'); ?></ins></span>&nbsp;
    <input type="radio"  name="rating" value="1" >
    <ins class="blog-ins_rating" style="">1</ins>
    <input type="radio"  name="rating" value="2" >
    <ins class="blog-ins_rating" >2</ins>
    <input type="radio"  name="rating" value="3" >
    <ins class="blog-ins_rating" >3</ins>
    <input type="radio"  name="rating" value="4" >
    <ins class="blog-ins_rating" >4</ins>
    <input type="radio"  name="rating" value="5" >
    <ins class="blog-ins_rating" >5</ins>
   &nbsp;&nbsp; <span><ins  class="color_good"><?php echo $this->language->get('entry_good'); ?></ins></span>
<?php } ?>


  <div class="bordernone overflowhidden margintop5 lineheight1"></div>

    <?php
		  if ($captcha_status)
		  { ?>
		    <div class="captcha_status">



             </div>
		    <?php
		  }
    ?>

    <div class="buttons">
      <div class="left"><a class="button button-comment" id="button-comment-0"><span><?php echo $this->language->get('button_write'); ?></span></a></div>
    </div>

    </form>
   </div>



   </div>


  </div>

  <?php } ?>


   <div class="overflowhidden">&nbsp;</div>

  </div>


<script type="text/javascript">
	function captcha_fun()
	{
	 $.ajax({  type: 'POST',
				url: 'index.php?route=record/record/captcham',
				dataType: 'html',
			   	success: function(data)
			    {
			     $('.captcha_status').html(data);
			     return false;
	  		    }
		    });

	  return false;
	}


	$.fn.comments = function(sorting , page) {
		if (typeof(sorting) == "undefined") {
		sorting = 'none';
		}

		if (typeof(page) == "undefined") {
		page = '1';
		}
		return $.ajax({
					type: 'POST',
					url: 'index.php?route=record/treecomments/comment&product_id=<?php echo $product_id; ?>&sorting='+sorting+'&page='+page+'&mylist_position=<?php echo $this->registry->get('mylist_position');?>'+'&ajax=1',
					data: { thislist: '<?php echo base64_encode(serialize($thislist)); ?>' },
					dataType: 'html',
					async: 'false',
				   	success: function(data)
				    {
				     $('#comment_<?php echo $product_id; ?>').html(data);
				    },
				    complete: function(data)
				    {
                     captcha_fun();
				    }
				  });
	}

if ($.isFunction($.fn.on)) {
	$(document).on('click','#tab-review .pagination a',  function() {

	    $('#tab-review').prepend('<div class="attention"><img src="catalog/view/theme/<?php echo $theme; ?>/image/loading.gif" alt=""> <?php echo $text_wait; ?></div>');

	    urll = this.href+'#tab-review';
	    location = urll;

	    $('.attention').remove();

		return false;
	});

} else {
	$('#tab-review .pagination a').live('click',  function() {

	    $('#tab-review').prepend('<div class="attention"><img src="catalog/view/theme/<?php echo $theme; ?>/image/loading.gif" alt=""> <?php echo $text_wait; ?></div>');

	    urll = this.href+'#tab-review';
	    location = urll;

	    $('.attention').remove();

		return false;
	});

}








	function remove_success()
	{	  $('.success, .warning, .attention').fadeIn().animate({
	   opacity: 0.0
	 }, 5000, function() {
	   $('.success, .warning, .attention').remove();
	 });
	}

	function comment_write(event)
	{

	 $('.success, .warning').remove();

	   if (typeof(event.data.sorting) == "undefined")
	   {
			sorting = 'none';
	   }
	   else
	    {	      sorting = event.data.sorting;
		}

		if (typeof(event.data.page) == "undefined")
		{
		  page = '1';
		}
		else
		{
	      page = event.data.page;
		}

	   if (typeof(this.id) == "undefined") {
	      myid = '0';
	    }  else  {
	      myid = this.id.replace('button-comment-','');	    }

	   <?php if ($visual_editor) { ?>
	   	$('#editor_'+myid).wysibb().sync();
	   <?php } ?>


	    $.ajax(
		{			type: 'POST',
			url: 'index.php?route=record/treecomments/write&product_id=<?php echo $product_id; ?>&parent=' + myid + '&page=' + page+'&mylist_position=<?php echo $this->registry->get('mylist_position');?>',
			dataType: 'html',
			//data: 'name=' + encodeURIComponent($('#comment_work_'+myid).find('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('#comment_work_'+myid).find('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('#comment_work_'+myid).find('input[name=\'rating\']:checked').val() ? $('#comment_work_'+myid).find('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('#comment_work_'+myid).find('input[name=\'captcha\']').val()),
			data: $('#form_work_'+myid).serialize(),

			beforeSend: function()
			{
	            $('.success, .warning, .attention').remove();
				$('.button-comment').hide();
				$('#comment_work_'+myid).hide();
				$('#comment_work_'+myid).before('<div class="attention"><img src="catalog/view/theme/<?php echo $theme; ?>/image/loading.gif" alt=""> <?php echo $text_wait; ?></div>');

			},
			error: function()
			{	             $('.success, .warning, .attention').remove();
	             alert('error');
			},
			success: function(data)
			{
	           $('#comment_work_'+ myid).prepend(data);
               $('.success, .attention').remove();
				if (wdata['code']=='error')
				{
					$('#comment_work_'+myid).show();

					if ( myid == '0') $('#comment-title').after('<div class="warning">' + wdata['message'] + '</div>');
					else
					$('#comment_work_'+ myid).prepend('<div class="warning">' + wdata['message'] + '</div>');
				}

				if (wdata['code']=='success')
				{
	                   	$.when($('#comment_<?php echo $product_id; ?>').comments(sorting, page )).done(function(){

	 					 if ( myid == '0')  {
	                     	$('#comment-title').after('<div class="success">' + wdata['message'] +'</div>');
	                     }  else  {
	                      $('#comment_work_' + myid).append('<div class="success">'+ wdata['message'] + '</div>');
	                     }
	                      remove_success();
	                     });

	                $('#tabs').find('a[href=\'#tab-review\']').html(wdata['review_count']);

					$('input[name=\'name\']').val(wdata['login']);
					$('.wysibb-text-editor').html('');
					$('input[name=\'rating\']:checked').attr('checked', '');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'captcha\']').val('');

				}

				$('.button-comment').show();


			}
		});
	}


	function subcaptcha(e) {
	   ic = $('.captcha').val();
	   $('.captcha').val(ic + this.value)
	   return false;
	}


$(document).ready(function(){

	var product_comments_<?php echo $product_id; ?> = $('#product_comments_<?php echo $product_id; ?>').html();
	$('#tab-review').html(product_comments_<?php echo $product_id; ?>);

	$('#product_comments_<?php echo $product_id; ?>').hide('slow').remove();

	//captcha_fun();

	<?php  if (isset($this->request->get['page'])) { ?>
	$('a[href=\'#tab-review\']').trigger('click');
	<?php  } ?>

});

</script>

<!-- <script type="text/javascript" src="catalog/view/javascript/wysibb/jquery.wysibb.js"></script> -->
<script>
<?php if ($visual_editor) { ?>

ratingdestroy = function (id) {
$('.star-rating-control').each(function() {
$(this).remove();
$(id).removeClass('star-rating-applied').show();
});
}

ratingloader = function (id) {
 $(id).rating({
  focus: function(value, link){
    var tip = $('#hover-test');
    var rcolor = $(this).attr('alt');
    tip[0].data = tip[0].data || tip.html();
    tip.html('<ins style="color:'+rcolor+';">'+link.title+'<\/ins>' || 'value: '+value);
    $('.rating-cancel').hide();
  },
  blur: function(value, link){
    var tip = $('#hover-test');
    $('#hover-test').html(tip[0].data || '');
    $('.rating-cancel').hide();
  }
 });

 $('.rating-cancel').hide();


}



	wisybbdestroy = function () {
		$('.editor').each(function() {
	  		var data = $(this).data("wbb");
			if (data) {
				 $(this).destroy();
			}
		});

		ratingdestroy('.visual_star');

	}

	wisybbinit = function(cid) {
	    if (typeof(this.id) == "undefined") {		      myid = '0';
		}  else  {
		      myid = this.id;
		}

		if (myid=='0') {	  		myid = 'editor_'+cid;
		}

		$('#'+myid).wysibb({
		  img_uploadurl:		"catalog/view/javascript/wysibb/iupload.php",
	      buttons: 'bold,italic,underline,|,img,video,link,|,fontcolor,fontsize,|'
		});
        $('.wysibb-body').css('height',$('.blog-textarea_height').css('height'));
	    $('span.powered').hide();
	}

	wisybbloader = function(cid) {
		 wisybbdestroy();
		 wisybbinit(cid);
		 ratingloader('.visual_star');
	}
<?php } ?>

$(document).ready(function(){
$('.button-comment').unbind();
$('.button-comment').bind('click',{ }, comment_write);

$('#comment_id_reply_0').click();

});
</script>
<?php if ($imagebox=='colorbox') { ?>
<script type="text/javascript">
$(document).ready(function(){
	$('.imagebox').colorbox({
		overlayClose: true,
		opacity: 0.5
	});
});
</script>
<?php } ?>

<?php if ($imagebox=='fancybox') { ?>
<script type="text/javascript">
$(document).ready(function(){
	$('.imagebox').fancybox({
		cyclic: false,
		autoDimensions: true,
		autoScale: false,
		'onComplete' : function(){
	        $.fancybox.resize();
	  }
	});
});
</script>
<?php } ?>

<?php if (isset($settings_widget['signer']) && $settings_widget['signer']) { ?>
<script>
$(document).ready(function(){

if ($.isFunction($.fn.on)) {
	$(document).on('click','#comments_signer',  function() {

	    $.ajax(
		{
			type: 'POST',
			url: 'index.php?route=module/blog/signer&id=<?php echo $product_id; ?>&pointer=product_id',
			dataType: 'html',
			data: $('#form_signer').serialize(),

			beforeSend: function()
			{
              $('#js_signer').html('');
			},
			error: function()
			{
	             $('.success, .warning, .attention').remove();
	             alert('error');
			},
			success: function(data)
			{
              $('#js_signer').html(data);

              // alert(data);

				if (sdata['code']=='error')
				{


				}

				if (sdata['code']=='success')
				{

	                if (sdata['success']=='remove')
					{
	  					$('#comments_signer').attr('checked', false);
					}
	                if (sdata['success']=='set')
					{
	  					$('#comments_signer').attr('checked', true);
					}
               }


			 }


		});


		return false;
	});

} else {

	$('#comments_signer').live('click',  function() {

	    $.ajax(
		{
			type: 'POST',
			url: 'index.php?route=module/blog/signer&id=<?php echo $product_id; ?>&pointer=product_id',
			dataType: 'html',
			data: $('#form_signer').serialize(),

			beforeSend: function()
			{
              $('#js_signer').html('');
			},
			error: function()
			{
	             $('.success, .warning, .attention').remove();
	             alert('error');
			},
			success: function(data)
			{
               $('#js_signer').html(data);

				if (sdata['code']=='error')
				{


				}

				if (sdata['code']=='success')
				{

	                if (sdata['success']=='remove')
					{
	  					$('#comments_signer').attr('checked', false);
					}
	                if (sdata['success']=='set')
					{
	  					$('#comments_signer').attr('checked', true);
					}
               }


			 }

		});

		return false;
	});

}

});
</script>
<?php } ?>

<?php if (isset($signer_code) && $signer_code=='customer_id') { ?>
<script>
$(document).ready(function(){
if ($.isFunction($.fn.on)) {
	$(document).on('click','#customer_enter',  function() {

	    $('#form_customer').show('slow');

		return false;
	});

} else {

	$('#customer_enter').live('click',  function() {

         $('#form_customer').show('slow');

		return false;
	});

}


});
</script>
<?php } ?>
