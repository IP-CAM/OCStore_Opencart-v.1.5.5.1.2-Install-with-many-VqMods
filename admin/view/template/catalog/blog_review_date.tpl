<script type="text/javascript">
if ($('head').html().indexOf('wbbtheme.css') <0) {
	$('head').append('<link href="view/javascript/wysibb/theme/default/wbbtheme.css" type="text/css" rel="stylesheet" />');
 }

</script>

<div id="blog_review_date_<?php echo $review_id; ?>" style="display: view;">
<table class="form">
          <tr>
            <td><?php echo $entry_date_added; ?></td>
            <td>
                <input type="text" id="date_added" name="date_added" value="<?php echo $date_added; ?>" size="20" class="datetime" >
                <input type="hidden" id="new_action" name="new_action" value="<?php echo $action; ?>">
            </tr>
</table>
</div>
<script type="text/javascript" src="view/javascript/wysibb/jquery.wysibb.js"></script>

<script type="text/javascript">

$(document).ready(function(){

var blog_review_date_<?php echo $review_id; ?> = $('#blog_review_date_<?php echo $review_id; ?>').html();
$('#form').append(blog_review_date_<?php echo $review_id; ?>);

$('#blog_review_date_<?php echo $review_id; ?>').hide('slow');
$('#blog_review_date_<?php echo $review_id; ?>').remove();

$('#form').attr('action',$('#new_action').val());
	$('textarea').wysibb({
	  img_uploadurl:		"view/javascript/wysibb/iupload.php",
      buttons: 'bold,italic,underline,|,img,video,link,|,fontcolor,fontsize,|'
	});
   $('span.powered').hide();


});
</script>


<script type="text/javascript" src="view/javascript/blog/timepicker/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="view/javascript/blog/timepicker/localization/jquery-ui-timepicker-<?php echo $config_language; ?>.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'HH:mm:ss'
	});
});
</script>
