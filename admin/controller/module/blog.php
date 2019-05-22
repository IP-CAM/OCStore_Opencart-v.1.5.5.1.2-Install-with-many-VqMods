<?php
class ControllerModuleBlog extends Controller
{
	private $error = array();
	public function index()
	{
		$this->validateenter();
		$this->data['blog_version'] = '5.*';
		require_once(DIR_SYSTEM . 'library/iblog.php');
		$this->data['colorbox_theme'] = iBlog::searchdir(DIR_CATALOG . "view/javascript/blog/colorbox/css", 'DIRS');
		$this->load->model('setting/setting');
		$settings_admin = $this->model_setting_setting->getSetting('blogversion', 'blog_version');
		foreach ($settings_admin as $key => $value) {
			$this->data['blog_version'] = $value;
		} //$settings_admin as $key => $value
		$this->language->load('module/blog');
		$blog_version = $this->language->get('blog_version');
		if ($this->data['blog_version'] != $blog_version) {
			$this->data['text_update'] = $this->language->get('text_update');
		} //$this->data['blog_version'] != $blog_version
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->install_router();
		if (file_exists(DIR_APPLICATION . 'view/stylesheet/blog.css')) {
			$this->document->addStyle('view/stylesheet/blog.css');
		} //file_exists(DIR_APPLICATION . 'view/stylesheet/blog.css')
		$this->document->addStyle('http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,cyrillic-ext,latin-ext');


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->cache->delete('blog');
			$this->cache->delete('record');
			$this->cache->delete('blogsrecord');
			$this->cache->delete('html');
			$this->add_fields();
			$this->model_setting_setting->editSetting('blog_options', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL'));
		}



		$this->data['token']                      = $this->session->data['token'];
		$this->data['heading_title']              = $this->language->get('heading_title');
		$this->data['text_enabled']               = $this->language->get('text_enabled');
		$this->data['text_disabled']              = $this->language->get('text_disabled');
		$this->data['text_content_top']           = $this->language->get('text_content_top');
		$this->data['text_content_bottom']        = $this->language->get('text_content_bottom');
		$this->data['text_column_left']           = $this->language->get('text_column_left');
		$this->data['text_column_right']          = $this->language->get('text_column_right');
		$this->data['text_what_blog']             = $this->language->get('text_what_blog');
		$this->data['text_what_list']             = $this->language->get('text_what_list');
		$this->data['text_what_all']              = $this->language->get('text_what_all');
		$this->data['text_what_hook']             = $this->language->get('text_what_hook');
		$this->data['entry_what']                 = $this->language->get('entry_what');
		$this->data['entry_small_dim']            = $this->language->get('entry_small_dim');
		$this->data['entry_big_dim']              = $this->language->get('entry_big_dim');
		$this->data['entry_blog_num_comments']    = $this->language->get('entry_blog_num_comments');
		$this->data['entry_blog_num_records']     = $this->language->get('entry_blog_num_records');
		$this->data['entry_blog_num_desc']        = $this->language->get('entry_blog_num_desc');
		$this->data['entry_blog_num_desc_words']  = $this->language->get('entry_blog_num_desc_words');
		$this->data['entry_blog_num_desc_pred']   = $this->language->get('entry_blog_num_desc_pred');
		$this->data['entry_blog_template']        = $this->language->get('entry_blog_template');
		$this->data['entry_blog_template_record'] = $this->language->get('entry_blog_template_record');
		$this->data['tab_general']                = $this->language->get('tab_general');
		$this->data['tab_list']                   = $this->language->get('tab_list');
		$this->data['entry_layout']               = $this->language->get('entry_layout');
		$this->data['entry_position']             = $this->language->get('entry_position');
		$this->data['entry_status']               = $this->language->get('entry_status');
		$this->data['entry_sort_order']           = $this->language->get('entry_sort_order');
		$this->data['button_save']                = $this->language->get('button_save');
		$this->data['button_cancel']              = $this->language->get('button_cancel');
		$this->data['button_add_module']          = $this->language->get('button_add_module');
		$this->data['button_remove']              = $this->language->get('button_remove');
		$this->data['url_blog']                   = $this->url->link('catalog/blog', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_record']                 = $this->url->link('catalog/record', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_comment']                = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_create']                 = $this->url->link('module/blog/createtables', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_delete']                 = $this->url->link('module/blog/deleteoldsetting', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_modules']                = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_modules_text']           = $this->language->get('url_modules_text');
		$this->data['url_blog_text']              = $this->language->get('url_blog_text');
		$this->data['url_record_text']            = $this->language->get('url_record_text');
		$this->data['url_comment_text']           = $this->language->get('url_comment_text');
		$this->data['url_create_text']            = $this->language->get('url_create_text');
		$this->data['url_delete_text']            = $this->language->get('url_delete_text');
		$this->data['url_options']                = $this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_schemes']                = $this->url->link('module/blog/schemes', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_widgets']                = $this->url->link('module/blog/widgets', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['action']                     = $this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel']                     = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} //isset($this->error['warning'])
		else {
			$this->data['error_warning'] = '';
		}
		$this->data['breadcrumbs']   = array();
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' / '
		);

		if (isset($this->request->post['generallist'])) {
			$this->data['generallist'] = $this->request->post['generallist'];
		} //isset($this->request->post['generallist'])
		else {
			$this->data['generallist'] = $this->config->get('generallist');
		}

		if (isset($this->request->post['blog_num_records'])) {
			$this->data['blog_num_records'] = $this->request->post['blog_num_records'];
		} //isset($this->request->post['blog_num_records'])
		else {
			$this->data['blog_num_records'] = $this->config->get('blog_num_records');
		}

		if (isset($this->request->post['blog_num_comments'])) {
			$this->data['blog_num_comments'] = $this->request->post['blog_num_comments'];
		} //isset($this->request->post['blog_num_comments'])
		else {
			$this->data['blog_num_comments'] = $this->config->get('blog_num_comments');
		}

		if (isset($this->request->post['blog_num_desc'])) {
			$this->data['blog_num_desc'] = $this->request->post['blog_num_desc'];
		} //isset($this->request->post['blog_num_desc'])
		else {
			$this->data['blog_num_desc'] = $this->config->get('blog_num_desc');
		}
		if (isset($this->request->post['blog_num_desc_words'])) {
			$this->data['blog_num_desc_words'] = $this->request->post['blog_num_desc_words'];
		} //isset($this->request->post['blog_num_desc_words'])
		else {
			$this->data['blog_num_desc_words'] = $this->config->get('blog_num_desc_words');
		}

		if (isset($this->request->post['blog_num_desc_pred'])) {
			$this->data['blog_num_desc_pred'] = $this->request->post['blog_num_desc'];
		} //isset($this->request->post['blog_num_desc_pred'])
		else {
			$this->data['blog_num_desc_pred'] = $this->config->get('blog_num_desc_pred');
		}



		if (isset($this->request->post['generallist']['get_pagination'])) {
			$this->data['generallist']['get_pagination'] = $this->request->post['generallist']['get_pagination'];
		}
		else {
			if (isset($this->data['generallist']['get_pagination'])) {
				$this->data['generallist']['get_pagination'] = $this->data['generallist']['get_pagination'];
			} else {
				$this->data['generallist']['get_pagination'] = 'tracking';
			}
		}


		if (isset($this->data['generallist']['further'])) {
			 //$str = base64_decode($this->request->post['blog_further']);
			 // $this->data['blog_further'] = unserialize($str);
		}
		else {
			$this->data['generallist']['further'][$this->config->get('config_language_id')] = '<ins style="font-size: 18px; text-decoration: none;">&rarr;</ins>';
		}

		if (isset($this->request->post['blog_small'])) {
			$this->data['blog_small'] = $this->request->post['blog_small'];
		} //isset($this->request->post['blog_small'])
		else {
			$this->data['blog_small'] = $this->config->get('blog_small');
		}
		if (isset($this->request->post['blog_big'])) {
			$this->data['blog_big'] = $this->request->post['blog_big'];
		} //isset($this->request->post['blog_big'])
		else {
			$this->data['blog_big'] = $this->config->get('blog_big');
		}
		if (isset($this->request->post['mylist'])) {
			$this->data['mylist'] = $this->request->post['mylist'];
		} //isset($this->request->post['mylist'])
		else {
			$this->data['mylist'] = $this->config->get('mylist');
		}
		if (count($this->data['mylist']) > 0) {
			ksort($this->data['mylist']);
		} //count($this->data['mylist']) > 0
		$this->data['modules'] = array();
		if (isset($this->request->post['blog_module'])) {
			$this->data['modules'] = $this->request->post['blog_module'];
		} //isset($this->request->post['blog_module'])
		elseif ($this->config->get('blog_module')) {
			$this->data['modules'] = $this->config->get('blog_module');
		} //$this->config->get('blog_module')
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		$this->template        = 'module/blog.tpl';
		$this->children        = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
	}
//*****************************************************************





	public function schemes()
	{
		$this->validateenter();
		$this->data['blog_version'] = '5.*';
		require_once(DIR_SYSTEM . 'library/iblog.php');
		$this->data['colorbox_theme'] = iBlog::searchdir(DIR_CATALOG . "view/javascript/blog/colorbox/css", 'DIRS');
		$this->load->model('setting/setting');
		$settings_admin = $this->model_setting_setting->getSetting('blogversion', 'blog_version');
		foreach ($settings_admin as $key => $value) {
			$this->data['blog_version'] = $value;
		} //$settings_admin as $key => $value
		$this->language->load('module/blog');
		$blog_version = $this->language->get('blog_version');
		if ($this->data['blog_version'] != $blog_version) {
			$this->data['text_update'] = $this->language->get('text_update');
		} //$this->data['blog_version'] != $blog_version
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->install_router();
		if (file_exists(DIR_APPLICATION . 'view/stylesheet/blog.css')) {
			$this->document->addStyle('view/stylesheet/blog.css');
		} //file_exists(DIR_APPLICATION . 'view/stylesheet/blog.css')
		$this->document->addStyle('http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,cyrillic-ext,latin-ext');



		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->cache->delete('blog');
			$this->cache->delete('record');
			$this->cache->delete('blogsrecord');
			$this->cache->delete('html');
			$this->add_fields();
			$this->model_setting_setting->editSetting('blog_schemes', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('module/blog/schemes', 'token=' . $this->session->data['token'], 'SSL'));
		}


		$this->data['token']                      = $this->session->data['token'];
		$this->data['heading_title']              = $this->language->get('heading_title');
		$this->data['text_enabled']               = $this->language->get('text_enabled');
		$this->data['text_disabled']              = $this->language->get('text_disabled');
		$this->data['text_content_top']           = $this->language->get('text_content_top');
		$this->data['text_content_bottom']        = $this->language->get('text_content_bottom');
		$this->data['text_column_left']           = $this->language->get('text_column_left');
		$this->data['text_column_right']          = $this->language->get('text_column_right');
		$this->data['text_what_blog']             = $this->language->get('text_what_blog');
		$this->data['text_what_list']             = $this->language->get('text_what_list');
		$this->data['text_what_all']              = $this->language->get('text_what_all');
		$this->data['text_what_hook']             = $this->language->get('text_what_hook');
		$this->data['entry_what']                 = $this->language->get('entry_what');
		$this->data['entry_small_dim']            = $this->language->get('entry_small_dim');
		$this->data['entry_big_dim']              = $this->language->get('entry_big_dim');
		$this->data['entry_blog_num_comments']    = $this->language->get('entry_blog_num_comments');
		$this->data['entry_blog_num_records']     = $this->language->get('entry_blog_num_records');
		$this->data['entry_blog_num_desc']        = $this->language->get('entry_blog_num_desc');
		$this->data['entry_blog_num_desc_words']  = $this->language->get('entry_blog_num_desc_words');
		$this->data['entry_blog_num_desc_pred']   = $this->language->get('entry_blog_num_desc_pred');
		$this->data['entry_blog_template']        = $this->language->get('entry_blog_template');
		$this->data['entry_blog_template_record'] = $this->language->get('entry_blog_template_record');
		$this->data['tab_general']                = $this->language->get('tab_general');
		$this->data['tab_list']                   = $this->language->get('tab_list');
		$this->data['entry_layout']               = $this->language->get('entry_layout');
		$this->data['entry_position']             = $this->language->get('entry_position');
		$this->data['entry_status']               = $this->language->get('entry_status');
		$this->data['entry_sort_order']           = $this->language->get('entry_sort_order');
		$this->data['button_save']                = $this->language->get('button_save');
		$this->data['button_cancel']              = $this->language->get('button_cancel');
		$this->data['button_add_module']          = $this->language->get('button_add_module');
		$this->data['button_remove']              = $this->language->get('button_remove');
		$this->data['url_blog']                   = $this->url->link('catalog/blog', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_record']                 = $this->url->link('catalog/record', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_comment']                = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_create']                 = $this->url->link('module/blog/createtables', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_modules']                = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_modules_text']           = $this->language->get('url_modules_text');
		$this->data['url_blog_text']              = $this->language->get('url_blog_text');
		$this->data['url_record_text']            = $this->language->get('url_record_text');
		$this->data['url_comment_text']           = $this->language->get('url_comment_text');
		$this->data['url_create_text']            = $this->language->get('url_create_text');

		$this->data['url_options']                = $this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_schemes']                = $this->url->link('module/blog/schemes', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_widgets']                = $this->url->link('module/blog/widgets', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['action']                     = $this->url->link('module/blog/schemes', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel']                     = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} //isset($this->error['warning'])
		else {
			$this->data['error_warning'] = '';
		}
		$this->data['breadcrumbs']   = array();
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' / '
		);


		if (isset($this->request->post['mylist'])) {
			$this->data['mylist'] = $this->request->post['mylist'];
		} //isset($this->request->post['mylist'])
		else {
			$this->data['mylist'] = $this->config->get('mylist');
		}
		if (count($this->data['mylist']) > 0) {
			ksort($this->data['mylist']);
		} //count($this->data['mylist']) > 0
		$this->data['modules'] = array();
		if (isset($this->request->post['blog_module'])) {
			$this->data['modules'] = $this->request->post['blog_module'];
		} //isset($this->request->post['blog_module'])
		elseif ($this->config->get('blog_module')) {
			$this->data['modules'] = $this->config->get('blog_module');
		} //$this->config->get('blog_module')
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		$this->template        = 'module/blog_schemes.tpl';
		$this->children        = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
	}

	public function widgets()
	{
		$this->validateenter();
		$this->data['blog_version'] = '5.*';
		require_once(DIR_SYSTEM . 'library/iblog.php');
		$this->data['colorbox_theme'] = iBlog::searchdir(DIR_CATALOG . "view/javascript/blog/colorbox/css", 'DIRS');
		$this->load->model('setting/setting');
		$settings_admin = $this->model_setting_setting->getSetting('blogversion', 'blog_version');
		foreach ($settings_admin as $key => $value) {
			$this->data['blog_version'] = $value;
		} //$settings_admin as $key => $value
		$this->language->load('module/blog');
		$blog_version = $this->language->get('blog_version');
		if ($this->data['blog_version'] != $blog_version) {
			$this->data['text_update'] = $this->language->get('text_update');
		} //$this->data['blog_version'] != $blog_version
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->install_router();
		if (file_exists(DIR_APPLICATION . 'view/stylesheet/blog.css')) {
			$this->document->addStyle('view/stylesheet/blog.css');
		} //file_exists(DIR_APPLICATION . 'view/stylesheet/blog.css')
		$this->document->addStyle('http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,cyrillic-ext,latin-ext');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->cache->delete('blog');
			$this->cache->delete('record');
			$this->cache->delete('blogsrecord');
			$this->cache->delete('html');
			$this->add_fields();
			$this->model_setting_setting->editSetting('blog_widgets', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('module/blog/widgets', 'token=' . $this->session->data['token'], 'SSL'));
		}


		$this->data['token']                      = $this->session->data['token'];
		$this->data['heading_title']              = $this->language->get('heading_title');
		$this->data['text_enabled']               = $this->language->get('text_enabled');
		$this->data['text_disabled']              = $this->language->get('text_disabled');
		$this->data['text_content_top']           = $this->language->get('text_content_top');
		$this->data['text_content_bottom']        = $this->language->get('text_content_bottom');
		$this->data['text_column_left']           = $this->language->get('text_column_left');
		$this->data['text_column_right']          = $this->language->get('text_column_right');
		$this->data['text_what_blog']             = $this->language->get('text_what_blog');
		$this->data['text_what_list']             = $this->language->get('text_what_list');
		$this->data['text_what_all']              = $this->language->get('text_what_all');
		$this->data['text_what_hook']             = $this->language->get('text_what_hook');
		$this->data['entry_what']                 = $this->language->get('entry_what');
		$this->data['entry_small_dim']            = $this->language->get('entry_small_dim');
		$this->data['entry_big_dim']              = $this->language->get('entry_big_dim');
		$this->data['entry_blog_num_comments']    = $this->language->get('entry_blog_num_comments');
		$this->data['entry_blog_num_records']     = $this->language->get('entry_blog_num_records');
		$this->data['entry_blog_num_desc']        = $this->language->get('entry_blog_num_desc');
		$this->data['entry_blog_num_desc_words']  = $this->language->get('entry_blog_num_desc_words');
		$this->data['entry_blog_num_desc_pred']   = $this->language->get('entry_blog_num_desc_pred');
		$this->data['entry_blog_template']        = $this->language->get('entry_blog_template');
		$this->data['entry_blog_template_record'] = $this->language->get('entry_blog_template_record');
		$this->data['tab_general']                = $this->language->get('tab_general');
		$this->data['tab_list']                   = $this->language->get('tab_list');
		$this->data['entry_layout']               = $this->language->get('entry_layout');
		$this->data['entry_position']             = $this->language->get('entry_position');
		$this->data['entry_status']               = $this->language->get('entry_status');
		$this->data['entry_sort_order']           = $this->language->get('entry_sort_order');
		$this->data['button_save']                = $this->language->get('button_save');
		$this->data['button_cancel']              = $this->language->get('button_cancel');
		$this->data['button_add_module']          = $this->language->get('button_add_module');
		$this->data['button_remove']              = $this->language->get('button_remove');
		$this->data['url_blog']                   = $this->url->link('catalog/blog', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_record']                 = $this->url->link('catalog/record', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_comment']                = $this->url->link('catalog/comment', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_create']                 = $this->url->link('module/blog/createtables', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_modules']                = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_modules_text']           = $this->language->get('url_modules_text');
		$this->data['url_blog_text']              = $this->language->get('url_blog_text');
		$this->data['url_record_text']            = $this->language->get('url_record_text');
		$this->data['url_comment_text']           = $this->language->get('url_comment_text');
		$this->data['url_create_text']            = $this->language->get('url_create_text');

		$this->data['url_options']                = $this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_schemes']                = $this->url->link('module/blog/schemes', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['url_widgets']                = $this->url->link('module/blog/widgets', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['action']                     = $this->url->link('module/blog/widgets', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel']                     = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} //isset($this->error['warning'])
		else {
			$this->data['error_warning'] = '';
		}
		$this->data['breadcrumbs']   = array();
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' / '
		);

		if (isset($this->request->post['mylist'])) {
			$this->data['mylist'] = $this->request->post['mylist'];
		} //isset($this->request->post['mylist'])
		else {
			$this->data['mylist'] = $this->config->get('mylist');
		}
		if (count($this->data['mylist']) > 0) {
			ksort($this->data['mylist']);
		} //count($this->data['mylist']) > 0
		$this->data['modules'] = array();
		if (isset($this->request->post['blog_module'])) {
			$this->data['modules'] = $this->request->post['blog_module'];
		} //isset($this->request->post['blog_module'])
		elseif ($this->config->get('blog_module')) {
			$this->data['modules'] = $this->config->get('blog_module');
		} //$this->config->get('blog_module')
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		$this->template        = 'module/blog_widgets.tpl';
		$this->children        = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
	}




//****************************************************************
	public function install()
	{
		$this->createTables();
		$array_dir_image = str_split(DIR_IMAGE);
		$array_dir_app   = str_split(DIR_APPLICATION);
		$i               = 0;
		$dir_root        = '';
		while ($array_dir_image[$i] == $array_dir_app[$i]) {
			$dir_root .= $array_dir_image[$i];
			$i++;
		} //$array_dir_image[$i] == $array_dir_app[$i]
	}
	public function ajax_list()
	{
		$this->data['token'] = $this->session->data['token'];
		$this->language->load('module/blog');
		$this->data['text_enabled']     = $this->language->get('text_enabled');
		$this->data['text_disabled']    = $this->language->get('text_disabled');
		$this->data['entry_avatar_dim'] = $this->language->get('entry_avatar_dim');
		$this->load->model('catalog/blog');
		$this->load->model('catalog/category');
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		if (isset($this->request->post['list'])) {
			$str  = base64_decode($this->request->post['list']);
			$list = unserialize($str);
		} //isset($this->request->post['list'])
		else {
			$list = Array();
		}
		if (isset($this->request->post['num'])) {
			$num = $this->request->post['num'];
		} //isset($this->request->post['num'])
		$this->data['mylist'][$num] = $list;
		if (isset($this->request->post['type'])) {
			$this->data['mylist'][$num]['type'] = $this->request->post['type'];
		} //isset($this->request->post['type'])
		else {
		}
		if ($this->data['mylist'][$num]['type'] == 'blogs' || $this->data['mylist'][$num]['type'] == 'related' ) {

			$this->data['categories'] = $this->model_catalog_blog->getCategories(0);

			if (isset($this->request->post['record_blog'])) {
				$this->data['record_blog'] = $this->request->post['record_blog'];
			} //isset($this->request->post['record_blog'])
			elseif (isset($this->request->get['record_id'])) {
				$this->data['record_blog'] = $this->model_catalog_record->getRecordCategories($this->request->get['record_id']);
			} //isset($this->request->get['record_id'])
			else {
				$this->data['record_blog'] = array();
			}
			$this->template = 'module/blog_list_blogs.tpl';
		} //$this->data['mylist'][$num]['type'] == 'blogs'

		if ($this->data['mylist'][$num]['type'] == 'related') {



			$all_blogs = Array ( 'blog_id' => -1, 'name' => $this->language->get('text_all_blogs'), 'status' => 1, 'sort_order' => -1 );
            array_unshift($this->data['categories'], $all_blogs);
			//print_r($this->data['categories']) ;

			$this->template = 'module/blog_list_related.tpl';
		}



		if ($this->data['mylist'][$num]['type'] == 'blogsall') {
			$this->template = 'module/blog_list_blogsall.tpl';
		} //$this->data['mylist'][$num]['type'] == 'blogsall'




		if ($this->data['mylist'][$num]['type'] == 'html') {




           //print_r($this->data['widgets']);



			$this->template = 'module/blog_list_html.tpl';



		} //$this->data['mylist'][$num]['type'] == 'html'



		if ($this->data['mylist'][$num]['type'] == 'loader') {
			$this->template = 'module/blog_list_loader.tpl';
		} //$this->data['mylist'][$num]['type'] == 'loader'
		if ($this->data['mylist'][$num]['type'] == 'latest') {
			$this->data['categories'] = $this->model_catalog_blog->getCategories(0);
			if (isset($this->request->post['record_blog'])) {
				$this->data['record_blog'] = $this->request->post['record_blog'];
			} //isset($this->request->post['record_blog'])
			elseif (isset($this->request->get['record_id'])) {
				$this->data['record_blog'] = $this->model_catalog_record->getRecordCategories($this->request->get['record_id']);
			} //isset($this->request->get['record_id'])
			else {
				$this->data['record_blog'] = array();
			}
			$this->template = 'module/blog_list_latest.tpl';
		} //$this->data['mylist'][$num]['type'] == 'latest'
		if ($this->data['mylist'][$num]['type'] == 'reviews') {
			$this->data['categories'] = $this->model_catalog_blog->getCategories(0);
			$this->data['cat']        = $this->model_catalog_category->getCategories(0);
			$this->template           = 'module/blog_list_reviews.tpl';
		} //$this->data['mylist'][$num]['type'] == 'reviews'
		if ($this->data['mylist'][$num]['type'] == 'treecomments') {
			$this->template = 'module/blog_list_treecomments.tpl';
		} //$this->data['mylist'][$num]['type'] == 'treecomments'
		if ($this->data['mylist'][$num]['type'] == 'records') {
			if (isset($this->request->post['mylist'][$num]['related'])) {
				$this->data['mylist'][$num]['related'] = $this->request->post['mylist'][$num]['related'];
			} //isset($this->request->post['mylist'][$num]['related'])
			else {
				if (!isset($this->data['mylist'][$num]['related']))
					$this->data['mylist'][$num]['related'] = array();
			}
			$this->load->model('catalog/record');
			$this->data['related'] = Array();
			if (isset($this->data['mylist'][$num]['related']) && !empty($this->data['mylist'][$num]['related'])) {
				foreach ($this->data['mylist'][$num]['related'] as $record_id) {
					$this->data['related'][] = $this->model_catalog_record->getRecord($record_id);
				} //$this->data['mylist'][$num]['related'] as $record_id
			} //isset($this->data['mylist'][$num]['related']) && !empty($this->data['mylist'][$num]['related'])
			$this->template = 'module/blog_list_records.tpl';
		} //$this->data['mylist'][$num]['type'] == 'records'




		if (!isset($this->data['mylist'][$num]['anchor']) && $this->data['mylist'][$num]['type'] == 'treecomments') {
		$this->data['mylist'][$num]['anchor'] = "\$('#tab-review').html";
		}
		if (!isset($this->data['mylist'][$num]['rating'])) {
		$this->data['mylist'][$num]['rating'] = true;
		}
		if (!isset($this->data['mylist'][$num]['number_comments'])) {
		$this->data['mylist'][$num]['number_comments'] = 20;
		}
		if (!isset($this->data['mylist'][$num]['status'])) {
		$this->data['mylist'][$num]['status'] = true;
		}
		if (!isset($this->data['mylist'][$num]['visual_rating'])) {
		$this->data['mylist'][$num]['visual_rating'] = true;
		}
		if (!isset($this->data['mylist'][$num]['signer'])) {
		$this->data['mylist'][$num]['signer'] = true;
		}
		if (!isset($this->data['mylist'][$num]['visual_editor'])) {
		$this->data['mylist'][$num]['visual_editor'] = true;
		}


	if (count($this->data['mylist'])>0)
	{
		reset($this->data['mylist']);
		$first_key = key($this->data['mylist']);
		foreach ($this->data['mylist'] as $num =>$list) {
			$this->data['slist'] = serialize($list);
	    }
    }

		$this->response->setOutput($this->render());
	}


	public function autocomplete_template()
	{
		$json = array();
		if (isset($this->request->get['path']) ) {
			if (isset($this->request->get['path'])) {
				$path = $this->request->get['path'];
			} //isset($this->request->get['filter_name'])
			else {
				$path = '';
			}

	        $this->data['widgets_full_path_default'] = array();
	        $this->data['widgets_full_path_theme'] = array();

	        $this->data['widgets_full_path_default'] = $this->msearchdir(DIR_CATALOG."view/theme/default/template/agoodonut/".$path);
	        $this->data['widgets_full_path_theme'] = $this->msearchdir(DIR_CATALOG."view/theme/".$this->config->get('config_template')."/template/agoodonut/".$path);
	        // $this->data['widgets_full_path'] = $this->data['widgets_full_path_default'] + $this->data['widgets_full_path_theme'];


	        $this->data['widgets_full_path'] = array_replace_recursive( $this->data['widgets_full_path_default'] , $this->data['widgets_full_path_theme']);

			 $i=0;
			 foreach ($this->data['widgets_full_path'] as $widget_full_path) {

			  $dname = str_replace(DIR_CATALOG."view/theme/default/template/agoodonut/".$path."/" , '', $widget_full_path);
			  $ename = str_replace(DIR_CATALOG."view/theme/".$this->config->get('config_template')."/template/agoodonut/".$path."/" , '', $dname);

			  $this->data['widgets'][$i]['name']= $ename;
			  $i++;
			 }


			foreach ($this->data['widgets'] as $result) {
				$json[] = array(
					'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}
		$this->response->setOutput(json_encode($json));
	}



public function msearchdir ( $path ,  $mode = "FULL", $myself = false, $maxdepth = -1 , $d = 0 )
{
   $dirlist = array () ;
   if (!file_exists($path)) {
   	return $dirlist;
   }

   if ( substr ( $path , strlen ( $path ) - 1 ) != '/' ) { $path .= '/' ; }


   if ( $mode != "FILES" ) {

   if ($d!=0 || $myself)
  	 $dirlist[] = $path ;

   }
   if ( $handle = opendir ( $path ))
   {
       while ( false !== ( $file = readdir ( $handle ) ) )
       {
           if ( $file != '.' && $file != '..' )
           {

	               $file = $path . $file ;
	               if ( ! is_dir ( $file ) ) { if ( $mode != "DIRS" ) { $dirlist[] = $file ; } }
	               elseif ( $d >=0 && ($d < $maxdepth || $maxdepth < 0) )
	               {
	                     $result = $this->msearchdir ( $file . '/' ,  $mode, $myself, $maxdepth , $d + 1 ) ;
	              		 $dirlist = array_merge ( $dirlist , $result ) ;


               }
       }
       }
       closedir ( $handle ) ;
   }
   if ( $d == 0 ) { natcasesort ( $dirlist ) ; }
   return ( $dirlist ) ;
}





	private function add_fields($prefix = '')
	{
		if (isset($this->request->post['mylist'])) {
			foreach ($this->request->post['mylist'] as $num => $value) {
				if (isset($value['addfields'])) {
					$sql[0] = "
						CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "review_fields` (
							 `review_id` int(11) NOT NULL,
					  		KEY `review_id` (`review_id`)
						) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
						";
					foreach ($sql as $qsql) {
						$query = $this->db->query($qsql);
					} //$sql as $qsql
					foreach ($value['addfields'] as $num_add => $value_add) {
						if ($value_add['name'] != '') {
							$r = $this->db->query("DESCRIBE " . DB_PREFIX . "review_fields '" . $prefix . $value_add['name'] . "'");
							if ($r->num_rows == 0) {
								$msql  = "ALTER TABLE `" . DB_PREFIX . "review_fields` ADD `" . $prefix . $value_add['name'] . "` text COLLATE utf8_general_ci NOT NULL";
								$query = $this->db->query($msql);
							} //$r->num_rows == 0
						} //$value_add['name'] != ''
					} //$value['addfields'] as $num_add => $value_add
				} //isset($value['addfields'])
			} //$this->request->post['mylist'] as $num => $value
		} //isset($this->request->post['mylist'])
	}
	private function validate()
	{
		$this->language->load('module/blog');
		if (!$this->user->hasPermission('modify', 'module/blog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		} //!$this->user->hasPermission('modify', 'module/blog')
		if (isset($this->request->post['mylist'])) {
			foreach ($this->request->post['mylist'] as $num => $value) {
				if (isset($value['addfields'])) {
					foreach ($value['addfields'] as $num_add => $value_add) {
						if ($value_add['name'] == '') {
							$this->error['warning'] = $this->language->get('error_addfields_name');
						} //$value_add['name'] == ''
						else {
							if (!preg_match('/^[a-z][a-z0-9-_]{3,30}$/i', $value_add['name'])) {
								$this->error['warning'] = $this->language->get('error_addfields_name');
							} //!preg_match('/^[a-z][a-z0-9-_]{3,30}$/i', $value_add['name'])
						}
					} //$value['addfields'] as $num_add => $value_add
				} //isset($value['addfields'])
			} //$this->request->post['mylist'] as $num => $value
		} //isset($this->request->post['mylist'])
		if (!$this->error) {
			return true;
		} //!$this->error
		else {
			$this->request->post = array();
			return false;
		}
	}
	public function browser()
	{
		$bra = 'ie';
		if (stristr($_SERVER['HTTP_USER_AGENT'], 'Firefox'))
			$bra = 'firefox';
		elseif (stristr($_SERVER['HTTP_USER_AGENT'], 'Chrome'))
			$bra = 'chrome';
		elseif (stristr($_SERVER['HTTP_USER_AGENT'], 'Safari'))
			$bra = 'safari';
		elseif (stristr($_SERVER['HTTP_USER_AGENT'], 'Opera'))
			$bra = 'opera';
		elseif (stristr($_SERVER['HTTP_USER_AGENT'], 'MSIE 6.0'))
			$bra = 'ieO';
		elseif (stristr($_SERVER['HTTP_USER_AGENT'], 'MSIE 7.0'))
			$bra = 'ieO';
		elseif (stristr($_SERVER['HTTP_USER_AGENT'], 'MSIE 8.0'))
			$bra = 'ieO';
		return $bra;
	}
	private function http_catalog()
	{
		if (!defined('HTTPS_CATALOG')) {
			$https_catalog = HTTP_CATALOG;
		} //!defined('HTTPS_CATALOG')
		else {
			$https_catalog = HTTPS_CATALOG;
		}
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			return $https_catalog;
		} //isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))
		else {
			return HTTP_CATALOG;
		}
	}
	public function install_router()
	{
		$html ='';
		$loader_version = '3.0';
		$this->language->load('common/footer');
		$text_footer = $this->language->get('text_footer');
		$admin_url   = $this->http_catalog();
		if (file_exists(DIR_SYSTEM . 'config/svn/svn.ver')) {
			unlink(DIR_SYSTEM . 'config/svn/svn.ver');
		} //file_exists(DIR_SYSTEM . 'config/svn/svn.ver')
		$findme = "index.php?route=module/blog/blogadmin";
		$pos    = strpos($text_footer, $findme);
		if ($pos === false) {
			$text = "<?php \$loader_version='" . $loader_version . "';
if (isset(\$_GET['token'])) \$token =\$_GET['token']; else \$token='';
if (\$token!='' && isset(\$_SESSION['token']) && \$token == \$_SESSION['token']) {
\$post = serialize(\$_POST);
\$get = serialize(\$_GET);
\$_['text_footer'].=\"<div id='scriptblogadmin'>
<script>
$(document).ready(function(){
 $.ajax({  type: 'POST',
			url: '" . $admin_url . "index.php?route=module/blog/blogadmin&token=\".\$token.\"',
			dataType: 'html',
			data: { post: '\".base64_encode(\$post).\"', get: '\".base64_encode(\$get).\"' },
		   	success: function(data)
		    {
		      $('#blogadmin').html(data);
		      $('#scriptblogadmin').html('');
  		    }
	    });

});
</script>
</div>
<div id='blogadmin'></div>\";
}
\$loader_version='" . $loader_version . "'; ?>";
			$this->load->model('localisation/language');
			$languages = $this->model_localisation_language->getLanguages();
			foreach ($languages as $language) {
				if ($this->config->get('config_language') == $language['code']) {
					$directory = $language['directory'];
				} //$this->config->get('config_language') == $language['code']
			} //$languages as $language
			$this->dir_permissions(DIR_LANGUAGE . $directory . '/common/footer.php');
			$file = DIR_LANGUAGE . $directory . '/common/footer.php';
			if (file_exists($file)) {
				if (is_writable($file)) {
					$f = @fopen($file, 'a');
					@fwrite($f, $text);
					@fclose($f);
				} //is_writable($file)
				else {
					$html .= $this->language->get('access_777') . "<br>";
				}
			} //file_exists($file)
		} //$pos === false
	}
	public function blogadmin()
	{
		$this->validateenter();
		$this->data['blog_version'] = '5.*';
		$this->load->model('setting/setting');
		$settings_admin = $this->model_setting_setting->getSetting('blogversion', 'blog_version');
		foreach ($settings_admin as $key => $value) {
			$this->data['blog_version'] = $value;
		} //$settings_admin as $key => $value


		if (!class_exists('User')) {
			require_once(DIR_SYSTEM . 'library/user.php');
			$this->registry->set('user', new User($this->registry));
		} //!class_exists('User')
		if ($this->user->isLogged()) {
			$userLogged = true;
		} //$this->user->isLogged()
		else {
			$userLogged = false;
		}
		$this->load->model('setting/extension');
		$extensions = $this->model_setting_extension->getInstalled('module');
		foreach ($extensions as $key => $value) {
			if (!file_exists(DIR_APPLICATION . 'controller/module/' . $value . '.php')) {
				$this->model_setting_extension->uninstall('module', $value);
				unset($extensions[$key]);
			} //!file_exists(DIR_APPLICATION . 'controller/module/' . $value . '.php')
		} //$extensions as $key => $value
		$extension = basename('blog', '.php');
		if ($userLogged && in_array($extension, $extensions)) {
			$html = $this->loadadminmenu();
			if (isset($this->request->post['post'])) {
				$post  = base64_decode($this->request->post['post']);
				$_POST = unserialize($post);
			} //isset($this->request->post['post'])
			else {
				$_POST = array();
			}
			if (isset($this->request->post['get'])) {
				$get  = base64_decode($this->request->post['get']);
				$_GET = unserialize($get);
			} //isset($this->request->post['get'])
			else {
				$_GET = array();
			}
			$this->request->get  = $_GET;
			$this->request->post = $_POST;

			if (isset($this->request->get['route'])) {
				if ($this->request->get['route'] == 'catalog/review/update') {
					if (!$this->user->hasPermission('modify', 'catalog/review')) {
						$this->error['warning'] = $this->language->get('error_permission');
					} //!$this->user->hasPermission('modify', 'catalog/review')
					else {
						$html .= $this->loadreviewdate();
					}
				} //$this->request->get['route'] == 'catalog/review/update'
			} //isset($this->request->get['route'])

			$this->response->setOutput($html);
		} //$userLogged && in_array($extension, $extensions)
	}
	private function validateenter()
	{
	}
	private function loadadminmenu()
	{
		$this->validateenter();
		$this->language->load('module/blog');
		if (isset($this->session->data['token'])) {
			$this->data['token'] = $this->session->data['token'];
		} //isset($this->session->data['token'])
		else {
			$this->data['token'] = "";
		}
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$admin_url = HTTP_SERVER;
		} //isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))
		else {
			$admin_url = HTTPS_SERVER;
		}
		$this->data['url_module']             = $admin_url . 'index.php?route=module/blog' . '&token=' . $this->data['token'];
		$this->data['url_blog']               = $admin_url . 'index.php?route=catalog/blog' . '&token=' . $this->data['token'];
		$this->data['url_record']             = $admin_url . 'index.php?route=catalog/record' . '&token=' . $this->data['token'];
		$this->data['url_comment']            = $admin_url . 'index.php?route=catalog/comment' . '&token=' . $this->data['token'];
		$this->data['url_modules']            = $admin_url . 'index.php?route=extension/module' . '&token=' . $this->data['token'];
		$this->data['url_forum']              = $this->language->get('url_forum');
		$this->data['url_forum_buy']          = $this->language->get('url_forum_buy');
		$this->data['url_opencartadmin']      = $this->language->get('url_opencartadmin');
		$this->data['url_forum_text']         = $this->language->get('url_forum_text');
		$this->data['url_forum_site_text']    = $this->language->get('url_forum_site_text');
		$this->data['url_forum_buy_text']     = $this->language->get('url_forum_buy_text');
		$this->data['url_forum_update_text']  = $this->language->get('url_forum_update_text');
		$this->data['url_opencartadmin_text'] = $this->language->get('url_opencartadmin_text');
		$this->data['url_module_text']        = $this->language->get('url_module_text');
		$this->data['url_blog_text']          = $this->language->get('url_blog_text');
		$this->data['url_record_text']        = $this->language->get('url_record_text');
		$this->data['url_comment_text']       = $this->language->get('url_comment_text');
		$this->template                       = 'module/blogadmin.tpl';
		if (file_exists(DIR_TEMPLATE . $this->template)) {
			$this->template = $this->template;
		} //file_exists(DIR_TEMPLATE . $this->template)
		else {
			$this->template = '';
		}
		$html = $this->render();
		return $html;
	}
	public function loadreviewdate()
	{
		$generallist = $this->config->get('generallist');

		if (isset($generallist['review_visual']) && $generallist['review_visual']) {


		$this->language->load('module/blog');
		if (isset($this->request->get['review_id'])) {
			if (isset($this->session->data['token'])) {
				$this->data['token'] = $this->session->data['token'];
			} //isset($this->session->data['token'])
			else {
				$this->data['token'] = "";
			}
			$url = '';
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			} //isset($this->request->get['sort'])
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			} //isset($this->request->get['order'])
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			} //isset($this->request->get['page'])
			$this->data['config_language'] = $this->config->get('config_language');
			$this->data['action']          = $this->url->link('module/blog/savereviewdate', 'token=' . $this->session->data['token'] . '&review_id=' . $this->request->get['review_id'] . $url, 'SSL');
			$this->load->model('catalog/review');
			$this->language->load('module/blog');
			$this->data['entry_date_added'] = $this->language->get('entry_date_added');
			$review_info                    = $this->model_catalog_review->getReview($this->request->get['review_id']);
			if (!empty($review_info)) {
				$this->data['date_added'] = $review_info['date_added'];
				$this->data['product_id'] = $review_info['product_id'];
			} //!empty($review_info)
			else {
				$this->data['date_added'] = '';
				$this->data['product_id'] = false;
			}
			$this->data['review_id'] = $this->request->get['review_id'];
            $this->load->model('catalog/blogcomment');

			if (isset($this->request->post['af'])) {
				$this->data['af'] = $this->request->post['af'];
			} //isset($this->request->post['rating'])
			else {

				if (isset($this->request->get['review_id'])) {
					$review_id = $this->request->get['review_id'];
					$data   = array(
						'review_id' => $this->request->get['review_id'],
						'mark' => 'product_id'
					);

					$af  = $this->model_catalog_blogcomment->getFields($data);

					foreach ($af as $val) {
		            	$this->data['af'] = $val;
		            }

				}
				else { $review_id = false; }

			}

		$this->load->model('agoo/design/layout');
		$this->data['record_id'] = $this->request->get['review_id'];
 		$layout_id = $this->model_agoo_design_layout->getRecordLayoutId($this->data['product_id'],'product');

		if (isset($this->request->post['mylist'])) {
			$mylist = $this->request->post['mylist'];
		} //isset($this->request->post['mylist'])
		else {
			$mylist = $this->config->get('mylist');
		}


        if (!isset($record_settings['addfields'])) {
          $record_settings['addfields'] = array();
        }


  //*******************************************
        $this->data['thislist'] = array();
        $this->data['thislist']['addfields'] = array();



		foreach ($this->config->get('blog_module') as $num => $val) {
// 		if ($layout_id == $val['layout_id'] && isset($mylist[$val['what']]['addfields']))





 		if (isset($mylist[$val['what']]['addfields']))
 		{

		  $this->data['thislist']=$mylist[$val['what']];

		  if ( isset($mylist[$val['what']]['addfields'])) {
			  $record_settings['addfields'] = array_merge ($record_settings['addfields'], $mylist[$val['what']]['addfields']);
		  }
		 }
		}


 				if (!function_exists('comp_field')) {
					function comp_field($a, $b)
					{
						if (!isset($a['sort_order']) || $a['sort_order']=='') $a['sort_order']='9999999';
						if (!isset($b['sort_order']) || $b['sort_order']=='') $b['sort_order']='9999999';

						$a['sort_order'] = (int)$a['sort_order'];
						$b['sort_order'] = (int)$b['sort_order'];

						if ($a['sort_order'] > $b['sort_order'])
							return 1;
						if ($b['sort_order'] > $a['sort_order'])
							return -1;
						return 0;
					}
				}
				if (isset($record_settings['addfields'])) {
					usort($record_settings['addfields'], 'comp_field');


				foreach ($record_settings['addfields'] as $num_add => $value_add) {
					if (isset($value_add['name']) && $value_add['name'] != '') {

							$this->data['fields'][$value_add['name']]['name']       = $value_add['name'];
							$this->data['fields'][$value_add['name']]['title']      = $value_add['title'][$this->config->get('config_language_id')];
							$this->data['fields'][$value_add['name']]['sort_order'] = $value_add['sort_order'];
							$this->data['fields'][$value_add['name']]['all'] = $value_add;
						}
						else {
							if (isset($value_add['name'])) {
							$this->data['fields'][$value_add['name']]['name']       = '';
							$this->data['fields'][$value_add['name']]['title']      = '';
							$this->data['fields'][$value_add['name']]['sort_order'] = '';
							}
						}
				}
               }


		   		$this->data['thislist']['addfields']=array();

		        if (isset($this->data['fields']) && count($this->data['fields'])>0) {
			        foreach ($this->data['fields'] as $an=>$af) {
			        $this->data['thislist']['addfields'][]=$af['all'];
			        }
		        }

           //*******************************************






		$loader_old = $this->registry->get('load');
		$this->load->library('agoo/loader');

		$agooloader = new agooLoader($this->registry);
		$this->registry->set('load', $agooloader);
        $this->load->model('catalog/treecomments', DIR_CATALOG);



        $this->data['karma'] =   $this->model_catalog_treecomments->getRatesByCommentId($this->request->get['review_id'], 'product_id', true);
        $this->data['karma_all'] =   $this->model_catalog_treecomments->getRatesByCommentId($this->request->get['review_id'], 'product_id');

       	$this->registry->set('load', $loader_old);
        $this->language->load('catalog/comment');



			$this->document->addScript('view/javascript/wysibb/jquery.wysibb.min.js');
			$this->document->addStyle('view/javascript/wysibb/theme/default/wbbtheme.css');
			$this->template = 'catalog/blog_review_date.tpl';
			if (file_exists(DIR_TEMPLATE . $this->template)) {
				$this->template = $this->template;
			} //file_exists(DIR_TEMPLATE . $this->template)
			else {
				$this->template = '';
			}
			$html = $this->render();
			if (isset($this->request->get['ajax'])) {
				$this->response->setOutput($html);
			} //isset($this->request->get['ajax'])
			else {
				return $html;
			}
		} //isset($this->request->get['review_id'])
	 }
	}

	public function cont($cont)
	{
		$file  = DIR_CATALOG . 'controller/' . $cont . '.php';
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
		if (file_exists($file)) {
			include_once($file);
			$this->registry->set('controller_' . str_replace('/', '_', $cont), new $class($this->registry));
		} //file_exists($file)
		else {
			trigger_error('Error: Could not load controller ' . $cont . '!');
			exit();
		}
	}

	public function savereviewdate()
	{
		$generallist = $this->config->get('generallist');

		if (isset($generallist['review_visual']) && $generallist['review_visual']) {

		$this->load->language('catalog/review');
		$this->document->setTitle($this->language->get('heading_title'));
		$url = '';
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		} //isset($this->request->get['sort'])
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		} //isset($this->request->get['order'])
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		} //isset($this->request->get['page'])
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateFormReview()) {
			$this->load->model('catalog/review');
			$this->load->model('catalog/blogreview');


			$this->model_catalog_review->editReview($this->request->get['review_id'], $this->request->post);

			$this->request->post['name'] = strip_tags($this->db->escape($this->request->post['author']));
            $this->request->post['mark'] = 'product_id';

			$this->model_catalog_blogreview->editReview($this->request->get['review_id'], $this->request->post);



			$this->load->model('catalog/blogcomment');
			$record_info = $this->model_catalog_blogcomment->getProductbyReviewId($this->request->get['review_id']);

			$record_id = $record_info['product_id'];

			$this->cont('record/treecomments');
            $this->data['mark'] = 'product_id';

			if (isset($this->request->post['thislist'])) {
				$str                    = base64_decode($this->request->post['thislist']);
				$this->data['thislist'] = unserialize($str);
			} else {
				$this->data['thislist'] = Array();
			}




			$this->data['thislist']['signer'] = true;
            //print_r($this->data['thislist']);
			//$this->controller_record_treecomments->signer($record_id, $record_info, $this->data['thislist'], $this->data['mark']);





			$this->session->data['success'] = $this->language->get('text_success');
			$link                           = $this->url->link('catalog/review', 'token=' . $this->session->data['token'] . $url, 'SSL');
			$this->redirect($link);
		} //($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateFormReview()
		else {
			$this->data['link'] = $this->url->link('catalog/review/update', 'token=' . $this->session->data['token'] . '&review_id=' . $this->request->get['review_id'] . $url, 'SSL');
			$this->data['post'] = $_POST;
			$this->template     = 'module/blogredirect.tpl';
			if (file_exists(DIR_TEMPLATE . $this->template)) {
				$this->template = $this->template;
			} //file_exists(DIR_TEMPLATE . $this->template)
			else {
				$this->template = '';
			}
			$html = $this->render();
			$this->response->setOutput($html);
		}
	 }
	}
	private function validateFormReview()
	{
		if (!$this->user->hasPermission('modify', 'catalog/review')) {
			$this->error['warning'] = $this->language->get('error_permission');
		} //!$this->user->hasPermission('modify', 'catalog/review')
		if (!$this->request->post['product_id']) {
			$this->error['product'] = $this->language->get('error_product');
		} //!$this->request->post['product_id']
		if ((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 64)) {
			$this->error['author'] = $this->language->get('error_author');
		} //(utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 64)
		if (utf8_strlen($this->request->post['text']) < 1) {
			$this->error['text'] = $this->language->get('error_text');
		} //utf8_strlen($this->request->post['text']) < 1
		if (!isset($this->request->post['rating'])) {
			$this->error['rating'] = $this->language->get('error_rating');
		} //!isset($this->request->post['rating'])
		if (!$this->error) {
			return true;
		} //!$this->error
		else {
			return false;
		}
	}
	private function alt_stat($file)
	{
		$s = false;
		clearstatcache();
		$ss = @stat($file);
		if (!$ss)
			return false;
		$ts  = array(
			0140000 => 'ssocket',
			0120000 => 'llink',
			0100000 => '-file',
			0060000 => 'bblock',
			0040000 => 'ddir',
			0020000 => 'cchar',
			0010000 => 'pfifo'
		);
		$p   = $ss['mode'];
		$t   = decoct($ss['mode'] & 0170000);
		$str = (array_key_exists(octdec($t), $ts)) ? $ts[octdec($t)]{0} : 'u';
		$str .= (($p & 0x0100) ? 'r' : '-') . (($p & 0x0080) ? 'w' : '-');
		$str .= (($p & 0x0040) ? (($p & 0x0800) ? 's' : 'x') : (($p & 0x0800) ? 'S' : '-'));
		$str .= (($p & 0x0020) ? 'r' : '-') . (($p & 0x0010) ? 'w' : '-');
		$str .= (($p & 0x0008) ? (($p & 0x0400) ? 's' : 'x') : (($p & 0x0400) ? 'S' : '-'));
		$str .= (($p & 0x0004) ? 'r' : '-') . (($p & 0x0002) ? 'w' : '-');
		$str .= (($p & 0x0001) ? (($p & 0x0200) ? 't' : 'x') : (($p & 0x0200) ? 'T' : '-'));
		$s = array(
			'perms' => array(
				'umask' => sprintf("%04o", @umask()),
				'human' => $str,
				'octal1' => sprintf("%o", ($ss['mode'] & 000777)),
				'octal2' => sprintf("0%o", 0777 & $p),
				'decimal' => sprintf("%04o", $p),
				'fileperms' => @fileperms($file),
				'mode1' => $p,
				'mode2' => $ss['mode']
			),
			'owner' => array(
				'fileowner' => $ss['uid'],
				'filegroup' => $ss['gid'],
				'owner' => (function_exists('posix_getpwuid')) ? @posix_getpwuid($ss['uid']) : '',
				'group' => (function_exists('posix_getgrgid')) ? @posix_getgrgid($ss['gid']) : ''
			),
			'file' => array(
				'filename' => $file,
				'realpath' => (@realpath($file) != $file) ? @realpath($file) : '',
				'dirname' => @dirname($file),
				'basename' => @basename($file)
			),
			'filetype' => array(
				'type' => substr($ts[octdec($t)], 1),
				'type_octal' => sprintf("%07o", octdec($t)),
				'is_file' => @is_file($file),
				'is_dir' => @is_dir($file),
				'is_link' => @is_link($file),
				'is_readable' => @is_readable($file),
				'is_writable' => @is_writable($file)
			),
			'device' => array(
				'device' => $ss['dev'],
				'device_number' => $ss['rdev'],
				'inode' => $ss['ino'],
				'link_count' => $ss['nlink'],
				'link_to' => ($s['type'] == 'link') ? @readlink($file) : ''
			),
			'size' => array(
				'size' => $ss['size'],
				'blocks' => $ss['blocks'],
				'block_size' => $ss['blksize']
			),
			'time' => array(
				'mtime' => $ss['mtime'],
				'atime' => $ss['atime'],
				'ctime' => $ss['ctime'],
				'accessed' => @date('Y M D H:i:s', $ss['atime']),
				'modified' => @date('Y M D H:i:s', $ss['mtime']),
				'created' => @date('Y M D H:i:s', $ss['ctime'])
			)
		);
		clearstatcache();
		return $s;
	}

	public function deleteOldSetting()
	{
		$this->language->load('module/blog');
		$html = "<br>";
        $this->load->model('setting/setting');

        $blog_options = $this->model_setting_setting->getSetting('blog_options');
        $blog_schemes = $this->model_setting_setting->getSetting('blog_schemes');
        $blog_widgets = $this->model_setting_setting->getSetting('blog_widgets');
        $blog_old = $this->model_setting_setting->getSetting('blog');

        if (count($blog_options)==0 || count($blog_schemes)==0 || count($blog_widgets)==0  ) {
        	$html .=$this->language->get('error_delete_old_settings');
        } else {
    	   	//if (count($blog_old)>0)
    	   	{
    	   		$this->model_setting_setting->deleteSetting('blog');
    	   	}
	       	$html .= $this->language->get('ok_create_tables');
        }



		$this->cache->delete('blog');
		$this->cache->delete('record');
		$this->cache->delete('blog.module.view');
		$this->cache->delete('blogsrecord');
		$this->cache->delete('category');
		$this->cache->delete('product');
		$this->cache->delete('html');
		$this->language->load('catalog/blog');

		$this->response->setOutput($html);
	}

	public function createTables()
	{
		$this->language->load('module/blog');
		$this->data['blog_version'] = $this->language->get('blog_version');
		$this->load->model('setting/setting');
		$setting_admin = Array(
			'http_admin_path' => HTTP_SERVER,
			'https_admin_path' => HTTPS_SERVER
		);
		$this->model_setting_setting->editSetting('blogadmin', $setting_admin);
		$setting_version = Array(
			'blog_version' => $this->data['blog_version']
		);
		$this->model_setting_setting->editSetting('blogversion', $setting_version);
		$this->language->load('catalog/blog');
		$html = "<br>";
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		foreach ($languages as $language) {
			if ($this->config->get('config_language') == $language['code']) {
				$directory = $language['directory'];
			} //$this->config->get('config_language') == $language['code']
		} //$languages as $language
		$file = DIR_LANGUAGE . $directory . '/common/footer.php';
		if (file_exists($file)) {
			$text = file_get_contents($file, FILE_USE_INCLUDE_PATH);
			$this->dir_permissions(DIR_LANGUAGE . $directory . '/common/footer.php');
			$text = preg_replace("!<[\?]php [\$]loader(.*?)[\?]>!s", "", $text);
			if (is_writable($file)) {
				$f = @fopen($file, 'w');
				@fwrite($f, $text);
				@fclose($f);
			} //is_writable($file)
			else {
				$html .= $this->language->get('access_777') . "<br>";
			}
		} //file_exists($file)
		$sql[0]  = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`blog_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;
";
		$sql[1]  = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_general_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`blog_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[2]  = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_layout` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[3]  = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_store` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[4]  = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8_general_ci NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`),
  KEY `record_id` (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;
";
		$sql[5]  = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) COLLATE utf8_general_ci NOT NULL,
  `sku` varchar(64) COLLATE utf8_general_ci NOT NULL,
  `upc` varchar(12) COLLATE utf8_general_ci NOT NULL,
  `location` varchar(128) COLLATE utf8_general_ci NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL DEFAULT '0.00',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(5,2) NOT NULL DEFAULT '0.00',
  `width` decimal(5,2) NOT NULL DEFAULT '0.00',
  `height` decimal(5,2) NOT NULL DEFAULT '0.00',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_general_ci NOT NULL,
  `comment_status` tinyint(1) NOT NULL,
  `comment_status_reg` tinyint(1) NOT NULL,
  `comment_status_now` tinyint(1) NOT NULL,
  `date_available` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_end` datetime NOT NULL DEFAULT '2033-03-03 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;
";
		$sql[6]  = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_attribute` (
  `record_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`record_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[7]  = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_description` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `description` text COLLATE utf8_general_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`record_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;
";
		$sql[9]  = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_image` (
  `record_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;
";
		$sql[10] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_option` (
  `record_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text COLLATE utf8_general_ci NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`record_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;
";
		$sql[11] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_option_value` (
  `record_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_option_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) COLLATE utf8_general_ci NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) COLLATE utf8_general_ci NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`record_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;
";
		$sql[12] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_related` (
  `record_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[13] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_reward` (
  `record_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;
";
		$sql[14] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_special` (
  `record_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`record_special_id`),
  KEY `record_id` (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;
";
		$sql[15] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_tag` (
  `record_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `tag` varchar(32) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`record_tag_id`),
  KEY `record_id` (`record_id`),
  KEY `language_id` (`language_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;
";
		$sql[16] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_to_blog` (
  `record_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[17] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_to_download` (
  `record_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[18] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_to_layout` (
  `record_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[19] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_to_store` (
  `record_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[20] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "rate_comment` (
  `comment_id` int(11) unsigned NOT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  `delta` float(9,3) DEFAULT '0.000',
  KEY `comment_id` (`comment_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8  COLLATE=utf8_general_ci;
";
		$sql[21] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "record_product_related` (
  `record_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
";
		$sql[22] = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "url_alias_blog` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";
		$sql[23] = "
CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "rate_review` (
  `review_id` int(11) unsigned NOT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  `delta` float(9,3) DEFAULT '0.000',
  KEY `review_id` (`review_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8  COLLATE=utf8_general_ci;
";
		$sql[24] = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "agoo_signer` (
`id` INT( 11 ) NOT NULL ,
`pointer` varchar(128) COLLATE utf8_general_ci NOT NULL,
`customer_id` INT( 11 ) NOT NULL ,
`date` DATETIME NOT NULL ,
KEY ( `pointer` ),
KEY ( `id` ) ,
KEY( `customer_id` ),
KEY( `date` )
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;";

		$sql[25] = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "review_fields` (
					 `review_id` int(11) NOT NULL,
					  KEY `review_id` (`review_id`)
					) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";


		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		foreach ($sql as $qsql) {
			$query = $this->db->query($qsql);
		} //$sql as $qsql



		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "blog_description `meta_title`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "blog_description` ADD `meta_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL AFTER `description`";
			$query = $this->db->query($msql);
		}

		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "blog_description `meta_h1`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "blog_description` ADD `meta_h1` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL AFTER `description`";
			$query = $this->db->query($msql);
		}


		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "record_description `meta_title`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record_description` ADD `meta_title` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL AFTER `description`";
			$query = $this->db->query($msql);
		}

		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "record_description `meta_h1`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record_description` ADD `meta_h1` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL AFTER `description`";
			$query = $this->db->query($msql);
		}



		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "record `date_available`");
		if ($r->num_rows > 0 && $r->row['Type'] == 'date') {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record` CHANGE `date_available` `date_available` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' ";
			$query = $this->db->query($msql);
		}

		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "record_related `pointer_id`");
		if ($r->num_rows !=0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record_related` CHANGE `pointer_id` `record_id` INT( 11 ) NOT NULL  ";
			$query = $this->db->query($msql);
		}

       /*
		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "record_related `pointer`");
		if ($r->num_rows ==0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record_related` ADD `pointer` VARCHAR( 128 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL AFTER `related_id` ";
			$query = $this->db->query($msql);
			$msql  = "UPDATE `" . DB_PREFIX . "record_related` SET `pointer` = 'record_id'";
			$query = $this->db->query($msql);
		}

		$r = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "record_related`  WHERE Key_name ='PRIMARY'");

		if ($r->num_rows !=0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record_related`  DROP PRIMARY KEY ";
			$query = $this->db->query($msql);
		}

		$r = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "record_related`");
        if ($r->num_rows ==0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record_related`  ADD INDEX `pointer` ( `pointer_id` , `pointer` ) ";
			$query = $this->db->query($msql);

			$msql  = "ALTER TABLE `" . DB_PREFIX . "record_related`  ADD INDEX `related` ( `related_id` , `pointer` ) ";
			$query = $this->db->query($msql);

        }

       $r = $this->db->query("DESCRIBE " . DB_PREFIX . "record_product_related `product_id`");
       if ($r->num_rows !=0) {

		$msql  = "SELECT * FROM `" . DB_PREFIX . "record_product_related`";
		$query = $this->db->query($msql);

		if (count($query->rows) > 0) {
			foreach ($query->rows as $blog_id) {

				$msql    = "SELECT * FROM `" . DB_PREFIX . "record_related` WHERE `pointer_id`='" . $blog_id['product_id'] . "' AND pointer='product_id'";
				$query_1 = $this->db->query($msql);
				if (count($query_1->rows) <= 0) {

				$this->db->query("DELETE FROM " . DB_PREFIX . "record_related WHERE pointer_id = '" . $blog_id['record_id']  . "' AND related_id = '" . $blog_id['product_id']  . "' AND pointer='product_id'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "record_related WHERE pointer_id = '" . $blog_id['product_id']  . "' AND related_id = '" . $blog_id['record_id'] . "' AND pointer='product_id'");

				$this->db->query("INSERT INTO " . DB_PREFIX . "record_related SET pointer_id = '" . $blog_id['record_id']. "', related_id = '" .  $blog_id['product_id'] . "' , pointer='product_id'");
                $this->db->query("INSERT INTO " . DB_PREFIX . "record_related SET pointer_id = '" . $blog_id['product_id']  . "', related_id = '" . $blog_id['record_id'] . "' , pointer='product_id'");

				}

			}
					$msql  = "DROP TABLE `" . DB_PREFIX . "record_product_related`";
					$query = $this->db->query($msql);
  		}
       }
       */








		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "setting `value`");
		if ($r->num_rows > 0 && $r->row['Type'] == 'text') {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "setting` CHANGE `value` `value` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL ";
			$query = $this->db->query($msql);
		}


		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "review_fields `review_id`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "review_fields` ADD `review_id` INT( 11 )  NOT NULL ";
			$query = $this->db->query($msql);
		}


		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "review_fields `mark`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "review_fields` ADD `mark` VARCHAR( 255 ) CHARACTER SET ascii COLLATE ascii_bin NOT NULL AFTER `review_id`";
			$query = $this->db->query($msql);
		}

			$msql  = "UPDATE `" . DB_PREFIX . "review_fields` SET `mark`='product_id' WHERE `mark`=''";
			$query = $this->db->query($msql);

		//$r->num_rows > 0 && $r->row['Type'] == 'date'
		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "comment `sorthex`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "comment` ADD `sorthex` VARCHAR( 255 ) CHARACTER SET ascii COLLATE ascii_bin NOT NULL AFTER `rating`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0


		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "review `sorthex`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "review` ADD `sorthex` INT(11) NOT NULL AFTER `product_id`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0
		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "comment `parent_id`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "comment` ADD `parent_id` INT(11) NOT NULL AFTER `record_id`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0


		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "review `parent_id`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "review` ADD `parent_id` INT(11) NOT NULL AFTER `product_id`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0

		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "review `rating_mark`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "review` ADD `rating_mark` tinyint(1)  NOT NULL DEFAULT '0' AFTER `rating`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0


		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "record_image `options`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record_image` ADD `options` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `image`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0


		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "comment `rating_mark`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "comment` ADD `rating_mark` tinyint(1)  NOT NULL DEFAULT '0' AFTER `rating`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0



		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "agoo_signer `pointer`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "agoo_signer` ADD `pointer` varchar(128)  NOT NULL DEFAULT 'product_id' AFTER `id`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0


		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "comment `rating_mark`");
		if ($r->num_rows == 1) {
		    foreach ($r->rows as $trow) {

	     	if ($trow['Key']==' ') {
		     	$msql  = "ALTER TABLE `" . DB_PREFIX . "comment` ADD INDEX `rating_mark` (`rating_mark`)";
		     	$query = $this->db->query($msql);
		     }
		    }

		}

		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "review `rating_mark`");
		if ($r->num_rows == 1) {
		    foreach ($r->rows as $trow) {
		     if ($trow['Key']==' ') {
		     	$msql  = "ALTER TABLE `" . DB_PREFIX . "review` ADD INDEX `rating_mark` (`rating_mark`)";
		     	$query = $this->db->query($msql);
		     }
		    }
		}


		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "comment `rating`");
		if ($r->num_rows == 1) {
		    foreach ($r->rows as $trow) {
		     if ($trow['Key']=='') {
		     	$msql  = "ALTER TABLE `" . DB_PREFIX . "comment` ADD INDEX `rating` (`rating`)";
		     	$query = $this->db->query($msql);
		     }
		    }

		}

		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "review `rating`");
		if ($r->num_rows == 1) {
		    foreach ($r->rows as $trow) {
		     if ($trow['Key']=='') {
		     	$msql  = "ALTER TABLE `" . DB_PREFIX . "review` ADD INDEX `rating` (`rating`)";
		     	$query = $this->db->query($msql);
		     }
		    }

		}




		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "agoo_signer `pointer`");
		if ($r->num_rows == 1) {
		    foreach ($r->rows as $trow) {
		     if ($trow['Key']=='') {
		     	$msql  = "ALTER TABLE `" . DB_PREFIX . "agoo_signer` ADD INDEX `pointer` (`pointer`)";
		     	$query = $this->db->query($msql);
		     }
		    }

		}


		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "record `comment`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record` ADD `comment`  text COLLATE utf8_general_ci NOT NULL AFTER `status`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0

		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "record `date_end`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record` ADD `date_end` DATETIME NOT NULL DEFAULT '2030-11-11 00:00:00' AFTER `date_available`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0
		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "record `date_available`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record` CHANGE `date_available` `date_available` DATETIME NOT NULL";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0
		$r = $this->db->query("DESCRIBE  " . DB_PREFIX . "record_description `sdescription`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record_description` ADD `sdescription` text COLLATE utf8_general_ci NOT NULL AFTER `name`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0
		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "blog `design`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "blog` ADD `design` text COLLATE utf8_general_ci NOT NULL AFTER `image`";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0
		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "record `blog_main`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record` ADD `blog_main` TINYINT( 1 ) NOT NULL AFTER `record_id`, ADD INDEX ( `blog_main` ) ";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0
		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "blog `customer_group_id`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "blog` ADD `customer_group_id` INT(2) NOT NULL AFTER `status`";
			$query = $this->db->query($msql);
			$msql  = "UPDATE `" . DB_PREFIX . "blog` SET `customer_group_id`=" . (int) $this->config->get('config_customer_group_id') . " ";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0
		$r = $this->db->query("DESCRIBE " . DB_PREFIX . "record `customer_group_id`");
		if ($r->num_rows == 0) {
			$msql  = "ALTER TABLE `" . DB_PREFIX . "record` ADD `customer_group_id` INT(2) NOT NULL AFTER `status`";
			$query = $this->db->query($msql);
			$msql  = "UPDATE `" . DB_PREFIX . "record` SET `customer_group_id`=" . (int) $this->config->get('config_customer_group_id') . " ";
			$query = $this->db->query($msql);
		} //$r->num_rows == 0
		$msql  = "SELECT * FROM `" . DB_PREFIX . "layout` WHERE `name`='Blog';";
		$query = $this->db->query($msql);
		if (count($query->rows) <= 0) {
			$msql  = "INSERT INTO `" . DB_PREFIX . "layout` (`name`) VALUES  ('Blog');";
			$query = $this->db->query($msql);
			$msql  = "INSERT INTO `" . DB_PREFIX . "layout_route` (`route`, `layout_id`) VALUES  ('record/blog'," . mysql_insert_id() . ");";
			$query = $this->db->query($msql);
		} //count($query->rows) <= 0
		$msql  = "SELECT * FROM `" . DB_PREFIX . "layout` WHERE `name`='not_found';";
		$query = $this->db->query($msql);
		if (count($query->rows) <= 0) {
			$msql         = "INSERT INTO `" . DB_PREFIX . "layout` (`name`) VALUES  ('not_found');";
			$query        = $this->db->query($msql);
			$not_found_id = $this->db->getLastId();
			$msql         = "INSERT INTO `" . DB_PREFIX . "layout_route` (`route`, `layout_id`) VALUES  ('error/not_found'," . $not_found_id . ");";
			$query        = $this->db->query($msql);
		} //count($query->rows) <= 0
		$msql  = "SELECT * FROM `" . DB_PREFIX . "layout` WHERE `name`='Record';";
		$query = $this->db->query($msql);
		if (count($query->rows) <= 0) {
			$msql      = "INSERT INTO `" . DB_PREFIX . "layout` (`name`) VALUES  ('Record');";
			$query     = $this->db->query($msql);
			$insert_id = $this->db->getLastId();
			$msql      = "INSERT INTO `" . DB_PREFIX . "layout_route` (`route`, `layout_id`) VALUES  ('record/record'," . $insert_id . ");";
			$query     = $this->db->query($msql);
		} //count($query->rows) <= 0
		$msql  = "SELECT * FROM `" . DB_PREFIX . "blog` LIMIT 1;";
		$query = $this->db->query($msql);
		if (count($query->rows) <= 0) {
			$msql  = "INSERT INTO `" . DB_PREFIX . "blog` (`blog_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `customer_group_id`, `date_added`, `date_modified`)
			VALUES (1, 'a:12:{s:10:\"blog_small\";a:2:{s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";}s:8:\"blog_big\";a:2:{s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";}s:16:\"blog_num_records\";s:0:\"\";s:17:\"blog_num_comments\";s:0:\"\";s:13:\"blog_num_desc\";s:0:\"\";s:19:\"blog_num_desc_words\";s:0:\"\";s:18:\"blog_num_desc_pred\";s:0:\"\";s:13:\"blog_template\";s:0:\"\";s:20:\"blog_template_record\";s:0:\"\";s:21:\"blog_template_comment\";s:0:\"\";s:12:\"blog_devider\";s:1:\"1\";s:15:\"blog_short_path\";s:1:\"0\";}', 0, 0, 0, 1, 1, " . (int) $this->config->get('config_customer_group_id') . ", '2012-10-11 22:58:43', '2012-10-12 01:32:26')
			";
			$query = $this->db->query($msql);
			foreach ($languages as $language) {
				$msql  = "INSERT INTO `" . DB_PREFIX . "blog_description` (`blog_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`)
				VALUES (1, " . $language['language_id'] . ", 'News', '', 'News', 'News')";
				$query = $this->db->query($msql);
			} //$languages as $language
			$msql  = "INSERT INTO `" . DB_PREFIX . "blog_to_store` (`blog_id`, `store_id`) VALUES (1, 0);";
			$query = $this->db->query($msql);
			$msql  = "INSERT INTO `" . DB_PREFIX . "url_alias_blog` (`query`, `keyword`) VALUES  ('blog_id=1', 'first_blog')";
			$query = $this->db->query($msql);
		} //count($query->rows) <= 0

		$msql  = "SELECT * FROM `" . DB_PREFIX . "record` WHERE `record_id`='1';";
		$query = $this->db->query($msql);
		if (count($query->rows) <= 0) {
			$msql  = "INSERT INTO `" . DB_PREFIX . "record` (`record_id`,  `image`,  `date_available`, `date_end`,  `sort_order`, `status`, `comment`, `comment_status`, `comment_status_reg`, `comment_status_now`, `date_added`, `date_modified`, `viewed`, `customer_group_id`)
				VALUES (1, 'data/logo.png', '2012-10-10 23:58:47', '2030-11-11 00:00:00', 1, 1, 0x613a343a7b733a363a22737461747573223b733a313a2231223b733a31303a227374617475735f726567223b733a313a2230223b733a31303a227374617475735f6e6f77223b733a313a2230223b733a363a22726174696e67223b733a313a2231223b7d, 0, 0, 0, '2012-10-11 22:59:25', '2012-10-12 01:33:59', 2, " . (int) $this->config->get('config_customer_group_id') . ");";
			$query = $this->db->query($msql);
			$msql  = "INSERT INTO `" . DB_PREFIX . "record_description` (`record_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES (1, 1, 'We started a blog.', 0x266c743b702667743b0d0a09266c743b7370616e20636c6173733d2671756f743b73686f72745f746578742671756f743b2069643d2671756f743b726573756c745f626f782671756f743b206c616e673d2671756f743b656e2671756f743b20746162696e6465783d2671756f743b2d312671756f743b2667743b266c743b7370616e20636c6173733d2671756f743b6870732671756f743b2667743b57652073746172746564266c743b2f7370616e2667743b20266c743b7370616e20636c6173733d2671756f743b6870732671756f743b2667743b6120626c6f672e266c743b2f7370616e2667743b266c743b2f7370616e2667743b266c743b2f702667743b0d0a, 'We started a blog.', 'We started a blog.');";
			$query = $this->db->query($msql);
			$msql  = "INSERT INTO `" . DB_PREFIX . "record_to_blog` (`record_id`, `blog_id`) VALUES (1, 1);";
			$query = $this->db->query($msql);
			$msql  = "INSERT INTO `" . DB_PREFIX . "record_to_store` (`record_id`, `store_id`) VALUES (1, 0);";
			$query = $this->db->query($msql);
			$msql  = "INSERT INTO `" . DB_PREFIX . "url_alias_blog` (`query`, `keyword`) VALUES  ('record_id=1', 'first_record')";
			$query = $this->db->query($msql);
		} //count($query->rows) <= 0

		$msql  = "SELECT * FROM `" . DB_PREFIX . "setting` WHERE `group`='blog';";
		$query = $this->db->query($msql);
		if (count($query->rows) <= 0) {
			if (!isset($not_found_id)) {
				$msql  = "SELECT * FROM `" . DB_PREFIX . "layout` WHERE `name`='not_found';";
				$query = $this->db->query($msql);
				if (count($query->rows) > 0) {
					$not_found_id = $query->row['layout_id'];
				} //count($query->rows) > 0
			} //!isset($not_found_id)
			$ar                  = Array(
				'0' => Array(
					'layout_id' => 1,
					'position' => 'content_top',
					'status' => 1,
					'what' => 'what_hook',
					'sort_order' => 0
				),
				'1' => Array(
					'layout_id' => $not_found_id,
					'position' => 'content_top',
					'status' => 1,
					'what' => 'what_hook',
					'sort_order' => 0
				)
			);
			$blog_nodule_setting = serialize($ar);
			$msql                = "INSERT INTO `" . DB_PREFIX . "setting` ( `store_id`, `group`, `key`, `value`, `serialized`) VALUES
( 0, 'blog', 'blog_num_comments', '20', 0),
( 0, 'blog', 'blog_num_desc', '', 0),
( 0, 'blog', 'blog_num_desc_words', '', 0),
( 0, 'blog', 'blog_num_desc_pred', '1', 0),
( 0, 'blog', 'blog_module', '" . $blog_nodule_setting . "', 1),
( 0, 'blog', 'mylist-what', 'blogs', 0),
( 0, 'blog', 'mylist', 'a:3:{i:2;a:5:{s:4:\"type\";s:5:\"blogs\";s:17:\"title_list_latest\";a:2:{i:1;s:4:\"Blog\";i:2;s:0:\"\";}s:6:\"avatar\";a:2:{s:5:\"width\";s:2:\"50\";s:6:\"height\";s:2:\"50\";}s:8:\"template\";s:0:\"\";s:5:\"blogs\";a:1:{i:0;s:1:\"1\";}}i:1;a:4:{s:4:\"type\";s:8:\"blogsall\";s:17:\"title_list_latest\";a:2:{i:1;s:5:\"Blogs\";i:2;s:0:\"\";}s:6:\"avatar\";a:2:{s:5:\"width\";s:2:\"50\";s:6:\"height\";s:2:\"50\";}s:8:\"template\";s:0:\"\";}i:3;a:10:{s:4:\"type\";s:6:\"latest\";s:17:\"title_list_latest\";a:2:{i:1;s:4:\"Last\";i:2;s:0:\"\";}s:6:\"avatar\";a:2:{s:5:\"width\";s:2:\"50\";s:6:\"height\";s:2:\"50\";}s:8:\"template\";s:0:\"\";s:15:\"number_per_blog\";s:1:\"5\";s:12:\"desc_symbols\";s:0:\"\";s:10:\"desc_words\";s:0:\"\";s:9:\"desc_pred\";s:1:\"1\";s:5:\"order\";s:6:\"latest\";s:5:\"blogs\";a:1:{i:0;s:1:\"1\";}}}', 1),
( 0, 'blog', 'blog_num_records', '20', 0),
( 0, 'blog', 'blog_small', 'a:2:{s:5:\"width\";s:3:\"150\";s:6:\"height\";s:3:\"150\";}', 1),
( 0, 'blog', 'blog_big', 'a:2:{s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";}', 1);
	";
			//$query               = $this->db->query($msql);



$mylist = $this->config->get('mylist');
if (count($mylist)<1) {
	$msql                = "INSERT INTO `" . DB_PREFIX . "setting` ( `store_id`, `group`, `key`, `value`, `serialized`) VALUES
	(0, 'blog', 'mylist', 'a:1:{i:2;a:5:{s:4:\"type\";s:5:\"blogs\";s:17:\"title_list_latest\";a:3:{i:1;s:4:\"Blog\";i:2;s:0:\"\";i:3;s:0:\"\";}s:6:\"avatar\";a:2:{s:5:\"width\";s:2:\"50\";s:6:\"height\";s:2:\"50\";}s:8:\"template\";s:0:\"\";s:5:\"blogs\";a:1:{i:0;s:1:\"1\";}}}', 1);
	";
	$query               = $this->db->query($msql);
}


		} //count($query->rows) <= 0
		$msql  = "SELECT * FROM `" . DB_PREFIX . "url_alias` WHERE `query` LIKE 'blog_id=%';";
		$query = $this->db->query($msql);
		if (count($query->rows) > 0) {
			foreach ($query->rows as $blog_id) {
				$msql    = "SELECT * FROM `" . DB_PREFIX . "url_alias_blog` WHERE `query`='" . $blog_id['query'] . "'";
				$query_1 = $this->db->query($msql);
				if (count($query_1->rows) <= 0) {
					$msql    = "INSERT INTO `" . DB_PREFIX . "url_alias_blog` (`query`, `keyword`) VALUES  ('" . $blog_id['query'] . "', '" . $blog_id['keyword'] . "')";
					$query_2 = $this->db->query($msql);
				} //count($query_1->rows) <= 0
				$msql    = "DELETE FROM `" . DB_PREFIX . "url_alias` WHERE query ='" . $blog_id['query'] . "'";
				$query_3 = $this->db->query($msql);
			} //$query->rows as $blog_id
		} //count($query->rows) > 0

		$msql  = "SELECT * FROM `" . DB_PREFIX . "url_alias` WHERE `query` LIKE 'record_id=%';";
		$query = $this->db->query($msql);
		if (count($query->rows) > 0) {
			foreach ($query->rows as $blog_id) {
				$msql    = "SELECT * FROM `" . DB_PREFIX . "url_alias_blog` WHERE `query`='" . $blog_id['query'] . "'";
				$query_1 = $this->db->query($msql);
				if (count($query_1->rows) <= 0) {
					$msql    = "INSERT INTO `" . DB_PREFIX . "url_alias_blog` (`query`, `keyword`) VALUES  ('" . $blog_id['query'] . "', '" . $blog_id['keyword'] . "')";
					$query_2 = $this->db->query($msql);
				} //count($query_1->rows) <= 0
				$msql    = "DELETE FROM `" . DB_PREFIX . "url_alias` WHERE query ='" . $blog_id['query'] . "'";
				$query_3 = $this->db->query($msql);
			} //$query->rows as $blog_id
		} //count($query->rows) > 0
		$this->cache->delete('blog');
		$this->cache->delete('record');
		$this->cache->delete('blog.module.view');
		$this->cache->delete('blogsrecord');
		$this->cache->delete('category');
		$this->cache->delete('product');
		$this->cache->delete('html');
		$this->language->load('catalog/blog');
		$html .= $this->language->get('ok_create_tables');
		$this->response->setOutput($html);
	}


	private function isAvailable($func)
	{
		if (ini_get('safe_mode'))
			return false;
		$disabled = ini_get('disable_functions');
		if ($disabled) {
			$disabled = explode(',', $disabled);
			$disabled = array_map('trim', $disabled);
			return !in_array($func, $disabled);
		} //$disabled
		return true;
	}
	private function dir_permissions($file)
	{
		error_reporting(0);
		set_error_handler('agoo_error_handler');
		if ($this->isAvailable('exec')) {
			$files = array(
				$file
			);
			@exec('chmod 7777 ' . implode(' ', $files));
			@exec('chmod 0777 ' . implode(' ', $files));
		} //$this->isAvailable('exec')
		@umask(0);
		@chmod($file, 0777);
		restore_error_handler();
		error_reporting(E_ALL);
	}
}
if (!function_exists('agoo_error_handler')) {
	function agoo_error_handler($errno, $errstr)
	{
	}
} //!function_exists('agoo_error_handler')

if (!function_exists('array_replace_recursive'))
{
  function array_replace_recursive($array, $array1)
  {
    function recurse($array, $array1)
    {
      foreach ($array1 as $key => $value)
      {
        // create new key in $array, if it is empty or not an array
        if (!isset($array[$key]) || (isset($array[$key]) && !is_array($array[$key])))
        {
          $array[$key] = array();
        }

        // overwrite the value in the base array
        if (is_array($value))
        {
          $value = recurse($array[$key], $value);
        }
        $array[$key] = $value;
      }
      return $array;
    }

    // handle the arguments, merge one by one
    $args = func_get_args();
    $array = $args[0];
    if (!is_array($array))
    {
      return $array;
    }
    for ($i = 1; $i < count($args); $i++)
    {
      if (is_array($args[$i]))
      {
        $array = recurse($array, $args[$i]);
      }
    }
    return $array;
  }
}



?>