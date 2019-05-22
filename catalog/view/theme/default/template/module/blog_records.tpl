<?php if ($records) { ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="box-content">

  <div class="blog-record-list-small">
    <?php foreach ($records as $record) {
  //  print_r($record['settings']);
    ?>
    <div>
     <?php if ($record['date_available']) { ?>
        <div class="blog-date"><?php echo $record['date_available']; ?></div>
      <?php } ?>
     <div class="name marginbottom5">
    <?php if (isset ($record['settings']['category_status']) && $record['settings']['category_status']) { ?>

    <a href="<?php echo $record['blog_href']; ?>" class="blog-title"><?php echo $record['blog_name']; ?></a><ins class="blog-arrow">&nbsp;&rarr;&nbsp;</ins>

    <?php } ?>

    <a href="<?php echo $record['href']; ?>" class="blog-title"><?php echo $record['name']; ?></a>
     </div>

      <?php if ($record['thumb']) { ?>
      <div class="image blog-image"><a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" /></a></div>
      <?php } ?>

          	<div class="description"><?php echo $record['description']; ?>&nbsp;
          	<a href="<?php echo $record['href']; ?>" class="description blog-further"><?php echo $this->language->get('text_further'); ?></a></div>


      <div>


      <?php if ($record['rating']) { ?>
      <div class="rating">
      <img style="border: 0px;"  title="<?php echo $record['rating']; ?>" alt="<?php echo $record['rating']; ?>" src="/catalog/view/theme/<?php


			$template = '/image/blogstars-'.$record['rating'].'.png';
			if (file_exists(DIR_TEMPLATE . $theme . $template)) {
				$starpath = $theme . $template;
			} else {
				$starpath = 'default' . $template;
			}

			echo $starpath;

?>">
      </div>
      <?php } ?>

     <div>
      <?php if ($record['settings_comment']['status']) { ?>
	      <div class="blog-light-small-text"><?php echo $text_comments; ?> <?php echo $record['comments']; ?></div>
	  <?php } ?>
	      <div class="blog-light-small-text"><?php echo $text_viewed; ?> <?php echo $record['viewed']; ?></div>
      </div>

<div class="overflowhidden lineheight1 bordernone">&nbsp;</div>
      </div>
 	<?php
	 if ($userLogged)
	  {
	?>
	<div class="blog-edit_container">
	   <a class="zametki" target="_blank" href="<?php echo $admin_path; ?>index.php?route=catalog/record/update&token=<?php echo $this->session->data['token']; ?>&record_id=<?php echo $record['record_id']; ?>"><?php echo $this->language->get('text_edit');?></a>
	 </div>
	<?php
	 }
	?>

  <div class="blog-child_divider">&nbsp;</div>

    </div>
    <?php } ?>
  </div>
</div>
</div>
  <?php } ?>
