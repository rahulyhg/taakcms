<?php 
class api_controller extends controller 
{ 
  public function view($action){
    if (isset($_POST['json'])){
      $json = $_POST['json'];
      echo $this->send_post($json);
      return;
    }
    $this->_setView($action);
    $this->_view->set('page_title', 'API'); 
	 return $this->_view->output(); 
  }

  public function index()
  {
    $this->view('index');
  }

  public function login()
  {
    $this->view('login');
  }

  public function getCategories()
  {
    $this->view('getCategories');
  }

  public function getSubcategories()
  {
    $this->view('getSubcategories');
  }

  public function getContents()
  {
    $this->view('getContents');
  }

  public function getFullContents()
  {
    $this->view('getFullContents');
  }

  public function getContent()
  {
    $this->view('getContent');
  }
}	 
	 
?>