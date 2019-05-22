<?php
class BBCode
{
	public static $width = '160';
	public static $bbclass = 'bbimage';
	private static $simple_search = array('/\[b\](.*?)\[\/b\]/is', '/\[i\](.*?)\[\/i\]/is', '/\[u\](.*?)\[\/u\]/is', '/\[s\](.*?)\[\/s\]/is', '/\[size\=(.*?)\](.*?)\[\/size\]/is', '/\[color\=(.*?)\](.*?)\[\/color\]/is', '/\[center\](.*?)\[\/center\]/is', '/\[font\=(.*?)\](.*?)\[\/font\]/is', '/\[align\=(left|center|right)\](.*?)\[\/align\]/is', '/\[url\=(.*?)\]\[img\](.*?)\[\/img\]\[\/url\]/ise', '/\[url\](.*?)\[\/url\]/is', '/\[url\=(.*?)\](.*?)\[\/url\]/is', '/\[mail\=(.*?)\](.*?)\[\/mail\]/is', '/\[mail\](.*?)\[\/mail\]/is', '/\[img\](.*?)\[\/img\]/ise', '/\[img\=(\d*?)x(\d*?)\](.*?)\[\/img\]/is', '/\[img (.*?)\](.*?)\[\/img\]/ise', '/\[quote\](.*?)\[\/quote\]/is', '/\[quote\=(.*?)\](.*?)\[\/quote\]/is', '/\[code\](.*?)\[\/code\]/is', '/\[sub\](.*?)\[\/sub\]/is', '/\[sup\](.*?)\[\/sup\]/is', '/\[p\](.*?)\[\/p\]/is', "/\[video\](.*?)\[\/video\]/i", "/\[gvideo\](.*?)\[\/gvideo\]/i", '/\[bull \/\]/i', '/\[copyright \/\]/i', '/\[registered \/\]/i', '/\[tm \/\]/i');
	private static $simple_replace = array('<strong>$1</strong>', '<em>$1</em>', '<u>$1</u>', '<del>$1</del>', '<span style="font-size: $1%;">$2</span>', '<span style="color: $1;">$2</span>', '<div style="text-align: center;">$1</div>', '<span style="font-family: $1;">$2</span>', '<div style="text-align: $1;">$2</div>', '"<a href=\"$1\" class=\"imagebox\" rel=\"imagebox\"><img class=\"bbimage\" alt=\"\" width=\"".self::$width."\" src=\"$2\"></a>"', '<a href="$1">$1</a>', '<a href="$1">$2</a>', '<a href="mailto:$1">$2</a>', '<a href="mailto:$1">$1</a>', '"<a href=\"$1\" class=\"imagebox\" rel=\"imagebox\"><img class=\"bbimage\" alt=\"\" width=\"".self::$width."\" src=\"$1\"></a>"', '<img height="$2" width="$1" src="$3" class=\"bbimage\" alt=\"\"/>', '"<img " . str_replace("&#039;", "\"",str_replace("&quot;", "\"", "$1")) . " src=\"$2\" width=\"".self::$width."\" class=\"bbimage\" alt=\"\"/>"', '<blockquote>$1</blockquote>', '<blockquote><strong>$1 wrote:</strong> $2</blockquote>', '<pre>$1</pre>', '<sub>$1</sub>', '<sup>$1</sup>', '<p>$1</p>', '<div style="overflow:hidden; "><iframe width="300" height="200" src="http://www.youtube.com/embed/$1" frameborder="0" allowfullscreen></iframe></div>', "<embed src=\"http://video.google.com/googleplayer.swf?docId=$1\" type=\"application/x-shockwave-flash\" style=\"width: 300px; height: 200px;\">", '&bull;', '&copy;', '&reg;', '&trade;');
	private static $lineBreaks_search = array('/\[list(.*?)\](.+?)\[\/list\]/sie', '/\[\/list\]\s*\<br \/\>/i', '/\[code\](.+?)\[\/code\]/sie', '/\[\/code\]\s*\<br \/\>/i', '/\[\/quote\]\s*\<br \/\>/i', '/\[\/p\]\s*\<br \/\>/i', '/\[\/center\]\s*\<br \/\>/i', '/\[\/align\]\s*\<br \/\>/i');
	private static $lineBreaks_replace = array("'[list$1]'.str_replace('<br />', '', '$2').'[/list]'", "[/list]", "'[code]'.str_replace('<br />', '', '$1').'[/code]'", "[/code]", "[/quote]", "[/p]", "[/center]", "[/align]");
	private static function process_list_items($list_items)
	{
		$result_list_items = array();
		preg_match_all("/\[li\](.*?)\[\/li\]/is", $list_items, $li_array);
		$li_array = $li_array[1];
		if (empty($li_array)) {
			$list_items_array = explode("[*]", $list_items);
			foreach ($list_items_array as $li_text) {
				$li_text = trim($li_text);
				if (empty($li_text)) {
					continue;
				} //empty($li_text)
				$li_text             = nl2br($li_text);
				$result_list_items[] = '<li>' . $li_text . '</li>';
			} //$list_items_array as $li_text
		} //empty($li_array)
		else {
			foreach ($li_array as $li_text) {
				$li_text             = nl2br($li_text);
				$result_list_items[] = '<li>' . $li_text . '</li>';
			} //$li_array as $li_text
		}
		$list_items = implode("\n", $result_list_items);
		return $list_items;
	}
	public static function parse($string)
	{
		$s = (string) $string;
		if (empty($s)) {
			return '';
		} //empty($s)
		$s = preg_replace('/\[url\=([^(http)].+?)\](.*?)\[\/url\]/i', '[url=http://$1]$2[/url]', $s);
		$s = preg_replace('/\[url\]([^(http)].+?)\[\/url\]/i', '[url=http://$1]$1[/url]', $s);
		$s = nl2br($s);
		$s = preg_replace(self::$lineBreaks_search, self::$lineBreaks_replace, $s);
		$s = preg_replace(self::$simple_search, self::$simple_replace, $s);
		$s = preg_replace('/\[list\](.*?)\[\/list\]/sie', '"<ul>\n".self::process_list_items("$1")."\n</ul>"', $s);
		$s = preg_replace('/\[list\=(disc|circle|square|decimal|decimal-leading-zero|lower-roman|upper-roman|lower-greek|lower-alpha|lower-latin|upper-alpha|upper-latin|hebrew|armenian|georgian|cjk-ideographic|hiragana|katakana|hiragana-iroha|katakana-iroha|none)\](.*?)\[\/list\]/sie', '"<ol style=\"list-style-type: $1;\">\n".self::process_list_items("$2")."\n</ol>"', $s);
		return $s;
	}
}
if (!function_exists('agoo_error_handler')) {
	function agoo_error_handler($errno, $errstr)
	{
	}
} //!function_exists('agoo_error_handler')
?>