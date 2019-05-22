<?php
class ControllerModuleManBlock extends Controller {
    protected function index($setting) {
        $this->language->load('module/man_block');
        
        $this->data['heading_title'] = $this->language->get('heading_title');
        
        $this->load->model('catalog/manufacturer');
        
        $this->load->model('tool/image');
        

        $this->data['manufacturers'] = array();
                                    
        $results = $this->model_catalog_manufacturer->getManufacturers();
        
        $count = 0;
    
        foreach ($results as $result) {
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
            } else {
                continue;
            }
                        
            $this->data['manufacturers'][] = array(
                'name'  => $result['name'],
                'thumb' => $image,
                'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
            );
            
            $count++;
            if ($count >= $setting['limit']) {
                break;
            }
        }
        
        $this->document->addStyle('catalog/view/theme/default/stylesheet/man_block.css');
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/man_block.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/man_block.tpl';
        } else {
            $this->template = 'default/template/module/man_block.tpl';
        }

        $this->render();
    }
}
?>