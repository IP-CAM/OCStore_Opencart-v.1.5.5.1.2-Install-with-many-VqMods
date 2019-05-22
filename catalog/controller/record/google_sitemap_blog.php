<?php
class ControllerRecordGoogleSitemapBlog extends Controller
{
	public function index()
	{
		if ($this->config->get('google_sitemap_status')) {
			$output = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
			$this->load->model('catalog/product');
			$output .= '<url>';
			$output .= '<loc>' . $this->config->get('config_url') . '</loc>';
			$output .= '<changefreq>always</changefreq>';
			$output .= '<priority>1.0</priority>';
			$output .= '</url>';
			$product_cache = $this->cache->get('blog.sitemap.products');
			if (!isset($product_cache)) {
				$product_output = '';
				$products       = $this->model_catalog_product->getProducts();
				foreach ($products as $product) {
					$product_output .= '<url>';
					$product_output .= '<loc>' . str_replace('&', '&amp;', str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $product['product_id']))) . '</loc>';
					$product_output .= '<lastmod>' . substr(max($product['date_added'], $product['date_modified']), 0, 10) . '</lastmod>';
					$product_output .= '<changefreq>weekly</changefreq>';
					$product_output .= '<priority>1.0</priority>';
					$product_output .= '</url>';
				} //$products as $product
				$this->cache->set('blog.sitemap.products', $product_output);
				$output .= $product_output;
			} //!isset($product_cache)
			else {
				$output .= $product_cache;
			}
			$this->load->model('catalog/category');
			$categories_cache = $this->cache->get('blog.sitemap.categories');
			if (!isset($categories_cache)) {
				$categories_output = $this->getCategories(0);
				$this->cache->set('blog.sitemap.categories', $categories_output);
				$output .= $categories_output;
			} //!isset($categories_cache)
			else {
				$output .= $categories_cache;
			}
			$this->load->model('catalog/manufacturer');
			$manufacturer_cache = $this->cache->get('blog.sitemap.manufacturer');
			if (!isset($manufacturer_cache)) {
				$manufacturers_output = '';
				$manufacturers        = $this->model_catalog_manufacturer->getManufacturers();
				foreach ($manufacturers as $manufacturer) {
					$manufacturers_output .= '<url>';
					$manufacturers_output .= '<loc>' . str_replace('&', '&amp;', str_replace('&amp;', '&', $this->url->link('product/manufacturer/product', 'manufacturer_id=' . $manufacturer['manufacturer_id']))) . '</loc>';
					$manufacturers_output .= '<changefreq>weekly</changefreq>';
					$manufacturers_output .= '<priority>0.7</priority>';
					$manufacturers_output .= '</url>';
				} //$manufacturers as $manufacturer
				$this->cache->set('blog.sitemap.manufacturer', $manufacturers_output);
				$output .= $manufacturers_output;
			} //!isset($manufacturer_cache)
			else {
				$output .= $manufacturer_cache;
			}
			$this->load->model('catalog/information');
			$information_cache = $this->cache->get('blog.sitemap.information');
			if (!isset($information_cache)) {
				$information_output = '';
				$informations       = $this->model_catalog_information->getInformations();
				foreach ($informations as $information) {
					$information_output .= '<url>';
					$information_output .= '<loc>' . str_replace('&', '&amp;', str_replace('&amp;', '&', $this->url->link('information/information', 'information_id=' . $information['information_id']))) . '</loc>';
					$information_output .= '<changefreq>weekly</changefreq>';
					$information_output .= '<priority>0.5</priority>';
					$information_output .= '</url>';
				} //$informations as $information
				$this->cache->set('blog.sitemap.information', $information_output);
				$output .= $information_output;
			} //!isset($information_cache)
			else {
				$output .= $information_cache;
			}
			$this->load->model('catalog/record');
			$records_cache = $this->cache->get('blog.sitemap.records');
			if (!isset($records_cache)) {
				$records_output = '';
				$this->getChild('common/seoblog');
				$records = $this->model_catalog_record->getRecords();
				if ($records) {
					foreach ($records as $record) {
						$records_output .= '<url>';
						$records_output .= '<loc>' . str_replace('&', '&amp;', str_replace('&amp;', '&', $this->url->link('record/record', 'record_id=' . $record['record_id']))) . '</loc>';
						$records_output .= '<lastmod>' . substr(max($record['date_available'], $record['date_modified']), 0, 10) . '</lastmod>';
						$records_output .= '<changefreq>weekly</changefreq>';
						$records_output .= '<priority>1.0</priority>';
						$records_output .= '</url>';
					} //$records as $record
				} //$records
				$this->cache->set('blog.sitemap.records', $records_output);
				$output .= $records_output;
			} //!isset($records_cache)
			else {
				$output .= $records_cache;
			}
			$this->load->model('catalog/blog');
			$blogies_cache = $this->cache->get('blog.sitemap.blogies');
			if (!isset($blogies_cache)) {
				$blogies_output = $this->getBlogies(0);
				$this->cache->set('blog.sitemap.blogies', $blogies_output);
				$output .= $blogies_output;
			} //!isset($blogies_cache)
			else {
				$output .= $blogies_cache;
			}
			$output .= '</urlset>';
			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		} //$this->config->get('google_sitemap_status')
	}
	protected function getCategories($parent_id, $current_path = '')
	{
		$output  = '';
		$results = $this->model_catalog_category->getCategories($parent_id);
		if ($results) {
			foreach ($results as $result) {
				if (!$current_path) {
					$new_path = $result['category_id'];
				} //!$current_path
				else {
					$new_path = $current_path . '_' . $result['category_id'];
				}
				$output .= '<url>';
				$output .= '<loc>' . str_replace('&', '&amp;', str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $new_path))) . '</loc>';
				$output .= '<lastmod>' . substr(max($result['date_added'], $result['date_modified']), 0, 10) . '</lastmod>';
				$output .= '<changefreq>weekly</changefreq>';
				$output .= '<priority>0.7</priority>';
				$output .= '</url>';
				$output .= $this->getCategories($result['category_id'], $new_path);
			} //$results as $result
		} //$results
		return $output;
	}
	protected function getBlogies($parent_id, $current_path = '')
	{
		$output  = '';
		$results = $this->model_catalog_blog->getBlogies($parent_id);
		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['blog_id'];
			} //!$current_path
			else {
				$new_path = $current_path . '_' . $result['blog_id'];
			}
			$output .= '<url>';
			$output .= '<loc>' . str_replace('&', '&amp;', str_replace('&amp;', '&', $this->url->link('record/blog', 'blog_id=' . $new_path))) . '</loc>';
			$output .= '<lastmod>' . substr(max($result['date_added'], $result['date_modified']), 0, 10) . '</lastmod>';
			$output .= '<changefreq>weekly</changefreq>';
			$output .= '<priority>0.7</priority>';
			$output .= '</url>';
			$output .= $this->getBlogies($result['blog_id'], $new_path);
		} //$results as $result
		return $output;
	}
}
?>