<?php 
class api_controller extends controller 
{ 
  public function index()
  {
	 
	 $this->_setView("index");
    
    $this->_view->set('page_title', 'API'); 
   
	 return $this->_view->output(); 
  }

   
   
}	 
	 
?>