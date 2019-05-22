<?php 
class ControllerToolImport extends Controller { 
	private $error = array();
	

	public function index() {
		$this->load->model('tool/export');
		$file = $_GET["file"];
		if (file_exists($file)) {
			if ($this->model_tool_export->upload($file)) {
				echo "The End";
				unset($_SESSION['startRow']);
				unset($_SESSION['isFirstEnter']);
				unset($_SESSION['productRewardId']);
				@unlink($file);
				//$this->session->data['success'] = $this->language->get('text_success');
				//$this->redirect($this->url->link('tool/export', 'token=' . $this->session->data['token'], 'SSL'));
			}
			else {
				//$this->error['warning'] = $this->language->get('error_upload');
				//echo "Не удалось загрузить файл!";
			}
		} else {
			echo "Ошибка! Не удалось обнаружить файл: ".$file; 
		}

	}


	public function download() {
		if ($this->validate()) {

			// set appropriate timeout limit
			set_time_limit( 1800 );

			// send the categories, products and options as a spreadsheet file
			$this->load->model('tool/export');
			$this->model_tool_export->download();

		} else {

			// return a permission error page
			return $this->forward('error/permission');
		}
	}


	private function validate() {
		if (!$this->user->hasPermission('modify', 'tool/export')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
?>