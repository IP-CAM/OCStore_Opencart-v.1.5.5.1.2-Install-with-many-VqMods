<?php
# загрузка файлы при помощи ajax-формы
function fileupload($file){
  $input = fopen("php://input", "r");
  $temp = tmpfile();
  $realSize = stream_copy_to_stream($input, $temp);
  fclose($input);
  if(!isset($_SERVER["CONTENT_LENGTH"]) || $realSize != (int)$_SERVER["CONTENT_LENGTH"]) return array('status'=>'err','msg'=>'The actual size of the file does not match the passed');
  if(is_dir($file)) { 
    $_GET['qqfile'] = explode('\\',$_GET['qqfile']);
    $_GET['qqfile'] = array_pop($_GET['qqfile']);
    $file = $file.'/'.$_GET['qqfile']; 
  }
  $target = fopen($file, "w");        
  fseek($temp, 0, SEEK_SET);
  stream_copy_to_stream($temp, $target);
  fclose($target);
  return $file;
}
?>
