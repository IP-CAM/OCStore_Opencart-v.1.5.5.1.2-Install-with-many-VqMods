<?php
require_once(dirname(__FILE__).'/fileupload.php');

	$file = fileupload("{$_SERVER['DOCUMENT_ROOT']}".'/admin/uploads');
	echo json_encode(array('status'=>'ok','file'=>$file));

?>
