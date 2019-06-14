<?php 
class subcategory_controller extends controller 
{ 
  public function add()
  {
    $this->_setView("add");

    $fieldset_model = new fieldset_model(); 
    $fieldsets = $fieldset_model->getRowsForDrowdown();

    $this->_view->set('page_title', STRINGS['category']); 
    $this->_view->set('fieldsets', $fieldsets); 
   
	 return $this->_view->output(); 
  }

  public function save() 
   { 
	   $id  =$_POST['id'];
	   $title =$_POST['title'];
	   $fieldset =$_POST['fieldset'];
	   $has_subcategory =$_POST['has_subcategory'];
	   //$logo = $this->_upload_file($_FILES["logo"]);
	   $active =0;//$_POST['active'];
      $product_id = $_SESSION['product_id'];

      if($id==0)
         $this->_model->insert($title , $fieldset, $has_subcategory,$product_id); 
      else	 
         $this->_model->update($title , $fieldset, $has_subcategory,$product_id, $id );	
         
      if ($has_subcategory){

      }else{
         				       
      }
      header('location:index.php?id=content/index/' . $product_id);
   } 
}	 
	 
?>