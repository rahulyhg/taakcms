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
		
		$sql2 = "SELECT * FROM tbl_content_details WHERE content_id =$id"; 
		$row['details'] = $this->getAll($sql2); 
		
		$sql3 = "SELECT * FROM tbl_content_sounds WHERE content_id =$id";
		$row['images'] = $this->getAll($sql3); 

		return $row; 
	} 

	public function getFieldsByCategoryId($categoryId) 
	{ 
		$sql = "SELECT * FROM tbl_categories WHERE id =$categoryId"; 
		$category = $this->getRow($sql); 
		$fieldset_id = $category['fieldset_id'] ;
		$sql  = "SELECT * FROM tbl_fieldset_details WHERE fieldset_id = $fieldset_id";
		$fields = $this->getAll($sql); 
		return $fields; 
	} 

	

	public function insert($title,$category_id, $details){
		$sql="INSERT INTO tbl_contents(title,category_id) 
		VALUES('$title',$category_id)";
		$this->execQuery($sql);
		$id = $this->insert_id();

		$sql="DELETE FROM tbl_content_details WHERE content_id = $id";			
		$this->execQuery($sql);

		foreach($details as $detail => $detail_value){
			
			$sql="INSERT INTO tbl_content_details(content_id,field_key,field_value) 
				VALUES($id,'$detail','$detail_value')";
			$this->execQuery($sql);
		}
	}

	public function update($id,$title, $details){
		$sql="UPDATE tbl_contents SET title = '$title' WHERE id = $id";
		$this->execQuery($sql);

		$sql="DELETE FROM tbl_content_details WHERE content_id = $id";			
		$this->execQuery($sql);

		foreach($details as $detail => $detail_value){
			$sql="INSERT INTO tbl_content_details(content_id,field_key,field_value) 
				VALUES($id,'$detail','$detail_value')";
			$this->execQuery($sql);
		}
	}
}
?>