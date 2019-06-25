<?php 
class controller 
{ 
	  protected $_model; 
	  protected $_controller; 
	  protected $_action; 
	  protected $_view; 
	  protected $_modelBaseName; 

			 
	  public function __construct($model, $action) 
	  { 
	   	  $this->_controller = ucwords(__CLASS__); 
		  $this->_action = $action; 
		  $this->_modelBaseName = $model; 
		  $modelName = $model.'_model'; 
		  $this->_model = new $modelName(); 
		  $this->_view = new View(HOME . DS . 'views' . DS . strtolower($this->_modelBaseName) . DS . $action . '.tpl'); 

		  
	  } 
	  protected function _setView($viewName) 
	  { 
		  $this->_view = new View(HOME . DS . 'views' . DS . strtolower($this->_modelBaseName) . DS . $viewName . '.tpl');	
		  
  		  if (isset($_SESSION['uname']))
		        $this->_view->set('uname' , $_SESSION['uname']);
		  else 	$this->_view->set('uname' , '' );   
	  } 

	  protected function _upload_file($file,$valid_file_types){
		$target_dir = "uploads/";
		$fileType = pathinfo($file['name'], PATHINFO_EXTENSION);
		$newfileName = generateRandomString(16);
		$newfileFullName = $newfileName . "." . $fileType;
		$target_file = $target_dir . $newfileFullName;

		/*
		// Check file size
		if ($file["size"] > 500000) {
		   echo "Sorry, your file is too large.";
		   $uploadOk = 0;
		}
		*/
		
		// Allow certain file formats
		if(!in_array($fileType,$valid_file_types)){
		   $message = "this file type does not allowed! Only " . implode(', ',$valid_file_types)  . " are allowed.";
		   return $this->uploadResult(false,$message);
		}
  
		if (move_uploaded_file($file["tmp_name"], $target_file)) {
			return $this->uploadResult(true,$newfileFullName);
		} else {
			return $this->uploadResult(false,'unkhown error');
		}
	  }

	  function uploadResult($result,$message){
		$obj = array();
		$obj['message'] = $message;
		$obj['result'] = $result;
		return $obj;
	  }

	  function getBool($post,$id){
		  if (isset($post[$id])){
			if ($post[$id] == "on"){
				return 1;
			}
		  }
		  return 0;
	  }

	  function send_post($json){
		$url = "http://" . $_SERVER['HTTP_HOST'] . "/taakcms/api.php";
		header('Content-type: application/json');
		$ch=curl_init();
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
		$result = curl_exec($ch);
		curl_close ($ch);
		return $result;
	  }

}	 
?>