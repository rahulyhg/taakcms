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
      $contetn_fieldset_id = intval($_POST['content_fieldset']);
      $has_audio = $this->getBool($_POST,'has_audio');
      $has_video = $this->getBool($_POST,'has_video');
      $has_image = $this->getBool($_POST,'has_image');

      $has_subcategory = $this->getBool($_POST,'has_subcategory');
      $subcategory_fieldset_id = intval($_POST['subcategory_fieldset']);

      $product_id = $_SESSION['product_id'];

      if($id==0){
         $category_id = $this->_model->insert($title,$contetn_fieldset_id,$has_audio,$has_video,$has_image,$has_subcategory,$subcategory_fieldset_id,$product_id); 
         if (!$has_subcategory && $category_id){
            $subcategory_model = new subcategory_model(); 
            $subcategory_model->insert($title,$category_id);
         }
      }
      else	 
         $this->_model->update($title,$contetn_fieldset_id,$has_audio,$has_video,$has_image,$has_subcategory,$subcategory_fieldset_id,$product_id,$id);	
      
      header('location:index.php?id=content/index/' . $product_id);
   } 
}	 
	 
?>