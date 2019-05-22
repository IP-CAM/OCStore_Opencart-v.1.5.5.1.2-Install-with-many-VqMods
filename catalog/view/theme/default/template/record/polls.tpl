<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content" style=" margin-bottom: 120px; ">
<div style="margin-left: 10px;">
<?php echo $content_top; ?>

  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

  <h1 style="margin-bottom: 5px;"><?php echo $heading_title; ?></h1>
  <div class="record-info">

 <div style="font-size: 12px; color: #999; font-weight: normal; margin-bottom: 10px; border-bottom: 1px solid #EEE;">
 <span style=""><?php echo $date_added; ?></span>
 <ins style="text-decoration: none;margin-left: 10px;">

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



 </ins>
 <span style="float:right;">
  <ins style="text-decoration: none;margin-left: 10px;"><?php echo $text_viewed; ?> <?php echo $viewed; ?></ins></span>
 </div>

  <div style="font-size: 16px; font-weight: normal">
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


    <div class="right">
      <div class="description">

     <?php
      if ($comment_status)
      {
      $h=end($breadcrumbs);
      $href=$h['href'];



      ?>

      <?php } ?>
    </div>
  </div>

<style>
input[type="text"], input[type="password"], textarea {
    background: none repeat scroll 0 0 #fbfefb;
    border: 1px solid #CCCCCC;
    padding: 3px;
}
ins
{ text-decoration: none;
}
</style>

  <div id="tabs" class="htabs">

    <?php
    if ($comment_status){
    ?>
    <a href="#tab-comment"><?php echo $this->language->get('text_ans'); ?><ins style="text-decoration: none;" class="comment_count">(<?php echo $comment_count; ?>)</ins></a>
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


<style>
input[name=rating]
{
background: #FFF;
}
</style>

  <?php
  if ($comment_status)
  { ?>
  <div id="tab-comment" class="tab-content">



    <div id="comment" >

    <?php
		echo $html_comment;
	?>

    </div>


    <div id="ostavit" style="display: none;">
    <h2 id="comment-title"><?php echo $this->language->get('text_writeans');  ?></h2>

    <div id="reply_comments">

 <div id="comment_work_0"  style="width: 100%; margin-top: 10px; ">

    <b><ins style="color: #777;"><?php   echo $entry_name; ?></ins></b>
    <br>
    <input type="text" name="name"  value="<?php echo $text_login; ?>" <?php

    if (isset($customer_id))
    {
     //echo 'readonly="readonly" style="background-color:#DDD; color: #555;"';
    }

    ?>>  <?php

    if (!isset($customer_id))
    {
     echo $text_welcome;
    }

    ?>
    <div style="overflow: hidden;line-height:1px; margin-top: 5px;"></div>

    <b><ins style="color: #777;"><?php echo $this->language->get('entry_ans');  ?></ins></b><br>

    <textarea name="text" cols="40" rows="8" style="width: 70%; font-size: 16px; font-family: Geneva, Arial, Helvetica, sans-serif;"></textarea>
    <br>
    <span style="font-size: 11px; opacity: 0.50"><?php echo $text_note; ?></span>

    <div style="overflow: hidden; line-height:1px; margin-top: 5px;"></div>

    <b><ins style="color: #777;"><?php echo $entry_rating; ?></ins></b>&nbsp;&nbsp;
    <span><ins style="color: red;"><?php echo $entry_bad; ?></ins></span>&nbsp;

    <input type="radio" name="rating" value="1" >
    <ins style="color: #555; font-size: 14px; margin-left: -5px;">1</ins>
    <input type="radio" name="rating" value="2" >
    <ins style="color: #555; font-size: 14px; margin-left: -5px;">2</ins>
    <input type="radio" name="rating" value="3" >
    <ins style="color: #555; font-size: 14px; margin-left: -5px;">3</ins>
    <input type="radio" name="rating" value="4" >
    <ins style="color: #555; font-size: 14px; margin-left: -5px;">4</ins>
    <input type="radio" name="rating" value="5" >
    <ins style="color: #555; font-size: 14px; margin-left: -5px;">5</ins>
    &nbsp;&nbsp; <span><ins style="color: green;"><?php echo $entry_good; ?></ins></span>

    <div style="overflow: hidden; line-height:1px; margin-top: 5px;"></div>

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


   </div>



   </div>

   </div>

  <div><a onclick="$('a[href=\'#tab-comment\']').trigger('click'); $('#ostavit').show(); " href="<?php echo $href; ?>#comment-title"><?php echo $this->language->get('text_youans'); ?></a></div>


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


<div class="share" style="float: left;"><!-- AddThis Button BEGIN -->

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


   <div style="overflow: hidden;">&nbsp;</div>

  <?php if ($tags) { ?>
  <div class="tags"><b><?php echo $text_tags; ?></b>
    <?php foreach ($tags as $tag) { ?>
    <a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>,
    <?php } ?>
  </div>
  <?php } ?>
  </div></div>

 <?php echo $content_bottom; ?></div>


<script type="text/javascript">
function captcha_fun()
{
 $.ajax({  type: 'POST',
			url: 'index.php?route=record/record/captcham',
			dataType: 'html',
		   	success: function(data)
		    {

		     $('.captcha_status').html(data);
  		    }
	    });
  return false;
}


$.fn.comments = function(sorting , page) {if (typeof(sorting) == "undefined") {
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
 captcha_fun();

if ($.isFunction($.fn.on)) {

$(document).on('click', '#comment .pagination a', function() {

    $('#comment').prepend('<div class="attention"><img src="catalog/view/theme/<?php echo $theme; ?>/image/loading.gif" alt=""> <?php echo $text_wait; ?></div>');
	//$('#comment').load(this.href);

	urll = this.href+'#tab-review';
    location = urll;


    $('.attention').remove();

	return false;
});

} else {

$('#comment .pagination a').live('click',  function() {

    $('#comment').prepend('<div class="attention"><img src="catalog/view/theme/<?php echo $theme; ?>/image/loading.gif" alt=""> <?php echo $text_wait; ?></div>');
	//$('#comment').load(this.href);

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

// из config и get
function comment_write(event)
{
   $('.success, .warning').remove();

   if (typeof(event.data.sorting) == "undefined")
   {
		sorting = 'none';
   }
   else
    {      sorting = event.data.sorting;
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
      myid = this.id.replace('button-comment-','');    }

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

				$('input[name=\'name\']').val(data.login);
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');


			}

		}
	});

}
$('.button-comment').unbind();
$('.button-comment').bind('click',{ }, comment_write);

$('#tabs a').tabs();

</script>

<?php echo $footer; ?>