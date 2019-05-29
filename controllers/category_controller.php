<?php 
class category_controller extends controller 
{ 
  public function add()
  {
    $this->_setView("add");

    $fieldset_model = new fieldset_model(); 
    $fieldsets = $fieldset_model->getRowsForDrowdown();

    $this->_view->set('page_title', STRINGS['contents']); 
    $this->_view->set('fieldsets', $fieldsets); 
   
	 return $this->_view->output(); 
  }
}	 
	 
?>