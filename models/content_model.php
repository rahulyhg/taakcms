<?php
class content_model extends model 
{ 
    public function getRowsBySubcategoryId($subcategory_id){
        $sql = "SELECT * FROM tbl_contents WHERE subcategory_id = $subcategory_id ORDER BY row_index"; 
		$rows = $this->getAll($sql); 
		return $rows; 
	}
	
    public function getFullRowsBySubcategoryId($subcategory_id){
        $sql = "SELECT * FROM tbl_contents WHERE subcategory_id = $subcategory_id ORDER BY row_index"; 
		$rows = $this->getAll($sql);
		$counter=0;
		foreach($rows as $row){
			$content_id = $row['id'];
			$sql2 = "SELECT * FROM tbl_content_details WHERE content_id =$content_id"; 
			foreach ($this->getAll($sql2) as $detail){
				$rows[$counter][$detail['field_key']] = $detail['field_value'];
			} 

			$sql4 = "SELECT * FROM tbl_content_sounds WHERE content_id =$content_id";
			$audios =  $this->getAll($sql4);
			foreach($audios as $key => $audio){
				$audios[$key]['url'] = getServerAddress() . "/uploads" . "/" . $audio['filename'];
			}
			$rows[$counter]['sounds'] =$audios; 
			$counter++;
		}

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
		$images = $this->getAll($sql3);
		foreach($images as $key => $image){
			$images[$key]['url'] = getServerAddress() . "/uploads" . "/" . $image['filename'];
		}
		$row['images'] = $images; 
		
		$sql4 = "SELECT * FROM tbl_content_sounds WHERE content_id =$id";
		$audios =  $this->getAll($sql4);
		foreach($audios as $key => $audio){
			$audios[$key]['url'] = getServerAddress() . "/uploads" . "/" . $audio['filename'];
		}
		$row['sounds'] =$audios; 

		$sql5 = "SELECT * FROM tbl_content_videos WHERE content_id =$id";
		$videos =  $this->getAll($sql5);
		foreach($videos as $key => $video){
			$videos[$key]['url'] = getServerAddress() . "/uploads" . "/" . $video['filename'];
		}
		$row['videos'] = $videos; 

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

	public function delete($id)
	{
       $sql="DELETE FROM tbl_contents WHERE id=$id";
	   $this->execQuery($sql);
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

	public function saveImage($id,$image,$title){
		$sql="INSERT INTO tbl_content_images(content_id,title,filename) VALUES($id,'$title','$image')";
		$this->execQuery($sql);
		return $this->insert_id();
	}
	public function saveAudio($id,$audio,$title){
		$sql="INSERT INTO tbl_content_sounds(content_id,title,filename) VALUES($id,'$title','$audio')";
		$this->execQuery($sql);
		return $this->insert_id();
	}
	public function saveVideo($id,$video,$title){
		$sql="INSERT INTO tbl_content_videos(content_id,title,filename) VALUES($id,'$title','$video')";
		$this->execQuery($sql);
		return $this->insert_id();
	}
	public function getNewOrderIndex($subcategory_id){
		$sql = "SELECT * FROM tbl_contents WHERE subcategory_id = $subcategory_id ORDER BY row_index DESC"; 
		$subcategory = $this->getRow($sql); 
		return $subcategory['row_index'] + 1; 
	}

	public function deleteFile($id,$type){
		$table = "";
		switch($type){
			case 'audio':
				$table='tbl_content_sounds';
				break;
			case 'video':
				$table='tbl_content_videos';
				break;
			case 'image':
				$table='tbl_content_images';
				break;
			default:
				return;
		}
		$sql="DELETE FROM " . $table . " WHERE id = $id";
		$this->execQuery($sql);
	}
	
	
}
?>