<?php
//-----------------------------------------------------
// based on TagCloud Created by villagedefrance                   
//-----------------------------------------------------
?>
<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
</div>
<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

<div class="box">
	<div class="heading">
		<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
		<div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
			<a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
		</div>
	</div>
	<div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<table class="form">
			<?php foreach ($languages as $language) { ?>
				<tr> 
					<td><?php echo $entry_title; ?></td> 
					<td> 
					<input type="text" name="tagcloud_title<?php echo $language['language_id']; ?>" id="tagcloud_title<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'tagcloud_title' . $language['language_id']}; ?>" />
					<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
					</td>
				</tr>
			<?php } ?> 

			  
				<tr> 
					<td><?php echo $entry_icon; ?></td> 
					<td> 
						<?php if($tagcloud_icon) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="tagcloud_icon_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="tagcloud_icon_1" name="tagcloud_icon" value="1" /> 
					<label for="tagcloud_icon_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="tagcloud_icon_0" name="tagcloud_icon" value="0" /> 
					</td> 
				</tr>
				
				<tr> 
					<td><?php echo $entry_box; ?></td> 
					<td> 
						<?php if($tagcloud_box) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
						<label for="tagcloud_box_1"><?php echo $entry_yes; ?></label> 
						<input type="radio"<?php echo $checked1; ?> id="tagcloud_box_1" name="tagcloud_box" value="1" /> 
						<label for="tagcloud_box_0"><?php echo $entry_no; ?></label> 
						<input type="radio"<?php echo $checked0; ?> id="tagcloud_box_0" name="tagcloud_box" value="0" /> 
					</td> 
				</tr>
				
				<tr>
					<td><?php echo $entry_limit; ?></td>
					<td><span class="required">* </span><input type="text" name="tagcloud_limit" value="<?php echo $tagcloud_limit; ?>" size="1" />
						<?php if ($error_limit) { ?>
							<div class="error"><?php echo $error_limit; ?></div>
						<?php } ?>	
					</td>
				</tr>
				
				<tr>
					<td><?php echo $entry_min_font_size; ?></td>
					<td><span class="required">* </span><input type="text" name="tagcloud_min_font_size" value="<?php echo $tagcloud_min_font_size; ?>" size="1" />&nbsp; px
						<?php if ($error_min_font_size) { ?>
							<div class="error"><?php echo $error_min_font_size; ?></div>
						<?php } ?>	
					</td>
				</tr>
				
				<tr>
					<td><?php echo $entry_max_font_size; ?></td>
					<td><span class="required">* </span><input type="text" name="tagcloud_max_font_size" value="<?php echo $tagcloud_max_font_size; ?>" size="1" />&nbsp; px
						<?php if ($error_max_font_size) { ?>
							<div class="error"><?php echo $error_max_font_size; ?></div>
						<?php } ?>
					</td>	
				</tr>
				

				
				<tr>
					<td><?php echo $entry_template; ?></td>
					<td>
						<?php foreach ($templates as $template) { ?>
							<?php if ($template == $config_template) { ?>
								<span style='color: #336600; padding: 0 5px;'><b><?php echo $template; ?></b></span> 
							<?php } ?>
						<?php } ?>	
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<span style='text-align: center;'><b><?php echo $text_module_settings; ?></b></span>
					</td>
				</tr>
			</table>
			
			<table id="module" class="list">
			<thead>
				<tr>
					<td class="left"><?php echo $entry_layout; ?></td>
					<td class="left"><?php echo $entry_position; ?></td>
					<td class="left"><?php echo $entry_status; ?></td>
					<td class="center"><?php echo $entry_sort_order; ?></td>
					<td></td>
				</tr>
			</thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
			<tbody id="module-row<?php echo $module_row; ?>">
				<tr>
					<td class="left"><select name="tagcloud_module[<?php echo $module_row; ?>][layout_id]">
					<?php foreach ($layouts as $layout) { ?>
						<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
							<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
						<?php } ?>
					<?php } ?>
					</select></td>
					<td class="left"><select name="tagcloud_module[<?php echo $module_row; ?>][position]">
					<?php if ($module['position'] == 'content_top') { ?>
						<option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
					<?php } else { ?>
						<option value="content_top"><?php echo $text_content_top; ?></option>
					<?php } ?>
					<?php if ($module['position'] == 'content_bottom') { ?>
						<option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
					<?php } else { ?>
						<option value="content_bottom"><?php echo $text_content_bottom; ?></option>
					<?php } ?>
					<?php if ($module['position'] == 'column_left') { ?>
						<option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
					<?php } else { ?>
						<option value="column_left"><?php echo $text_column_left; ?></option>
					<?php } ?>
					<?php if ($module['position'] == 'column_right') { ?>
						<option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
					<?php } else { ?>
						<option value="column_right"><?php echo $text_column_right; ?></option>
					<?php } ?>
					</select></td>
					<td class="left"><select name="tagcloud_module[<?php echo $module_row; ?>][status]">
					<?php if ($module['status']) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select></td>
					<td class="center">
						<input type="text" name="tagcloud_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" />
					</td>
					<td class="center">
						<a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a>
					</td>
				</tr>
			</tbody>
        <?php $module_row++; ?>
        <?php } ?>
			<tfoot>
				<tr>
					<td colspan="4"></td>
					<td class="center"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
				</tr>
			</tfoot>
		</table>
    </form>
	</div>
		<br>
		<div style="text-align:center; color:#555555;">TagCloud v<?php echo $tagcloud_version; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="tagcloud_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="tagcloud_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="tagcloud_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="center"><input type="text" name="tagcloud_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="center"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script>