<?php
class subcategory_model extends model 
{ 
    public function getRowsByProductId($product_id){
        $sql = "SELECT * FROM tbl_subcategories WHERE product_id = $product_id"; 
		$rows = $this->getAll($sql); 
		return $rows; 
    }

    public function insert($id,$title,$logo,$content_fieldset_id,$has_audio,$has_video,$product_id,$active,$self_fieldset_id,$category_id,$has_image)
	{
      $sql="INSERT INTO tbl_subcategories(title,logo,content_fieldset_id,has_audio,has_video,product_id,active,self_fieldset_id,category_id,has_image) 
	  	VALUES('$title','$logo',$content_fieldset_id,$has_audio,$has_video,$product_id,$active,$self_fieldset_id,$category_id,$has_image)";
	  $this->execQuery($sql);
	}
//.................
	public function update($title ,$has_subcategory,$product_id, $id)
	{
       $sql="UPDATE tbl_subcategories SET title='$title',has_subcategory=$has_subcategory,product_id=$product_id WHERE id=$id";
	   $this->execQuery($sql);
	}
}
?>