<?php 
class category_controller extends controller 
{ 
   public function add()
   {
      $product_id = $_SESSION['product_id'];
      $this->_setView("add");
      $fieldset_model = new fieldset_model(); 
      $fieldsets = $fieldset_model->getRowsForDrowdown($product_id);
      $row = $this->_model->getCategory(0);
      $this->_view->set('page_title', tr('category')); 
      $this->_view->set('fieldsets', $fieldsets); 
      $this->_view->set('row', $row); 
      $this->_view->set('product_id', $product_id); 
      
      return $this->_view->output(); 
   }
   public function edit($id)
   {
      $product_id = $_SESSION['product_id'];
      $this->_setView("add");

      $fieldset_model = new fieldset_model(); 
      $fieldsets = $fieldset_model->getRowsForDrowdown($product_id);
      $row = $this->_model->getCategory($id);
      $this->_view->set('page_title', tr('category')); 
      $this->_view->set('fieldsets', $fieldsets); 
      $this->_view->set('row', $row); 
      $this->_view->set('product_id', $product_id); 
      
      return $this->_view->output(); 
   }
   public function delete($id)
   {
      $product_id = $_SESSION['product_id'];
      $this->_model->delete($id);
      $this->_view->set('page_title', tr('category')); 
      
      header('location:index.php?id=content/index/' . $product_id);
   }
   public function save() 
   { 
	   $id  = safe($_POST['id']);
	   $title = safe($_POST['title']);
      $contetn_fieldset_id = intval(safe($_POST['content_fieldset']));
      $has_audio = $this->getBool($_POST,'has_audio');
      $has_video = $this->getBool($_POST,'has_video');
      $has_image = $this->getBool($_POST,'has_image');

      $has_subcategory = $this->getBool($_POST,'has_subcategory');
      $subcategory_fieldset_id = 0;
      if (isset($_POST['subcategory_fieldset'])){
         $subcategory_fieldset_id = intval(safe($_POST['subcategory_fieldset']));
      }

      $product_id = $_SESSION['product_id'];

      if($id==0){
         $category_id = $this->_model->insert($title,$contetn_fieldset_id,$has_audio,$has_video,$has_image,$has_subcategory,$subcategory_fieldset_id,$product_id); 
         if (!$has_subcategory && $category_id){
            $subcategory_model = new subcategory_model(); 
            $subcategory_model->insert($title,$category_id,0,[]);
         }
      }
      else	 
         $this->_model->update($title,$contetn_fieldset_id,$has_audio,$has_video,$has_image,$has_subcategory,$subcategory_fieldset_id,$product_id,$id);	
      
      header('location:index.php?id=content/index/' . $product_id);
   } 
}	 
	 
?>