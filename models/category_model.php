<?php
class category_model extends model 
{ 
    public function getRowsByProductId($product_id){
        $sql = "SELECT * FROM tbl_categories WHERE product_id = $product_id"; 
		$rows = $this->getAll($sql); 
		return $rows; 
    }
}
?>