<?php
//-----------------------------------------------------
// based on TagCloud Created by villagedefrance                   
//-----------------------------------------------------

class ModelModuleTagCloud extends Model {

	public function getRandomTags($limit = 5, $min_font_size = 9, $max_font_size = 25, $font_weight) {

		$names			= array();
		$totals			= array();
		$tags			= array();
		$tagcloud		= false;
		
		if (isset($this->request->get['path'])) {
			$path = explode('_', $this->request->get['path']);
			
			$category_id = end($path);
			$tagNameQuery = $this->db->query("SELECT DISTINCT tag FROM " . DB_PREFIX . "product_description pd join " . DB_PREFIX . "product_to_category p2c on p2c.product_id = pd.product_id  WHERE p2c.category_id = " .$category_id. " and language_id=" . (int)$this->config->get('config_language_id') . " order by rand()");

		}
		else
			$tagNameQuery = $this->db->query("SELECT DISTINCT tag FROM " . DB_PREFIX . "product_description WHERE language_id=" . (int)$this->config->get('config_language_id') . " order by rand()");
		
		$tags = array();
		foreach ($tagNameQuery->rows as $row) {
			$words = explode(",",$row['tag']);
			$tags = array_merge($tags, $words);
		}
		
		$tags = array_slice(array_count_values($tags), 0, (int)$limit);

		$tagcloud = $this->generateTagCloud($tags, true, $min_font_size, $max_font_size, $font_weight);
		
		return $tagcloud;
	}

	private function generateTagCloud($tags, $resize = true, $min_font_size = 9, $max_font_size = 25, $font_weight) {

		if ($resize == true) {
			//arsort($tags);

			$max_qty = max(array_values($tags));
			$min_qty = min(array_values($tags));

			$cloud = array();

			foreach ($tags as $key => $value) {
				
				$size = rand((int)$min_font_size,(int)$max_font_size);

				/*$size = (int)((int)$max_font_size*(int)($value/$max_qty));
				if ($size < (int)$min_font_size)
				{
					$size = (int)$min_font_size;
				}*/
			
				$cloud[] = '<a href="' . $this->url->link('product/search', 'tag=' . $key) . '" style="text-decoration:none;font-size:' . $size . 'px;font-weight:' . $font_weight . ';" title="">' . $key . '</a> ';
			}
			
		} else {
		
			foreach ($tags as $key => $value) {
				$cloud[] = '<a href="' . $this->url->link('product/search', 'tag=' . $key) . '" style="text-decoration:none;" title="">' . $key . '</a> ';
			}
		}

		$tagcloud = '';

		shuffle($cloud);

		for ($x = 0; $x < count($cloud); $x++) {
			$tagcloud .= $cloud[$x];
		}

		return $tagcloud;
	}
}
?>