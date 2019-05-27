<?php 
class fieldset_controller extends controller 
{ 
  public function index()
  {
    $_SESSION['active_category_id'] = 0;
    $this->_setView("index");
    
    $fieldsets = $this->_model->getRows();

    $this->_view->set('page_title', STRINGS['fieldsets']); 
    $this->_view->set('rows', $fieldsets); 
   
	 return $this->_view->output(); 
  }

  public function edit($id)
  {
    $_SESSION['active_category_id'] = 0;
    $this->_setView("edit");
    
    $fieldset = $this->_model->getRowById($id);

    $this->_view->set('page_title', STRINGS['define_fieldset']); 
    $this->_view->set('row', $fieldset); 
   
	 return $this->_view->output(); 
  }

  public function add()
  {
    $_SESSION['active_category_id'] = 0;
    $this->_setView("add");
    
    $this->_view->set('page_title', STRINGS['define_fieldset']); 
   
	return $this->_view->output(); 
  }

  public function save()
  {
    $id  =$_POST['id'];
    $title =$_POST['title'];
    $product_id =$_SESSION['product_id'];
    $fields = $_POST['mytbl_data'];
    
    if($id==0)
        $id = $this->_model->insert($title , $product_id); 
    else	 
        $this->_model->update($title , $id);		

    return $this->index();
  }
}	 
	 
?>