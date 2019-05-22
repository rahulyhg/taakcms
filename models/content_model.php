<?php
class content_model extends model 
{ 
    public function getRowsByCategoryId($category_id){
        $sql = "SELECT * FROM tbl_contents WHERE category_id = $category_id"; 
		$rows = $this->getAll($sql); 
		return $rows; 
    }

    public function getRowById($id) 
	{ 
		$sql = "SELECT * FROM tbl_contents WHERE  id =$id"; 
		$row = $this->getRow($sql); 
		return $row; 
	} 
}
?>