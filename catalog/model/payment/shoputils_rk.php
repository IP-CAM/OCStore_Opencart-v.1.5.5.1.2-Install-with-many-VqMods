<?php 
/*
 * Shoputils
 *
 * ПРИМЕЧАНИЕ К ЛИЦЕНЗИОННОМУ СОГЛАШЕНИЮ
 *
 * Этот файл связан лицензионным соглашением, которое можно найти в архиве,
 * вместе с этим файлом. Файл лицензии называется: LICENSE.1.5.x.RUS.txt
 * Так же лицензионное соглашение можно найти по адресу:
 * http://opencart.shoputils.ru/LICENSE.1.5.x.RUS.txt
 * 
 * =================================================================
 * OPENCART 1.5.x ПРИМЕЧАНИЕ ПО ИСПОЛЬЗОВАНИЮ
 * =================================================================
 *  Этот файл предназначен для Opencart 1.5.x. Shoputils не
 *  гарантирует правильную работу этого расширения на любой другой 
 *  версии Opencart, кроме Opencart 1.5.x. 
 *  Shoputils не поддерживает программное обеспечение для других 
 *  версий Opencart.
 * =================================================================
*/

class ModelPaymentShoputilsRK extends Model {
		const METHOD_CODE = 'shoputils_rk';

  	public function getMethod($address, $total) {
		$this->load->language('payment/shoputils_rk');

		//if ($this->config->get('shoputils_rk_status')) {
		if (($this->config->get('shoputils_rk_status')) && ($total) &&
        (!$this->config->get('shoputils_rk_minimal_order') || ($total >= (float)$this->config->get('shoputils_rk_minimal_order'))) &&
        (!$this->config->get('shoputils_rk_maximal_order') || ($total <= (float)$this->config->get('shoputils_rk_maximal_order')))) {
      		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('shoputils_rk_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			
			if (!$this->config->get('shoputils_rk_geo_zone_id')) {
        		$status = true;
      		} elseif ($query->num_rows) {
      		  	$status = true;
      		} else {
     	  		$status = false;
			}	
      	} else {
			$status = false;
		}

        $method_data = array();

		if ($status) {
            $title = $this->config->get('shoputils_rk_langdata');
            $method_data = array(
                'code'        => self::METHOD_CODE,
                'title'       => $title[$this->config->get('config_language_id')]['title'],
                'description' => $this->makeDescriptions(),
                'sort_order'  => $this->config->get('shoputils_rk_sort_order')
            );
    	}
    	return $method_data;
  	}

    public function checkLaterpay($order_id) {
          if (($this->config->get('shoputils_rk_laterpay_mode')) && ($this->config->get('shoputils_rk_order_later_status_id') != $this->config->get('shoputils_rk_order_confirm_status_id'))) { //Mode Laterpay Disabled?     
              $order_info = $this->getOrder($order_id);

              if ((!$order_info) || ($order_info['payment_code'] != self::METHOD_CODE)) {
                return false;
              }
              
              return $order_info['order_status_id'] == $this->config->get('shoputils_rk_order_later_status_id');
      }
      return false;
    }
    
    public function getOrderStatusById($order_status_id, $language_id = false) {
        if (!$language_id) {
          $language_id = (int)$this->config->get('config_language_id');
        }
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . $language_id . "'");
        return $query->num_rows ? $query->row['name'] : '';
    }

    public function getCustomerGroup($customer_group_id) {
        if ($this->getVersion() >= 152) {
          $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer_group cg LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cg.customer_group_id = '" . (int)$customer_group_id . "' AND cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
        } else {  //v1.5.1.3 & low
          $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer_group WHERE customer_group_id = '" . (int)$customer_group_id . "'");
        }
        return $query->num_rows ? $query->row['name'] : '';
    }

    public function getProducts($order_id) {
        $order_info = $this->getOrder($order_id);
        $order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
        $order_download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_download WHERE order_id = '" . (int)$order_id . "'");
        $order_voucher_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");
        $order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order ASC");
				
				$result = '';
				foreach ($order_product_query->rows as $product) {
					$result .= $product['quantity'] . 'x ' . $product['name'] . ' (' . $product['model'] . ') ' . html_entity_decode($this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . '<br />';
					
					$order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . $product['order_product_id'] . "'");
					
					foreach ($order_option_query->rows as $option) {
						if ($option['type'] != 'file') {
							$value = $option['value'];
						} else {
							$value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
						}
											
						$result .= chr(9) . '-' . $option['name'] . ' ' . (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value) . '<br />';
					}
				}
				
				foreach ($order_voucher_query->rows as $voucher) {
					$result .= '1x ' . $voucher['description'] . ' ' . $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']);
				}
				return $result;
    }

    public function getOrder($order_id) {
      $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "'");
      $result = $query->num_rows ? $query->row : false;
      if ($result) {
        //Compatibles for 1.5.1.3 and low
        if (!isset($result['payment_code'])) {
          $method_code = $this->config->get('shoputils_rk_langdata');
          $result['payment_code'] = strtoupper($result['payment_method']) == strtoupper($method_code[$result['language_id']]['title']) ? self::METHOD_CODE : '';
        }
      }
      return $result;
    }

    protected function makeDescriptions() {
        $this->load->language('renderer/rk_payment_currency');
        $this->load->model('renderer/rk_payment_currency');
        $data = array(
            'favorites' => array(
                'expand' => false,
                'name' => $this->language->get('text_payment_favorites'),
                'card-visa' => array(
                    'url' => 'http://robokassa.ru/ru/Creditcards.aspx',
                ),
                'card-mastercard' => array(
                    'url' => 'http://robokassa.ru/ru/Creditcards.aspx',
                ),
                'emoney-webmoney' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'emoney-w1' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'terminal-qiwi' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
                'terminal-elecsnet' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
                'onlinebank-alphabank' => array(
                    'url' => 'http://robokassa.ru/ru/E-invoicing.aspx',
                ),
                'onlinebank-handybank' => array(
                    'url' => 'http://robokassa.ru/ru/E-invoicing.aspx',
                ),
            ),
            'emoney' => array(
                'expand' => true,
                'name' => $this->language->get('text_payment_emoney'),
                'emoney-webmoney' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'emoney-yandex.money' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'emoney-moneymail' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'emoney-rbkmoney' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'emoney-easypay' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'emoney-w1' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'emoney-liqpay' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'emoney-webcreds' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
                'emoney-zpayment' => array(
                    'url' => 'http://robokassa.ru/ru/Currencies.aspx',
                ),
            ),
            'sms' => array(
                'expand' => true,
                'name' => $this->language->get('text_payment_sms'),
                'sms-beeline' => array(
                    'url' => 'http://robokassa.ru/ru/Sms.aspx',
                ),
                'sms-megafon' => array(
                    'url' => 'http://robokassa.ru/ru/Sms.aspx',
                ),
                'sms-mts' => array(
                    'url' => 'http://robokassa.ru/ru/Sms.aspx',
                ),
            ),
            'card' => array(
                'expand' => true,
                'name' => $this->language->get('text_payment_card'),
                'card-visa' => array(
                    'url' => 'http://robokassa.ru/ru/Creditcards.aspx',
                ),
                'card-mastercard' => array(
                    'url' => 'http://robokassa.ru/ru/Creditcards.aspx',
                ),
                'card-maestro' => array(
                    'url' => 'http://robokassa.ru/ru/Creditcards.aspx',
                ),
            ),
            'terminal' => array(
                'expand' => true,
                'name' => $this->language->get('text_payment_terminal'),
                'terminal-qiwi' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
                'terminal-elecsnet' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
                'terminal-novo-plat' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
                'terminal-comepay' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
                'terminal-unikassa' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
                'terminal-mobilelement' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
                'terminal-pinpay' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
                'terminal-absoluteplat' => array(
                    'url' => 'http://robokassa.ru/ru/Terminals.aspx',
                ),
            ),
            'onlinebank' => array(
                'expand' => true,
                'name' => $this->language->get('text_payment_onlinebank'),
                'onlinebank-alphabank' => array(
                    'url' => 'http://robokassa.ru/ru/E-invoicing.aspx',
                ),
                'onlinebank-handybank' => array(
                    'url' => 'http://robokassa.ru/ru/E-invoicing.aspx',
                ),
            ),
            'other' => array(
                'expand' => true,
                'name' => $this->language->get('text_payment_other'),
                'other-ipad-iphone' => array(
                    'url' => 'http://www.robokassa.ru/ru/iRobokassa.aspx',
                ),
            ),
        );

        return $this->model_renderer_rk_payment_currency->makePaymentCurrency($data, 'robokassa');
    }

    protected function getVersion() {
        $version = explode('.', VERSION);
        $rev= isset($version[3]) ? 0.1*$version[3] : 0;
        $main = $version[0].$version[1].$version[2];
        return (int)$main + $rev;
    }
}
?>