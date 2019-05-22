<?php
class ModelCatalogCatapulta extends Model {

	public function addOrder($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "catapulta SET contact = '" . $this->db->escape($data['contact']) . "', product_id = '" . (int) $data['product_id'] . "', product_name = '" . $this->db->escape($data['product_name']) . "', total = '" . (float) $data['total'] . "', date_added = NOW(), currency_id = '" . (int) $data['currency_id'] . "', currency_code = '" . $this->db->escape($data['currency_code']) . "', currency_value = '" . (float) $this->db->escape($data['currency_value']) . "'");

		$order_id = $this->db->getLastId();

		$this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = (quantity - 1) WHERE product_id = '" . (int) $data['product_id'] . "' AND subtract = '1'");

		return $order_id;
	}

}

?>