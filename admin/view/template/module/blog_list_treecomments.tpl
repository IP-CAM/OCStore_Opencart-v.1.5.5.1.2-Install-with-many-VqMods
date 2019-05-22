<?php
foreach ($mylist as $list_num=>$list) {
/*
print_r("<PRE>");
print_r($mylist);
print_r("</PRE>");
 */
?>
<div id="list<?php echo $list_num;?>" style="padding-left: 200px;">

  <input type="hidden" name="mylist[<?php echo $list_num; ?>][type]" value="<?php if (isset($list['type'])) echo $list['type']; else echo 'blogs'; ?>">

<table>
    <tr>
    <td>
    </td>
    <td>
	 <div class="buttons"><a onclick="mylist_num--; $('#amytabs<?php echo $list_num;?>').remove(); $('#mytabs<?php echo $list_num;?>').remove(); $('#mytabs a').tabs(); return false; " class="mbuttonr"><?php echo $this->language->get('button_remove'); ?></a></div>
    </td>
    </tr>

	 <?php foreach ($languages as $language) { ?>
	<tr>
			<td>
			<?php echo $this->language->get('entry_title_list_latest'); ?> (<?php echo  ($language['name']); ?>)

		</td>

			<td>

				<input type="text" name="mylist[<?php echo $list_num; ?>][title_list_latest][<?php echo $language['language_id']; ?>]" value="<?php if (isset($list['title_list_latest'][$language['language_id']])) echo $list['title_list_latest'][$language['language_id']]; ?>" size="60" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
			</td>

	</tr>
   <?php } ?>




	<tr>
			<td>
			<?php echo $this->language->get('entry_template'); ?>

		</td>

			<td>
				<input type="text" name="mylist[<?php echo $list_num; ?>][template]" value="<?php if (isset($list['template'])) echo $list['template']; ?>" size="60" />
			</td>

	</tr>
	<tr>
			<td>
			<?php echo $this->language->get('entry_blog_num_comments'); ?>

		</td>

			<td>
				<input type="text" name="mylist[<?php echo $list_num; ?>][number_comments]" value="<?php  if (isset( $list['number_comments'])) echo $list['number_comments']; ?>" size="3" />
			</td>

	</tr>


            <tr>
              <td><?php echo $this->language->get('entry_comment_status'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][status]">
                  <?php if ($list['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>




            <tr>
              <td><?php echo $this->language->get('entry_comment_status_reg'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][status_reg]">
                  <?php if ($list['status_reg']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>

            <tr>
              <td><?php echo $this->language->get('entry_comment_status_now'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][status_now]">
                  <?php if ($list['status_now']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>




            <tr>
              <td><?php echo $this->language->get('entry_comment_rating'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][rating]">
                  <?php if ($list['rating']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>


		    <tr>
		     <td class="left"><?php echo $this->language->get('entry_comment_rating_num'); ?></td>
		     <td class="left">
		      <input type="text" name="mylist[<?php echo $list_num; ?>][rating_num]" value="<?php  if (isset($list['rating_num'])) echo $list['rating_num']; ?>" size="3" />
		     </td>
		    </tr>

	<tr>
 		<td>
			<?php echo $this->language->get('entry_order_ad'); ?>
		</td>
		<td>
         <select id="mylist_<?php echo $list_num; ?>_order_ad"  name="mylist[<?php echo $list_num; ?>][order_ad]">
           <option value="desc"  <?php if (isset( $list['order_ad']) &&  $list['order_ad']=='desc') { echo 'selected="selected"'; } ?>><?php echo $this->language->get('text_what_desc'); ?></option>
           <option value="asc"   <?php if (isset( $list['order_ad']) &&  $list['order_ad']=='asc')  { echo 'selected="selected"'; } ?>><?php echo $this->language->get('text_what_asc'); ?></option>
        </select>
		</td>
      </tr>



            <tr>
              <td><?php echo $this->language->get('entry_fields_view'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][fields_view]">
                  <?php if ($list['fields_view']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>

            <tr>
              <td><?php echo $this->language->get('entry_view_captcha'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][view_captcha]">
                  <?php if ($list['view_captcha']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>

            <tr>
              <td><?php echo $this->language->get('entry_comment_signer'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][signer]">
                  <?php if ($list['signer']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>



          <tr>
              <td><?php echo $this->language->get('entry_visual_editor'); ?></td>
              <td><select name="mylist[<?php echo $list_num; ?>][visual_editor]">
                  <?php if ($list['visual_editor']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>


		    <tr>
		     <td class="left"><?php echo $this->language->get('entry_bbwidth'); ?></td>
		     <td class="left">
		      <input type="text" name="mylist[<?php echo $list_num; ?>][bbwidth]" value="<?php if (isset($list['bbwidth'])) echo $list['bbwidth']; ?>" size="3" />
		      </td>
		    </tr>


       <tr>
       <td colspan="2">


   <table class="mytable" id="table_fields_<?php echo $list_num;?>" >
     <thead>
      <tr>
      <td class="left" style=""><div style="width: 100%"><?php echo $this->language->get('entry_name_field'); ?></div></td>
       <td class="left" style=""><div style="width: 100%"><?php echo $this->language->get('entry_title_list_latest'); ?></div></td>
       <td class="right" style=""><div style="width: 100%"><?php echo $this->language->get('text_sort_order'); ?></div></td>
       <td style="width: 200px;"><?php echo $this->language->get('text_action'); ?></td>
      </tr>

     </thead>
        <?php
          $fields_row = 0;
        ?>

      <?php



       if (isset($list['addfields']) && !empty($list['addfields'])) {
        foreach ($list['addfields'] as $num_field => $field) {

         while (!isset($list['addfields'][$fields_row])) {
          $fields_row++;
         }

        ?>
          <tr id="field-row-<?php echo $list_num;?>-<?php echo $num_field; ?>">

            <td class="left">
            <input type="text" name="mylist[<?php echo $list_num; ?>][addfields][<?php echo $num_field; ?>][name]" value="<?php echo $field['name']; ?>" size="10" />
            </td>

            <td class="left" > <!-- <?php echo $num_field; ?>&nbsp; -->
	 		<?php foreach ($languages as $language) { ?>

                <div style=" overflow: hidden;">
				<div style="float: left; font-size: 11px; width: 77px; text-decoration: none;"><?php echo  ($language['name']); ?></div>
				<div style="float: left;">
					<input type="text" name="mylist[<?php echo $list_num; ?>][addfields][<?php echo $num_field; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php if (isset($field['title'][$language['language_id']])) echo $field['title'][$language['language_id']]; ?>" size="20" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
				</div>
				</div>

			   	<?php } ?>
			</td>

            <td class="right">
            <input type="text" name="mylist[<?php echo $list_num; ?>][addfields][<?php echo $num_field; ?>][sort_order]" value="<?php echo $field['sort_order']; ?>" size="3" />
            </td>

            <td class="left">
            <div style="float:left; width: 100px;">
             <a onclick="$('#field-row-<?php echo $list_num;?>-<?php echo $num_field; ?>').remove();" class="mbuttonr"><?php echo $this->language->get('button_remove');?></a>
           </div>
           </td>

      </tr>



        <?php
        }
        } else  {
        ?>
       <td class="left"><div style="width: 100%">&nbsp;</div></td>
       <td class="left"><div style="width: 100%">&nbsp;</div></td>
       <td class="right"><div style="width: 100%">&nbsp;</div></td>
       <td style="width: 200px;"><div style="width: 100%">&nbsp;</div></td>
        <?php
        }

        ?>
        <tfoot>
          <tr>
            <td colspan="3"></td>
            <td class="left"><a id="add_f-<?php echo $list_num;?>"  class="markbutton"><?php echo $this->language->get('text_action_add_field'); ?></a></td>
          </tr>
        </tfoot>
      </table>

      </td>
       </tr>


</table>




</div>

<?php }   ?>


<script>
var afields_row_<?php echo $list_num;?> = Array();

<?php
if (isset($list['addfields'])) {
 foreach ($list['addfields'] as $indx => $module) {
?>
afields_row_<?php echo $list_num;?>.push(<?php echo $indx; ?>);
<?php
 }
}
?>
var num_field =<?php echo $fields_row; ?>;


function addfields() {var aindex = -1;
	for(i=0; i<afields_row_<?php echo $list_num;?>.length; i++) {
	 flg = jQuery.inArray(i, afields_row_<?php echo $list_num;?>);
	 if (flg == -1) {
	  aindex = i;
	 }
	}
	if (aindex == -1) {
	  aindex = afields_row_<?php echo $list_num;?>.length;
	}
	num_field = aindex;
	afields_row_<?php echo $list_num;?>.push(aindex);




addfields_<?php echo $list_num;?> = '<tr>';


addfields_<?php echo $list_num;?>+= '            <td class="right">';
addfields_<?php echo $list_num;?>+= '            <input type="text" name="mylist[<?php echo $list_num; ?>][addfields]['+num_field +'][name]" value="" size="10" />';
addfields_<?php echo $list_num;?>+= '            </td>';

addfields_<?php echo $list_num;?>+= '<td class="left">';
//addfields_<?php echo $list_num;?>+= num_field + '&nbsp;';

	 		<?php foreach ($languages as $language) { ?>


addfields_<?php echo $list_num;?>+= '	               <div style="width: 100%">';
addfields_<?php echo $list_num;?>+= '					<div style="float: left; font-size: 11px; width: 77px; text-decoration: none;"><?php echo  ($language['name']); ?></div>';
addfields_<?php echo $list_num;?>+= '					<div style="">';

addfields_<?php echo $list_num;?>+= '<input type="text" name="mylist[<?php echo $list_num; ?>][addfields]['+num_field +'][title][<?php echo $language['language_id']; ?>]" value="" size="50" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" >';


addfields_<?php echo $list_num;?>+= '					</div>';
addfields_<?php echo $list_num;?>+= '					</div>';



			   	<?php } ?>
addfields_<?php echo $list_num;?>+= '			</td>';
addfields_<?php echo $list_num;?>+= '            <td class="right">';
addfields_<?php echo $list_num;?>+= '            <input type="text" name="mylist[<?php echo $list_num; ?>][addfields]['+num_field +'][sort_order]" value="" size="3" />';
addfields_<?php echo $list_num;?>+= '            </td>';
addfields_<?php echo $list_num;?>+= '            <td class="left">';
addfields_<?php echo $list_num;?>+= '            <div style="float:left; width: 100px;">';
addfields_<?php echo $list_num;?>+= '             <a onclick="$(\'#field-row-<?php echo $list_num;?>-' + num_field + '\').remove();" class="mbuttonr"><?php echo $this->language->get('button_remove');?></a>';
addfields_<?php echo $list_num;?>+= '           </div>';
addfields_<?php echo $list_num;?>+= '    </td>';
addfields_<?php echo $list_num;?>+= ' </tr>';

html_<?php echo $list_num;?>  = '<tbody id="field-row-<?php echo $list_num;?>-' + num_field + '">' + addfields_<?php echo $list_num;?> + '</tbody>';

$('#table_fields_<?php echo $list_num;?> tfoot').before(html_<?php echo $list_num;?>);
num_field++;
}

$('#add_f-<?php echo $list_num;?>').bind('click',{ }, addfields);
</script>





