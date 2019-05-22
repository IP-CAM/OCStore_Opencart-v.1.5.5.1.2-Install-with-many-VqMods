<?php
class ControllerModuleCatapulta extends Controller {

	protected function index() {
		if ($this->config->get('catapulta_status')) {
			$this->language->load('module/catapulta');

			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
			$this->document->addScript('catalog/view/javascript/jquery/jquery.maskedinput.min.js');
			$this->document->addScript('catalog/view/javascript/catapulta.js');

			$this->data['heading_title'] = $this->language->get('heading_title');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/catapulta.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/catapulta.tpl';
			} else {
				$this->template = 'default/template/module/catapulta.tpl';
			}

			$this->render();
		}
	}

	public function getForm() {
		$this->load->model('catalog/product');

		$this->language->load('module/catapulta');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_wait'] = $this->language->get('text_wait');

		$this->data['entry_contact'] = $this->language->get('entry_contact');

		$this->data['button_send'] = $this->language->get('button_send');

		if ($this->config->get('catapulta_phone_mask_status')) {
			$this->data['phone_mask'] = $this->config->get('catapulta_phone_mask');
		} else {
			$this->data['phone_mask'] = '';
		}

		$this->data['phone_text'] = $this->config->get('catapulta_phone_text');

		$this->data['stock_status'] = 1;

		if (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')) {
			$product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);

			if (!$product_info['quantity'] || ($product_info['quantity'] < 0)) {
				$this->data['error_warning'] = $this->language->get('error_stock');

				if (!$this->config->get('config_stock_checkout')) {
					$this->data['stock_status'] = 0;
				}
			}
		}

		if ($this->customer->isLogged()) {
			$this->load->model('account/customer');

			$this->data['text_customer'] = $this->language->get('text_customer');

			$customer = $this->model_account_customer->getCustomer($this->customer->getId());

			$data = array(
				'contact' => $customer['telephone'],
				'product_id' => $this->request->get['product_id']
			);

			$this->write($data);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/catapulta_form.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/catapulta_form.tpl';
		} else {
			$this->template = 'default/template/module/catapulta_form.tpl';
		}

		$this->response->setOutput($this->render());
	}

	public function write($settings = array()) {
		$this->language->load('module/catapulta');

		$this->load->model('catalog/catapulta');
		$this->load->model('setting/setting');

		$json = array();

		if ($settings) {
			$contact = $settings['contact'];
			$product_id = $settings['product_id'];
		} elseif ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$contact = $this->request->post['contact'];
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if ($product_id) {
			if ((utf8_strlen($contact) < 3) || (utf8_strlen($contact) > 50)) {
				if ($this->config->get('catapulta_phone_mask_status')) {
					$json['error']['contact'] = $this->language->get('error_mask');
				} else {
					$json['error']['contact'] = $this->language->get('error_contact');
				}
			}

			if (!isset($json['error'])) {
				if ($this->config->get('catapulta_phone_text')) {
					$contact = $this->config->get('catapulta_phone_text') . $contact;
				}

				$this->load->model('catalog/product');

				$product_info = $this->model_catalog_product->getProduct($product_id);

				$price = isset($product_info['special']) ? $product_info['special'] : $product_info['price'];
				$total = $this->currency->format($price);

				$data = array(
					'contact' => $contact,
					'product_id' => $product_id,
					'product_name' => $product_info['name'],
					'total' => $price,
					'currency_id' => $this->currency->getId(),
					'currency_code' => $this->currency->getCode(),
					'currency_value' => $this->currency->getValue($this->currency->getCode())
				);

				$order_id = $this->model_catalog_catapulta->addOrder($data);

				if ($this->config->get('catapulta_email_status')) {
					$email_subject = sprintf($this->language->get('text_subject'), $this->language->get('heading_title'), $this->config->get('config_name'), $order_id);
					$email_text = sprintf($this->language->get('text_order'), $order_id) . "\n\n";
					$email_text .= sprintf($this->language->get('text_contact'), html_entity_decode($contact), ENT_QUOTES, 'UTF-8') . "\n";
					$email_text .= sprintf($this->language->get('text_ip'), $this->request->server['REMOTE_ADDR'], ENT_QUOTES, 'UTF-8') . "\n\n";
					$email_text .= sprintf($this->language->get('text_product'), html_entity_decode($product_info['name']), ENT_QUOTES, 'UTF-8') . "\n";
					$email_text .= sprintf($this->language->get('text_date_order'), date('d.m.Y H:i'), ENT_QUOTES, 'UTF-8') . "\n\n";
					$email_text .= sprintf($this->language->get('text_price'), $total, ENT_QUOTES, 'UTF-8');

					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->hostname = $this->config->get('config_smtp_host');
					$mail->username = $this->config->get('config_smtp_username');
					$mail->password = $this->config->get('config_smtp_password');
					$mail->port = $this->config->get('config_smtp_port');
					$mail->timeout = $this->config->get('config_smtp_timeout');
					$mail->setTo($this->config->get('config_email'));
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender($this->config->get('config_name'));
					$mail->setSubject($email_subject);
					$mail->setText($email_text);
					$mail->send();
				}

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

}

?>
