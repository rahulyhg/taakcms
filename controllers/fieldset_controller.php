<?php 
class fieldset_controller extends controller 
{ 
  public function index()
  {
    $product_id = decodeId($_SESSION['product_id']);
    $_SESSION['active_category_id'] = 0;
    $this->_setView("index");
    
    $fieldsets = $this->_model->getRows($product_id);

    $this->_view->set('page_title', tr('fieldsets')); 
    $this->_view->set('rows', $fieldsets); 
   
	 return $this->_view->output(); 
  }

  public function edit($id)
  {
    $_SESSION['active_category_id'] = 0;
    $this->_setView("edit");
    
    $fieldset = $this->_model->getRowById($id);

    $this->_view->set('page_title', tr('define_fieldset')); 
    $this->_view->set('fieldset', $fieldset); 
   
	 return $this->_view->output(); 
  }

  public function add()
  {
    $_SESSION['active_category_id'] = 0;
    $this->_setView("add");
    
    $this->_view->set('page_title', tr('define_fieldset')); 
   
	return $this->_view->output(); 
  }

  public function save()
  {
    $id  =safe($_POST['id']);
    $title =safe($_POST['title']);
    $product_id = decodeId($_SESSION['product_id']);
    $has_audio = $this->getBool($_POST,'has_audio');
    $has_video = $this->getBool($_POST,'has_video');
    $has_image = $this->getBool($_POST,'has_image');
    $fields = json_decode(stripslashes($_POST['mytbl']));
    
    if($id==0)
        $id = $this->_model->insert($title,$product_id,$has_audio,$has_video,$has_image,$fields); 
    else	 
        $this->_model->update($title,$has_audio,$has_video,$has_image,$fields,$id);		

    return $this->index();
  }
  public function delete($id) 
   {  
      
      $id=intval($id);
      $this->_model->delete($id); 
      $this->index();
   } 
}	 
	 
?>