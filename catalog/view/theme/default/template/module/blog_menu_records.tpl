<div id="blog-mr_<?php echo md5(serialize($records)); ?>" style="display: none;">
<?php
if (count($records) > 0) {
	foreach ($records as $record) {
?>
<li><a href="<?php echo $record['href'];?>" class="blog-menu-title"><?php echo $record['name'];?></a></li>
<?php
	}
}
?>
</div>
<script>
$(document).ready(function(){
var blog_menur_<?php echo md5(serialize($records)); ?> = $('#blog-mr_<?php echo md5(serialize($records)); ?>').html();
$('#menu ul:first').append(blog_menur_<?php echo md5(serialize($records)); ?>);

});
</script>