<?php 
class subcategory_controller extends controller 
{ 
   public function index($category_id)
   {
      $_SESSION['active_category_id'] = $category_id;
      $this->_setView("index");

      $subcategories = $this->_model->getSubcategories($category_id);

      $this->_view->set('page_title', STRINGS['subcategory']); 
      $this->_view->set('subcategories', $subcategories); 
      
      
      return $this->_view->output(); 
   }
  public function add()
  {
      $category_id = $_SESSION['active_category_id'];
      $this->_setView("add");

      $fields = $this->_model->getSubcategoryFields($category_id);
      $values['id']=rand(100, 999) * -1;
      $values['title']="";
      foreach($fields as $field){
         $item = array();
         $item['field_key'] = $field['title_latin'];
         $item['field_value'] = '';
         $values['details'][] = $item;
       }
      $this->_view->set('page_title', STRINGS['category']); 
      $this->_view->set('fields', $fields); 
      $this->_view->set('values', $values); 
    
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
            return $_POST[$title];
         }
      }
      return "";
   }

   public function save() 
   { 
      $category_id = $_SESSION['active_category_id'];
      $fields = $this->_model->getSubcategoryFields($category_id);
      $id = $_POST['id'];
      $title = $_POST['title'];
      $row_index=0;
      $details;
      foreach($fields as $field){
         $details[$field['title_latin']] = $this->getValue($field['title_latin'],$field['data_type']);
      }

      if($id<=0)
         $id = $this->_model->insert($id,$title,$category_id, $row_index,$details); 
      else	 
         $this->_model->update($id,$title, $row_index,$details);		
      
      return $this->index($category_id); 
   } 
}	 
	 
?>