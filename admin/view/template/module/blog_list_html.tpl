<?php
foreach ($mylist as $list_num=>$list) { ?>
<div id="list<?php echo $list_num;?>"  style="padding-left: 200px;">

  <input type="hidden" name="mylist[<?php echo $list_num; ?>][type]" value="<?php if (isset($list['type'])) echo $list['type']; else echo 'blogs'; ?>">


<table >
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
			<div style="float: left;">
				<input type="text" name="mylist[<?php echo $list_num; ?>][title_list_latest][<?php echo $language['language_id']; ?>]" value="<?php if (isset($list['title_list_latest'][$language['language_id']])) echo $list['title_list_latest'][$language['language_id']]; ?>" size="60" />
				</div>
				<div style="float: left; margin-left: 3px;">
				<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
				</div>
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



	 <?php foreach ($languages as $language) { ?>
	<tr>
			<td>
			<?php echo $this->language->get('entry_html'); ?>

		</td>

			<td>
				<div style="float: left;">
				<textarea id="html_<?php echo $list_num; ?>_<?php echo $language['language_id']; ?>" name="mylist[<?php echo $list_num; ?>][html][<?php echo $language['language_id']; ?>]" rows="10" cols="57" ><?php if (isset($list['html'][$language['language_id']])) echo $list['html'][$language['language_id']]; ?></textarea>
				<br>
			(<a href="" onclick="load_editor('html_<?php echo $list_num; ?>_<?php echo $language['language_id']; ?>', '100'); return false;"><?php echo $this->language->get('entry_editor'); ?></a>)

				</div>
				<div style="float: left; margin-left: 3px;">
				<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" ><br>
               </div>
			</td>

	</tr>
   <?php } ?>

</table>
</div>


  <?php }  ?>

<script language="javascript">
var myEditor = new Array();

function load_editor(idName, idHeight) {
	if (!myEditor[idName]) {
	    CKEDITOR.remove(idName);
		var html = $('#'+idName).html();
		var config = {
						filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						skin 		: 'kama',
						enterMode 	: CKEDITOR.ENTER_BR,
						entities 	: false,
						htmlEncodeOutput : false,
						//protectedSource: [/<\?[\s\S]*?\?>/g],
						toolbar		:[ ['Source','-','Link','Unlink','-','Image','-','Table','-','Cut','Copy','Paste','-','PasteText','PasteFromWord','-','Print'],
						'/',
						['-','Bold','Italic','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyFull','-','OrderedList','UnorderedList','-', 'TextColor','BGColor','-','FitWindow','ShowBlocks','-','Rule','Smiley','SpecialChar','RemoveFormat']
						],

					};
	    //config.protectedSource.push( /<\?[\s\S]*?\?>/g );
	    //config.protectedSource.push( /<\?[\s\S]*?\?>/g );   // PHP Code

		myEditor[idName] = CKEDITOR.replace(idName, config, html );

		CKEDITOR.remove(myEditor[idName]);
	} 	else {
		$('#'+idName).html(myEditor[idName].getData());
		// Destroy editor
		myEditor[idName].destroy();
		myEditor[idName] = null;
	}
}
</script>

</div>
