<?php 
class category_controller extends controller 
{ 
  public function add()
  {
    $this->_setView("add");
	
    $this->_view->set('page_title', STRINGS['contents']); 
   
	 return $this->_view->output(); 
  }
}	 
	 
?>