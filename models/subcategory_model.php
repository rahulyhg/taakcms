<?php
class subcategory_model extends model 
{ 
    public function getRowsByProductId($product_id){
        $sql = "SELECT * FROM tbl_subcategories WHERE product_id = $product_id"; 
		$rows = $this->getAll($sql); 
		return $rows; 
	}
	public function getSubcategories($category_id){
		$sql = "SELECT * FROM tbl_subcategories WHERE category_id = $category_id"; 
		$rows = $this->getAll($sql); 
		return $rows; 
	}
	public function getSubcategoryFields($category_id) 
	{ 
		$sql2 = "SELECT * FROM tbl_categories WHERE id =$category_id"; 
		$category = $this->getRow($sql2); 

		$fieldset_id = $category['subcategory_fieldset_id'];
		$sql3  = "SELECT * FROM tbl_fieldset_details WHERE fieldset_id = $fieldset_id";
		$fields = $this->getAll($sql3); 
		return $fields; 
	} 

    public function insert($id,$title,$category_id,$row_index,$details)
	{
		$sql="INSERT INTO tbl_subcategories(title,category_id,row_index) 
		VALUES('$title',$category_id,$row_index)";
		$this->execQuery($sql);
		$id = $this->insert_id();
		
		$sql="DELETE FROM tbl_subcategories_details WHERE subcategory_id = $id";			
		$this->execQuery($sql);

		foreach($details as $detail => $detail_value){
			$sql="INSERT INTO tbl_subcategories_details(subcategory_id,field_key,field_value) 
				VALUES($id,'$detail','$detail_value')";
			$this->execQuery($sql);
		}
	}
	//.................
	public function update($title,$category_id,$row_index, $id)
	{
		$sql="UPDATE tbl_subcategories SET title = '$title',row_index=$row_index WHERE id = $id";
		$this->execQuery($sql);

		$sql="DELETE FROM tbl_subcategories_details WHERE subcategory_id = $id";			
		$this->execQuery($sql);

		foreach($details as $detail => $detail_value){
			$sql="INSERT INTO tbl_subcategories_details(subcategory_id,field_key,field_value) 
				VALUES($id,'$detail','$detail_value')";
			$this->execQuery($sql);
		}
	}

	public function getSubcategoryId($category_id){
		$sql = "SELECT * FROM tbl_subcategories WHERE category_id = $category_id"; 
		$rows = $this->getRow($sql); 
		return $rows['category_id']; 
	}
	public function getContentTitle($category_id,$subcategory_id){
		$sql = "SELECT * FROM tbl_categories WHERE id = $category_id"; 
		$category = $this->getRow($sql); 
		$fieldset_id = $category['content_fieldset_id'];
		$sql2 = "SELECT * FROM tbl_fieldsets WHERE id = $fieldset_id"; 
		$fieldset = $this->getRow($sql2); 
		$subcategory_title="";
		if ($category['has_subcategory'] == "1"){
			$sql3 = "SELECT * FROM tbl_subcategories WHERE id = $subcategory_id"; 
			$subcategory = $this->getRow($sql3);
			$subcategory_title = $subcategory['title'] . ' - ' ;
		}
		
		return $subcategory_title . $fieldset['display_title']; 
	}
	public function getSubcategoryTitle($category_id){
		$sql = "SELECT * FROM tbl_categories WHERE id = $category_id"; 
		$category = $this->getRow($sql); 
		$fieldset_id = $category['subcategory_fieldset_id'];
		$sql2 = "SELECT * FROM tbl_fieldsets WHERE id = $fieldset_id"; 
		$fieldset = $this->getRow($sql2); 
		
		return $fieldset['display_title']; 
	}
}
?>