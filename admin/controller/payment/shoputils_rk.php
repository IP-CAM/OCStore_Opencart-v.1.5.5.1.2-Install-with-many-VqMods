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

class ControllerPaymentShoputilsRK extends Controller
{
    private $error = array();
    private $version = '2.2';
    const MAX_LAST_LOG_LINES = 500;
    const FILE_NAME_LOG = 'shoputils_rk.log';
    const FILE_NAME_LIC = 'shoputils_robokassa.lic';

    public function __construct($registry) {
        parent::__construct($registry);
        $this->language->load('payment/shoputils_rk');
        $this->document->setTitle($this->language->get('heading_title'));
    }

    public function index() {
        if (!file_exists(DIR_APPLICATION . self::FILE_NAME_LIC)) {
            $this->redirect($this->url->link('payment/shoputils_rk/lic', '&token=' . $this->session->data['token'], 'SSL'));
        }

        register_shutdown_function(array($this, 'licShutdownHandler'));
        $this->load->model('localisation/language');
        $this->load->model('localisation/order_status');
        $this->load->model('localisation/geo_zone');
        $this->load->model('shoputils/rk');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_shoputils_rk->setSetting();
            $this->redirect($this->model_shoputils_rk->makeUrl('extension/payment'));
        }

        $this->_setData(array(
                             'heading_title',
                             'button_save',
                             'button_cancel',
                             'button_clear',
                             'tab_general',
                             'tab_emails',
                             'tab_settings',
                             'tab_log',
                             'tab_information',
                             'text_confirm',
                             'text_enabled',
                             'text_disabled',
                             'text_all_zones',
                             'text_yes',
                             'text_no',
                             'text_info',
                             'entry_geo_zone',
                             'entry_status',
                             'entry_minimal_order',
                             'entry_maximal_order',
                             'entry_sort_order',
                             'entry_order_status',
                             'entry_order_confirm_status',
                             'entry_order_fail_status',
                             'entry_laterpay_mode',
                             'entry_order_later_status',
                             'entry_title',
                             'entry_instruction',

                             'entry_notify_customer_success',
                             'entry_mail_customer_success_subject',
                             'entry_mail_customer_success_content',
                             'entry_notify_customer_fail',
                             'entry_mail_customer_fail_subject',
                             'entry_mail_customer_fail_content',
                             'entry_notify_admin_success',
                             'entry_mail_admin_success_subject',
                             'entry_mail_admin_success_content',
                             'entry_notify_admin_fail',
                             'entry_mail_admin_fail_subject',
                             'entry_mail_admin_fail_content',

                             'entry_sign_type',
                             'entry_MerchantLogin',
                             'entry_MerchantPass1',
                             'entry_MerchantPass2',
                             'entry_test_mode',
                             'entry_lang',

                             'entry_log',
                             'entry_log_file',

                             'entry_callback_url',

                             'sample_mail_customer_success_content',
                             'sample_mail_customer_success_subject',
                             'sample_mail_customer_fail_subject',
                             'sample_mail_customer_fail_content',
                             'sample_mail_admin_success_subject',
                             'sample_mail_admin_success_content',
                             'sample_mail_admin_fail_subject',
                             'sample_mail_admin_fail_content',
                             'placeholder_instruction',
                             'help_minimal_order',
                             'help_maximal_order',
                             'help_order_confirm_status',
                             'help_order_status',
                             'help_order_fail_status',
                             'help_laterpay_mode',
                             'help_order_later_status',
                             'help_title',
                             'help_instruction',

                             'help_notify_customer_success',
                             'help_mail_customer_success_subject',
                             'help_mail_customer_success_content',
                             'help_notify_customer_fail',
                             'help_mail_customer_fail_subject',
                             'help_mail_customer_fail_content',
                             'help_notify_admin_success',
                             'help_mail_admin_success_subject',
                             'help_mail_admin_success_content',
                             'help_notify_admin_fail',
                             'help_mail_admin_fail_subject',
                             'help_mail_admin_fail_content',

                             'help_MerchantLogin',
                             'help_MerchantPass1',
                             'help_MerchantPass2',
                             'help_test_mode',
                             'help_lang',

                             'help_log_file'        => sprintf($this->language->get('help_log_file'), self::MAX_LAST_LOG_LINES),
                             'help_log'             => sprintf($this->language->get('help_log'), self::FILE_NAME_LOG),
                             'title_default'        => explode(',', $this->language->get('heading_title')),
                             'action'               => $this->model_shoputils_rk->makeUrl('payment/shoputils_rk'),
                             'cancel'               => $this->model_shoputils_rk->makeUrl('extension/payment'),
                             'clear_log'            => $this->model_shoputils_rk->makeUrl('payment/shoputils_rk/clearLog'),
                             'token'                => isset($this->session->data['token']) ? $this->session->data['token'] : '',
                             'text_copyright'       => sprintf($this->language->get('text_copyright'), $this->language->get('heading_title'), date('Y', time())),
                             'list_helper'          => $this->getListHelper(),
                             'error_warning'        => isset($this->error['warning']) ? $this->error['warning'] : '',
                             'error_mail_customer_success_subject' => isset($this->error['error_mail_customer_success_subject']) ? $this->error['error_mail_customer_success_subject'] : '',
                             'error_mail_customer_success_content' => isset($this->error['error_mail_customer_success_content']) ? $this->error['error_mail_customer_success_content'] : '',
                             'error_mail_customer_fail_subject'    => isset($this->error['error_mail_customer_fail_subject']) ? $this->error['error_mail_customer_fail_subject'] : '',
                             'error_mail_customer_fail_content'    => isset($this->error['error_mail_customer_fail_content']) ? $this->error['error_mail_customer_fail_content'] : '',
                             'error_mail_admin_success_subject'    => isset($this->error['error_mail_admin_success_subject']) ? $this->error['error_mail_admin_success_subject'] : '',
                             'error_mail_admin_success_content'    => isset($this->error['error_mail_admin_success_content']) ? $this->error['error_mail_admin_success_content'] : '',
                             'error_mail_admin_fail_subject'       => isset($this->error['error_mail_admin_fail_subject']) ? $this->error['error_mail_admin_fail_subject'] : '',
                             'error_mail_admin_fail_content'       => isset($this->error['error_mail_admin_fail_content']) ? $this->error['error_mail_admin_fail_content'] : '',
                             'error_MerchantPass1'  => isset($this->error['error_MerchantPass1']) ? $this->error['error_MerchantPass1'] : '',
                             'error_MerchantPass2'  => isset($this->error['error_MerchantPass2']) ? $this->error['error_MerchantPass2'] : '',
                             'error_MerchantLogin'  => isset($this->error['error_MerchantLogin']) ? $this->error['error_MerchantLogin'] : '',
                             'version'              => $this->version,
                             'log_lines'            => $this->readLastLines(DIR_LOGS . self::FILE_NAME_LOG, self::MAX_LAST_LOG_LINES),
                             'log_filename'         => self::FILE_NAME_LOG,
                             'geo_zones'            => $this->model_localisation_geo_zone->getGeoZones(),
                             'order_statuses'       => $this->model_localisation_order_status->getOrderStatuses(),
                             'oc_languages'         => $this->model_localisation_language->getLanguages()
                        ));

        $this->data['languages'] = array(
            '' => $this->language->get('text_lang_auto'),
            'ru' => $this->language->get('text_lang_ru'),
            'en' => $this->language->get('text_lang_en'),
        );

        $this->data['logs'] = array(
            '0' => $this->language->get('text_log_off'),
            '1' => $this->language->get('text_log_short'),
            '2' => $this->language->get('text_log_full'),
        );

        $this->data['test_modes'] = array(
            '0' => $this->language->get('text_disabled'),
            '1' => $this->language->get('text_enabled'),
        );

        $this->data['informations'] = array(
            $this->language->get('entry_password1')           => $this->language->get('entry_password1_text'),
            $this->language->get('entry_password2')           => $this->language->get('entry_password2_text'),
            $this->language->get('entry_result_url')          => HTTP_CATALOG . 'index.php?route=payment/shoputils_rk/callback',
            $this->language->get('entry_result_url_method')   => 'POST',
            $this->language->get('entry_success_url')         => HTTP_CATALOG . 'index.php?route=payment/shoputils_rk/success',
            $this->language->get('entry_success_url_method')  => 'POST',
            $this->language->get('entry_fail_url')            => HTTP_CATALOG . 'index.php?route=payment/shoputils_rk/fail',
            $this->language->get('entry_fail_url_method')     => 'POST',
        );

        if (isset($this->session->data['success'])) {
          $this->data['success'] = $this->session->data['success'];
          unset($this->session->data['success']);
        } else {
          $this->data['success'] = '';
        }

        if (isset($this->session->data['warning'])) {
          $this->data['error_warning'] = $this->session->data['warning'];
          unset($this->session->data['warning']);
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href' => $this->model_shoputils_rk->makeUrl('common/home'),
            'text' => $this->language->get('text_home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'href' => $this->model_shoputils_rk->makeUrl('extension/payment'),
            'text' => $this->language->get('text_payment'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'href' => $this->model_shoputils_rk->makeUrl('payment/shoputils_rk'),
            'text' => $this->language->get('heading_title'),
            'separator' => ' :: '

        );

        $this->_updateData(
            array(
                 'shoputils_rk_geo_zone_id',
                 'shoputils_rk_sort_order',
                 'shoputils_rk_status',
                 'shoputils_rk_minimal_order',
                 'shoputils_rk_maximal_order',
                 'shoputils_rk_laterpay_mode',
                 'shoputils_rk_order_status_id',
                 'shoputils_rk_order_fail_status_id',
                 'shoputils_rk_order_confirm_status_id',
                 'shoputils_rk_order_later_status_id',
                 'shoputils_rk_langdata',

                 'shoputils_rk_notify_customer_success',
                 'shoputils_rk_notify_customer_fail',
                 'shoputils_rk_notify_admin_success',
                 'shoputils_rk_mail_admin_success_subject',
                 'shoputils_rk_mail_admin_success_content',
                 'shoputils_rk_notify_admin_fail',
                 'shoputils_rk_mail_admin_fail_subject',
                 'shoputils_rk_mail_admin_fail_content',

                 'shoputils_rk_MerchantLogin',
                 'shoputils_rk_MerchantPass1',
                 'shoputils_rk_MerchantPass2',
                 'shoputils_rk_language',
                 'shoputils_rk_test_mode',

                 'shoputils_rk_log',
            )
        );
        
        $this->template = 'payment/shoputils_rk.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    public function lic() {
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'payment/shoputils_rk')) {
                $this->session->data['warning'] = sprintf($this->language->get('error_permission'), $this->language->get('heading_title'));
            } elseif (!empty($this->request->post['lic_data'])) {
                $perms = fileperms(DIR_APPLICATION);
                if (!is_writable(DIR_APPLICATION)) {
                    chmod(DIR_APPLICATION, 0755);
                }
                
                $lic = '------ LICENSE FILE DATA -------' . "\n";
                $lic .= trim($this->request->post['lic_data']) . "\n";
                $lic .= '--------------------------------' . "\n";
                $file = DIR_APPLICATION . self::FILE_NAME_LIC;
                $handle = @fopen($file, 'w'); 
                fwrite($handle, $lic);
                fclose($handle); 
                chmod(DIR_APPLICATION, $perms);

                if (!file_exists($file)) {
                    $this->session->data['warning'] = sprintf($this->language->get('error_dir_perm'), DIR_APPLICATION);
                    $this->redirect($this->url->link('payment/shoputils_rk/lic', '&token=' . $this->session->data['token'], 'SSL'));
                }

                register_shutdown_function(array($this, 'licShutdownHandler'));
                $this->load->model('shoputils/rk');

                $this->redirect($this->url->link('payment/shoputils_rk', '&token=' . $this->session->data['token'], 'SSL'));
            }
        }

        $domain = str_replace('http://', '', HTTP_SERVER);
        $domain = explode('/', str_replace('https://', '', $domain));
        $this->_setData(array(
            'heading_title',
            'button_save',
            'button_cancel',
            'entry_key',
            'error_loader',
            'error_key',
            'text_get_key'  => sprintf($this->language->get('text_get_key'), $domain[0]),
            'action'        => $this->url->link('payment/shoputils_rk/lic', '&token=' . $this->session->data['token'], 'SSL'),
            'cancel'        => $this->url->link('extension/payment', '&token=' . $this->session->data['token'], 'SSL'),
            'loader'        => extension_loaded('ionCube Loader')
        ));
        
        if (isset($this->session->data['warning'])) {
          $this->data['error_warning'] = $this->session->data['warning'];
          unset($this->session->data['warning']);
          if (file_exists(DIR_APPLICATION . self::FILE_NAME_LIC)) {
              @unlink(DIR_APPLICATION . self::FILE_NAME_LIC);
          }
        } else {
          $this->data['error_warning'] = '';
        }

        $this->template = 'shoputils/payment/shoputils_rk_lic.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());
    }

    public function clearLog() {
      $json = array();

      $this->load->model('shoputils/rk');
      if ($this->model_shoputils_rk->validatePermission()) {
          if (file_exists(DIR_LOGS . self::FILE_NAME_LOG)) {
              @unlink(DIR_LOGS . self::FILE_NAME_LOG);
          }
          $json['success'] = $this->language->get('text_clear_log_success');
      } else {
          $json['error'] = $this->language->get('error_clear_log');
      }

      $this->response->setOutput(json_encode($json));
    }

    protected function getListHelper() {
        $this->_setData(array(
                             'text_order_id_ft',
                             'text_store_name_ft',
                             'text_logo_ft',
                             'text_products_ft',
                             'text_total_ft',
                             'text_customer_firstname_ft',
                             'text_customer_lastname_ft',
                             'text_customer_group_ft',
                             'text_customer_email_ft',
                             'text_customer_telephone_ft',
                             'text_order_status_ft',
                             'text_comment_ft',
                             'text_ip_ft',
                             'text_date_added_ft',
                             'text_date_modified_ft'
                        ));

        $this->template = 'payment/shoputils_rk_list_helper.tpl';
        return $this->render();
    }

    protected function validate() {
        if (!$this->model_shoputils_rk->validatePermission()) {
            $this->error['warning'] = sprintf($this->language->get('error_permission'), $this->language->get('heading_title'));
        } else {
            if (!isset($this->request->post['shoputils_rk_MerchantLogin']) || !trim($this->request->post['shoputils_rk_MerchantLogin'])) {
                $this->error['warning'] = $this->error['error_MerchantLogin'] = sprintf($this->language->get('error_form'),
                                                                                        $this->language->get('entry_MerchantLogin'),
                                                                                        $this->language->get('tab_settings'));
            }
            if (!isset($this->request->post['shoputils_rk_MerchantPass1']) || !trim($this->request->post['shoputils_rk_MerchantPass1'])) {
                $this->error['warning'] = $this->error['error_MerchantPass1'] = sprintf($this->language->get('error_form'),
                                                                                        $this->language->get('entry_MerchantPass1'),
                                                                                        $this->language->get('tab_settings'));
            }
            if (!isset($this->request->post['shoputils_rk_MerchantPass2']) || !trim($this->request->post['shoputils_rk_MerchantPass2'])) {
                $this->error['warning'] = $this->error['error_MerchantPass2'] = sprintf($this->language->get('error_form'),
                                                                                        $this->language->get('entry_MerchantPass2'),
                                                                                        $this->language->get('tab_settings'));
            }

            $this->load->model('localisation/language');
            foreach ($this->model_localisation_language->getLanguages() as $language) {
              if (($this->request->post['shoputils_rk_notify_customer_success']) && ((!isset($this->request->post['shoputils_rk_langdata'][$language['language_id']]['mail_customer_success_subject']) || !trim($this->request->post['shoputils_rk_langdata'][$language['language_id']]['mail_customer_success_subject'])))) {
                  $this->error['warning'] = $this->error['error_mail_customer_success_subject'] = sprintf($this->language->get('error_form'),
                                                                                                          $this->language->get('entry_mail_customer_success_subject'),
                                                                                                          $this->language->get('tab_emails'));
              }
              if (($this->request->post['shoputils_rk_notify_customer_success']) && ((!isset($this->request->post['shoputils_rk_langdata'][$language['language_id']]['mail_customer_success_content']) || !$this->request->post['shoputils_rk_langdata'][$language['language_id']]['mail_customer_success_content']))) {
                  $this->error['warning'] = $this->error['error_mail_customer_success_content'] = sprintf($this->language->get('error_form'),
                                                                                                          $this->language->get('entry_mail_customer_success_content'),
                                                                                                          $this->language->get('tab_emails'));
              }
              if (($this->request->post['shoputils_rk_notify_customer_fail']) && ((!isset($this->request->post['shoputils_rk_langdata'][$language['language_id']]['mail_customer_fail_subject']) || !trim($this->request->post['shoputils_rk_langdata'][$language['language_id']]['mail_customer_fail_subject'])))) {
                  $this->error['warning'] = $this->error['error_mail_customer_fail_subject'] = sprintf($this->language->get('error_form'),
                                                                                                          $this->language->get('entry_mail_customer_fail_subject'),
                                                                                                          $this->language->get('tab_emails'));
              }
              if (($this->request->post['shoputils_rk_notify_customer_fail']) && ((!isset($this->request->post['shoputils_rk_langdata'][$language['language_id']]['mail_customer_fail_content']) || !$this->request->post['shoputils_rk_langdata'][$language['language_id']]['mail_customer_fail_content']))) {
                  $this->error['warning'] = $this->error['error_mail_customer_fail_content'] = sprintf($this->language->get('error_form'),
                                                                                                          $this->language->get('entry_mail_customer_fail_content'),
                                                                                                          $this->language->get('tab_emails'));
              }
            }

            if (($this->request->post['shoputils_rk_notify_admin_success']) && ((!isset($this->request->post['shoputils_rk_mail_admin_success_subject']) || !trim($this->request->post['shoputils_rk_mail_admin_success_subject'])))) {
                $this->error['warning'] = $this->error['error_mail_admin_success_subject'] = sprintf($this->language->get('error_form'),
                                                                                                          $this->language->get('entry_mail_admin_success_subject'),
                                                                                                          $this->language->get('tab_emails'));
            }
            if (($this->request->post['shoputils_rk_notify_admin_success']) && ((!isset($this->request->post['shoputils_rk_mail_admin_success_content']) || !$this->request->post['shoputils_rk_mail_admin_success_content']))) {
                $this->error['warning'] = $this->error['error_mail_admin_success_content'] = sprintf($this->language->get('error_form'),
                                                                                                          $this->language->get('entry_mail_admin_success_content'),
                                                                                                          $this->language->get('tab_emails'));
            }
            if (($this->request->post['shoputils_rk_notify_admin_fail']) && ((!isset($this->request->post['shoputils_rk_mail_admin_fail_subject']) || !trim($this->request->post['shoputils_rk_mail_admin_fail_subject'])))) {
                $this->error['warning'] = $this->error['error_mail_admin_fail_subject'] = sprintf($this->language->get('error_form'),
                                                                                                          $this->language->get('entry_mail_admin_fail_subject'),
                                                                                                          $this->language->get('tab_emails'));
            }
            if (($this->request->post['shoputils_rk_notify_admin_fail']) && ((!isset($this->request->post['shoputils_rk_mail_admin_fail_content']) || !$this->request->post['shoputils_rk_mail_admin_fail_content']))) {
                $this->error['warning'] = $this->error['error_mail_admin_fail_content'] = sprintf($this->language->get('error_form'),
                                                                                                          $this->language->get('entry_mail_admin_fail_content'),
                                                                                                          $this->language->get('tab_emails'));
            }
        }

        return !$this->error;
    }

    protected function _setData($values) {
        foreach ($values as $key => $value) {
            if (is_int($key)) {
                $this->data[$value] = $this->language->get($value);
            } else {
                $this->data[$key] = $value;
            }
        }
    }

    protected function _updateData($keys, $info = array()) {
        foreach ($keys as $key) {
            if (isset($this->request->post[$key])) {
                $this->data[$key] = $this->request->post[$key];
            } elseif ($this->config->get($key)) {
                $this->data[$key] = $this->config->get($key);
            } elseif (isset($info[$key])) {
                $this->data[$key] = $info[$key];
            } else {
                $this->data[$key] = null;
            }
        }
    }

    function licShutdownHandler() {
        if (@is_array($e = @error_get_last())) {
            $code = isset($e['type']) ? $e['type'] : 0;
            $msg = isset($e['message']) ? $e['message'] : '';
            if(($code > 0) && strpos($msg, 'requires a license file')) {
                $this->session->data['warning'] = $this->language->get('error_key');
                $this->redirect($this->url->link('payment/shoputils_rk/lic', '&token=' . $this->session->data['token'], 'SSL'));
            }
        }
    }

    protected function readLastLines($filename, $lines) {
        if (!is_file($filename)) {
            return array();
        }
        $handle = @fopen($filename, "r");
        if (!$handle) {
            return array();
        }
        $linecounter = $lines;
        $pos = -1;
        $beginning = false;
        $text = array();

        while ($linecounter > 0) {
            $t = " ";

            while ($t != "\n") {
                /* if fseek() returns -1 we need to break the cycle*/
                if (fseek($handle, $pos, SEEK_END) == -1) {
                    $beginning = true;
                    break;
                }
                $t = fgetc($handle);
                $pos--;
            }

            $linecounter--;

            if ($beginning) {
                rewind($handle);
            }

            $text[$lines - $linecounter - 1] = fgets($handle);

            if ($beginning) {
                break;
            }
        }
        fclose($handle);

        return array_reverse($text);
    }
}
?>