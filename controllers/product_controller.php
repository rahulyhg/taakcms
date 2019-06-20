<?php 
class product_controller extends controller 
{ 
  public function index()
  {
	 $rows = $this->_model->getRows();
	 $this->_setView("index");
    $this->_view->set('rows', $rows); 
    $this->_view->set('page_title', STRINGS['products']); 
   
	 return $this->_view->output(); 
  }

   public function delete($id=0) 
   {  
      $id=intval($id);
      $this->_model->delete($id); 
      return $this->index();
   } 

   public function add() 
   { 
      $colors = $this->_model->getColors();
      $this->_setView("add");
      $this->_view->set('page_title', STRINGS['add_product']); 
      $this->_view->set('colors', $colors); 
	  return $this->_view->output(); 
   }

   public function edit($id=0) 
   { 
      $colors = $this->_model->getColors();
      $id = intval($id);
	   $row = $this->_model->getRowById($id);
      $this->_setView("edit");
      $this->_view->set('page_title', STRINGS['edit_product']);
      $this->_view->set('colors', $colors);  	
      $this->_view->set('row', $row ); 	
      return $this->_view->output(); 
   } 
 //............
   public function save() 
   { 
	   $id  = $_POST['id'];
      $title = $_POST['title'];
      $logo="";
      if (isset($_FILES["logo"]) && $_FILES["logo"]["name"] !== ""){
         $logo = $this->_upload_file($_FILES["logo"]);
      }
	   $color = $_POST['color'];
	   $terms_and_conditions = $_POST['terms_and_conditions'];
	   $about = $_POST['about'];
      $banner_id = intval($_POST['banner_id']);
      
	   if($id==0)
			$this->_model->insert($title , $logo, $color, $terms_and_conditions, $about, $banner_id  ); 
      else	 
         $this->_model->update($title , $logo ,$color, $terms_and_conditions, $about, $banner_id, $id );					       
      return $this->index();
   } 
   
}	 
	 
?>