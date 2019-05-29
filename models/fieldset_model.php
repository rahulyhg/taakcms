<?php
class fieldset_model extends model 
{ 
    public function getRows(){
			$sql = "SELECT * FROM tbl_fieldsets"; 
			$rows = $this->getAll($sql); 
			return $rows; 
        
		}
		public function getRowsForDrowdown(){
			$sql = "SELECT * FROM tbl_fieldsets"; 
			$rows = $this->getAll($sql); 
			$fieldsets;
			foreach($rows as $row)
				$fieldsets[$row['id']] = $row['title'];

			return $fieldsets; 
		}
    public function getRowById($id) 
		{ 
			$sql = "SELECT * FROM tbl_fieldsets WHERE id =$id"; 
			$row = $this->getRow($sql); 
			$sql = "SELECT * FROM tbl_fieldset_details WHERE fieldset_id =$id";
			$details = [];

			$rows = $this->getAll($sql);
			$index=0; 
			foreach($rows as $detail){
				$details[$index]['field_id'] = $detail['id'];
				$details[$index]['field_order'] = $detail['orderfield'];
				$details[$index]['field_title'] = $detail['title'];
				$details[$index]['field_title_latin'] = $detail['title_latin'];
				$details[$index]['field_type'] = $detail['data_type'];
				$details[$index]['field_value'] = $detail['value'];
				$details[$index]['row_status'] = 'unchanged';
				$index++;
			}

			$row['details'] = $details; 
			return $row; 
    } 
    
    public function insert($title,$product_id,$fields)
		{
      $sql="INSERT INTO tbl_fieldsets(title,product_id) 
			VALUES('$title',$product_id)";
			$this->execQuery($sql);
			$id = $this->insert_id();
			foreach($fields as $field){
				$order = intval($field->field_order);
				if ($field->row_status == 'inserted'){
				$sql="INSERT INTO tbl_fieldset_details(fieldset_id,title,title_latin,data_type,value,orderfield) 
				VALUES($id,'$field->field_title','$field->field_title_latin','$field->field_type','$field->field_value',$order)";
				$this->execQuery($sql);
				}else if ($field->row_status == 'updated'){
				$sql="UPDATE tbl_fieldset_details
				SET title = '$field->field_title',title_latin = '$field->field_title_latin',data_type = '$field->field_type',value = '$field->field_value' ,order=$order
				WHERE id = $field->field_id";
				$this->execQuery($sql);
				}else if ($field->row_status == 'deleted'){
				$sql="DELETE tbl_fieldset_details WHERE id = $field->field_id";
				$this->execQuery($sql);
			}
	  }
		return $id;
	}
//.................
	public function update($title, $fields, $id)
	{
	   $sql="UPDATE tbl_fieldsets SET title='$title' WHERE id=$id";
	   $this->execQuery($sql);

	   foreach($fields as $field){
			$order = intval($field->field_order);
			if ($field->row_status == 'inserted'){
				$sql="INSERT INTO tbl_fieldset_details(fieldset_id,title,title_latin,data_type,value,orderfield) 
				VALUES($id,'$field->field_title','$field->field_title_latin','$field->field_type','$field->field_value',$order)";
				$this->execQuery($sql);
				}else if ($field->row_status == 'updated'){
				$sql="UPDATE tbl_fieldset_details
				SET title = '$field->field_title',title_latin = '$field->field_title_latin',data_type = '$field->field_type',value = '$field->field_value' ,orderfield=$order
				WHERE id = $field->field_id";
				$this->execQuery($sql);
				}else if ($field->row_status == 'deleted'){
				$sql="DELETE FROM tbl_fieldset_details WHERE id = $field->field_id";
				$this->execQuery($sql);
			}
		}
	}
}
?>