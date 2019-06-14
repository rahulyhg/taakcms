<?php 
class category_controller extends controller 
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
	   
	   $has_subcategory =$_POST['has_subcategory'];
	   //$logo = $this->_upload_file($_FILES["logo"]);
	   $active =0;//$_POST['active'];
      $product_id = $_SESSION['product_id'];

      if($id==0){
         $category_id = $this->_model->insert($title , $has_subcategory,$product_id); 
         if (!$has_subcategory){
            $fieldset =$_POST['fieldset'];
   
            $subcategory_model = new subcategory_model(); 
            $subcategory_model->insert($title,'',$fieldset,false,false,$product_id,true,0,$category_id,false);
         
   
   
         }
      }
      else	 
         $this->_model->update($title , $has_subcategory,$product_id, $id );	
         
      
      header('location:index.php?id=content/index/' . $product_id);
   } 
}	 
	 
?>