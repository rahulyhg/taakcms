<?php
class category_model extends model 
{ 
    public function getRowsByProductId($product_id){
        $sql = "SELECT * FROM tbl_categories WHERE product_id = $product_id"; 
		$rows = $this->getAll($sql); 
		foreach($rows as &$row){
			if ($row['has_subcategory']=="0"){
				$category_id = $row['id'];
				$sql2 = "SELECT * FROM tbl_subcategories WHERE category_id = $category_id"; 
				$subcategory = $this->getRow($sql2); 
				$row['subcategory_id'] = $subcategory['id'];
			}else{
				$row['subcategory_id'] = 0;
			}
		}
		return $rows; 
    }

    public function insert($title,$content_fieldset_id,$has_audio,$has_video,$has_image,$has_subcategory,$subcategory_fieldset_id,$product_id)
	{
      $sql="INSERT INTO tbl_categories(title,content_fieldset_id,has_audio,has_video,has_image,has_subcategory,subcategory_fieldset_id,product_id) 
	  	VALUES('$title',$content_fieldset_id,$has_audio,$has_video,$has_image,$has_subcategory,$subcategory_fieldset_id,$product_id)";
	  $this->execQuery($sql);
	  return $this->insert_id();
	}
//.................
	public function update($title,$content_fieldset_id,$has_audio,$has_video,$has_image,$has_subcategory,$subcategory_fieldset_id,$product_id, $id)
	{
       $sql="UPDATE tbl_categories SET title='$title',has_subcategory=$has_subcategory,content_fieldset_id=$content_fieldset_id,has_audio=$has_audio,has_video=$has_video,has_image=$has_image,subcategory_fieldset_id=$subcategory_fieldset_id WHERE id=$id";
	   $this->execQuery($sql);
	}
}
?>