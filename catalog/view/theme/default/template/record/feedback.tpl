<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
<div>
<?php echo $content_top; ?>

  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1 class="marginbottom5"><?php echo $heading_title; ?></h1>
  <div class="record-info" style="padding: 0; margin: 0;">

	<div class="blog-small-record">
	<ul>
	     <?php if (isset ($settings_blog['view_date']) && $settings_blog['view_date'] ) { ?>
			<li class="blog-data-record"> <?php echo $date_added; ?></li>
	     <?php } ?>


	 <?php if (isset ($settings_blog['view_comments']) && $settings_blog['view_comments'] ) { ?>
	<li class="blog-comments-record"> <?php echo $this->language->get('text_feedback'); ?>:<ins style="text-decoration:none;" class="comment_count"><?php echo $comment_count; ?>
	 <!--<?php echo $text_comments; ?>--></ins></li>
	<?php } ?>
	 <?php if (isset ($settings_blog['view_viewed']) && $settings_blog['view_viewed'] ) { ?>
	<li class="blog-viewed-record"><?php echo $text_viewed; ?> <?php echo $viewed; ?></li>
	 <?php } ?>

	 <li class="floatright" style="float: right; ">
	<span typeof="v:Review-aggregate" xmlns:v="http://rdf.data-vocabulary.org/#">
	<?php if (isset ($settings_blog['view_rating']) && $settings_blog['view_rating'] ) { ?>
	<img style="border: 0px;"  title="<?php echo $rating; ?>" alt="<?php echo $rating; ?>" src="/catalog/view/theme/<?php
	$template = '/image/blogstars-'.$rating.'.png';
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . $template)) {
					$starpath = $this->config->get('config_template') . $template;
				} else {
					$starpath = 'default' . $template;
				}

	echo $starpath;
	?>">
	<?php } ?>


	    <span property="v:itemreviewed"></span> <span rel="v:rating"><span typeof="v:Rating"><span property="v:average" content="<?php echo $rating; ?>"></span><span property="v:best" content="5"></span></span></span><span property="v:votes" content="<?php echo $comment_count; ?>"></span>
	    <span property="v:count" content="<?php echo $comment_count; ?>"></span>

	</span>

	 </li>

	</ul>

 </div>


<div class="overflowhidden" style="width: 100%;">&nbsp;</div>

  <div class="blog-record-description">
  <?php echo $description; ?>
  </div>

<div class="blog-next-prev">
<?php if($record_previous['name']!='') {?>
<a href="<?php echo $record_previous['url']; ?>">&larr;&nbsp;<?php echo $record_previous['name']; ?></a>&nbsp;&nbsp;|&nbsp;
<?php } ?>

<?php if($record_next['name']!='') {?>
<a href="<?php echo $record_next['url']; ?>"><?php echo $record_next['name']; ?>&nbsp;&rarr;</a>
<?php } ?>
</div>

    <div>
      <div class="description">

     <?php
      if ($comment_status) {
      $h=end($breadcrumbs);
      $href=$h['href'];
      ?>
      <div class="comment">

        <div>
        <br>
<a onclick="$('a[href=\'#tab-comment\']').trigger('click');" href="<?php echo $href; ?>#comment-title"><?php echo $this->language->get('text_write_feedback'); ?></a>

        </div>

        <div class="overflowhidden">&nbsp;</div>

      </div>
      <?php } ?>
    </div>
  </div>

  </div>


<?php if (isset($record_comment['signer']) && $record_comment['signer']) { ?>
<div id="record_signer" class="marginbottom5">
<div id="js_signer"></div>

<form id="form_signer">
<label>
<input id="comments_signer" type="checkbox" <?php if (isset($signer_status) && $signer_status) echo 'checked'; ?>/>
<ins class="hrefajax"><?php echo $this->language->get('text_signer'); ?></ins>
</label>
</form>

</div>

<script>
if ($.isFunction($.fn.on)) {
	$(document).on('click','#comments_signer',  function() {

	    $.ajax(
		{
			type: 'POST',
			url: 'index.php?route=module/blog/signer&id=<?php echo $record_id; ?>&pointer=record_id',
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
               $('#js_signer').prepend(data);

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
			url: 'index.php?route=module/blog/signer&id=<?php echo $record_id; ?>&pointer=record_id',
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
               $('#js_signer').prepend(data);

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



</script>
<?php } ?>


  <div id="tabs" class="htabs">
    <?php
    if ($comment_status) {
    ?>
    <a href="#tab-comment"><?php echo $this->language->get('text_feedback'); ?><ins style="text-decoration: none;" class="comment_count">&nbsp;(<?php echo $comment_count; ?>)</ins></a>
    <?php } ?>

    <?php if ($images) { ?>
     <a href="#tab-images"><?php echo $tab_images; ?></a>
    <?php } ?>

    <?php if ($attribute_groups) { ?>
    <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>

    <?php if ($records) { ?>
    <a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($records); ?>)</a>
    <?php } ?>

    <?php if ($products) { ?>
    <a href="#tab-product-related"><?php echo $tab_product_related; ?> (<?php echo count($products); ?>)</a>
    <?php } ?>


</div>


  <?php
  if ($comment_status) { ?>
  <div id="tab-comment" class="tab-content">
    <div id="comment" >

    <?php
		echo $html_comment;
	?>

    </div>
    <a href="#" onclick="comment_reply('0'); return false;" id="comment_id_reply_0" class="comment_buttons">
	    <div id="comment-title"><ins id="reply_0"><?php echo $this->language->get('text_write_feedback'); ?></ins></div>
    </a>

   <div class="comment_work" id="comment_work_0"></div>

 <div id="reply_comments" style="display:none">

 <div id="comment_work_"  style="width: 100%; margin-top: 10px;">

<?php if (isset($signer_code) && $signer_code=='customer_id') { ?>
<div class="attention" id="form_customer" style="display:none;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
          <p><?php echo $text_i_am_returning_customer; ?></p>
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
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>#tabs" />
          <?php } ?>
        </div>
      </form>
<a href="<?php echo $register; ?>"><?php echo $this->language->get('error_register'); ?></a>
</div>
<?php } ?>





 <form id="form_work_">

    <b><ins class="color_entry_name"><?php   echo $entry_name; ?></ins></b>
    <br>
    <input type="text" name="name"  value="<?php echo $text_login; ?>" <?php

    if (isset($customer_id))
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

    <div class="bordernone overflowhidden margintop5 lineheight1"></div>

    <b><ins class="color_entry_name"><?php echo $this->language->get('entry_feedback'); ?></ins></b><br>

    <textarea name="text" cols="40" rows="8" id="editor_" class="blog-record-textarea editor blog-textarea_height"></textarea>
    <br>
    <span class="text_note"><?php echo $text_note; ?></span>

   <div class="bordernone overflowhidden margintop5 lineheight1"></div>

  <?php if (isset ($settings_blog['view_rating']) && $settings_blog['view_rating'] ) { ?>
    <b><ins class="color_entry_name"><?php echo $this->language->get('entry_rating'); ?></ins></b>&nbsp;&nbsp;
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
<span><ins class="color_bad"><?php echo $entry_bad; ?></ins></span>&nbsp;
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
   &nbsp;&nbsp; <span><ins  class="color_good"><?php echo $entry_good; ?></ins></span>
<?php } ?>


    <?php } else {?>
    <input type="radio" name="rating" value="5" checked style="display:none;">
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
      <div class="left"><a class="button button-comment" id="button-comment-0"><span><?php echo $button_write; ?></span></a></div>
    </div>

  </form>


</div>

</div>


</div>

  <?php } ?>


  <?php if ($products) { ?>
  <div id="tab-product-related" class="tab-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/<?php echo $theme; ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>


  <?php if ($records) { ?>
  <div id="tab-related" class="tab-content">
    <div class="box-product">
      <?php foreach ($records as $record) { ?>
      <div>
        <?php if ($record['thumb']) { ?>
        <div class="image"><a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" alt="<?php echo $record['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $record['href']; ?>"><?php echo $record['name']; ?></a></div>

        <?php if ($record['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/<?php echo $theme; ?>/image/blogstars-<?php echo $record['rating']; ?>.png" alt="<?php echo $record['comments']; ?>" /></div>
        <?php } ?>
        </div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>


  <?php if ($images) { ?>

  <div id="tab-images" class="tab-content">
    <div class="left">
      <?php if ($images) { ?>
      <div class="image-additional">
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="imagebox" rel="imagebox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>


  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>




 <?php if (isset ($settings_blog['view_share']) && $settings_blog['view_share'] ) { ?>
<div class="share floatleft"><!-- AddThis Button BEGIN -->

  <div  class="addthis_toolbox addthis_default_style ">
          <a class="addthis_button_facebook"></a>
          <a class="addthis_button_vk"></a>
          <a class="addthis_button_odnoklassniki_ru"></a>
          <a class="addthis_button_youtube"></a>
          <a class="addthis_button_twitter"></a>
          <a class="addthis_button_email"></a>
          <a class="addthis_button_compact"></a>
          </div>

          <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
          <!-- AddThis Button END -->
        </div>

  <div class="powered_blog_icon"><h3 class="blog-icon">Powered by module Blog | News | Reviews | Gallery ver.: <?php echo $blog_version; ?> (opencartadmin.com)</h3></div>
   <div style="overflow: hidden;">&nbsp;</div>
 <?php } ?>

   <?php if ($tags) {
   ?>
  <div class="tags"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>


  </div>

<?php echo $content_bottom; ?>
</div>


<script type="text/javascript">
var visual_star;
function captcha_fun()
{ $.ajax({  type: 'POST',
			url: 'index.php?route=record/record/captcham',
			dataType: 'html',
		   	success: function(data)
		    {
		     $('.captcha_status').html(data);
  		    }
	    });

  return false;
}


$.fn.comments = function(sorting , page) {	if (typeof(sorting) == "undefined") {
	sorting = 'none';
	}

	if (typeof(page) == "undefined") {
	page = '1';
	}
	return $.ajax({
				type: 'POST',
				url: 'index.php?route=record/record/comment&record_id=<?php echo $record_id; ?>&sorting='+sorting+'&page='+page+'&ajax=1',
				dataType: 'html',
				async: 'false',
			   	success: function(data)
			    {
			     $('#comment').html(data);
			    },
			    complete: function(data)
			    {
		          captcha_fun();
			    }
			  });
	}

// add sorting

//$('#comment').comments();
// captcha_fun();

if ($.isFunction($.fn.on)) {

$(document).on('click', '#comment .pagination a', function() {

    $('#comment').prepend('<div class="attention"><img src="catalog/view/theme/<?php echo $theme; ?>/image/loading.gif" alt=""> <?php echo $text_wait; ?></div>');

	urll = this.href+'#tab-review';
    location = urll;


    $('.attention').remove();

	return false;
});

} else {

$('#comment .pagination a').live('click',  function() {

    $('#comment').prepend('<div class="attention"><img src="catalog/view/theme/<?php echo $theme; ?>/image/loading.gif" alt=""> <?php echo $text_wait; ?></div>');

	urll = this.href+'#tab-review';
    location = urll;

    $('.attention').remove();

	return false;
});


}


function remove_success()
{  $('.success, .warning').fadeIn().animate({
   opacity: 0.0
 }, 5000, function() {
   $('.success, .warning').remove();
 });
}

// from config и get
function comment_write(event)
{

   $('.success, .warning').remove();

   if (typeof(event.data.sorting) == "undefined")
   {
		sorting = 'none';
   } else {      sorting = event.data.sorting;
	}

	if (typeof(event.data.page) == "undefined")
	{
	  page = '1';
	}  else  {
      page = event.data.page;
	}

   if (typeof(this.id) == "undefined") {
      myid = '0';
    }  else  {
      myid = this.id.replace('button-comment-','');    }
   <?php if ($visual_editor) { ?>
   $('#editor_'+myid).wysibb().sync();
   <?php } ?>

    $.ajax(
	{		type: 'POST',
		url: 'index.php?route=record/record/write&record_id=<?php echo $record_id; ?>&parent=' + myid + '&page=' + page,
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('#comment_work_'+myid).find('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('#comment_work_'+myid).find('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('#comment_work_'+myid).find('input[name=\'rating\']:checked').val() ? $('#comment_work_'+myid).find('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('#comment_work_'+myid).find('input[name=\'captcha\']').val()),
		beforeSend: function()
		{
            $('.success, .warning').remove();
			$('.button-comment').attr('disabled', true);
			$('#comment-title #comment').after('<div class="attention"><img src="catalog/view/theme/<?php echo $theme; ?>/image/loading.gif" alt=""> <?php echo $text_wait; ?></div>');
		},
		success: function(data)
		{
			$('.button-comment').attr('disabled', false);

			if (data.error)
			{
				if ( myid == '0') $('#comment-title').after('<div class="warning">' + data.error + '</div>');
				else
				$('#comment_work_'+ myid).prepend('<div class="warning">' + data.error + '</div>');

			}

			if (data.success)
			{
                   	$.when($('#comment').comments(sorting, page )).done(function(){

 					 if ( myid == '0')
                     {
                     	$('#comment-title').after('<div class="success">' + data.success + '</div>');
                     }
                     else
                     {
                      $('#comment_work_' + myid).append('<div class="success">'+  data.success +'</div>');
                     }
                      remove_success();

                     });


                $('.comment_count').html(data.comment_count);
               	$('.wysibb-text-editor').html('');
				$('input[name=\'name\']').val(data.login);
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');

			}
		}
	});

}

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

    if (typeof(this.id) == "undefined") {
	      myid = '0';
	}  else  {
	      myid = this.id;
	}

	if (myid=='0') {
  		myid = 'editor_'+cid;
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

<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script>


<script>
$(document).ready(function(){$('.powered_blog').hide();
});
</script>

<style>
h3.blog-icon {
  background-image: url("catalog/view/theme/<?php
	$template = '/image/ib.png';
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . $template)) {
					$ibpath = $this->config->get('config_template') . $template;
				} else {
					$ibpath = 'default' . $template;
				}

	echo $ibpath;
	?>");
  height: 16px;
  width:  16px;
  text-indent: 100%;
  white-space: nowrap;
  overflow: hidden;
  font-size:12px;
  font-weight: normal;
}
</style>


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

<?php echo $footer; ?>