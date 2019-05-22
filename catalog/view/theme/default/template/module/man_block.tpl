<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-manufacturer">
      <?php foreach ($manufacturers as $manufacturer) { ?>
      <div style="display:block;float:left;">
        <?php if ($manufacturer['thumb']) { ?>
            <div class="image">
                <a href="<?php echo $manufacturer['href']; ?>">
                    <img src="<?php echo $manufacturer['thumb']; ?>" alt="<?php echo $manufacturer['name']; ?>" title="<?php echo $manufacturer['name']; ?>" />
                </a>
            </div>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
