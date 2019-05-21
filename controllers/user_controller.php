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
  
}	 
	 
?>