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

      $fieldset_model = new fieldset_model();
      $fieldset = $fieldset_model->getFieldsetDetails($category_id,'subcategory_fieldset_id');
      $fields = $fieldset['details'];
      $values['id']=rand(100, 999) * -1;
      $values['title']="";
      $values['row_index']=$this->_model->getNewOrderIndex($category_id);
      foreach($fields as $field){
         $item = array();
         $item['field_key'] = $field['field_title_latin'];
         $item['field_value'] = '';
         $values['details'][] = $item;
      }
      $values['images'] = [];
      $this->_view->set('page_title', tr('category')); 
      $this->_view->set('fields', $fields); 
      $this->_view->set('values', $values); 
      $this->_view->set('category_id', $category_id); 
      $this->_view->set('tableId', $this->getTableId($fields)); 
      $this->_view->set('has_audio', $fieldset['has_audio']); 
      $this->_view->set('has_image', $fieldset['has_image']); 
      $this->_view->set('has_video', $fieldset['has_video']); 
	   return $this->_view->output(); 
  }
  public function edit($id)
  {
      $category_id = $_SESSION['active_category_id'];
      $this->_setView("add");

      $fieldset_model = new fieldset_model();
      $fieldset = $fieldset_model->getFieldsetDetails($category_id,'subcategory_fieldset_id');
      $fields = $fieldset['details'];
      $values = $this->_model->getRowById($id);
      
      foreach($fields as $field){
         $item = array();
         $item['field_key'] = $field['field_title_latin'];
         $item['field_value'] = '';
         $values['details'][] = $item;
       }
      $this->_view->set('page_title', tr('category')); 
      $this->_view->set('fields', $fields); 
      $this->_view->set('values', $values); 
      $this->_view->set('category_id', $category_id); 
      $this->_view->set('tableId', $this->getTableId($fields)); 
      $this->_view->set('has_audio', $fieldset['has_audio']); 
      $this->_view->set('has_image', $fieldset['has_image']); 
      $this->_view->set('has_video', $fieldset['has_video']); 
    
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
      $fieldset_model = new fieldset_model();
      $fieldset = $fieldset_model->getFieldsetDetails($category_id,'subcategory_fieldset_id');
      $fields = $fieldset['details'];
      $id = safe($_POST['id']);
      $title = safe($_POST['title']);
      $row_index = safe($_POST['row_index']);
      $last_row_index=safe($_POST['last_row_index']);
      $details;
      foreach($fields as $field){
         $details[$field['field_title_latin']] = $this->getValue($field['field_title_latin'],$field['field_type']);
      }

      if($id<=0)
         $id = $this->_model->insert($title,$category_id, $row_index,$details); 
      else	 
         $this->_model->update($id,$title,$category_id, $row_index,$last_row_index,$details);		
      
      return $this->index($category_id); 
   } 
   public function delete($id) 
   {  
      $category_id = $_SESSION['active_category_id'];
      $id=intval($id);
      $this->_model->delete($id); 
      return $this->index($category_id);
   } 
   private function getTableId($fields){
      foreach($fields as $field){
        if ($field['field_type'] == 'string_list')
          return $field['field_title_latin'];
      }
   }
   public function uploadimage(){
      $id=safe($_POST['id']);
      $title=safe($_POST['title']);
      $image = $this->_upload_file($_FILES["image"],image_types());
      if ($image['result']){
         $this->_model->saveImage($id,$image['message'],$title);
      }
      $image['title'] = $title;
      echo json_encode($image);
   }
   public function deleteImage(){
      $id=safe($_POST['id']);
   }

   public function uploadaudio(){
      $id=safe($_POST['id']);
      $title=safe($_POST['title']);
      $audio = $this->_upload_file($_FILES["audio"],audio_types());
      if ($audio['result']){
         $this->_model->saveAudio($id,$audio['message'],$title);
      }
      $audio['title'] = $title;
      echo json_encode($audio);
   }

   public function uploadvideo(){
      $id=safe($_POST['id']);
      $title=safe($_POST['title']);
      $video = $this->_upload_file($_FILES["video"],video_types());
      if ($video['result']){
         $this->_model->saveVideo($id,$video['message'],$title);
      }
      $video['title'] = $title;
      echo json_encode($video);
   }
}	 
	 
?>