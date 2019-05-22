<?php
class ModelCatalogCatapulta extends Model {

	public function deleteOrder($order_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "catapulta WHERE order_id = '" . (int) $order_id . "'");
	}

	public function getOrders($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "catapulta";

		if (isset($data['filter_order_id']) && !is_null($data['filter_order_id'])) {
			$sql .= " WHERE order_id = '" . (int) $data['filter_order_id'] . "'";
		} else {
			$sql .= " WHERE order_id > '0'";
		}

		if (!empty($data['filter_contact'])) {
			$sql .= " AND contact LIKE '%" . $this->db->escape($data['filter_contact']) . "%'";
		}

		if (!empty($data['filter_product_name'])) {
			$sql .= " AND product_name LIKE '%" . $this->db->escape($data['filter_product_name']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float) $data['filter_total'] . "'";
		}

		$sort_data = array(
			'order_id',
			'contact',
			'product_name',
			'total',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY order_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalOrders() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "catapulta");

		return $query->row['total'];
	}

	public function tableExists() {
		$query = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "catapulta'");

		return $query->num_rows;
	}

	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "catapulta (
			order_id int(11) NOT NULL AUTO_INCREMENT,
			contact varchar(96) NOT NULL,
			product_id int(11) NOT NULL,
			product_name varchar(255) NOT NULL,
			total decimal(15,4) NOT NULL DEFAULT '0.0000',
			date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
			currency_id int(11) NOT NULL,
			currency_code varchar(3) NOT NULL,
			currency_value decimal(15,8) NOT NULL DEFAULT '1.00000000',
			PRIMARY KEY (order_id)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8;");
	}

	public function unistall() {
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "catapulta");
	}

}

?>
