<?php 
class user_controller extends controller 
{ 
  public function login()
  {
	 $this->_setView("login");
	 $this->_view->set('page_title', ''); 
	 return $this->_view->output(); 
  }
//.............
  public function check() 
   {  
 	  $uname =$_POST['uname'];
	  $upass =$_POST['upass'];  
	  $row = $this->_model->getRowByUP($uname , $upass ); 
	  if ($row )
	  {
	     $_SESSION['uname']=$row['username'];
		 header('location:index.php?products/index');
		 exit;
	  }
	  else 
	  return $this->login();
   } 
   
   public function logout() 
   { 
     unset($_SESSION['uname']);
	 header('location:index.php?user/login');
   } 

   public function index(){
	$rows = $this->_model->getRows();
	$this->_setView("index");
	$this->_view->set('rows', $rows); 
	$this->_view->set('page_title', STRINGS['users']); 
	return $this->_view->output(); 
   }

   public function add(){
	
	$this->_setView("add");
	$roles = $this->_model->getRoles();
	$product = new product_model();
	$products = $product->getRowsForDrowdown();
	$this->_view->set('page_title', STRINGS['adduser']); 
	$this->_view->set('roles', $roles); 
	$this->_view->set('products', $products); 
	return $this->_view->output(); 
   }

   	public function edit($id)
	{
		$this->_setView("edit");
		
		$row = $this->_model->getRowById($id);
		$roles = $this->_model->getRoles();
		$product = new product_model();
		$products = $product->getRowsForDrowdown();
		$this->_view->set('page_title', STRINGS['edit_user']); 
		$this->_view->set('row', $row); 
		$this->_view->set('roles', $roles); 
		$this->_view->set('products', $products); 
		return $this->_view->output(); 
	}
	
	public function save()
	{
		$id  =$_POST['id'];
		$username =$_POST['username'];
		$fullname =$_POST['fullname'];
		$role = $_POST['role'];
		$accessed_products = stripslashes($_POST['accessed_products']);
		
		if($id==0)
			$id = $this->_model->insert($username ,$fullname, $role, $accessed_products); 
		else	 
			$this->_model->update($username ,$fullname, $role, $accessed_products, $id);		

		return $this->index();
	}
  
}	 
	 
?>