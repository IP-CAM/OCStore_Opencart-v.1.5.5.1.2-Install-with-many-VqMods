<?php  
class ControllerModulecartpopup extends Controller {
	protected function index() {

		$this->data += $this->load->language('module/cartpopup');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->document->addScript('catalog/view/javascript/jquery/jquery.popupoverlay.min.js');
		$this->document->addScript('catalog/view/javascript/cartpopup.js');
		$this->document->addStyle('catalog/view/theme/default/stylesheet/cartpopup.css');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cartpopup.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cartpopup.tpl';
		} else {
			$this->template = 'default/template/module/cartpopup.tpl';
		}
		
		$this->render();
	}
}
?>