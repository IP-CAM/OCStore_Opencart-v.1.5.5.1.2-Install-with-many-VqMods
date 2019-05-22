<?php
class ControllerCommonSeoBlog extends Controller
{
	private $blog_design = Array();
	public function index()
	{
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		} //$this->config->get('config_seo_url')
		if (isset($_GET['_route_']))
			$this->request->get['_route_'] = $_GET['_route_'];
		if (isset($_GET['route']))
			$this->request->get['route'] = $_GET['route'];
		$this->flag = 'none';
		if ((isset($this->request->get['route']) && $this->request->get['route'] == 'record/search') || (isset($this->request->get['_route_']) && $this->request->get['_route_'] == 'record/search')) {
			$this->request->get['route'] = 'record/search';
			if (isset($this->request->get['_route_'])) {
				$_route_ = $this->request->get['_route_'];
				unset($this->request->get['_route_']);
			} //isset($this->request->get['_route_'])
			$this->validate();
			if (isset($this->request->get['_route_'])) {
				$this->request->get['_route_'] = $_route_;
			} //isset($this->request->get['_route_'])
			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 200 OK');
			return $this->flag = "search";
		} //(isset($this->request->get['route']) && $this->request->get['route'] == 'record/search') || (isset($this->request->get['_route_']) && $this->request->get['_route_'] == 'record/search')
		if (isset($this->request->get['record_id'])) {
			$this->request->get['route']   = 'record/record';
			$this->request->get['blog_id'] = $this->getPathByRecord($this->request->get['record_id']);
			if (isset($this->request->get['_route_'])) {
				$_route_ = $this->request->get['_route_'];
				unset($this->request->get['_route_']);
			} //isset($this->request->get['_route_'])
			$this->validate();
			if (isset($this->request->get['_route_'])) {
				$this->request->get['_route_'] = $_route_;
			} //isset($this->request->get['_route_'])
			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 200 OK');
			return $this->flag = 'record';
		} //isset($this->request->get['record_id'])
		if (isset($this->request->get['blog_id'])) {
			$this->request->get['route']   = 'record/blog';
			$this->request->get['blog_id'] = $this->getPathByBlog($this->request->get['blog_id']);
			if (isset($this->request->get['_route_'])) {
				$_route_ = $this->request->get['_route_'];
				unset($this->request->get['_route_']);
			} //isset($this->request->get['_route_'])
			$this->validate();
			if (isset($this->request->get['_route_'])) {
				$this->request->get['_route_'] = $_route_;
			} //isset($this->request->get['_route_'])
			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 200 OK');
			return $this->flag = 'blog';
		} //isset($this->request->get['blog_id'])
		if (isset($this->request->get['_route_'])) {
			$this->load->model('design/bloglayout');
			$this->data['layouts'] = $this->model_design_bloglayout->getLayouts();
			$route                 = $this->request->get['_route_'];
			$parts                 = explode('/', trim($route, '/'));
			if (isset($this->request->get['record_id']) && $this->request->get['record_id'] != '') {
				array_push($parts, 'record_id=' . $this->request->get['record_id']);
			} //isset($this->request->get['record_id']) && $this->request->get['record_id'] != ''
			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias_blog WHERE keyword = '" . $this->db->escape($part) . "'");
				if (!$query->num_rows && isset($this->request->get['record_id']) && $this->request->get['record_id'] != '') {
					$query->num_rows     = 1;
					$query->row['query'] = 'record_id=' . $this->request->get['record_id'];
				} //!$query->num_rows && isset($this->request->get['record_id']) && $this->request->get['record_id'] != ''
				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);
					if (isset($url[0]) && $url[0] == 'record_id') {
						$this->request->get['record_id'] = $url[1];
						$path                            = $this->getPathByRecord($this->request->get['record_id']);
						$this->flag                      = 'record';
						$layout                          = 0;
						foreach ($this->data['layouts'] as $num => $lay) {
							if ($lay['name'] == 'Record')
								$layout = $lay['layout_id'];
						} //$this->data['layouts'] as $num => $lay
						$this->config->set("config_layout_id", $layout);
					} //isset($url[0]) && $url[0] == 'record_id'
					else {
						if (isset($url[0]) && $url[0] == 'blog_id') {
							$this->flag = 'blog';
							$layout     = 0;
							foreach ($this->data['layouts'] as $num => $lay) {
								if ($lay['name'] == 'Blog')
									$layout = $lay['layout_id'];
							} //$this->data['layouts'] as $num => $lay
							$this->config->set("config_layout_id", $layout);
							if (!isset($this->request->get['blog_id'])) {
								$this->request->get['blog_id'] = $url[1];
							} //!isset($this->request->get['blog_id'])
							else {
								$this->request->get['blog_id'] .= '_' . $url[1];
							}
						} //isset($url[0]) && $url[0] == 'blog_id'
					}
					if (isset($url[0]) && $url[0] == 'record/search') {
						$this->flag = 'search';
						$layout     = 0;
						foreach ($this->data['layouts'] as $num => $lay) {
							if ($lay['name'] == 'Search_Record')
								$layout = $lay['layout_id'];
						} //$this->data['layouts'] as $num => $lay
						$this->config->set("config_layout_id", $layout);
						if (!isset($this->request->get['record/search'])) {
							$this->request->get['route'] = 'record/search';
						} //!isset($this->request->get['record/search'])
						else {
							$this->request->get['route'] = 'record/search';
						}
					} //isset($url[0]) && $url[0] == 'record/search'
					if (isset($url[0]) && $url[0] == 'route') {
						$this->request->get['route'] = $url[1];
					} //isset($url[0]) && $url[0] == 'route'
				} //$query->num_rows
				else {
				}
			} //$parts as $part
			if (isset($this->request->get['record_id'])) {
				$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 200 OK');
				$this->request->get['route'] = 'record/record';
			} //isset($this->request->get['record_id'])
			elseif (isset($this->request->get['blog_id'])) {
				$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 200 OK');
				$this->request->get['route'] = 'record/blog';
			} //isset($this->request->get['blog_id'])
				elseif (isset($this->request->get['record/search'])) {
				$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 200 OK');
				$this->request->get['route'] = 'record/search';
			} //isset($this->request->get['record/search'])
			$_route_ = $this->request->get['_route_'];
			unset($this->request->get['_route_']);
			$this->validate();
			$this->request->get['_route_'] = $_route_;
			if (isset($this->request->get['route'])) {
				$this->request->get['_route_'] = $this->request->get['route'];
			} //isset($this->request->get['route'])
			return $this->flag;
		} //isset($this->request->get['_route_'])
	}
	public function rewrite($link)
	{
		if ($this->config->get('config_seo_url')) {
			$url_data = parse_url(str_replace('&amp;', '&', $link));
			$url      = '';
			$data     = array();
			if (isset($url_data['query'])) {
				parse_str($url_data['query'], $data);
			} //isset($url_data['query'])
			foreach ($data as $num => $name) {
				if ($name != 'record_id' && $name != '' && $name != 'route' && $name != 'blog_id') {
					unset($data[$name]);
				} //$name != 'record_id' && $name != '' && $name != 'route' && $name != 'blog_id'
			} //$data as $num => $name
			reset($data);
			if (isset($data['record_id'])) {
				$record_id = $data['record_id'];
				if ($this->config->get('config_seo_url')) {
					$path = $this->getPathByRecord($record_id);
				} //$this->config->get('config_seo_url')
				$data['path'] = $path;
			} //isset($data['record_id'])
			$flag_record = false;
			foreach ($data as $key => $value) {
				if (isset($data['route'])) {
					if ($key == 'blog_id') {
						$path = $this->getPathByBlog($value);
					} //$key == 'blog_id'
					if ($key == 'path') {
						$categories = explode('_', $value);
						$new        = array_reverse($categories);
						foreach ($new as $category) {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias_blog WHERE `query` = 'blog_id=" . (int) $category . "'");
							if ($query->num_rows) {
								$url = '/' . $query->row['keyword'] . $url;
							} //$query->num_rows
						} //$new as $category
						unset($data[$key]);
					} //$key == 'path'
					if (($data['route'] == 'record/record' && $key == 'record_id')) {
						$flag_record = true;
						$query       = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias_blog WHERE `query` = '" . $this->db->escape($key . '=' . (int) $value) . "'");
						if ($query->num_rows) {
							$url = '/' . $query->row['keyword'];
							unset($data[$key]);
						} //$query->num_rows
					} //($data['route'] == 'record/record' && $key == 'record_id')
					elseif ($key == 'blog_id' && !$flag_record) {
						$categories = explode('_', $value);
						if (count($categories) == 1) {
							$path       = $this->getPathByBlog($categories[0]);
							$categories = explode('_', $path);
						} //count($categories) == 1
						foreach ($categories as $category) {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias_blog WHERE `query` = 'blog_id=" . (int) $category . "'");
							if ($query->num_rows) {
								$url .= '/' . $query->row['keyword'];
							} //$query->num_rows
						} //$categories as $category
						unset($data[$key]);
					} //$key == 'blog_id' && !$flag_record
					if ($flag_record && $key == 'blog_id') {
						unset($data[$key]);
					} //$flag_record && $key == 'blog_id'
					else {
						if ($url == '') {
							$sql   = "SELECT * FROM " . DB_PREFIX . "url_alias_blog WHERE `query` = '" . $this->db->escape($key . '=' . $value) . "'";
							$query = $this->db->query($sql);
							if ($query->num_rows) {
								$url .= '/' . $query->row['keyword'];
							} //$query->num_rows
						} //$url == ''
					}
				} //isset($data['route'])
			} //$data as $key => $value
			if ($url) {
				unset($data['route']);
				$query = '';
				if ($data) {
					foreach ($data as $key => $value) {
						$query .= '&' . $key . '=' . $value;
					} //$data as $key => $value
					if ($query) {
						$query = '?' . trim($query, '&');
					} //$query
				} //$data
				if (isset($this->blog_design['blog_devider']) && $this->blog_design['blog_devider'] == '1') {
					if (strpos($url, '.html') !== false) {
						$devider = "";
					} //strpos($url, '.html') !== false
					else {
						$devider = "/";
					}
				} //isset($this->blog_design['blog_devider']) && $this->blog_design['blog_devider'] == '1'
				else {
					$devider = "";
				}
				$link = $url_data['scheme'] . '://' . $url_data['host'] . (isset($url_data['port']) ? ':' . $url_data['port'] : '') . str_replace('/index.php', '', $url_data['path']) . $url . $devider . $query;
				return $link;
			} //$url
			else {
				return $link;
			}
		} //$this->config->get('config_seo_url')
		else {
			return $link;
		}
	}
	private function getPathByRecord($record_id)
	{
		if (utf8_strpos($record_id, '_') !== false) {
			$abid      = explode('_', $record_id);
			$record_id = $abid[count($abid) - 1];
		} //utf8_strpos($record_id, '_') !== false
		$record_id = (int) $record_id;
		if ($record_id < 1)
			return false;
		static $path = null;
		if (!is_array($path)) {
			$path        = $this->cache->get('record.seopath');
			$blog_design = $this->cache->get('record.blog_design');
			if (!is_array($path))
				$path = array();
		} //!is_array($path)
		if (!isset($path[$record_id]) || !isset($blog_design[$record_id])) {
			$sql              = "SELECT r2b.blog_id as blog_id,
			IF(r.blog_main=r2b.blog_id, 1, 0) as blog_main
			FROM " . DB_PREFIX . "record_to_blog r2b
			LEFT JOIN " . DB_PREFIX . "record r  ON (r.record_id = r2b.record_id)
			WHERE r2b.record_id = '" . (int)$record_id . "' ORDER BY blog_main DESC LIMIT 1";
			$query            = $this->db->query($sql);
			$path[$record_id] = $this->getPathByBlog($query->num_rows ? (int) $query->row['blog_id'] : 0);
			if (utf8_strpos($path[$record_id], '_') !== false) {
				$abid    = explode('_', $path[$record_id]);
				$blog_id = $abid[count($abid) - 1];
			} //utf8_strpos($path[$record_id], '_') !== false
			else {
				$blog_id = (int) $path[$record_id];
			}
			$blog_id = (int) $blog_id;
			$this->load->model('catalog/blog');
			$blog_info = $this->model_catalog_blog->getBlog($blog_id);
			if (isset($blog_info['design']) && $blog_info['design'] != '') {
				$this->blog_design = unserialize($blog_info['design']);
			} //isset($blog_info['design']) && $blog_info['design'] != ''
			else {
				$this->blog_design = Array();
			}
			if (isset($blog_info['design'])) {
				$blog_design[$record_id] = $blog_info['design'];
			} //isset($blog_info['design'])
			else {
				$blog_design[$record_id] = array();
			}
			$this->cache->set('record.blog_design', $blog_design);
			$this->cache->set('record.seopath', $path);
		} //!isset($path[$record_id]) || !isset($blog_design[$record_id])
		else {
			if (isset($blog_design[$record_id]) && is_string($blog_design[$record_id])) {
				$this->blog_design = unserialize($blog_design[$record_id]);
			} //isset($blog_design[$record_id]) && is_string($blog_design[$record_id])
			else {
				$this->blog_design = Array();
			}
		}
		if (isset($this->blog_design['blog_short_path']) && $this->blog_design['blog_short_path'] == 1)
			$path[$record_id] = '';
		return $path[$record_id];
	}
	private function getPathByBlog($blog_id)
	{
		if (utf8_strpos($blog_id, '_') !== false) {
			$abid    = explode('_', $blog_id);
			$blog_id = $abid[count($abid) - 1];
		} //utf8_strpos($blog_id, '_') !== false
		$blog_id = (int) $blog_id;
		if ($blog_id < 1)
			return false;
		static $path = null;
		$this->load->model('catalog/blog');
		$blog_info = $this->model_catalog_blog->getBlog($blog_id);
		if (isset($blog_info['design']) && $blog_info['design'] != '') {
			$this->blog_design = unserialize($blog_info['design']);
		} //isset($blog_info['design']) && $blog_info['design'] != ''
		else {
			$this->blog_design = Array();
		}
		if (!is_array($path)) {
			$path = $this->cache->get('blog.seopath');
			if (!is_array($path))
				$path = array();
		} //!is_array($path)
		if (!isset($path[$blog_id])) {
			$max_level = 10;
			$sql       = "SELECT CONCAT_WS('_'";
			for ($i = $max_level - 1; $i >= 0; --$i) {
				$sql .= ",t$i.blog_id";
			} //$i = $max_level - 1; $i >= 0; --$i
			$sql .= ") AS path FROM " . DB_PREFIX . "blog t0";
			for ($i = 1; $i < $max_level; ++$i) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "blog t$i ON (t$i.blog_id = t" . ($i - 1) . ".parent_id)";
			} //$i = 1; $i < $max_level; ++$i
			$sql .= " WHERE t0.blog_id = '" . (int)$blog_id . "'";
			$query          = $this->db->query($sql);
			$path[$blog_id] = $query->num_rows ? $query->row['path'] : false;
			$this->cache->set('blog.seopath', $path);
		} //!isset($path[$blog_id])
		return $path[$blog_id];
	}
	private function validate()
	{
		if (empty($this->request->get['route']) || $this->request->get['route'] == 'error/not_found') {
			return;
		} //empty($this->request->get['route']) || $this->request->get['route'] == 'error/not_found'
		if (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
			return;
		} //isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$url = str_replace('&amp;', '&', $this->config->get('config_ssl') . ltrim($this->request->server['REQUEST_URI'], '/'));
			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array(
				'route'
			)), 'SSL'));
		} //isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))
		else {
			$url = str_replace('&amp;', '&', $this->config->get('config_url') . ltrim($this->request->server['REQUEST_URI'], '/'));
			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array(
				'route'
			)), 'NONSSL'));
		}
		if (rawurldecode($url) != rawurldecode($seo)) {
			header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');
			$this->response->redirect($seo);
		} //rawurldecode($url) != rawurldecode($seo)
	}
	private function getQueryString($exclude = array())
	{
		if (!is_array($exclude)) {
			$exclude = array();
		} //!is_array($exclude)
		return urldecode(http_build_query(array_diff_key($this->request->get, array_flip($exclude))));
	}
}
?>