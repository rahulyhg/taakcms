<?php 
class subcategory_controller extends controller 
{ 
   public function index($category_id)
   {
      $_SESSION['active_category_id'] = $category_id;
      $this->_setView("index");

      $subcategories = $this->_model->getSubcategories($category_id);
      $title = $this->_model->getSubcategoryTitle($category_id);
      $content_title = $this->_model->getContentPureTitle($category_id);
      $this->_view->set('page_title', $title); 
      $this->_view->set('subcategories', $subcategories); 
      $this->_view->set('content_title', $content_title); 
      
      
      return $this->_view->output(); 
   }
  public function add()
  {
      $category_id = $_SESSION['active_category_id'];
      $this->_setView("add");

      $fields = $this->_model->getSubcategoryFields($category_id);
      $values['id']=rand(100, 999) * -1;
      $values['title']="";
      $values['row_index']=$this->_model->getNewOrderIndex();
      foreach($fields as $field){
         $item = array();
         $item['field_key'] = $field['title_latin'];
         $item['field_value'] = '';
         $values['details'][] = $item;
       }
      $this->_view->set('page_title', tr('category')); 
      $this->_view->set('fields', $fields); 
      $this->_view->set('values', $values); 
      $this->_view->set('category_id', $category_id); 
	   return $this->_view->output(); 
  }
  public function edit($id)
  {
      $category_id = $_SESSION['active_category_id'];
      $this->_setView("add");

      $fields = $this->_model->getSubcategoryFields($category_id);
      $values = $this->_model->getRowById($id);
      
      foreach($fields as $field){
         $item = array();
         $item['field_key'] = $field['title_latin'];
         $item['field_value'] = '';
         $values['details'][] = $item;
       }
      $this->_view->set('page_title', tr('category')); 
      $this->_view->set('fields', $fields); 
      $this->_view->set('values', $values); 
      $this->_view->set('category_id', $category_id); 
    
	   return $this->_view->output(); 
  }
   private function getValue($title,$data_type){
      if (isset($_POST[$title])){
         if ($data_type == 'string_list'){
            $data =  json_decode(stripslashes($_POST[$title]),true);
            $newdata[]=array();
            $index=0;
            foreach($data as $row){
               $newdata[$index]['order'] = $row['order'];
               $newdata[$index]['title'] = $row['title'];
               $newdata[$index]['field_id'] = 0;
               $index++;
            }
            return json_encode($newdata,JSON_UNESCAPED_UNICODE);
         }else{
            return safe($_POST[$title]);
         }
      }
      return "";
   }

   public function save() 
   { 
      $category_id = $_SESSION['active_category_id'];
      $fields = $this->_model->getSubcategoryFields($category_id);
      $id = safe($_POST['id']);
      $title = safe($_POST['title']);
      $row_index = safe($_POST['row_index']);
      $last_row_index=safe($_POST['last_row_index']);
      $details;
      foreach($fields as $field){
         $details[$field['title_latin']] = $this->getValue($field['title_latin'],$field['data_type']);
      }

      if($id<=0)
         $id = $this->_model->insert($title,$category_id, $row_index,$details); 
      else	 
         $this->_model->update($id,$title, $row_index,$last_row_index,$details);		
      
      return $this->index($category_id); 
   } 
   public function delete($id) 
   {  
      $category_id = $_SESSION['active_category_id'];
      $id=intval($id);
      $this->_model->delete($id); 
      return $this->index($category_id);
   } 
}	 
	 
?>