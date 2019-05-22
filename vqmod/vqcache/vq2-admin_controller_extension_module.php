<?php
class ControllerExtensionModule extends Controller {

  	        //OpencartModules
            private static function cmpdata($a, $b) {
                if ($a['sort_order']==$b['sort_order']) {
                    return (strtolower($a['name'])<strtolower($b['name'])) ? -1 : 1;
                }
                return ((int)$a['sort_order']<(int)$b['sort_order']) ? -1 : 1;
            }
          
	public function index() {
		$this->language->load('extension/module');
		 
		$this->document->setTitle($this->language->get('heading_title')); 

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		

  	        //OpencartModules
   		    $this->data['action'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
          
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_confirm'] = $this->language->get('text_confirm');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_action'] = $this->language->get('column_action');

  	        //OpencartModules
  	        $this->data['column_sort_orders'] = $this->language->get('column_sort_orders');
  	        $this->data['column_sort_order'] = $this->language->get('column_sort_order');
  	        $this->data['column_description'] = $this->language->get('column_description');
  	        $this->data['column_positions'] = $this->language->get('column_positions');
  	        $this->data['column_layouts'] = $this->language->get('column_layouts');
  	        $this->data['button_save'] = $this->language->get('button_save');
          

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->session->data['error'])) {
			$this->data['error'] = $this->session->data['error'];
		
			unset($this->session->data['error']);
		} else {
			$this->data['error'] = '';
		}

		$this->load->model('setting/extension');

  	        //OpencartModules
  	        $this->model_setting_extension->CreateColumns();

          

  	        //OpencartModules
   		    if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			    $this->model_setting_extension->editSetting($this->request->post);
			}
          

		$extensions = $this->model_setting_extension->getInstalled('module');
		
		foreach ($extensions as $key => $value) {
			if (!file_exists(DIR_APPLICATION . 'controller/module/' . $value . '.php')) {
				$this->model_setting_extension->uninstall('module', $value);
				
				unset($extensions[$key]);
			}
		}
		
		$this->data['extensions'] = array();
						
		$files = glob(DIR_APPLICATION . 'controller/module/*.php');
		
		if ($files) {
			foreach ($files as $file) {
				$extension = basename($file, '.php');

	    //OpencartModules
                $layouts=array();
                $positions=array();
                $sort_orders=array();

                $modules = $this->config->get($extension . '_module');

                $extension_data=$this->model_setting_extension->getExtensionByCode($extension,'module');

                if ($modules) {
                    foreach ($modules as $module) {
                        $layouts[]=$this->model_setting_extension->getLayoutName($module['layout_id']);
                        $positions[]=$module['position'];
                        $sort_orders[]=$module['sort_order'];
                    }
                }
          
				
				$this->language->load('module/' . $extension);
	
				$action = array();
				
				if (!in_array($extension, $extensions)) {
					$action[] = array(
						'text' => $this->language->get('text_install'),
						'href' => $this->url->link('extension/module/install', 'token=' . $this->session->data['token'] . '&extension=' . $extension, 'SSL')
					);
				} else {
					$action[] = array(
						'text' => $this->language->get('text_edit'),
						'href' => $this->url->link('module/' . $extension . '', 'token=' . $this->session->data['token'], 'SSL')
					);
								
					$action[] = array(
						'text' => $this->language->get('text_uninstall'),
						'href' => $this->url->link('extension/module/uninstall', 'token=' . $this->session->data['token'] . '&extension=' . $extension, 'SSL')
					);
				}
												
				$this->data['extensions'][] = array(
					'name'   => $this->language->get('heading_title'),
					
	        //OpencartModules
					'action' => $action,
                    'layouts'=>implode(', ',$layouts),
                    'positions'=>implode(', ',$positions),
                    'sort_orders'=>implode(', ',$sort_orders),
                    'sort_order'=>$extension_data['sort_order'],
                    'description'=>$extension_data['description'],
					'code' => $extension,
					'type' => $extension_data['type'],
            
            
				);
			}
		}


  	        //OpencartModules
            usort($this->data['extensions'], array('ControllerExtensionModule','cmpdata'));
            
		$this->template = 'extension/module.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	public function install() {
		$this->language->load('extension/module');
		
		if (!$this->user->hasPermission('modify', 'extension/module')) {
			$this->session->data['error'] = $this->language->get('error_permission'); 
			
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		} else {
			$this->load->model('setting/extension');

  	        //OpencartModules
  	        $this->model_setting_extension->CreateColumns();

          

  	        //OpencartModules
   		    if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			    $this->model_setting_extension->editSetting($this->request->post);
			}
          
			
			$this->model_setting_extension->install('module', $this->request->get['extension']);

			$this->load->model('user/user_group');
		
			$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'module/' . $this->request->get['extension']);
			$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'module/' . $this->request->get['extension']);
			
			require_once(VQMod::modCheck(DIR_APPLICATION . 'controller/module/' . $this->request->get['extension'] . '.php'));
			
			$class = 'ControllerModule' . str_replace('_', '', $this->request->get['extension']);
			$class = new $class($this->registry);
			
			if (method_exists($class, 'install')) {
				$class->install();
			}
			
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}
	
	public function uninstall() {
		$this->language->load('extension/module');
		
		if (!$this->user->hasPermission('modify', 'extension/module')) {
			$this->session->data['error'] = $this->language->get('error_permission'); 
			
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		} else {		
			$this->load->model('setting/extension');

  	        //OpencartModules
  	        $this->model_setting_extension->CreateColumns();

          

  	        //OpencartModules
   		    if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			    $this->model_setting_extension->editSetting($this->request->post);
			}
          
			$this->load->model('setting/setting');
					
			$this->model_setting_extension->uninstall('module', $this->request->get['extension']);
		
			$this->model_setting_setting->deleteSetting($this->request->get['extension']);
		
			require_once(VQMod::modCheck(DIR_APPLICATION . 'controller/module/' . $this->request->get['extension'] . '.php'));
			
			$class = 'ControllerModule' . str_replace('_', '', $this->request->get['extension']);
			$class = new $class($this->registry);
			
			if (method_exists($class, 'uninstall')) {
				$class->uninstall();
			}
		
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));	
		}
	}
}
?>