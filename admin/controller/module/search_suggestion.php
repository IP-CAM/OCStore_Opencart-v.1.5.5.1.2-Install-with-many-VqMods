<?php
class ControllerModuleSearchSuggestion extends Controller {
	private $error = array(); 
		
	public function index() {   
		$this->load->language('module/search_suggestion');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		
		  foreach ($this->request->post['search_suggestion_module'] as &$module) {
		    if (!isset($module['status'])) {
		      $module['status'] = 0;
		    } 
		  }
			$this->model_setting_setting->editSetting('search_suggestion', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title']            = $this->language->get('heading_title');
		
		$this->data['entry_layout']             = $this->language->get('entry_layout');
		
		$this->data['button_save']              = $this->language->get('button_save');
		$this->data['button_cancel']            = $this->language->get('button_cancel');
		
		$this->data['search_where']             = $this->language->get('search_where');
    $this->data['search_where_name']        = $this->language->get('search_where_name');
    $this->data['search_where_tags']        = $this->language->get('search_where_tags');
    $this->data['search_where_description'] = $this->language->get('search_where_description');
    $this->data['search_where_model']       = $this->language->get('search_where_model');
    $this->data['search_where_sku']         = $this->language->get('search_where_sku');
    
    $this->data['relevance_weight']         = $this->language->get('relevance_weight');
    $this->data['relevance_weight_mr']      = $this->language->get('relevance_weight_mr');

		$this->data['search_order']             = $this->language->get('search_order');
    $this->data['search_order_name']        = $this->language->get('search_order_name');
    $this->data['search_order_rating']      = $this->language->get('search_order_rating');
    $this->data['search_order_relevance']   = $this->language->get('search_order_relevance');
    
		$this->data['search_order_dir_asc']     = $this->language->get('search_order_dir_asc');
    $this->data['search_order_dir_desc']    = $this->language->get('search_order_dir_desc');

    $this->data['search_logic']             = $this->language->get('search_logic');
    $this->data['search_logic_or']          = $this->language->get('search_logic_or');
    $this->data['search_logic_and']         = $this->language->get('search_logic_and');
  
    $this->data['search_limit']             = $this->language->get('search_limit');
    $this->data['search_cache']             = $this->language->get('search_cache');
      
    $this->data['search_fields']            = $this->language->get('search_fields');
    $this->data['search_field_description'] = $this->language->get('search_field_description');
    $this->data['search_field_attributes']  = $this->language->get('search_field_attributes');
    $this->data['search_fields_cut']        = $this->language->get('search_fields_cut');
    $this->data['search_fields_separator']  = $this->language->get('search_fields_separator');

    $this->data['search_fields_attributes_show']     = $this->language->get('search_fields_attributes_show');
    $this->data['search_fields_attributes_replace_text']  = $this->language->get('search_fields_attributes_replace_text');
    $this->data['search_fields_attributes_hide']     = $this->language->get('search_fields_attributes_hide');        
    $this->data['search_fields_attributes_replace']  = $this->language->get('search_fields_attributes_replace');  
    
    $this->data['tab_general']            = $this->language->get('tab_general');
    $this->data['tab_where']              = $this->language->get('tab_where');
    $this->data['tab_order']              = $this->language->get('tab_order');
    $this->data['tab_fields']             = $this->language->get('tab_fields'); 
    
    $this->data['tab_where_help']         = $this->language->get('tab_where_help');    
    		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

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
			'href'      => $this->url->link('module/search_suggestion', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/search_suggestion', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();
		
		if (isset($this->request->post['search_suggestion_module'])) {
			$this->data['modules'] = $this->request->post['search_suggestion_module'];
		} elseif ($this->config->get('search_suggestion_module')) { 
			$this->data['modules'] = $this->config->get('search_suggestion_module');
		}

		if (isset($this->request->post['search_suggestion_options'])) {
			$this->data['options'] = $this->request->post['search_suggestion_options'];
		} elseif ($this->config->get('search_suggestion_options')) { 
			$this->data['options'] = $this->config->get('search_suggestion_options');
		}
				
    $this->load->model('catalog/attribute');
    $this->data['attributes'] = $this->model_catalog_attribute->getAttributes();
      
		$this->load->model('design/layout');		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
										
		$this->template = 'module/search_suggestion.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
  
  public function install () {
    $this->load->model('setting/setting');
    $this->load->model('catalog/search_suggestion');
		$this->model_setting_setting->deleteSetting('search_suggestion');
		$setting['search_suggestion_module']  = $this->model_catalog_search_suggestion->getNewModules();
		$setting['search_suggestion_options'] = $this->model_catalog_search_suggestion->getDefaultOptions();
		$this->model_setting_setting->editSetting('search_suggestion', $setting);
  }
  
  public function uninstall () {
    $this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('search_suggestion');
  }
  
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/search_suggestion')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
//author sv2109 (sv2109@gmail.com) license for 1 product copy granted for rhel (shipka2008@mail.ru )
