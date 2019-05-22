<style>
.comment_buttons {
 color: #4DA1D6;
 border-bottom: 1px dashed #4DA1D6;
 text-decoration: none;
 margin-right: 5px;
}
.comment_content  {
    border-bottom: 1px solid #EEEEEE;
    margin-bottom: -1px;
    overflow: auto;
    padding: 0px;
}

 .voting .plus{width:11px;height:15px;display:block;float:right;margin-top:2px;margin-left:7px;}
 .voting .minus{width:11px;height:15px;display:block;float:right;margin-top:2px;margin-left:2px}

 .voting a.plus{background:url("/image/icons_vote_posts.png") no-repeat 0px -15px;}
 .voting a.minus{background:url("/image/icons_vote_posts.png") no-repeat -11px -15px;}
 .voting a:hover.plus{background:url("/image/icons_vote_posts.png") no-repeat 0px 0px ;}
 .voting a:hover.minus{background:url("/image/icons_vote_posts.png") no-repeat -11px 0px ;}

/* когда голосовать уже нельзя  */
.voting span.plus{background:url("/image/icons_vote_posts.png") no-repeat  -22px 0px ;}
.voting span.minus{background:url("/image/icons_vote_posts.png") no-repeat  -22px -15px ;}

/* проголосовал в плюс - подсвечиваем стрелку вверх и затемняем стрелку вниз*/
 .voting.voted_plus a.plus{background:url("/image/icons_vote_posts.png") no-repeat  0px 0px;}
 .voting.voted_plus span.plus{background:url("/image/icons_vote_posts.png") no-repeat  0px 0px;}
 .voting.voted_plus a.minus{background:url("/image/icons_vote_posts.png") no-repeat  -22px -15px ;}
 .voting.voted_plus span.minus{background:url("/image/icons_vote_posts.png") no-repeat   -22px -15px;}

/* проголосовал в минус - подсвечиваем стрелку вниз и затемняем стрелку вверх */
 .voting.voted_minus a.plus{background:url("/image/icons_vote_posts.png") no-repeat  -22px 0px  ;}
 .voting.voted_minus span.plus{background:url("/image/icons_vote_posts.png") no-repeat  -22px 0px  ;}
 .voting.voted_minus a.minus{background:url("/image/icons_vote_posts.png") no-repeat  -11px 0px ;}
 .voting.voted_minus span.minus{background:url("/image/icons_vote_posts.png") no-repeat  -11px 0px ;}

/* общий балл не известен */
 .voting .mark{float:right;color:#A9A9A9;font-weight:bold;padding-top:2px;font-size:14px;font-family:Arial, Helvetica, sans-serif;}
 .voting .mark span{color:#A9A9A9;}
 .voting .mark a{text-decoration:none;color:#A9A9A9;}
/* общий бал выше нуля */
 .voting .mark.positive span{color:#339900;}
/* общий балл - ниже нуля */
 .voting .mark.negative span{color:#CC0000;}

<?php

$maxic = 0;
if ($mycomments) {
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
	 $('.success, .warning').remove();

	 $('.comment_work').html('');

	 html_reply = $('#reply_comments').html();

	 $('#comment_work_'+cid).html(html_reply);
	 $('#comment_work_'+cid).find('#comment_work_0').attr('id', 'c_w_'+cid);

	 $('#comment_work_'+cid).find('.button-comment').attr('id', 'button-comment-'+cid);

	 $('.bkey').unbind();
	 $('.bkey').bind('click', {id: cid}, subcaptcha);

	 $('.button-comment').unbind();
	 $('.button-comment').bind('click', {sorting: '<?php echo $sorting; ?>', page: '<?php  echo $page; ?>'},  comment_write);

	 // for chrome, safari
	 captcha_fun();

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
			//alert(data.success.rate_delta);
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
if ($mycomments) {
$opendiv=0;

foreach ($mycomments as $num => $comment)
{
     $opendiv++;
?>
<div class="comment_content gradient<?php  echo $comment['level']; ?>" style="overflow: hidden; margin-left: <?php echo ($comment['level'] * 10); ?>px;">
<div style="padding: 10px;">
<?php if (isset($record_comment['rating']) && $record_comment['rating']) { ?>

<div class="voting  <?php  if ($comment['customer_delta'] < 0) echo 'voted_minus';  if ($comment['customer_delta'] > 0) echo 'voted_plus';?>" style="float: right;" id="voting_<?php  echo $comment['comment_id']; ?>">

<?php if (!$comment['customer']){ ?>
<span class="minus" title="<?php echo  $this->language->get('text_vote_will_reg'); ?>"></span>
<span class="plus" title="<?php echo  $this->language->get('text_vote_will_reg'); ?>"></span>
<?php } else { ?>
					<a onclick="return comments_vote(this, <?php  echo $comment['comment_id']; ?>,  1); return false;" title="<?php echo  $this->language->get('text_vote_plus'); ?>" class="plus " href="#plus"></a>
<?php } ?>
					<div class="mark <?php  if($comment['delta']>=0) {  echo 'positive'; } else {  echo 'negative'; } ?> " style=" ">
						<span title="Всего <?php  echo $comment['rate_count']; ?>: ↑<?php  echo $comment['rate_count_plus']; ?> и ↓<?php  echo $comment['rate_count_minus']; ?>" class="score"><?php  if($comment['delta']>0) {  echo '+'; } ?><?php  echo sprintf("%d", $comment['delta']); ?></span>
					</div>
</div>
<?php } ?>
<br>
   <div style="font-size: 15px; color: <?php  if($comment['delta']>=0) {  echo '#000'; } else {  echo '#AAA'; } ?>;">
  <?php echo $comment['text']; ?>
  </div>

<?php
        // determine the actual setting the mark rollup
        if (isset($mycomments[$num + 1]['parent_id']) && ($mycomments[$num + 1]['parent_id'] == $comment['comment_id'])) {
?>
	 <div style="float: right;">
	   <a href="#" id="rollup<?php echo $comment['comment_id']; ?>" class="comment_buttons" onclick="rollup(<?php echo $comment['comment_id']; ?>); return false;"><?php echo $text_rollup; ?></a>
	 </div>
<?php

        }
        // reply form the way we steal from record.tpl :)  through comment_reply js function, of course
?>
 <!-- for reply form -->
 <div style="overflow: hidden; width: 100%; line-height: 1px; height: 1px;">&nbsp;</div>
 <div id="comment_work_<?php echo $comment['comment_id']; ?>" class="comment_work" style="width: 100%; margin-top: 5px;">
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

<div style="display: inline; float: right;"><?php echo $this->language->get('entry_sortingans');  ?>&nbsp;&nbsp;
<select name="sorting" onchange="$('#comment').comments(this[this.selectedIndex].value);">
    <option <?php if ($sorting == 'desc')  echo 'selected="selected"'; ?> value="desc"><?php echo $text_sorting_desc; ?></option>
    <option <?php if ($sorting == 'asc')   echo 'selected="selected"'; ?> value="asc"><?php  echo $text_sorting_asc;  ?></option>
</select>

</div>

<!-- <div class="pagination"><?php echo $pagination; ?></div> -->
<?php
} else {
?>
<div class="content"><?php echo $text_no_comments; ?></div>
<?php

}
?>




