<?php 

function getvalue($fieldtitle,$values){
    foreach($values['details'] as $value) {
        if ($value['field_key'] == $fieldtitle) {
            return $value['field_value'];
        }
    }
    return "";
}

foreach($fields as $field) { 
    if ($field['data_type'] == 'text'){ ?>
    <div class="form-group">
        <label for="<?php echo $field['title_latin']  ?>"><?php echo $field['title']  ?>:</label>
        <input type="text" class="form-control" name="<?php echo $field['title_latin']  ?>" value="<?php echo getvalue($field['title_latin'],$values);  ?>" />
    </div>
    <?php } else if ($field['data_type'] == 'select'){?>
    <div class="form-group">
        <label for="<?php echo $field['title_latin']  ?>"><?php echo $field['title']  ?>:</label>
        <select class="form-control" name="<?php echo $field['title_latin']  ?>" value="<?php echo getvalue($field['title_latin'],$values);  ?>" >
            <option value=''></option>
            <?php foreach(explode("/",$field['value']) as $opt){
                echo "<option value='" . $opt . "' " . (getvalue($field['title_latin'],$values) == $opt ? "selected" : "")  . " >" . $opt . "</option>";
            } ?>
        </select>
    </div>
    <?php } else if ($field['data_type'] == 'yesno'){?>
    <div class="form-group">
        <label for="<?php echo $field['title_latin']  ?>"><?php echo $field['title']  ?>:</label>
        <input type="checkbox" <?php echo getvalue($field['title_latin'],$values) == 1 ? "checked" : "";  ?> />
    </div>
    <?php } ?> 
<?php } ?>
