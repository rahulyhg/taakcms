<?php 
class product_controller extends controller 
{ 
  public function index()
  {
	 $rows = $this->_model->getRows();
	 $this->_setView("index");
  	 $this->_view->set('rows', $rows); 
	 $this->_view->set('title', STRINGS['products']); 
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
      $this->_setView("add");
      $this->_view->set('title', STRINGS['add_product']); 
	  return $this->_view->output(); 
   } 
   public function edit($id=0) 
   { 
      $id = intval($id);
	  $row = $this->_model->getRowById($id);
      $this->_setView("edit");
	  $this->_view->set('title', STRINGS['edit_product']); 	
  	  $this->_view->set('row', $row ); 	
	  return $this->_view->output(); 
   } 
 //............
   public function save() 
    { 
	   $id  =$_POST['id'];
	   $title =$_POST['title'];
	   $logo =$_POST['logo'];
	   if($id==0)
			$this->_model->insert($title , $logo ); 
       else	 
            $this->_model->update($title , $logo , $id );					       
       return $this->index();
     } 
   
}	 
	 
?>