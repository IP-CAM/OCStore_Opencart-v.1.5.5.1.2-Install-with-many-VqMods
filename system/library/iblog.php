<?php
class iBlog
{
	private static $mode = 'FULL';
	private static $short = true;
	private $adirs = array();
	public static function print_my($var)
	{
		print_r("<PRE>");
		print_r($var);
		print_r("</PRE>");
	}
	public static function searchdir($path, $mode = 'self::$mode', $myself = false, $maxdepth = -1, $d = 0)
	{
		if (substr($path, strlen($path) - 1) != '/') {
			$path .= '/';
		} //substr($path, strlen($path) - 1) != '/'
		$dirlist = array();
		if ($mode != "FILES") {
			if ($d != 0 || $myself)
				$dirlist[] = $path;
		} //$mode != "FILES"
		if ($handle = opendir($path)) {
			while (false !== ($file = readdir($handle))) {
				if ($file != '.' && $file != '..') {
					$full_path_file = $path . $file;
					if (!self::$short) {
						$file = $full_path_file;
					} //!self::$short
					else {
						$file = $file;
					}
					if (!is_dir($full_path_file)) {
						if ($mode != "DIRS") {
							$dirlist[] = $file;
						} //$mode != "DIRS"
					} //!is_dir($full_path_file)
					elseif ($d >= 0 && ($d < $maxdepth || $maxdepth < 0)) {
						$dirlist[] = $file;
						$result    = self::searchdir($full_path_file . '/', $mode, $myself, $maxdepth, $d + 1);
					} //$d >= 0 && ($d < $maxdepth || $maxdepth < 0)
				} //$file != '.' && $file != '..'
			} //false !== ($file = readdir($handle))
			closedir($handle);
		} //$handle = opendir($path)
		if ($d == 0) {
			natcasesort($dirlist);
		} //$d == 0
		return ($dirlist);
	}
}
?>