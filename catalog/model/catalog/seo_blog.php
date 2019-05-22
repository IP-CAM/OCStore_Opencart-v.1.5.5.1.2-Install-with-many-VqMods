<?php
class ModelCatalogSeoBlog extends Controller
{
	public function index()
	{
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		} //$this->config->get('config_seo_url')
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);
			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");
				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);
					if ($url[0] == 'record_id') {
						$this->request->get['record_id'] = $url[1];
					} //$url[0] == 'record_id'
					if ($url[0] == 'blog_id') {
						if (!isset($this->request->get['blog_id'])) {
							$this->request->get['blog_id'] = $url[1];
						} //!isset($this->request->get['blog_id'])
						else {
							$this->request->get['blog_id'] .= '_' . $url[1];
						}
					} //$url[0] == 'blog_id'
				} //$query->num_rows
				else {
					$this->request->get['route'] = 'error/not_found';
				}
			} //$parts as $part
			if (isset($this->request->get['record_id'])) {
				$this->request->get['route'] = 'record/record';
			} //isset($this->request->get['record_id'])
			elseif (isset($this->request->get['blog_id'])) {
				$this->request->get['route'] = 'record/blog';
			} //isset($this->request->get['blog_id'])
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			} //isset($this->request->get['route'])
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
				foreach ($data as $key => $value) {
					if (isset($data['route'])) {
						if (($data['route'] == 'record/record' && $key == 'record_id')) {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int) $value) . "'");
							if ($query->num_rows) {
								$url .= '/' . $query->row['keyword'];
								unset($data[$key]);
							} //$query->num_rows
						} //($data['route'] == 'record/record' && $key == 'record_id')
						elseif ($key == 'blog_id') {
							$categories = explode('_', $value);
							foreach ($categories as $category) {
								$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'blog_id=" . (int) $category . "'");
								if ($query->num_rows) {
									$url .= '/' . $query->row['keyword'];
								} //$query->num_rows
							} //$categories as $category
							unset($data[$key]);
						} //$key == 'blog_id'
					} //isset($data['route'])
				} //$data as $key => $value
			} //isset($url_data['query'])
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
				return $url_data['scheme'] . '://' . $url_data['host'] . (isset($url_data['port']) ? ':' . $url_data['port'] : '') . str_replace('/index.php', '', $url_data['path']) . $url . $query;
			} //$url
			else {
				return $link;
			}
		} //$this->config->get('config_seo_url')
		else {
			return $link;
		}
	}
}
?>