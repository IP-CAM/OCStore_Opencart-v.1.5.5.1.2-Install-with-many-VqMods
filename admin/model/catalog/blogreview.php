<?php
class ModelCatalogBlogreview extends Model
{
	public function editReview($review_id, $data)
	{
		if ($review_id != "" && $data['date_added'] != "") {
			$this->db->query("UPDATE " . DB_PREFIX . "review SET   date_added = '" . $data['date_added'] . "' WHERE review_id = '" . (int) $review_id . "'");
			$this->cache->delete('product');
			$this->cache->delete('blog.module.view');
		} //$review_id != "" && $data['date_added'] != ""
	}
}
?>