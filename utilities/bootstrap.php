<?php 
session_start();
$controller = "product"; 
$action = "index"; 
$query = null; 

if (isset($_GET['id'])) 
{ 
   	$params = array(); 
	$params = explode("/", $_GET['id']); 
	$controller = ucwords($params[0]); 
	if (isset($params[1]) && !empty($params[1])) 
	{ 
		$action = $params[1]; 
	} 
	if (isset($params[2]) && !empty($params[2])) 
	{ 
		$query = $params[2]; 
	} 
}

$modelName = $controller; 
$controller .= '_controller'; 
$load = new $controller($modelName, $action); 

if ($action!='login' && !isset($_SESSION['uname']))
   header('location:index.php?id=user/login');

if (method_exists($load, $action)  ) 
	  $load->$action($query); 
else  echo "request invalid";
	 
