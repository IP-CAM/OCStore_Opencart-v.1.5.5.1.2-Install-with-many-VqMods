<?php
//-----------------------------------------------------
// based on TagCloud Created by villagedefrance                   
//-----------------------------------------------------

class ControllerModuleTagCloud extends Controller {

	private $_name = 'tagcloud';
	
	protected function index() {
		$this->load->language('module/' . $this->_name);
		
		$this->load->model('localisation/language');

		$languages = $this->model_localisation_language->getLanguages();
		
		foreach ($languages as $language) {
			if (isset($this->request->post[$this->_name . '_title' . $language['language_id']])) {
				$this->data[$this->_name . '_title' . $language['language_id']] = $this->request->post[$this->_name . '_title' . $language['language_id']];
			} else {
				$this->data[$this->_name . '_title' . $language['language_id']] = $this->config->get($this->_name . '_title' . $language['language_id']);
			}
		}
		$this->data['title'] = $this->config->get($this->_name . '_title' . $this->config->get('config_language_id'));

		
		$this->data['icon'] = $this->config->get($this->_name . '_icon');
 		
		$this->data['box'] = $this->config->get($this->_name . '_box');

		$this->data['text_notags'] = $this->language->get('text_notags');
		
		$this->load->model('module/tagcloud');
		
		$this->data['tagcloud'] = $this->model_module_tagcloud->getRandomTags(
			$this->config->get($this->_name . '_limit'),
			(int)$this->config->get($this->_name . '_min_font_size'),
			(int)$this->config->get($this->_name . '_max_font_size'),
			$this->config->get($this->_name . '_font_weight')
		);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl';
			} else {
				$this->template = 'default/template/module/' . $this->_name . '.tpl';
			}
			
		$this->render();
	}
}
?>
