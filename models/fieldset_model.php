<?php
class fieldset_model extends model 
{ 
    public function getRows(){
        $sql = "SELECT * FROM tbl_fieldsets"; 
		$rows = $this->getAll($sql); 
		return $rows; 
        
    }
    public function getRowById($id) 
	{ 
		$sql = "SELECT * FROM tbl_fieldsets WHERE id =$id"; 
		$row = $this->getRow($sql); 
		return $row; 
    } 
    
    public function insert($title,$product_id)
	{
      $sql="INSERT INTO tbl_fieldsets(title,product_id) 
	  VALUES('$title',$product_id)";
      $this->execQuery($sql);
      return $this->insert_id();
	}
//.................
	public function update($title, $product_id, $id)
	{
       $sql="UPDATE tbl_fieldsets SET title='$title',product_id=$product_id WHERE id=$id";
	   $this->execQuery($sql);
	}

}
?>