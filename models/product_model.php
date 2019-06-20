<?php
class product_model extends model 
{ 
	public function getRows() 
	{ 
		$rows = $this->getAll("SELECT * FROM tbl_products"); 
		return $rows ; 
	} 
//.................	
	public function getRowById($id) 
	{ 
		$sql = "SELECT * FROM tbl_products WHERE  id =$id"; 
		$row = $this->getRow($sql); 
		return $row; 
	} 
//.................	
	public function delete($id)
	{
       $sql="DELETE FROM tbl_products WHERE id=$id";
	   $this->execQuery($sql);
	}	
//.................
	public function insert($title,$logo,$color, $terms_and_conditions, $about, $banner_id)
	{
      $sql="INSERT INTO tbl_products(title,logo,color, terms_and_conditions, about, baner_contentId) 
	  	VALUES('$title','$logo','$color', '$terms_and_conditions', '$about', $banner_id)";
	  $this->execQuery($sql);
	}
//.................
	public function update($title, $logo, $color, $terms_and_conditions, $about, $banner_id, $id)
	{
		$logoUpdate = $logo !== "" ? "logo= '$logo',":"";
       	$sql="UPDATE tbl_products SET title='$title',color='$color',$logoUpdate terms_and_conditions='$terms_and_conditions',about='$about',baner_contentId='$banner_id' WHERE id=$id";
	   	$this->execQuery($sql);
	}

	public function getColors(){
		$colors;
		$colors['blue'] = 'blue';
		$colors['red'] = 'red';
		$colors['indigo'] = 'indigo';
		$colors['purple'] = 'purple';
		$colors['pink'] = 'pink';
		$colors['orange'] = 'orange';
		$colors['yellow'] = 'yellow';
		$colors['green'] = 'green';
		$colors['teal'] = 'teal';
		$colors['cyan'] = 'cyan';
		$colors['gray'] = 'gray';
		return $colors;
	}

	

}
?>