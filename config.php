<?php 
define ('DB_HOST', 'localhost:3306'); 
define ('DB_NAME', 'cms'); 
define ('DB_USER', 'root'); 
define ('DB_PASS', '');
define ('DB_COLL', 'utf8');

function aul ($class)  
{ 
		
	if (file_exists(HOME . DS . 'utilities' . DS . strtolower($class) . '.php')) 
	{ 
		require_once HOME . DS . 'utilities' . DS . strtolower($class) . '.php'; 
	} 
		else if (file_exists(HOME . DS . 'models' . DS . strtolower($class) . '.php')) 
	{ 
		require_once HOME . DS . 'models' . DS . strtolower($class) . '.php'; 
	} 
		else if (file_exists(HOME . DS . 'controllers' . DS . strtolower($class) . '.php')) 
	{ 
		require_once HOME . DS . 'controllers' . DS . strtolower($class) . '.php'; 
	} 
}

spl_autoload_register('aul');
require_once HOME . DS . 'includes' . DS . 'definition.php'; 
require_once HOME . DS . '/vendor/autoload.php';

?>