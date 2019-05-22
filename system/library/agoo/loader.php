<?php
final class agooLoader
{
	protected $registry;
	public function __construct($registry)
	{
		$this->registry = $registry;
	}
	public function __get($key)
	{
		return $this->registry->get($key);
	}
	public function __set($key, $value)
	{
		$this->registry->set($key, $value);
	}
	public function library($library)
	{
		$file = DIR_SYSTEM . 'library/agoo/' . $library . '.php';
		if (!file_exists($file)) {
			$file = DIR_SYSTEM . 'library/' . $library . '.php';
		} //!file_exists($file)
		if (file_exists($file)) {
			include_once($file);
		} //file_exists($file)
		else {
			trigger_error('Error: Could not load library ' . $library . '!');
			exit();
		}
	}
	public function helper($helper)
	{
		$file = DIR_SYSTEM . 'helper/agoo/' . $helper . '.php';
		if (!file_exists($file)) {
			$file = DIR_SYSTEM . 'helper/' . $helper . '.php';
		} //!file_exists($file)
		if (file_exists($file)) {
			include_once($file);
		} //file_exists($file)
		else {
			trigger_error('Error: Could not load helper ' . $helper . '!');
			exit();
		}
	}
	public function model($model, $dir_application = DIR_APPLICATION )
	{
		$file  = $dir_application . 'model/agoo/' . $model . '.php';
		$class = 'agooModel' . preg_replace('/[^a-zA-Z0-9]/', '', $model);
		if (!file_exists($file)) {
			$file  = $dir_application . 'model/' . $model . '.php';
			$class = 'Model' . preg_replace('/[^a-zA-Z0-9]/', '', $model);
		} //!file_exists($file)
		if (file_exists($file)) {
			if (!class_exists($class)) {
				include_once($file);
                // echo $file;
				$this->registry->set('model_' . str_replace('/', '_', $model), new $class($this->registry));
			} //!class_exists($class)
		} //file_exists($file)
		else {
			trigger_error('Error: Could not load model ' . $model . '!');
			exit();
		}
	}
	public function database($driver, $hostname, $username, $password, $database, $prefix = NULL, $charset = 'UTF8')
	{
		$file  = DIR_SYSTEM . 'database/agoo/' . $driver . '.php';
		$class = 'agooDatabase' . preg_replace('/[^a-zA-Z0-9]/', '', $driver);
		if (!file_exists($file)) {
			$file  = DIR_SYSTEM . 'database/' . $driver . '.php';
			$class = 'Database' . preg_replace('/[^a-zA-Z0-9]/', '', $driver);
		} //!file_exists($file)
		if (file_exists($file)) {
			if (!class_exists($class)) {
				include_once($file);
				$this->registry->set(str_replace('/', '_', $driver), new $class());
			} //!class_exists($class)
		} //file_exists($file)
		else {
			trigger_error('Error: Could not load database ' . $driver . '!');
			exit();
		}
	}
	public function config($config)
	{
		$this->config->load($config);
	}
	public function language($language)
	{
		return $this->language->load($language);
	}
}
?>