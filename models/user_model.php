<?php
class user_model extends model 
{ 
	public function getRowByUP($uname , $upass ) 
	{ 
		$sql = "SELECT * FROM tbl_users 
		        WHERE  `username`='$uname' and `password`='$upass' "; 
		$row = $this->getRow($sql); 
		return $row; 
	} 

	public function getRowById($id) 
	{ 
		$sql = "SELECT * FROM tbl_users WHERE  id =$id"; 
		$row = $this->getRow($sql); 
		if ($row['accessed_products'] == ""){
			$row['accessed_products'] = [];
		}else {
			$row['accessed_products'] = json_decode($row['accessed_products']);
		}
		return $row; 
	} 

	public function getRows(){
		$sql = "SELECT * FROM tbl_users "; 
		$rows = $this->getAll($sql); 
		return $rows; 
	
	}

	public function getRoles(){
		$colors;
		$colors['admin'] = 'admin';
		$colors['user'] = 'user';
		return $colors;
	}

	public function insert($username ,$fullname, $role, $accessed_products){
		$sql="INSERT INTO tbl_users(username,fullname,role,accessed_products) 
		VALUES('$username','$fullname','$role','$accessed_products')";
		$this->execQuery($sql);
	}

	public function update($username ,$fullname, $role, $accessed_products,$id){
		$sql="UPDATE tbl_users SET username='$username',fullname='$fullname',role='$role',accessed_products='$accessed_products' WHERE id=$id";
		$this->execQuery($sql);
	}


}
?>