<?php 
class content_controller extends controller 
{ 
  public function index($product_id)
  {
    $product_model = new product_model(); 
    $product = $product_model->getRowById($product_id);

    $category_model = new category_model(); 
    $categories = $category_model->getRowsByProductId($product_id);

    $_SESSION['product_title'] = $product['title'];
    $_SESSION['product_color'] = $product['color'];
    $_SESSION['product_id'] = $product_id;
    $_SESSION['categories'] = $categories;
    $_SESSION['active_category_id'] = 0;
    $this->_setView("index");
	
    $this->_view->set('page_title', tr('contents')); 
    
   
	 return $this->_view->output(); 
  }

  public function view_contents($category_id,$subcategory_id)
  {
    $subcategory_model = new subcategory_model(); 
    if (!isset($_SESSION['active_category_id'])){
      $categories = $subcategory_model->getRowsByProductId($product_id);
    }

    $subcategory_title = $subcategory_model->getContentTitle($category_id,$subcategory_id);

    $_SESSION['active_category_id'] = $category_id;
    $_SESSION['active_subcategory_id'] = $subcategory_id;
    $contents = $this->_model->getRowsBySubcategoryId($subcategory_id);

    $this->_setView("view_contents");
	
    $this->_view->set('page_title', $subcategory_title); 
    $this->_view->set('contents', $contents); 
   
	 return $this->_view->output(); 
  }

  public function add()
  {
    $subcategory_id = $_SESSION['active_subcategory_id'];
    $category_id = $_SESSION['active_category_id'];
    $fields = $this->_model->getFieldsByCategoryId($category_id);

    $category = new category_model();
    $category_info = $category->getCategory($category_id);

    $values['id']=rand(100, 999) * -1;
    $values['title']="";
    $values['row_index']=$this->_model->getNewOrderIndex();
    foreach($fields as $field){
      $item = array();
      $item['field_key'] = $field['title_latin'];
      $item['field_value'] = '';
      $values['details'][] = $item;
    }
    $values['images'] = [];
     
    $this->_setView("add");
	
    $this->_view->set('page_title', tr('contents')); 
    $this->_view->set('fields', $fields); 
    $this->_view->set('values', $values); 
    $this->_view->set('tableId', $this->getTableId($fields)); 
    $this->_view->set('subcategory_id', $subcategory_id); 
    $this->_view->set('category_id', $category_id); 
    
    $this->_view->set('has_audio', $category_info['has_audio']); 
    $this->_view->set('has_image', $category_info['has_image']); 
    $this->_view->set('has_video', $category_info['has_video']); 

	 return $this->_view->output(); 
  }

  private function getTableId($fields){
    foreach($fields as $field){
      if ($field['data_type'] == 'string_list')
        return $field['title_latin'];
    }

  }

  public function edit($id)
  {
    $category_id = $_SESSION['active_category_id'];
    $subcategory_id = $_SESSION['active_subcategory_id'];
    $fields = $this->_model->getFieldsByCategoryId($category_id);
    $values = $this->_model->getRowById($id);

    $category = new category_model();
    $category_info = $category->getCategory($category_id);

    $this->_setView("add");
	
    $this->_view->set('page_title', tr('contents')); 
    $this->_view->set('fields', $fields); 
    $this->_view->set('values', $values); 
    $this->_view->set('tableId', $this->getTableId($fields)); 
    $this->_view->set('subcategory_id', $subcategory_id); 
    $this->_view->set('category_id', $category_id); 

    $this->_view->set('has_audio', $category_info['has_audio']); 
    $this->_view->set('has_image', $category_info['has_image']); 
    $this->_view->set('has_video', $category_info['has_video']); 
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
  public function delete($id) 
  {  
    $category_id = $_SESSION['active_category_id'];
    $sub_category_id = $_SESSION['active_subcategory_id'];
    $id= intval($id);
    $this->_model->delete($id); 
    return $this->view_contents($category_id,$sub_category_id); 
  } 
  public function save()
  {
    $category_id = $_SESSION['active_category_id'];
    $sub_category_id = $_SESSION['active_subcategory_id'];
    $fields = $this->_model->getFieldsByCategoryId($category_id);
    $id=safe($_POST['id']);
    $title=safe($_POST['title']);
    $date=date('Y-m-d h:i:s');
    $row_index=safe($_POST['row_index']);
    $last_row_index=safe($_POST['last_row_index']);

    $details;
    foreach($fields as $field){
      $details[$field['title_latin']] = $this->getValue($field['title_latin'],$field['data_type']);
    }

    if($id<=0)
        $id = $this->_model->insert($id,$title,$sub_category_id,$row_index,$last_row_index,$date,$details); 
    else	 
        $this->_model->update($id,$title,$sub_category_id,$row_index,$last_row_index,$details);		
    
	  return $this->view_contents($category_id,$sub_category_id); 
  }

  public function uploadimage(){
    $id=safe($_POST['id']);
    $image = $this->_upload_file($_FILES["image"]);
    $this->_model->saveImage($id,$image);
    echo $image;
  }
  public function uploadaudio(){
    $id=safe($_POST['id']);
    $audio = $this->_upload_file($_FILES["audio"]);
    $this->_model->saveAudio($id,$audio);
    echo $audio;
  }
  public function uploadvideo(){
    $id=safe($_POST['id']);
    $video = $this->_upload_file($_FILES["video"]);
    $this->_model->saveVideo($id,$video);
    echo $video;
  }
}	 
	 
?>