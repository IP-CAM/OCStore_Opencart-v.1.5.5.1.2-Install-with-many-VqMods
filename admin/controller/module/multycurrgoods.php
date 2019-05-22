<?php
class ControllerModuleMultycurrgoods extends Controller {
	
	private $error = array(); 

	public function index() {   
// - Блок переменных --
    $this->data['token'] = $this->session->data['token'];
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
    $this->data['round_mode'] = 2;
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `group` = 'multycurrgoods' AND `key` = 'round_mode'");
    if ($query->row) $this->data['round_mode'] = $query->row['value'];
    if (($this->data['round_mode']<-2)||($this->data['round_mode']>3)) $this->data['round_mode'] = 2;
    $this->data['save_mode'] = 0;
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `group` = 'multycurrgoods' AND `key` = 'save_mode'");
    if ($query->row) $this->data['save_mode'] = $query->row['value'];
    $json = 0;
		$this->data['history'] = array();
		//Load the language file for this module
		$this->load->language('module/multycurrgoods');

		//Set the title from the language file $_['heading_title'] string
    $this->data['heading_title'] = $this->language->get('heading_title');
		$this->document->setTitle($this->language->get('heading_title'));
		
		// Обработчик AJAX-запросов
		if (($this->request->server['REQUEST_METHOD'] == 'GET')&&(isset($this->request->get['addcurr']))&&(isset($this->request->get['field1']))&&(isset($this->request->get['field2']))&&(isset($this->request->get['field3']))&&(isset($this->request->get['field4']))&&(isset($this->request->get['field5']))&&(isset($this->request->get['field6']))&&(isset($this->request->get['field7']))) {
       // Обрабатываем запрос  на добавление валюты
		   $this->db->query("INSERT INTO " . DB_PREFIX . "currency SET title = '" . $this->db->escape($this->request->get['field1']) . "', code = '" . $this->db->escape($this->request->get['field2']) . "', symbol_left = '" . $this->db->escape($this->request->get['field3']) . "', symbol_right = '" . $this->db->escape($this->request->get['field4']) . "', decimal_place = '" . $this->db->escape($this->request->get['field5']) . "', value = '" . $this->db->escape($this->request->get['field6']) . "', status = '" . (int)$this->request->get['field7'] . "', date_modified = NOW()");
       }
		if (($this->request->server['REQUEST_METHOD'] == 'GET')&&(isset($this->request->get['id']))&&(isset($this->request->get['kurs']))&&(isset($this->request->get['vendor']))) {
       // Обрабатываем запрос  на пересчет по новому курсу
       $id     = $this->request->get['id'];
       $kurs   = $this->request->get['kurs'];
       $vendor = $this->request->get['vendor'];  
       $total = 0;
       $json = 1;
       if (!$vendor) {
          // --- сохраним для красоты
          $key = "currency_id" . $id . "LastValue";
          $this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `group` = 'multycurrgoods' AND `key` = '" . $key . "'");
          $this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `group` = 'multycurrgoods', `key` = '" . $key . "', `value` = '" . $kurs . "'");
          //--- сохраним в систему
          if ($this->data['save_mode']&&$kurs) {  
            $saved = 0;
  			    $this->db->query("UPDATE " . DB_PREFIX . "currency SET value = '" . (float)(1/$kurs) . "' WHERE currency_id = '" . $id . "'");
            } 
         // Основная таблица
         $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_multycurr WHERE currency_id = '" . $id . "'");
  		   foreach ($query->rows as $result) {
              $price = round ($result['price'] * $kurs, $this->data['round_mode']);
              $total ++;
  			      $this->db->query("UPDATE " . DB_PREFIX . "product SET price = '" . (float)$price . "' WHERE product_id = '" . (int)$result['product_id'] . "'");
              }
        // Сохраняем в историю
        $date =  date("Y-m-d");
        $this->db->query("INSERT INTO " . DB_PREFIX . "product_multycurr_history SET kurs = '" . $kurs . "', total = '" . $total . "', currency_id = '" . $id . "', user = '" . $this->user->getUserName() . "', dateof = '" . $date . "'");
        // Таблица "Акции"
         $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_multycurr_special WHERE currency_id = '" . $id . "'");
  		   foreach ($query->rows as $result) {
              $price = round ($result['mc_price'] * $kurs, $this->data['round_mode']);
  			      $this->db->query("UPDATE " . DB_PREFIX . "product_special SET price = '" . (float)$price . "' WHERE product_special_id = '" . (int)$result['product_special_id'] . "'");
              }
        // Таблица "Скидки"
         $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_multycurr_discount WHERE currency_id = '" . $id . "'");
  		   foreach ($query->rows as $result) {
              $price = round ($result['mc_price'] * $kurs, $this->data['round_mode']);
  			      $this->db->query("UPDATE " . DB_PREFIX . "product_discount SET price = '" . (float)$price . "' WHERE product_discount_id = '" . (int)$result['product_discount_id'] . "'");
              }
        // Таблица "Опции"
         $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_multycurr_option WHERE currency_id = '" . $id . "'");
  		   foreach ($query->rows as $result) {
              $price = round ($result['mc_price'] * $kurs, $this->data['round_mode']);
  			      $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET price = '" . (float)$price . "' WHERE product_option_value_id = '" . (int)$result['product_option_value_id'] . "'");
              }
        }
      else {
         $mquery = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE manufacturer_id = '" . $vendor . "'");
  		   foreach ($mquery->rows as $mresult) {
           // Основная таблица
           $product_id = $mresult['product_id'];
           $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_multycurr WHERE currency_id = '" . $id . "' AND product_id = '" . $product_id . "'");
    		   foreach ($query->rows as $result) {
                $price = round ($result['price'] * $kurs, $this->data['round_mode']);
                $total ++;
    			      $this->db->query("UPDATE " . DB_PREFIX . "product SET price = '" . (float)$price . "' WHERE product_id = '" . (int)$result['product_id'] . "'");
                }
          // Таблица "Акции"
           $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_multycurr_special WHERE currency_id = '" . $id . "' AND product_id = '" . $product_id . "'");
    		   foreach ($query->rows as $result) {
                $price = round ($result['mc_price'] * $kurs, $this->data['round_mode']);
    			      $this->db->query("UPDATE " . DB_PREFIX . "product_special SET price = '" . (float)$price . "' WHERE product_special_id = '" . (int)$result['product_special_id'] . "'");
                }
          // Таблица "Скидки"
           $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_multycurr_discount WHERE currency_id = '" . $id . "' AND product_id = '" . $product_id . "'");
    		   foreach ($query->rows as $result) {
                $price = round ($result['mc_price'] * $kurs, $this->data['round_mode']);
    			      $this->db->query("UPDATE " . DB_PREFIX . "product_discount SET price = '" . (float)$price . "' WHERE product_discount_id = '" . (int)$result['product_discount_id'] . "'");
                }
          // Таблица "Опции"
           $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_multycurr_option WHERE currency_id = '" . $id . "' AND product_id = '" . $product_id . "'");
    		   foreach ($query->rows as $result) {
                $price = round ($result['mc_price'] * $kurs, $this->data['round_mode']);
    			      $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET price = '" . (float)$price . "' WHERE product_option_value_id = '" . (int)$result['product_option_value_id'] . "'");
                }
            }
          // Сохраняем в историю
          $date =  date("Y-m-d");
          $this->db->query("INSERT INTO " . DB_PREFIX . "product_multycurr_history SET kurs = '" . $kurs . "', total = '" . $total . "', currency_id = '" . $id . "', user = '" . $this->user->getUserName() . "', dateof = '" . $date . "'");
        }
      // ----------------------
		  }
		//Save the settings if the user has submitted the admin form (ie if someone has pressed save).
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
      if (isset($this->request->post['id'])) {
        if ($this->request->post['id']=="save") {
          if (isset($this->request->post['round_mode'])) $this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->request->post['round_mode'] . "' WHERE `group` = 'multycurrgoods' AND `key` = 'round_mode'");
          if (isset($this->request->post['save_mode'])) $this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->request->post['save_mode'] . "' WHERE `group` = 'multycurrgoods' AND `key` = 'save_mode'");
          }
        if ($this->request->post['id']=="delhis") $this->db->query("TRUNCATE TABLE " . DB_PREFIX . "product_multycurr_history");
        }
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

	
		//This creates an error message. The error['warning'] variable is set by the call to function validate() in this controller (below)
 		if (isset($this->error['warning'])) $this->data['error_warning'] = $this->error['warning'];
		else                                $this->data['error_warning'] = '';
		
		//SET UP BREADCRUMB TRAIL. YOU WILL NOT NEED TO MODIFY THIS UNLESS YOU CHANGE YOUR MODULE NAME.
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			    'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			    'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			    'href'      => $this->url->link('module/multycurrgoods', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

// - Закрузка списка валют --
		$this->data['currencies'] = array();
		$data = array(
			'sort'  => 'title',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $this->config->get('config_admin_limit')
		);
			$sql = "SELECT * FROM " . DB_PREFIX . "currency" . " ORDER BY title" . " ASC" . " LIMIT " . (int)0 . "," . (int)20;
			$query = $this->db->query($sql);
			$results = $query->rows;

		foreach ($results as $result) {
      $r     = $this->db->query("SELECT COUNT(`product_id`) AS total FROM " . DB_PREFIX . "product_multycurr WHERE currency_id = '" . $result['currency_id'] . "'");
      $key  = "currency_id" . $result['currency_id'] . "LastValue";
  		$last = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `group` = 'multycurrgoods' AND `key` = '" . $key . "'");
      $lastvalue =  $result['value']?1/$result['value']:0;
      if ($last->num_rows) $lastvalue = $last->row['value'];
			$this->data['currencies'][] = array(
				'currency_id'   => $result['currency_id'],
				'title'         => $result['title'] . (($result['code'] == $this->config->get('config_currency')) ? $this->language->get('text_default') : null),
				'code'          => $result['code'],
				'value'         => round ( $result['value']?1/$result['value']:0, 4),
				'last'          => $lastvalue,
 				'total'         => $r->row['total']
         );
		}	
// - Закрузка истории --
		$query1 = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_multycurr_history" . " ORDER BY dateof");
		$results1 = $query1->rows;
		foreach ($results1 as $result1) {
			$this->data['history'][] = array(
				'date'          => $result1['dateof'],
				'user'          => $result1['user'],
				'code'          => $result1['currency_id'],
				'kurs'          => $result1['kurs'],
 				'total'         => $result1['total']
         );
        }
    // Загружаем список производителей
    $this->data['manufacturer'] = array();
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "manufacturer ORDER by name");
    foreach ($query->rows as $result) {
      $totals = array();
      foreach ($this->data['currencies'] as $curr) {   
        $currency_id = $curr['currency_id'];
        $c_query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_multycurr pm LEFT JOIN " . DB_PREFIX . "product p ON (pm.product_id = p.product_id) WHERE pm.currency_id = '" . $currency_id . "' AND p.manufacturer_id = '" . $result['manufacturer_id'] . "'");
        $totals [$curr['currency_id']] = array( 'total' => $c_query->row['total'] );
        }
			$this->data['manufacturer'][] = array(
				'manufacturer_id'    => $result['manufacturer_id'],
        'totals'             => $totals,
 				'name'               => $result['name']
         );
      }
//---- мой блок
		//Choose which template file will be used to display this request.
		$this->template = 'module/multycurrgoods.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		//Send the output.
		if (!$json) $this->response->setOutput($this->render());
    else $this->response->setOutput(json_encode($this->data['history']));
	}
	
	/*
	 * 
	 * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
	 * You can add checks in here of your own.
	 * 
	 */
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/multycurrgoods')) $this->error['warning'] = $this->language->get('error_permission');
		if (!$this->error) return TRUE;
		else return FALSE;
	}

  public function install() {
  	$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_multycurr (product_id INT(11), price decimal(15,4), currency_id INT(11), PRIMARY KEY (product_id))");
//    $this->db->query("TRUNCATE TABLE " . DB_PREFIX . "product_multycurr");
  	$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_multycurr_history (id INT(11) AUTO_INCREMENT, dateof DATE NOT NULL, user VARCHAR(32), currency_id INT(11), kurs decimal(15,4), vendor INT(11), total INT(11), PRIMARY KEY (id))");
//    $this->db->query("TRUNCATE TABLE " . DB_PREFIX . "product_multycurr_history");
  	$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_multycurr_special (product_special_id INT(11), product_id INT(11), mc_price decimal(15,4), currency_id INT(11), PRIMARY KEY (product_special_id))");
//    $this->db->query("TRUNCATE TABLE " . DB_PREFIX . "product_multycurr_special");
  	$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_multycurr_discount (product_discount_id INT(11), product_id INT(11), mc_price decimal(15,4), currency_id INT(11), PRIMARY KEY (product_discount_id))");
//    $this->db->query("TRUNCATE TABLE " . DB_PREFIX . "product_multycurr_discount");
  	$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_multycurr_option (id INT(11) AUTO_INCREMENT, product_option_value_id INT(11), product_id INT(11), mc_price decimal(15,4), currency_id INT(11), PRIMARY KEY (id))");
//    $this->db->query("TRUNCATE TABLE " . DB_PREFIX . "product_multycurr_option");
    // -- Регистрация модуля в системе --
		$this->load->model('setting/setting');
    $data = "module=Мультивалютные товары 1.5.5";
    $data.= "&mail=";
    $data.= $this->config->get('config_email');
    $data.= "&store=";
    $data.= $this->config->get('config_name');
    $data.= "&www=";
    $data.= $_SERVER['SERVER_NAME'];
    $data.= "&ip=";
    $data.= $_SERVER['SERVER_ADDR'];
    $ch = curl_init(); curl_setopt($ch, CURLOPT_URL, "http://igg-eco.ru/index.php?route=module/igglic"); curl_setopt($ch, CURLOPT_POST, 1); curl_setopt($ch, CURLOPT_POSTFIELDS, $data ); curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); $server_output = curl_exec ($ch); curl_close ($ch);    
		$settings = array();
    $settings[] = array(
			'round_mode'        => 0,
      'reg_mail'          => $this->config->get('config_email'),
      'reg_store'         => $this->config->get('config_name'),
      'reg_www'           => $_SERVER['SERVER_NAME'],
      'reg_ip'            => $_SERVER['SERVER_ADDR'],
			'reg_name'          => "Мультивалютные товары 1.5.5" 
       );
    $this->model_setting_setting->editSetting('multycurrgoods', $settings );
		$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `group` = 'multycurrgoods', `key` = 'round_mode', `value` = '2'");
		$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `group` = 'multycurrgoods', `key` = 'save_mode', `value` = '0'");
    }
	

}
?>