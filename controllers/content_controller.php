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
	
    $this->_view->set('page_title', STRINGS['contents']); 
    
   
	 return $this->_view->output(); 
  }

  public function view_contents($category_id)
  {
    $_SESSION['active_category_id'] = $category_id;
    $contents = $this->_model->getRowsByCategoryId($category_id);

    $this->_setView("view_contents");
	
    $this->_view->set('page_title', STRINGS['contents']); 
    $this->_view->set('contents', $contents); 
   
	 return $this->_view->output(); 
  }

  public function add()
  {
    $category_id = $_SESSION['active_category_id'];
    $fields = $this->_model->getFieldsByCategoryId($category_id);

    $this->_setView("add");
	
    $this->_view->set('page_title', STRINGS['contents']); 
    $this->_view->set('fields', $fields); 
   
	 return $this->_view->output(); 
  }

  public function save()
  {
    $category_id = $_SESSION['active_category_id'];
    $fields = $this->_model->getFieldsByCategoryId($category_id);
    $id=$_POST['id'];
    $title=$_POST['title'];

    $details;
    foreach($fields as $field){
      $details[$field['title_latin']] = $_POST[$field['title_latin']];
    }

    if($id==0)
        $id = $this->_model->insert($title,$category_id,$details); 
    else	 
        $this->_model->update($id,$details);		
    
	 return $this->view_contents($category_id); 
  }
}	 
	 
?>