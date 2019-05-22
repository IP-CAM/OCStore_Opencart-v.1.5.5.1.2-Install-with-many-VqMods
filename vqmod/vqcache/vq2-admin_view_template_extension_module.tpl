<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error) { ?>
  <div class="warning"><?php echo $error; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>

                
	        <!--OpencartModules-->
	        <div class="buttons">
	        <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
	        </div>
            
            
    </div>
    <div class="content">

                
	        <!--OpencartModules-->
	        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
            
            
      <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_name; ?></td>

                
	        <!--OpencartModules-->
            <td class="left"><?php echo $column_layouts; ?></td>
            <td class="left"><?php echo $column_positions; ?></td>
            <td class="left"><?php echo $column_sort_orders; ?></td>
            <td class="left"><?php echo $column_sort_order; ?></td>
            <td class="left"><?php echo $column_description; ?></td>
            
            
            <td class="right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($extensions) { ?>
          <?php foreach ($extensions as $extension) { ?>
          <tr>
            <td class="left"><?php echo $extension['name']; ?></td>

                
	        <!--OpencartModules-->
            <td class="left"><?php echo $extension['layouts']; ?></td>
            <td class="left"><?php echo $extension['positions']; ?></td>
            <td class="left"><?php echo $extension['sort_orders']; ?></td>
            <input type="hidden" name="modules[<?php echo $extension['code']; ?>][type]" value="<?php echo $extension['type']; ?>" />
            <?php if ($extension['type']=='module') { ?>
            <td class="left"><input type="text" name="modules[<?php echo $extension['code']; ?>][sort_order]" value="<?php echo ($extension['sort_order']=='999999'?'':$extension['sort_order']); ?>" /></td>
            <td class="left"><textarea style="width:100%" name="modules[<?php echo $extension['code']; ?>][description]"><?php echo $extension['description']; ?></textarea></td>
            <?php } else { ?>
            <td></td><td></td>
            <?php } ?>
            
            
            <td class="right"><?php foreach ($extension['action'] as $action) { ?>
              [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
              <?php } ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>

                
	        <!--OpencartModules-->
	        </form>
            
            
    </div>
  </div>
</div>
<?php echo $footer; ?>