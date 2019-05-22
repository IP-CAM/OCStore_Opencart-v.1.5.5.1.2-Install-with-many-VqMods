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

class ControllerPaymentShoputilsRK extends Controller {
    private $order;
    private $log;
    private $shoputils = 0;
    private $version;
    private static $LOG_OFF = 0;
    private static $LOG_SHORT = 1;
    private static $LOG_FULL = 2;
    private static $valid_currencies = array(
        'RUB', 'RUR'
    );

    public function __construct($registry) {
        parent::__construct($registry);
        $this->language->load('payment/shoputils_rk');
    }

    protected function index() {
        $langdata = $this->config->get('shoputils_rk_langdata');
        $this->_setData(
            array(
                 'button_confirm',
                 'instruction'  => nl2br($langdata[$this->config->get('config_language_id')]['instruction']),
                 'continue'     => $this->url->link('checkout/success', '', 'SSL'),
                 'pay_status'   => ((!$this->config->get('shoputils_rk_laterpay_mode')) || ($this->config->get('shoputils_rk_order_later_status_id') == $this->config->get('shoputils_rk_order_confirm_status_id'))),
                 'action'       => $this->getUrl(),
                 'parameters'   => $this->makeForm()
            )
        );

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/shoputils_rk.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/payment/shoputils_rk.tpl';
        } else {
            $this->template = 'default/template/payment/shoputils_rk.tpl';
        }

        $this->render();
    }

    public function laterpay() {
        if ($this->validateLaterpay()) {
        $this->_setData(
            array(
                 'action'     => $this->getUrl(),
                 'parameters' => $this->makeForm($this->request->get['order_id'])
            )
        );

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/shoputils_rk_laterpay.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/payment/shoputils_rk_laterpay.tpl';
        } else {
            $this->template = 'default/template/payment/shoputils_rk_laterpay.tpl';
        }

        $this->response->setOutput($this->render());
        } else {
            $this->logWrite('Fail Validate Laterpay:', self::$LOG_FULL);
            $this->logWrite('  POST:' . var_export($this->request->post, true), self::$LOG_FULL);
            $this->logWrite('  GET:' . var_export($this->request->get, true), self::$LOG_FULL);
            $this->redirect($this->url->link('common/home', '', 'SSL'));
        }
    }

    public function callback() {
        $this->logWrite('CallbackURL: ', self::$LOG_SHORT);
        $this->logWrite('  POST:' . var_export($this->request->post, true), self::$LOG_SHORT);
        $this->logWrite('  GET:' . var_export($this->request->get, true), self::$LOG_SHORT);

        if (!$this->validate()) {
            return;
        }

        if ($this->order['order_status_id'] != $this->config->get('shoputils_rk_order_status_id')){
            $payment_method = isset($this->request->post['PaymentMethod']) ? $this->request->post['PaymentMethod'] : 'Test';
            if ($this->order['order_status_id']){
                //Reverse $this->config->get('shoputils_rk_notify_customer_success')
                $notify = !$this->config->get('shoputils_rk_notify_customer_success');
                $this->model_checkout_order->update($this->order['order_id'],
                                                     $this->config->get('shoputils_rk_order_status_id'),
                                                     'PaymentMethod: ' . $payment_method,
                                                      $notify);
                if (!$notify) {
                    $langdata = $this->config->get('shoputils_rk_langdata');
                    $langdata = $langdata[(int)$this->config->get('config_language_id')];
                    $this->sendMail($langdata['mail_customer_success_subject'],
                                    $langdata['mail_customer_success_content'],
                                    $this->config->get('shoputils_rk_order_status_id'),
                                    'customer',
                                    'Mail to Customer Sent Successfully: Payment Success');
                }

                if ($this->config->get('shoputils_rk_notify_admin_success')) {
                    $this->sendMail($this->config->get('shoputils_rk_mail_admin_success_subject'),
                                    $this->config->get('shoputils_rk_mail_admin_success_content'),
                                    $this->config->get('shoputils_rk_order_status_id'),
                                    'admin',
                                    'Mail to Admin Sent Successfully: Payment Success');
                }
            }

            $this->sendOk();
        }
    }

    public function success() {
        $this->logWrite('SuccessURL', self::$LOG_SHORT);
        $this->logWrite('  POST:' . var_export($this->request->post, true), self::$LOG_SHORT);
        $this->logWrite('  GET:' . var_export($this->request->get, true), self::$LOG_SHORT);

        if ($this->validate(false)) {
          if (!isset($this->session->data['order_id'])) {
            $this->session->data['order_id'] = $this->order['order_id']; //Добавляем в сессию номер заказа на случай, если в checkout/success на экран пользователю выводится номер заказа
          }
            $this->redirect($this->url->link('checkout/success', '', 'SSL'));
        } else {
            $this->redirect($this->url->link('common/home', '', 'SSL'));
        }
    }

    public function fail() {
        $this->logWrite('FailURL', self::$LOG_SHORT);
        $this->logWrite('  POST:' . var_export($this->request->post, true), self::$LOG_SHORT);
        $this->logWrite('  GET:' . var_export($this->request->get, true), self::$LOG_SHORT);

        if ($this->validate(false)) {
            if ($this->order['order_status_id']) {
                //Reverse $this->config->get('shoputils_rk_notify_customer_fail')
                $notify = !$this->config->get('shoputils_rk_notify_customer_fail');

                $this->model_checkout_order->update($this->order['order_id'],
                                                    $this->config->get('shoputils_rk_order_fail_status_id'),
                                                    'Robokassa - Payment Fail, Order ID: ' . $this->request->post['InvId'],
                                                    $notify);

              if (!$notify) {
                  $langdata = $this->config->get('shoputils_rk_langdata');
                  $langdata = $langdata[(int)$this->config->get('config_language_id')];
                  $this->sendMail($langdata['mail_customer_fail_subject'],
                                  $langdata['mail_customer_fail_content'],
                                  $this->config->get('shoputils_rk_order_fail_status_id'),
                                  'customer',
                                  'Mail to Customer Sent Successfully: Payment Fail');
              }

              if ($this->config->get('shoputils_rk_notify_admin_fail')) {
                  $this->sendMail($this->config->get('shoputils_rk_mail_admin_fail_subject'),
                                       $this->config->get('shoputils_rk_mail_admin_fail_content'),
                                       $this->config->get('shoputils_rk_order_fail_status_id'),
                                       'admin',
                                       'Mail to Admin Sent Successfully: Payment Fail');
              }
            }
        }

        $this->redirect($this->url->link('common/home', '', 'SSL'));
        //$this->redirect($this->url->link('checkout/checkout', '', 'SSL'));
        return true;
    }

    public function rk() {
        $oc = VERSION;
        if (file_exists(DIR_SYSTEM . 'config/svn/svn.ver')) {
          $oc .= '.r' . trim(file_get_contents(DIR_SYSTEM . 'config/svn/svn.ver'));
        }
        echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>';
        echo sprintf('%s - %s v%s<br />', $oc, $this->shoputils, $this->config->get('shoputils_rk_version'));
        //info
        if ((isset($this->request->get['info'])) && (md5($this->request->get['info']) == 'caf9b6b99962bf5c2264824231d7a40c')) {
          $this->load->model('setting/setting');
          $rk = $this->model_setting_setting->getSetting('shoputils_rk');
          $disallowed = array(
              'shoputils_rk_MerchantLogin',
              'shoputils_rk_MerchantPass1',
              'shoputils_rk_MerchantPass2'
          );
          foreach ($rk as $key => $value) {
            if (!in_array($key, $disallowed)) {
              if (is_array($value)) {
              echo sprintf('%s:<br />', $key);
                foreach ($value as $k => $val) {
                  if (is_array($val)) {
                    echo sprintf('............%s:<br />', $k);
                    foreach ($val as $k2 => $v) {
                      if (is_array($v)) {
                        echo sprintf('........................%s:<br />', $k2);
                        foreach ($v as $k3 => $v2) {
                          echo sprintf('........................%s: %s<br /><br />', $k3, $v2);
                        }
                      } else{
                        echo sprintf('....................................%s: %s<br /><br />', $k2, $v);
                      }
                    }                
                  } else {
                    echo sprintf('............%s: %s<br /><br />', $k, $val);
                  }
                }
              } else {
                echo sprintf('%s: %s<br /><br />', $key, $value);
              }
            }
          }
        }
    }

    public function confirm() {
        if (!empty($this->session->data['order_id'])) {
            $this->load->model('checkout/order');
            $this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('shoputils_rk_order_confirm_status_id'));
        }
    }

    protected function makeForm($order_id = false) {
        $this->load->model('checkout/order');
        if (!$order_id ) {
          if (isset($this->session->data['order_id'])) {
            $order_id  = $this->session->data['order_id'];
          } else {
            $this->logWrite('Error: Unsupported Checkout Extension', self::$LOG_SHORT);
            die($this->language->get('error_fail_checkout_extension'));
          }
        }
        $order_info = $this->model_checkout_order->getOrder($order_id);

        $found = false;
        foreach (self::$valid_currencies as $code) {
            if ($this->currency->has($code)) {
                $sCurrencyCode = $code;
                $found = true;
                break;
            }
        }

        if (!$found) {
            die(sprintf('Currency code (%s) not found', implode(', ', self::$valid_currencies)));
        }

        $sAmount = number_format($this->currency->convert($order_info['total'], $this->config->get('config_currency'), $sCurrencyCode), 2, '.', '');
        $sPaymentId = $order_info['order_id'];
        $sEmail = $order_info['email'];

        $params = array(
            'MrchLogin' => $this->config->get('shoputils_rk_MerchantLogin'),
            'OutSum' => $sAmount,
            'InvId' => $sPaymentId,
        );
        $params['SignatureValue'] = md5(implode(':', array_values($params)) . ':' . $this->config->get('shoputils_rk_MerchantPass1'));

        $params['Desc'] = sprintf($this->language->get('text_order_description'), $sPaymentId, $sAmount, $sCurrencyCode);
        $params['Email'] = $sEmail;
        $params['Culture'] = $this->config->get('shoputils_rk_language');
        $params['sEncoding'] = 'UTF-8';

        $this->logWrite('Make payment form: ', self::$LOG_FULL);
        $this->logWrite('  DATA: ' . var_export($params, true), self::$LOG_FULL);

        return $params;
    }

    protected function validateLaterpay() {
        if ((!isset($this->request->get['order_id'])) || (!isset($this->request->get['order_tt'])) || (!isset($this->request->get['order_fl']))) {
          return false;
        } else {
          $this->load->model('checkout/order');
          $order_info = $this->model_checkout_order->getOrder($this->request->get['order_id']);
          if ((!$order_info) || ($this->request->get['order_id'] != $order_info['order_id']) || ($this->request->get['order_tt'] != $order_info['total']) || ($this->request->get['order_fl']) != $order_info['firstname'] . $order_info['lastname']) {
            return false;
          }
        }
        return true;
    }

    protected function validate($check_sign_hash = true) {
        $this->load->model('checkout/order');

        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            //Система будет работать как с POST так и с GET данными
            array_merge($this->request->post, $this->request->get);
        }

        if ($check_sign_hash) {
            $signature = $this->calculateHash();

            if ($this->request->post['SignatureValue'] != $signature) {
                $this->sendForbidden(sprintf('Wrong signature: %s', $signature));
                return false;
            }
        }

        $this->order = $this->model_checkout_order->getOrder($this->request->post['InvId']);

        if (!$this->order) {
            $this->sendForbidden(sprintf('Order ID: %s', $this->request->post['InvId']));
            return false;
        }

        return true;
    }

    protected function calculateHash() {
        if (isset($this->request->post['OutSum']) &&
            isset($this->request->post['InvId'])
        ){
            return strtoupper(md5($this->request->post['OutSum'].':'.$this->request->post['InvId'].':'.$this->config->get('shoputils_rk_MerchantPass2')));
        } else {
            return '';
        }
    }

    protected function sendForbidden($error) {
        $this->logWrite('ERROR: ' . $error, self::$LOG_SHORT);
        header('HTTP/1.1 403 Forbidden');
        echo 'Error: ' . $error;
    }

    protected function sendOk() {
        $this->logWrite('OK: ' . http_build_query($this->request->post, '', ','), self::$LOG_SHORT);
        header('HTTP/1.1 200 OK');
        echo "OK".$this->order['order_id'];
    }

    //type = 'admin' - mail send to admin; type = 'customer' - mail send to customer
    protected function sendMail($subject, $content, $order_status_id, $type = 'admin', $log_result = '') {
				$this->load->model('payment/shoputils_rk');

				$order_info = $this->model_payment_shoputils_rk->getOrder($this->order['order_id']);

				$input = array(
            '{order_id}',
				    '{store_name}',
						'{logo}',
						'{products}',
						'{total}',
						'{customer_firstname}',
						'{customer_lastname}',
						'{customer_group}',
						'{customer_email}',
						'{customer_telephone}',
						'{order_status}',
						'{comment}',
						'{ip}',
						'{date_added}',
						'{date_modified}'
			  );

				$output = array(
            'order_id'            => $order_info['order_id'],
				    'store_name'          => $this->config->get('config_name'),
				    'logo'                => '<a href="' . HTTP_SERVER . '"><img src="' . HTTP_SERVER . 'image/' . $this->config->get('config_logo') . '" / ></a>',
						'products'            => $this->model_payment_shoputils_rk->getProducts($order_info['order_id']),
						'total'               => $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value']),
						'customer_firstname'  => $order_info['payment_firstname'],
						'customer_lastname'   => $order_info['payment_lastname'],
						'customer_group'      => $this->model_payment_shoputils_rk->getCustomerGroup($order_info['customer_group_id']),
						'customer_email'      => $order_info['email'],
						'customer_telephone'  => $order_info['telephone'],
						'order_status'        => $this->model_payment_shoputils_rk->getOrderStatusById($order_status_id, $order_info['language_id']),
						'comment'             => $order_info['comment'],
						'ip'                  => $order_info['ip'],
						'date_added'          => $order_info['date_added'],
						'date_modified'       => $order_info['date_modified']
			  );

		    $subject = html_entity_decode(trim(str_replace($input, $output, $subject)), ENT_QUOTES, 'UTF-8');
		    $content = html_entity_decode(str_replace($input, $output, $content), ENT_QUOTES, 'UTF-8');
		    $to = $type == 'admin' ? $this->config->get('config_email') : $order_info['email'];
		    $this->_sendMail($subject, $content, $type, $to);
		    $this->logWrite($log_result, self::$LOG_FULL);
    }

    protected function _sendMail($subject, $content, $type, $to) {
				$message  = '<html dir="ltr" lang="en">' . "\n";
				$message .= '  <head>' . "\n";
				$message .= '    <title>' . $subject . '</title>' . "\n";
				$message .= '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
				$message .= '  </head>' . "\n";
				$message .= '  <body>' . $content . '</body>' . "\n";
				$message .= '</html>' . "\n";

				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
				$mail->setTo($to);
        $mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject($subject);
				$mail->setHtml($message);
				$mail->send();

				if ($type == 'admin') {
          $emails = explode(',', $this->config->get('config_alert_emails'));
          foreach ($emails as $email) {
            if ($email && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
              $mail->setTo($email);
              $mail->send();
            }
          }
				}
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

    protected function logWrite($message, $type) {
        switch ($this->config->get('shoputils_rk_log')) {
            case self::$LOG_OFF:
                return;
            case self::$LOG_SHORT:
                if ($type == self::$LOG_FULL) {
                    return;
                }
        }

        if (!$this->log) {
            $this->log = new Log($this->config->get('shoputils_rk_log_filename'));
        }
        $this->log->Write($message);
    }

    protected function getUrl() {
        return $this->config->get('shoputils_rk_test_mode') ? 'http://test.robokassa.ru/Index.aspx': 'https://merchant.roboxchange.com/Index.aspx';
    }

    public function test() {
        $this->load->model('checkout/order');
        $this->order = $this->model_checkout_order->getOrder(30);
            if ($this->config->get('shoputils_rk_notify_admin_success')) {
                $this->sendMail($this->config->get('shoputils_rk_mail_admin_success_subject'),
                                     $this->config->get('shoputils_rk_mail_admin_success_content'),
                                     $this->config->get('shoputils_rk_order_status_id'),
                                     'Mail to Admin Sent Successfully: Payment Success');
            }
        die('OK');
    }

}
?>