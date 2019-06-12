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

	  protected function _upload_file($file){
		$target_dir = "uploads/";
		$target_file = $target_dir . basename($file["name"]);
		$uploadOk = 1;
		$fileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
  
		/*
		$check = getimagesize($file["tmp_name"]);
		if($check !== false) {
		   echo "File is an image - " . $check["mime"] . ".";
		   $uploadOk = 1;
		} else {
		   echo "File is not an image.";
		   $uploadOk = 0;
		}*/

		/*
		// Check if file already exists
		if (file_exists($target_file)) {
		   echo "Sorry, file already exists.";
		   $uploadOk = 0;
		}
		  */
		  /*
		// Check file size
		if ($file["size"] > 500000) {
		   echo "Sorry, your file is too large.";
		   $uploadOk = 0;
		}
  */
  /*
		// Allow certain file formats
		if($fileType != "jpg" && $fileType != "png" && $fileType != "jpeg"
		&& $fileType != "gif" ) {
		   echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
		   $uploadOk = 0;
		}
  */
		// Check if $uploadOk is set to 0 by an error
		if ($uploadOk == 0) {
		   echo "Sorry, your file was not uploaded.";
		// if everything is ok, try to upload file
		} else {
		   if (move_uploaded_file($file["tmp_name"], $target_file)) {
			  echo "The file ". basename( $file["name"]). " has been uploaded.";
			  return basename( $file["name"]);
		   } else {
			  echo "Sorry, there was an error uploading your file.";
			  return "";
		   }
		}

	  }

}	 
?>