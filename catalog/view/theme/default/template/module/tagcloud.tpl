<?php
//-----------------------------------------------------
// based on TagCloud Created by villagedefrance                   
//-----------------------------------------------------
?>
<style type="text/css" media="screen">
.box .box-heading img {
	float: left;
	margin-right: 8px;
}
</style>

<?php if($box) { ?>
	<div class="box">
		<div class="box-heading">
			<?php if($icon) { ?>	
				<img src="catalog/view/theme/default/image/cloud.png" alt="" />
			<?php } ?>

			<?php if($title) { ?>	
				<?php echo $title; ?>
			<?php }  else { ?>
				<?php echo "<br>"; ?>
			<?php } ?>

		</div>
		
		<div class="box-content" style="text-align: center;"> 
			<?php if($tagcloud) { ?>
				<?php echo $tagcloud; ?>
			<?php } else { ?>
				<?php echo $text_notags; ?>
			<?php } ?>
		</div>
	</div>
	
<?php } else { ?>
	
	<div style="text-align: center; margin-bottom: 10px;">
		<?php if($tagcloud) { ?>
			<?php echo $tagcloud; ?>
		<?php } else { ?>
			<?php echo $text_notags; ?>
		<?php } ?>
	</div>
	
<?php } ?>