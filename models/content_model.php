<?php
class content_model extends model 
{ 
    public function getRowsBySubcategoryId($subcategory_id){
        $sql = "SELECT * FROM tbl_contents WHERE subcategory_id = $subcategory_id ORDER BY row_index"; 
		$rows = $this->getAll($sql); 
		return $rows; 
    }

    public function getRowById($id) 
	{ 
		$sql = "SELECT * FROM tbl_contents WHERE  id =$id"; 
		$row = $this->getRow($sql); 
		
		$sql2 = "SELECT * FROM tbl_content_details WHERE content_id =$id"; 
		$row['details'] = $this->getAll($sql2); 
		
		$sql3 = "SELECT * FROM tbl_content_images WHERE content_id =$id";
		$row['images'] = $this->getAll($sql3); 
		
		$sql4 = "SELECT * FROM tbl_content_sounds WHERE content_id =$id";
		$row['sounds'] = $this->getAll($sql4); 

		$sql5 = "SELECT * FROM tbl_content_videos WHERE content_id =$id";
		$row['videos'] = $this->getAll($sql5); 

		return $row; 
	} 
	public function getRowByIdForApi($id) 
	{ 
		$sql = "SELECT * FROM tbl_contents WHERE  id =$id"; 
		$row = $this->getRow($sql); 
		
		$sql2 = "SELECT * FROM tbl_content_details WHERE content_id =$id"; 
		foreach ($this->getAll($sql2) as $detail){
			$row[$detail['field_key']] = $detail['field_value'];
		} 
		
		$sql3 = "SELECT * FROM tbl_content_images WHERE content_id =$id";
		$row['images'] = $this->getAll($sql3); 
		
		$sql4 = "SELECT * FROM tbl_content_sounds WHERE content_id =$id";
		$row['sounds'] = $this->getAll($sql4); 

		$sql5 = "SELECT * FROM tbl_content_videos WHERE content_id =$id";
		$row['videos'] = $this->getAll($sql5); 

		return $row; 
	} 

	public function getEmptyRow($fields) 
	{ 
		$sql = "SELECT * FROM tbl_contents WHERE  id =0"; 
		$row = $this->getRow($sql); 
		
		$sql2 = "SELECT * FROM tbl_content_details WHERE content_id =$id"; 
		$row['details'] = $this->getAll($sql2); 
		
		$sql3 = "SELECT * FROM tbl_content_images WHERE content_id =$id";
		$row['images'] = $this->getAll($sql3); 

		

		return $row; 
	}

	public function getFieldsByCategoryId($categoryId) 
	{ 
		$sql = "SELECT * FROM tbl_categories WHERE id =$categoryId"; 
		$category = $this->getRow($sql); 
		$fieldset_id = $category['content_fieldset_id'] ;
		$sql = "SELECT * FROM tbl_fieldset_details WHERE fieldset_id = $fieldset_id";
		$fields = $this->getAll($sql); 
		return $fields; 
	} 

	public function insert($oldId,$title,$subcategory_id,$row_index,$last_row_index,$date, $details){
		
		$sql="UPDATE tbl_contents SET row_index = row_index + 1 WHERE subcategory_id = $subcategory_id AND row_index >= $row_index ";
		$this->execQuery($sql);

		$sql="INSERT INTO tbl_contents(title,subcategory_id,row_index,create_date) 
		VALUES('$title',$subcategory_id,$row_index,'$date')";
		$this->execQuery($sql);
		$id = $this->insert_id();
		
		$sqlimage = "UPDATE tbl_content_images SET content_id = $id WHERE content_id = $oldId";
		$this->execQuery($sqlimage);

		$sql="DELETE FROM tbl_content_details WHERE content_id = $id";			
		$this->execQuery($sql);

		foreach($details as $detail => $detail_value){
			
			$sql="INSERT INTO tbl_content_details(content_id,field_key,field_value) 
				VALUES($id,'$detail','$detail_value')";
			$this->execQuery($sql);
		}
	}

	public function update($id,$title,$subcategory_id,$row_index,$last_row_index, $details){
		$sql="UPDATE tbl_contents SET row_index = row_index + 1 WHERE subcategory_id = $subcategory_id AND row_index >= $row_index and row_index < $last_row_index";
		$this->execQuery($sql);

		$sql="UPDATE tbl_contents SET title = '$title',row_index = $row_index WHERE id = $id";
		$this->execQuery($sql);

		$sql="DELETE FROM tbl_content_details WHERE content_id = $id";			
		$this->execQuery($sql);

		foreach($details as $detail => $detail_value){
			$sql="INSERT INTO tbl_content_details(content_id,field_key,field_value) 
				VALUES($id,'$detail','$detail_value')";
			$this->execQuery($sql);
		}
	}

	public function saveImage($id,$image){
		$sql="INSERT INTO tbl_content_images(content_id,title) VALUES($id,'$image')";
		$this->execQuery($sql);
	}
	public function saveAudio($id,$audio){
		$sql="INSERT INTO tbl_content_sounds(content_id,title) VALUES($id,'$audio')";
		$this->execQuery($sql);
	}
	public function saveVideo($id,$video){
		$sql="INSERT INTO tbl_content_videos(content_id,title) VALUES($id,'$video')";
		$this->execQuery($sql);
	}
	public function getNewOrderIndex(){
		$sql = "SELECT * FROM tbl_contents ORDER BY row_index DESC"; 
		$subcategory = $this->getRow($sql); 
		return $subcategory['row_index'] + 1; 
	}
	
	
}
?>