<?php
class category_model extends model 
{ 
    public function getRowsByProductId($product_id){
        $sql = "SELECT * FROM tbl_categories WHERE product_id = $product_id"; 
		$rows = $this->getAll($sql); 
		return $rows; 
    }

    public function insert($title , $fieldset, $logo, $active,$product_id)
	{
      $sql="INSERT INTO tbl_categories(title,fieldset_id,logo, active,product_id) 
	  	VALUES('$title',$fieldset,'$logo', $active,$product_id)";
	  $this->execQuery($sql);
	}
//.................
	public function update($title , $fieldset, $logo, $active,$product_id, $id)
	{
       $sql="UPDATE tbl_categories SET title='$title',fieldset_id=$fieldset,logo='$logo',logo='$logo',active=$active,product_id=$product_id WHERE id=$id";
	   $this->execQuery($sql);
	}
}
?>