<?php 
class ControllerProductSearchJson extends Controller { 	
	
	public function index() { 
  	
  	$this->language->load('product/search_json');	
		
    $json = array();
		$this->data['products'] = array();
        
		if (isset($this->request->get['keyword'])) {

  		$options = $this->config->get('search_suggestion_options');				
			
			$this->load->model('catalog/search_suggestion');
			$this->load->model('catalog/attributes_to_text');
            
			if (isset($options['search_where']['name'])){
			  $data_search['filter_name'] = $this->request->get['keyword'];
			}
			if (isset($options['search_where']['tags'])){
			  $data_search['filter_tag'] = $this->request->get['keyword'];
			}			
			if (isset($options['search_where']['description'])){
			  $data_search['filter_description'] = $this->request->get['keyword'];
			}			
			if (isset($options['search_where']['model'])){
			  $data_search['filter_model'] = $this->request->get['keyword'];
			}
			if (isset($options['search_where']['sku'])){
			  $data_search['filter_sku'] = $this->request->get['keyword'];
			}						
			if (isset($options['search_order'])){
			  if ($options['search_order'] == 'rating') {
			    $data_search['sort'] = 'rating';
			  }
			  else if ($options['search_order'] == 'name'){
			    $data_search['sort'] = 'pd.name';          
			  }
			  else if ($options['search_order'] == 'relevance'){
			    $data_search['sort'] = 'relevance';          
			  }
      }						
			if (isset($options['search_order_dir'])){
			  if ($options['search_order_dir'] == 'asc') {
			    $data_search['order'] = 'ASC';
			  }
			  else if ($options['search_order_dir'] == 'desc'){
			    $data_search['order'] = 'DESC';
			  }
			}						
			if (isset($options['search_limit'])){
			  $data_search['limit'] = $options['search_limit'];
			}						
			$data_search['start'] = 0;
			
      $search_model = 'model_catalog_search_suggestion';
      if ($data_search['sort'] == 'relevance') {
        $this->load->model('catalog/search_mr');
        $data_search['search_mr_options'] = $this->config->get('search_mr_options');
        // for relevance use DESC order
        $data_search['order'] = 'DESC';
        $search_model = 'model_catalog_search_mr';        
      }
      $product_total = $this->$search_model->getTotalProducts($data_search);			      
			
			if ($product_total) {
				$this->load->model('tool/image');
				
        $results = $this->$search_model->getProducts($data_search);		
        		
				foreach ($results as $result) {
				
				  if ($result['image']) {
					  $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				  } else {
					  $image = false;
				  }
				
				  if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					  $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				  } else {
					  $price = false;
				  }
				
				  if ((float)$result['special']) {
					  $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				  } else {
					  $special = false;
				  }	
				
				  if ($this->config->get('config_tax')) {
					  $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				  } else {
					  $tax = false;
				  }				
				
				  if ($this->config->get('config_review_status')) {
					  $rating = (int)$result['rating'];
				  } else {
					  $rating = false;
				  }
				  
				  $description = '';
				  if (isset($options['search_field']['show_description'])) {
				    $description = trim(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')));
				    $cut = isset($options['search_field']['description_cut']) ? $options['search_field']['description_cut'] : 100;
				    $dots = strlen($description) > $cut ? '..' : '';
				    $description = utf8_substr($description, 0, $cut) . $dots;				    
				  }
				  
				  $attributes = '';
				  if (isset($options['search_field']['show_attributes'])) {
				    $attributes = $this->model_catalog_attributes_to_text->getText($result['product_id'], $options['search_field']);
				  }

				  $this->data['products'][] = array(
					  'product_id'  => $result['product_id'],
					  'thumb'       => $image,
					  'name'        => htmlspecialchars_decode($result['name']),
					  'description' => $description,
					  'attributes'  => $attributes,					  
					  'price'       => $price,
					  'special'     => $special,
					  //'tax'         => $tax,
					  //'rating'      => $result['rating'],
					  //'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					  'href'        => str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $result['product_id']))
				  );

		    }		
			}
		}
		
		if(empty($this->data['products'])) {
			$this->data['products'][] = array(
			  'product_id'  => '',
			  'thumb'       => '',
				'name'        => $this->language->get('text_no_result'),
			  'description' => '',
			  'attributes'  => '',					  			  
			  'price'       => '',
			  'special'     => '',
			  //'tax'         => '',
			  //'rating'      => '',
			  //'reviews'     => '',
			  'href'        => ''
			);
		}
		else if($product_total > count($this->data['products'])){
			$remainder_cnt = $product_total - count($this->data['products']);
			if($remainder_cnt > 0) {
				$this->data['products'][] = array(
  			  'product_id'  => '',
  			  'thumb'       => '',
  				'name'        => $remainder_cnt . $this->language->get('more_results'),
  			  'description' => '',
  			  'attributes'  => '',
  			  'price'       => '',
  			  'special'     => '',
  			  //'tax'         => '',
  			  //'rating'      => '',
  			  //'reviews'     => '',
  			  'href'        => str_replace('&amp;', '&', $this->url->link('product/search','search=' . $this->request->get['keyword']))
				);
			}
		}
		
		$json = $this->data['products'];
		
		$this->response->setOutput(json_encode($json));
		
  }

}

//author sv2109 (sv2109@gmail.com) license for 1 product copy granted for rhel (shipka2008@mail.ru )
