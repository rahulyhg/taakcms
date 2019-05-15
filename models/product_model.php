<?php
class product_model extends model 
{ 
	public function getRows() 
	{ 
		$rows = $this->getAll("SELECT * FROM tbl_products"); 
		return $rows ; 
	} 
//.................	
	public function getRowById($id) 
	{ 
		$sql = "SELECT * FROM tbl_products WHERE  id =$id"; 
		$row = $this->getRow($sql); 
		return $row; 
	} 
//.................	
	public function delete($id)
	{
       $sql="DELETE FROM tbl_products WHERE id=$id";
	   $this->execQuery($sql);
	}	
//.................
	public function insert($title,$logo)
	{
      $sql="INSERT INTO tbl_products(title,logo) VALUES('$title','$logo')";
	  $this->execQuery($sql);
	}
//.................
	public function update($title,$logo,$id)
	{
       $sql="UPDATE tbl_products SET title='$title',logo='$logo' WHERE id=$id";
	   $this->execQuery($sql);
	}

	

}
?>