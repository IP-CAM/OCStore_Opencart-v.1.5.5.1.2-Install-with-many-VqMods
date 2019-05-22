<?php if (isset($comments) && $comments) { ?>
<div class="box" style="display: block">
  <div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="box-content">
  		<div class="blog-record-list-small">
			<div id="pagewrap">
				<div class="wrapper grid4">

   					<?php foreach ($comments as $comment) { ?>
    				<article class="col">

      				<?php if (isset ($settings['view_avatar']) && $settings['view_avatar'] ) { ?>
      				<?php if ($comment['thumb']) { ?>
      					<div class="image blog-image"><a href="<?php echo $comment['record_href']; ?>"><img src="<?php echo $comment['thumb']; ?>" title="<?php echo $comment['record_name']; ?>" alt="<?php echo $comment['record_name']; ?>" /></a></div>
      				<?php } ?>
      				<?php } ?>


				   	<div class="blogdescription  margintop5">
				   	<?php if (isset ($settings['view_author']) && $settings['view_author'] ) { ?>
				      <?php if ($comment['author']) { ?>
				        <div class="blog-author"><?php echo $comment['author']; ?></div>
				      <?php } ?>
				      <?php } ?>

				   	<?php echo $comment['text']; ?>&nbsp;
				         	<a href="<?php echo $comment['record_href']; ?>#comment_link_<?php  echo $comment['comment_id']; ?>" class="description blog-further"><?php echo $this->language->get('text_further'); ?></a>
					</div>

					<div class="name marginbottom5">
					 <div>

				    <?php if (isset ($settings['view_rating']) && $settings['view_rating'] ) { ?>
				      <?php if ($comment['rating']) { ?>
				      <div class="rating">
				      <img style="border: 0px;"  title="<?php echo $comment['rating']; ?>" alt="<?php echo $comment['rating']; ?>" src="/catalog/view/theme/<?php
$template = '/image/blogstars-'.$comment['rating'].'.png';
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . $template)) {
				$starpath = $this->config->get('config_template') . $template;
			} else {
				$starpath = 'default' . $template;
			}

echo $starpath;

?>">
				      </div>
				      <?php } ?>
				    <?php } ?>


				    <?php if (isset ($settings['view_date']) && $settings['view_date'] ) { ?>
				      <?php if ($comment['date']) { ?>
				        <div class="blog-date"><?php echo $comment['date']; ?></div>
				      <?php } ?>
				    <?php } ?>

     				<div>






					<div>

					    <?php if (isset ($settings['view_category']) && $settings['view_category'] ) { ?>

					    <div class="blog-light-small-text"><?php echo $comment['text_category']; ?>
					    <a href="<?php echo $comment['blog_href']; ?>" class="blog-little-title"><?php echo $comment['blog_name']; ?></a>
					    </div>
					    <?php } ?>

                        <?php if (isset ($settings['view_record']) && $settings['view_record'] ) { ?>
					    <div class="blog-light-small-text"><?php echo $comment['text_record']; ?>
					    <a href="<?php echo $comment['record_href']; ?>" class="blog-little-title"><?php echo $comment['record_name']; ?></a>
					    </div>
					    <?php } ?>

    				</div>


				       <?php if (isset ($settings['view_comments']) && $settings['view_comments'] ) { ?>
					      <?php if ($comment['record_comments']) { ?>
					      <div class="blog-light-small-text"><?php echo $text_comments; ?> <?php echo $comment['record_comments']; ?></div>
					      <?php } ?>
				       <?php } ?>



				        <?php if (isset ($settings['view_viewed']) && $settings['view_viewed'] ) { ?>
					      <div class="blog-light-small-text"><?php echo $text_viewed; ?> <?php echo $comment['record_viewed']; ?></div>
				        <?php } ?>




				     </div>

      				<div class="overflowhidden lineheight1">&nbsp;</div>
	    		</div>


  				<div class="blog-child_divider">&nbsp;</div>
    			</div>
    		</article>
    	<?php } ?>
   		</div>
	 </div>
	</div>
  </div>
</div>

<?php } ?>
