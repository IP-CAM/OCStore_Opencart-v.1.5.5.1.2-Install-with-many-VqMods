<?php
class ModelLocalisationCurrency extends Model {
	public function addCurrency($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "currency SET title = '" . $this->db->escape($data['title']) . "', code = '" . $this->db->escape($data['code']) . "', symbol_left = '" . $this->db->escape($data['symbol_left']) . "', symbol_right = '" . $this->db->escape($data['symbol_right']) . "', decimal_place = '" . $this->db->escape($data['decimal_place']) . "', value = '" . $this->db->escape($data['value']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW()");

		$this->cache->delete('currency');
	}
	
	public function editCurrency($currency_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "currency SET title = '" . $this->db->escape($data['title']) . "', code = '" . $this->db->escape($data['code']) . "', symbol_left = '" . $this->db->escape($data['symbol_left']) . "', symbol_right = '" . $this->db->escape($data['symbol_right']) . "', decimal_place = '" . $this->db->escape($data['decimal_place']) . "', value = '" . $this->db->escape($data['value']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE currency_id = '" . (int)$currency_id . "'");

		$this->cache->delete('currency');
	}
	
	public function deleteCurrency($currency_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "currency WHERE currency_id = '" . (int)$currency_id . "'");
	
		$this->cache->delete('currency');
	}

	public function getCurrency($currency_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "currency WHERE currency_id = '" . (int)$currency_id . "'");
		return $query->row;
	}
	
	public function getCurrencyByCode($currency) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "currency WHERE code = '" . $this->db->escape($currency) . "'");
		return $query->row;
	}
		
	public function getCurrencies($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "currency";

			$sort_data = array(
				'title',
				'code',
				'value',
				'date_modified'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY title";	
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
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}
			
			$query = $this->db->query($sql);
	
			return $query->rows;
		} else {
			$currency_data = $this->cache->get('currency');

			if (!$currency_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency ORDER BY title ASC");
	
				foreach ($query->rows as $result) {
      				$currency_data[$result['code']] = array(
        				'currency_id'   => $result['currency_id'],
        				'title'         => $result['title'],
        				'code'          => $result['code'],
						'symbol_left'   => $result['symbol_left'],
						'symbol_right'  => $result['symbol_right'],
						'decimal_place' => $result['decimal_place'],
						'value'         => $result['value'],
						'status'        => $result['status'],
						'date_modified' => $result['date_modified']
      				);
    			}	
			
				$this->cache->set('currency', $currency_data);
			}
			
			return $currency_data;			
		}
	}

	public function updateCurrencies() {
	
	$query = $this->db->query("SELECT date_modified FROM " . DB_PREFIX . "currency WHERE code != '" . $this->db->escape($this->config->get('config_currency')) . "'");
	$cc_value = $this->db->query("SELECT value FROM " . DB_PREFIX . "currency WHERE code = '" . $this->db->escape($this->config->get('config_currency')) . "'");
	$i = 0;
	foreach ($query->rows as $mdate) {
		if($this->db->escape(date('Y-m-d',strtotime($mdate['date_modified']))) < $this->db->escape(date('Y-m-d', strtotime('now')))) $i++;
	}
	$manual_update = isset($this->request->post['manual_update']) ? $this->request->post['manual_update'] : false;
	if ($i || $cc_value->row['value'] != 1.00000 || $manual_update)	{
	$url = 'http://www.cbr.ru/scripts/XML_daily.asp';
	$answer = $this->CheckHttpStatus($url);
	if ($answer != 200) {
	/*
	echo '<script type="text/javascript" charset="utf-8">
	alert("Не удалось загрузить файл курсов валют с сайта ЦБРФ! Код статуса ответа сервера: '.$answer.'. URL: '.$url.' . Возможны временные сбои на сервере, попробуйте обновить курсы позже. Дата последнего обновления валют: ' . $ldate["date_modified"] . '");
	</script>';
	*/
	} else {
	
		if (extension_loaded('curl')) {
			$data = array();
						
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, 'http://www.cbr.ru/scripts/XML_daily.asp');
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			$content = curl_exec($ch);
			curl_close($ch);

			$doc = new DOMDocument();
			$doc->loadXML($content);
			$valute = $doc->getElementsByTagName("Valute");
			
			$cur_val = $this->config->get('config_currency') == 'RUB' ? 'RUB' : $this->config->get('config_currency');
	
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency WHERE code != '" . $this->db->escape($this->config->get('config_currency')) . "'");

			$ret = array();

			foreach( $valute as $value )
			{
				$icn = $value->childNodes;
				$code = $icn->item(3)->nodeValue;
				$nom = intval($icn->item(5)->nodeValue);
				$value = floatval(str_replace(",", "." , $icn->item(9)->nodeValue));
				$ret[$code] = ($value/$nom);
			}
			
			if ($cur_val == 'RUB') {
			foreach ($query->rows as $result) {
			 if($ret[$result['code']]){
				//$value = 1 / $ret[$result['code']];
				$value = 1 / $ret[$result['code']];

				if ((float)$value) {
					$this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . (float)$value . "', date_modified = NOW() WHERE code = '" . $this->db->escape($result['code']) . "'");
				}
			 }
			}
			
			}

			if ($cur_val != 'RUB') {
			
			foreach ($query->rows as $result) {
			    if($result['code'] == 'RUB') {
				$value = $ret[$cur_val];
				if ((float)$value) {
				    $this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . (float)$value . "', date_modified = NOW() WHERE code = 'RUB'");
				}
				} else {
				    $value = $ret[$result['code']];
				    if ((float)$value) {
					$val = (float)$ret[$cur_val] / (float)$value;
				        $this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . $val . "', date_modified = NOW() WHERE code = '" . $this->db->escape($result['code']) . "'");
				    }
				}
			}
			}
			
			$this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '1.00000', date_modified = NOW() WHERE code = '" . $this->db->escape($this->config->get('config_currency')) . "'");
			
			$this->cache->delete('currency');

		}
	} }
	
	}

public function CheckHttpStatus($url) {
  $user_agent = 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)';
  $ch = curl_init();
  curl_setopt($ch, CURLOPT_URL, $url);
  curl_setopt($ch, CURLOPT_USERAGENT, $user_agent);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($ch, CURLOPT_VERBOSE, false);
  curl_setopt($ch, CURLOPT_TIMEOUT, 10);
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
  curl_setopt($ch, CURLOPT_SSLVERSION, 3);
  curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
  $page = curl_exec($ch);

  $err = curl_error($ch);
  if (!empty($err)) return $err;
  
  $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
  curl_close($ch);
  return $httpcode;
  }	
	
	public function getTotalCurrencies() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "currency");
		
		return $query->row['total'];
	}
}
?>