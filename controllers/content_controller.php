<?php 
class content_controller extends controller 
{ 
  public function index($product_id)
  {
    $_SESSION['product_title'] = $product_id;
    $_SESSION['product_color'] = "";
    $this->_setView("index");
	
    $this->_view->set('page_title', STRINGS['contents']); 
    
   
	 return $this->_view->output(); 
  }
}	 
	 
?>