<div id="blog-mts_<?php echo md5(serialize($myblogs)); ?>" style="display: none;">
<?php
if (count($myblogs) > 0) {
	foreach ($myblogs as $blogs) {
		for ($i = 0; $i < $blogs['flag_start']; $i++) {
?>
<li><a href="<?php if ($blogs['active'] == 'active') echo $blogs['href'] . "#"; else echo $blogs['href'];?>" class="blog-menu-title <?php if ($blogs['active'] == 'active') echo 'active'; if ($blogs['active'] == 'pass')	echo 'pass'; ?>"><?php echo $blogs['name'];
?></a>
<?php
			if ($i >= $blogs['flag_end']) {
?>
<div><ul>
<?php
			}
?>
<?php
			for ($m = 0; $m < $blogs['flag_end']; $m++) {
?>

		<?php
				if ($blogs['flag_start'] <= $m) {
?>
</ul></div>
<?php
				}
						?>
			</li>
		<?php



			}

		}
	}
}
?>
</div>
<script>
$(document).ready(function(){
var blog_menu_<?php echo md5(serialize($myblogs)); ?> = $('#blog-mts_<?php echo md5(serialize($myblogs)); ?>').html();
$('#menu ul:first').append(blog_menu_<?php echo md5(serialize($myblogs)); ?>);

});
</script>