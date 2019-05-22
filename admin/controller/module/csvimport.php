<?php
class ControllerModuleCSVImport extends Controller {
	private $error = array();

	private $escape_fields = array('model', 'sku', 'upc', 'location', 'image');

	public $allowed_fields = array('model', 'sku', 'upc', 'location', 'quantity', 'stock_status_id', 'image', 'manufacturer_id', 'shipping', 'price', 'points',
								   'tax_class_id', 'date_available', 'weight', 'weight_class_id', 'length', 'width', 'height', 'length_class_id', 'subtract',
								   'minimum', 'sort_order', 'status', 'date_added', 'date_modified', 'viewed');

	public function index() {
		$this->load->language('module/csvimport');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_export'] = $this->language->get('button_export');
		$this->data['button_import'] = $this->language->get('button_import');
		$this->data['text_import'] = $this->language->get('text_import');

		if(isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/csvimport', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['action_import'] = $this->url->link('module/csvimport/import', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['action_export'] = $this->url->link('module/csvimport/export', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->template = 'module/csvimport.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);


		$this->response->setOutput($this->render());
	}

	public function export() {
		$sql = "SELECT * FROM " . DB_PREFIX . "product";

		header('Content-Type: text/csv');
		header('Content-Disposition: attachment;filename=' . 'export.csv');
		$fp = fopen('php://output', 'w');

		$query = $this->db->query($sql);
		if($query->rows) {

			//headers
			fputcsv($fp, array_keys($query->row), ';', '"');

			foreach($query->rows as $row) {
				fputcsv($fp, $row, ';', '"');
			}
		}

		fclose($fp);
	}


	public function import() {

		if($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {

			if(is_uploaded_file($this->request->files['import']['tmp_name'])) {

				if(($handle = fopen($this->request->files['import']['tmp_name'], "r")) !== FALSE) {
					$headers = fgetcsv($handle, 0, ';', '"');

					$k = 0;
					while(($data = fgetcsv($handle, 0, ';', '"')) !== FALSE) {
						$num = count($data);
						$pairs = array();
						$product_id = 0;
						for($c = 0; $c < $num; $c++) {
							if(isset($headers[$c])) {
								$field = $headers[$c];
								if($field == 'product_id') {
									$product_id = (int)$data[$c];
								} else {
									if(in_array($field, $this->allowed_fields)) {
										if(in_array($field, $this->escape_fields)) {
											$pairs[] = $field . " = '" . $this->db->escape($data[$c]) . "'";
										} else {
											$pairs[] = $field . " = '" . $data[$c] . "'";
										}
									}
								}
							}
						}
						$this->db->query("UPDATE " . DB_PREFIX . "product SET " . implode(', ', $pairs) . " WHERE product_id = " . $product_id);
						$k++;
					}
					fclose($handle);
					$this->session->data['success'] = sprintf($this->language->get("text_updated"), $k);
					$this->cache->delete('product');
				}
			}
			$this->redirect($this->url->link('module/csvimport', 'token=' . $this->session->data['token'], 'SSL'));
		}

	}


	private function validate() {
		if(!$this->user->hasPermission('modify', 'module/csvimport')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if(!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}

?>