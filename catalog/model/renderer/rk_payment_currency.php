<?php
/*
 * Shoputils
 *
 * ПРИМЕЧАНИЕ К ЛИЦЕНЗИОННОМУ СОГЛАШЕНИЮ
 *
 * Этот файл связан лицензионным соглашением, которое можно найти в архиве,
 * вместе с этим файлом. Файл лицензии называется: LICENSE.1.5.x.RUS.txt
 * Так же лицензионное соглашение можно найти по адресу:
 * http://opencart.shoputils.ru/LICENSE.1.5.x.RUS.txt
 * 
 * =================================================================
 * OPENCART 1.5.x ПРИМЕЧАНИЕ ПО ИСПОЛЬЗОВАНИЮ
 * =================================================================
 *  Этот файл предназначен для Opencart 1.5.x. Shoputils не
 *  гарантирует правильную работу этого расширения на любой другой 
 *  версии Opencart, кроме Opencart 1.5.x. 
 *  Shoputils не поддерживает программное обеспечение для других 
 *  версий Opencart.
 * =================================================================
*/
class ModelRendererRkPaymentCurrency extends Model {

    public function makePaymentCurrency(array $data, $id = 'default'){
        $this->load->language('renderer/rk_payment_currency');
        $array_payment_currency = $this->language->get('array_payment_currency');

        $result = array();
        foreach ($data as $key => $values){
            $currencies = array();
            foreach ($values as $currency_key => $value){
                if (!empty($array_payment_currency[$currency_key])) {
                    $currency = $array_payment_currency[$currency_key];
                    $image = '';
                    $image_width = 0;
                    $image_height = 0;
                    $index =  !empty($value['image_index']) ? (int)$value['image_index'] : 0;
                    while ($index !== ''){
                        if ($index === 0) {
                            $index = '';
                            $image_index = '';
                        } else {
                            $image_index = '.' . $index;
                        }
                        $image = $this->config->get('config_template') . '/image/payment/shoputils_rk/' . $currency_key . $image_index . '.png';
                        $image_file = DIR_TEMPLATE . $image;
                        if (!is_file($image_file)){
                            $image = 'default/image/payment/shoputils_rk/' . $currency_key . $image_index . '.png';
                            $image_file = DIR_TEMPLATE . $image;
                        }
                        if (is_file($image_file)){
                            $info = getimagesize($image_file);
                            $image_width = (int)$info[0];
                            $image_height = (int)$info[1];

                        }
                        if ($index !== '') {
                            $index--;
                        }
                    }
                    if ($image){
                        $currencies[$currency_key] = array(
                            'name' => htmlspecialchars(!empty($value['name']) ? $value['name'] : $currency['name'], ENT_QUOTES, 'UTF-8'),
                            'url' => !empty($value['url']) ? $value['url'] : $currency['url'],
                            'image' => HTTPS_SERVER . 'catalog/view/theme/' . $image,
                            'image_width' => $image_width,
                            'image_height' => $image_height,
                        );
                    }
                }
            }
            if ($currencies){
                $result[$key] = array(
                    'expand' => isset($values['expand']) ? $values['expand'] : false,
                    'name' => htmlspecialchars(isset($values['name']) ? $values['name'] : '', ENT_QUOTES, 'UTF-8'),
                    'currencies' => $currencies
                );
            }
        }

        $template = new Template();
        $template->data['payment_currencies'] = $result;
        $template->data['id'] = $id;
        if (is_file(DIR_TEMPLATE . $this->config->get('config_template') . '/template/renderer/rk_payment_currency.tpl')) {
            return $template->fetch($this->config->get('config_template') . '/template/renderer/rk_payment_currency.tpl');
        } else {
            return $template->fetch('default/template/renderer/rk_payment_currency.tpl');
        }

    }
}
?>