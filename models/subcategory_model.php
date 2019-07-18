<?php
class subcategory_model extends model 
{ 
    public function getRowsByProductId($product_id){
        $sql = "SELECT * FROM tbl_subcategories WHERE product_id = $product_id"; 
		$rows = $this->getAll($sql); 
		return $rows; 
	}
	public function getSubcategories($category_id){
		$sql = "SELECT * FROM vw_subcategories WHERE category_id = $category_id ORDER BY row_index"; 
		$rows = $this->getAll($sql); 
		
		return $rows; 
	}

	public function getSubcategoriesForApi($category_id,$conditions){
		$ids=[];
		foreach ($conditions as $condition){
			$sql = 'SELECT subcategory_id FROM tbl_subcategory_details 
			WHERE field_key ="' . $condition->field . '" AND field_value = "' . $condition->value . '"';
			$rows = $this->getAll($sql); 
			$res = array_map(function ($object) { 
				return $object['subcategory_id']; 
			}, $rows);
			if (count($res) > 0){
				array_push($ids, $res);
			}
		}
		$whereContition="";
		if (count($ids) > 0){
			$whereContition = " AND id in (" . implode(',',$ids[0]) . ") ";
		}
		$sql = "SELECT * FROM tbl_subcategories WHERE category_id = $category_id " . $whereContition ." ORDER BY row_index"; 
		$rows = $this->getAll($sql); 

		$counter=0;
		foreach($rows as $subcategory){
			$subcategory_id = $subcategory['id'];
			$sql2 = "SELECT * FROM tbl_subcategory_details WHERE subcategory_id =$subcategory_id"; 
			foreach ($this->getAll($sql2) as $detail){
				$rows[$counter][$detail['field_key']] = $detail['field_value'];
			} 

			$sql4 = "SELECT * FROM tbl_subcategory_sounds WHERE subcategory_id =$subcategory_id";
			$audios =  $this->getAll($sql4);
			foreach($audios as $key => $audio){
				$audios[$key]['url'] = getServerAddress() . "/uploads" . "/" . $audio['filename'];
			}
			$rows[$counter]['sounds'] =$audios; 

			$sql4 = "SELECT * FROM tbl_subcategory_images WHERE subcategory_id =$subcategory_id";
			$images =  $this->getAll($sql4);
			foreach($images as $key => $image){
				$images[$key]['url'] = getServerAddress() . "/uploads" . "/" . $image['filename'];
			}
			$rows[$counter]['images'] =$images; 

			$sql4 = "SELECT * FROM tbl_subcategory_videos WHERE subcategory_id =$subcategory_id";
			$videos =  $this->getAll($sql4);
			foreach($videos as $key => $video){
				$videos[$key]['url'] = getServerAddress() . "/uploads" . "/" . $video['filename'];
			}
			$rows[$counter]['videos'] =$videos; 
			
			$counter++;
		}

		return $rows;
	}

	public function getRowById($id) 
	{ 
		$sql = "SELECT * FROM tbl_subcategories WHERE  id =$id"; 
		$row = $this->getRow($sql); 
		
		$sql2 = "SELECT * FROM tbl_subcategory_details WHERE subcategory_id =$id"; 
		$row['details'] = $this->getAll($sql2); 

		$sql3 = "SELECT * FROM tbl_subcategory_images WHERE subcategory_id =$id";
		$row['images'] = $this->getAll($sql3); 
		
		$sql4 = "SELECT * FROM tbl_subcategory_sounds WHERE subcategory_id =$id";
		$row['sounds'] = $this->getAll($sql4); 

		$sql5 = "SELECT * FROM tbl_subcategory_videos WHERE subcategory_id =$id";
		$row['videos'] = $this->getAll($sql5); 

		return $row; 
	} 
	
    public function insert($title,$category_id,$row_index,$details)
	{
		$sql="UPDATE tbl_subcategories SET row_index = row_index + 1 WHERE row_index >= $row_index ";
		$this->execQuery($sql);

		$sql="INSERT INTO tbl_subcategories(title,category_id,row_index) 
		VALUES('$title',$category_id,$row_index)";
		$this->execQuery($sql);
		$id = $this->insert_id();
		
		$sql="DELETE FROM tbl_subcategory_details WHERE subcategory_id = $id";			
		$this->execQuery($sql);

		foreach($details as $detail => $detail_value){
			$sql="INSERT INTO tbl_subcategory_details(subcategory_id,field_key,field_value) 
				VALUES($id,'$detail','$detail_value')";
			$this->execQuery($sql);
		}
	}
	//.................
	public function update($id,$title,$category_id,$row_index,$last_row_index,$details)
	{
		$sql="UPDATE tbl_subcategories SET row_index = row_index + 1 WHERE category_id = $category_id AND row_index >= $row_index and row_index < $last_row_index";
		$this->execQuery($sql);

		$sql="UPDATE tbl_subcategories SET title = '$title',row_index=$row_index WHERE id = $id";
		$this->execQuery($sql);

		$sql="DELETE FROM tbl_subcategory_details WHERE subcategory_id = $id";			
		$this->execQuery($sql);

		foreach($details as $detail => $detail_value){
			$sql="INSERT INTO tbl_subcategory_details(subcategory_id,field_key,field_value) 
				VALUES($id,'$detail','$detail_value')";
			$this->execQuery($sql);
		}
	}

	public function getSubcategoryId($category_id){
		$sql = "SELECT * FROM tbl_subcategories WHERE category_id = $category_id"; 
		$rows = $this->getRow($sql); 
		return $rows['category_id']; 
	}
	public function getContentPureTitle($category_id){
		$sql = "SELECT * FROM tbl_categories WHERE id = $category_id"; 
		$category = $this->getRow($sql); 
		$fieldset_id = $category['content_fieldset_id'];

		$sql2 = "SELECT * FROM tbl_fieldsets WHERE id = $fieldset_id"; 
		$fieldset = $this->getRow($sql2); 

		return $fieldset['title']; 
	}
	public function getContentTitle($category_id,$subcategory_id){
		$sql = "SELECT * FROM tbl_categories WHERE id = $category_id"; 
		$category = $this->getRow($sql); 
		$content_pure_title = $this->getContentPureTitle($category_id);
		$subcategory_title="";
		if ($category['has_subcategory'] == "1"){
			$sql3 = "SELECT * FROM tbl_subcategories WHERE id = $subcategory_id"; 
			$subcategory = $this->getRow($sql3);
			$subcategory_title = $subcategory['title'] . ' - ' ;
		}
		
		return $subcategory_title . $content_pure_title; 
	}
	public function getSubcategoryTitle($category_id){
		$sql = "SELECT * FROM tbl_categories WHERE id = $category_id"; 
		$category = $this->getRow($sql); 
		$fieldset_id = $category['subcategory_fieldset_id'];
		$sql2 = "SELECT * FROM tbl_fieldsets WHERE id = $fieldset_id"; 
		$fieldset = $this->getRow($sql2); 
		
		return $fieldset['title']; 
	}

	public function getNewOrderIndex($category_id){
		$sql = "SELECT * FROM tbl_subcategories WHERE category_id = $category_id ORDER BY row_index DESC"; 
		$subcategory = $this->getRow($sql); 
		return $subcategory['row_index'] + 1; 
	}
	public function delete($id)
	{
       $sql="DELETE FROM tbl_subcategories WHERE id=$id";
	   $this->execQuery($sql);
	}	
	public function saveImage($id,$image,$title){
		$sql="INSERT INTO tbl_subcategory_images(subcategory_id,title,filename) VALUES($id,'$title','$image')";
		$this->execQuery($sql);
	}
	public function saveAudio($id,$audio,$title){
		$sql="INSERT INTO tbl_subcategory_sounds(subcategory_id,title,filename) VALUES($id,'$title','$audio')";
		$this->execQuery($sql);
	}
	public function saveVideo($id,$video,$title){
		$sql="INSERT INTO tbl_subcategory_videos(subcategory_id,title,filename) VALUES($id,'$title','$video')";
		$this->execQuery($sql);
	}
}
?>