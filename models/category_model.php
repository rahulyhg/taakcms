<?php
class category_model extends model 
{ 
    public function getRowsByProductId($product_id){
        $sql = "SELECT * FROM tbl_categories WHERE product_id = $product_id"; 
		$rows = $this->getAll($sql); 
		return $rows; 
    }

    public function insert($title , $has_subcategory,$product_id)
	{
      $sql="INSERT INTO tbl_categories(title,has_subcategory,product_id) 
	  	VALUES('$title',$has_subcategory, $product_id)";
	  $this->execQuery($sql);
	  return $this->insert_id();
	}
//.................
	public function update($title ,$has_subcategory,$product_id, $id)
	{
       $sql="UPDATE tbl_categories SET title='$title',has_subcategory=$has_subcategory,product_id=$product_id WHERE id=$id";
	   $this->execQuery($sql);
	}
}
?>