<?php 
class api_controller extends controller 
{ 
  public function index()
  {
	 
	 $this->_setView("index");
    
    $this->_view->set('page_title', 'API'); 
   
	 return $this->_view->output(); 
  }

  public function login()
  {
    if (isset($_POST['json'])){
      $json = $_POST['json'];
      echo $this->send_post($json);
      return;
    }
	  $this->_setView("login");
    $this->_view->set('page_title', 'API'); 
	  return $this->_view->output(); 
  }

  public function getCategories()
  {
    if (isset($_POST['json'])){
      $json = $_POST['json'];
      echo $this->send_post($json);
      return;
    }
	  $this->_setView("getCategories");
    $this->_view->set('page_title', 'API'); 
	  return $this->_view->output(); 
  }


   
   
}	 
	 
?>