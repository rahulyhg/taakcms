<?php
class user_model extends model 
{ 
	public function getRowByUP($uname , $upass ) 
	{ 
		$sql = "SELECT * FROM tbl_users 
		        WHERE  `username`='$uname' and `password`=$upass "; 
		$row = $this->getRow($sql); 
		return $row; 
	} 


}
?>