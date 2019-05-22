<style>
<?php
$maxic = 0;
if (isset($mycomments) && $mycomments) {
    foreach ($mycomments as $num => $val) {
        if ($val['level'] > $maxic) {
            $maxic = $val['level'];
        }
    }
    reset($mycomments);
}
for ($i = 0; $i <= $maxic; $i++) {
    // colorable child branches
    $mycolor  = 'rgb(100%, 100%, 100%)';
    $colorhex = 'FFFFFF';
    if ($i > 0) {
        $colorback = round(100 - ($i * 2));
        if ($colorback < 0) {
            $colorback = 0;
        }
        $colorhex = dechex(round($colorback * 2.55));
        $mycolor  = 'rgb(' . $colorback . '%, ' . $colorback . '%, ' . $colorback . '%)';

?>
.gradient<?php  echo $i;  ?> {
background: <?php  echo $mycolor; ?>; /* Old browsers */
background: -moz-linear-gradient(top, <?php  echo $mycolor;  ?> 0%, #ffffff 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,<?php  echo $mycolor; ?>), color-stop(100%,#ffffff)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top, <?php  echo $mycolor; ?> 0%,#ffffff 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top, <?php  echo $mycolor; ?> 0%,#ffffff 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top, <?php echo $mycolor; ?> 0%,#ffffff 100%); /* IE10+ */
background: linear-gradient(to bottom, <?php echo $mycolor; ?> 0%,#ffffff 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#<?php echo $colorhex; ?><?php echo $colorhex; ?><?php echo $colorhex; ?>', endColorstr='#ffffff',GradientType=0 ); /* IE6-9 */
}
<?php
    }
}
?>
</style>

<script type="text/javascript">
	function subcaptcha(e) {
	   ic = $('.captcha').val();
	   $('.captcha').val(ic + this.value)
	   return false;
	}

	function rollup(parent) {
	if($('.parent'+parent).is(':hidden') == false)  {
	 $('#rollup'+parent).html('<?php echo $text_rollup_down; ?>');
	}  else {
	 $('#rollup'+parent).html('<?php  echo $text_rollup; ?>');
	}

	$('.parent'+parent).toggle();
	return false;
	}


	function comment_reply(cid) {

     <?php if ($visual_editor) { ?>
     wisybbdestroy();
     <?php } ?>

	 $('.success, .warning').remove();

	 $('.comment_work').html('');

	 html_reply = $('#reply_comments').html();

	 $('#comment_work_'+cid).html(html_reply);
	 $('#comment_work_'+cid).find('#comment_work_').attr('id', 'c_w_'+cid);
	 $('#comment_work_'+cid).find('#form_work_').attr('id', 'form_work_'+cid);
	 $('#comment_work_'+cid).find('#editor_').attr('id', 'editor_'+cid);

  	 $('#comment_work_'+cid).find('.button-comment').attr('id', 'button-comment-'+cid);

	 $('.bkey').unbind();
	 $('.bkey').bind('click', {id: cid}, subcaptcha);

	 $('.button-comment').unbind();
	 $('.button-comment').bind('click', {sorting: '<?php echo $sorting; ?>', page: '<?php  echo $page; ?>'},  comment_write);

	 // for chrome, safari
	 captcha_fun();

    <?php if ($visual_editor) { ?>
    wisybbloader(cid);
    <?php } ?>

	 return false;
	}

function comments_vote(link, comment_id, delta)
{
	if($(link).hasClass('loading'))
	{
	}
	else
	{
		$(link).addClass('loading');

 $.ajax({
		type: 'POST',
		url: 'index.php?route=record/record/comments_vote',
		dataType: 'json',
		data: 'comment_id=' + encodeURIComponent(comment_id) + '&delta=' + encodeURIComponent(delta),
		beforeSend: function()
		{
          $('.success, .warning').remove();
		},
		success: function(data)
		{
			if (data.error)
			{


			}

			if (data.success)
			{

				if(data.messages == 'ok')
				{
					var voting = $('#voting_'+comment_id);

					// выделим отмеченный пункт.
					if(delta === 1)
					{
					 voting.addClass('voted_plus').attr('title','<?php echo  $this->language->get('text_voted_plus'); ?>');
					}
					else if(delta === -1)
					{
					 voting.addClass('voted_minus').attr('title','<?php echo  $this->language->get('text_voted_minus'); ?>');
					}


					// обновим кол-во голосов
					$('.score', voting).replaceWith('<span class="score" title="<?php echo  $this->language->get('text_all'); ?> '+data.success.rate_count+': &uarr;'+data.success.rate_delta_plus+' и &darr;'+data.success.rate_delta_minus+'">'+data.success.rate_delta+'</span>');

					// раскрасим positive / negative
					$('.mark', voting).attr('class','mark '+data.sign);

					$(link).removeClass('loading');
               } else  {
                  $('#comment_work_' + comment_id).append('<div class="warning">'+  data.success +'</div>');
                  remove_success();
               }



			}

		}
	});
  }
  return false;
 }

</script>

<?php
if (isset($mycomments) && $mycomments) {
$opendiv=0;

foreach ($mycomments as $num => $comment)
{
     $opendiv++;
?>
<div id="comment_link_<?php  echo $comment['comment_id']; ?>" class="comment_content gradient<?php  echo $comment['level']; ?> level_<?php  echo $comment['level']; ?>" style="overflow: hidden; ">
<div class="padding10">
<b><?php  echo $comment['author']; ?></b>
<?php if (isset ($comment['settings_blog']['view_rating']) && $comment['settings_blog']['view_rating']) { ?>
<br>
<img style="border: 0px;"  title="<?php echo $comment['rating']; ?>" alt="<?php echo $comment['rating']; ?>" src="/catalog/view/theme/<?php
$template = '/image/blogstars-'.$comment['rating'].'.png';
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . $template)) {
				$starpath = $this->config->get('config_template') . $template;
			} else {
				$starpath = 'default' . $template;
			}

echo $starpath;

?>">
<?php } ?>

<?php if (isset($record_comment['rating']) && $record_comment['rating']) { ?>

<div class="voting  <?php  if ($comment['customer_delta'] < 0) echo 'voted_minus';  if ($comment['customer_delta'] > 0) echo 'voted_plus';?> floatright" id="voting_<?php  echo $comment['comment_id']; ?>">

<?php if (!$comment['customer']){ ?>
<span class="minus" title="<?php echo  $this->language->get('text_vote_will_reg'); ?>"></span>
<span class="plus" title="<?php echo  $this->language->get('text_vote_will_reg'); ?>"></span>
<?php } else { ?>
					<a onclick="return comments_vote(this, <?php  echo $comment['comment_id']; ?>, -1); return false;" title="<?php echo  $this->language->get('text_vote_minus'); ?>" class="minus " href="#minus"></a>
					<a onclick="return comments_vote(this, <?php  echo $comment['comment_id']; ?>,  1); return false;" title="<?php echo  $this->language->get('text_vote_plus'); ?>" class="plus " href="#plus"></a>
<?php } ?>
					<div class="mark <?php  if($comment['delta']>=0) {  echo 'positive'; } else {  echo 'negative'; } ?> ">
						<span title="Всего <?php  echo $comment['rate_count']; ?>: ↑<?php  echo $comment['rate_count_plus']; ?> и ↓<?php  echo $comment['rate_count_minus']; ?>" class="score"><?php  if($comment['delta']>0) {  echo '+'; } ?><?php  echo sprintf("%d", $comment['delta']); ?></span>
					</div>
</div>
<?php } ?>
<br>
  <div class="com_date_added"><?php echo $comment['date_added']; ?></div>

   <div class="com_text  color_<?php  if($comment['delta']>=0) {  echo '000'; } else {  echo 'AAA'; } ?>;">
  <?php echo $comment['text']; ?>
  </div>

 <div class="margintop10">
    <a href="#" onclick="comment_reply('<?php echo $comment['comment_id']; ?>'); return false;" id="comment_id_reply_<?php echo $comment['comment_id']; ?>" class="comment_buttons"><?php
        echo $text_reply_button;
?></a>
    <!--
    <a href="" class="comment_buttons"><?php
        echo $text_edit_button;
?></a>
    <a href="" class="comment_buttons"><?php
        echo $text_delete_button;
?></a>
     -->
  </div>

<?php
        // determine the actual setting the mark rollup
        if (isset($mycomments[$num + 1]['parent_id']) && ($mycomments[$num + 1]['parent_id'] == $comment['comment_id'])) {
?>
	 <div class="floatright">
	   <a href="#" id="rollup<?php echo $comment['comment_id']; ?>" class="comment_buttons" onclick="rollup(<?php echo $comment['comment_id']; ?>); return false;"><?php echo $text_rollup; ?></a>
	 </div>
<?php

        }
        // reply form the way we steal from record.tpl :)  through comment_reply js function, of course
?>
 <!-- for reply form -->
 <div class="overflowhidden width100 lineheight1 height1">&nbsp;</div>
 <div id="comment_work_<?php echo $comment['comment_id']; ?>" class="comment_work width100 margintop5">
 </div>
</div>
<div  class="parent<?php echo $comment['comment_id']; ?>">
<?php
		if ($comment['flag_end']>0) {

		 if ($comment['flag_end']>$opendiv) {
		  $comment['flag_end']=$opendiv;
		 }
         //echo " Close div: ".$opendiv;
		for ($i=0; $i<$comment['flag_end']; $i++)
		{
        $opendiv--;

?>
 </div>
</div>
<?php

		}
	}
}
 // for not close div
 if ($opendiv>0 ) {
  for ($i=0; $i<$opendiv; $i++)
  {
?>
 </div>
 </div>
 <?php
   }
 }
?>




<div class="floatright displayinline"><?php  echo $entry_sorting; ?>
<select name="sorting" onchange="$('#comment').comments(this[this.selectedIndex].value);">
    <option <?php if ($sorting == 'desc')  echo 'selected="selected"'; ?> value="desc"><?php echo $text_sorting_desc; ?></option>
    <option <?php if ($sorting == 'asc')   echo 'selected="selected"'; ?> value="asc"><?php  echo $text_sorting_asc;  ?></option>
</select>

</div>

<div class="pagination"><?php echo $pagination; ?></div>
<?php
} else {
?>
<div class="content"><?php echo $text_no_comments; ?></div>
<?php

}
?>




