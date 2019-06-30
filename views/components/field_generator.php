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
    if ($field['field_type'] == 'text'){ ?>
    <div class="form-group">
        <label class="form-group-first" for="<?php echo $field['field_title_latin']  ?>"><?php echo $field['field_title']  ?>:</label>
        <input type="text" class="form-control form-group-last" name="<?php echo $field['field_title_latin']  ?>" value="<?php echo getvalue($field['field_title_latin'],$values);  ?>" />
    </div>
    <?php } else if ($field['field_type'] == 'select'){?>
    <div class="form-group">
        <label class="form-group-first" for="<?php echo $field['field_title_latin']  ?>"><?php echo $field['field_title']  ?>:</label>
        <select class="form-control form-group-last form-control-sm" name="<?php echo $field['field_title_latin']  ?>" value="<?php echo getvalue($field['field_title_latin'],$values);  ?>" >
            <option value=''></option>
            <?php foreach(explode("/",$field['field_value']) as $opt){
                echo "<option value='" . $opt . "' " . (getvalue($field['field_title_latin'],$values) == $opt ? "selected" : "")  . " >" . $opt . "</option>";
            } ?>
        </select>
    </div>
    <?php } else if ($field['field_type'] == 'long_text'){?>
    <div class="form-group">
        <label class="form-group-first" for="<?php echo $field['field_title_latin']  ?>"><?php echo $field['field_title']  ?>:</label>
        <textarea type="text" class="form-control form-group-last" name="<?php echo $field['field_title_latin']  ?>" ><?php echo getvalue($field['field_title_latin'],$values);  ?></textarea>
    </div>
    <?php } else if ($field['field_type'] == 'string_list'){?>
    <div class="form-group">
        <label class="form-group-first" for="<?php echo $field['field_title_latin']  ?>"><?php echo $field['field_title']  ?>:</label>
        <?php 

            $tableId=$field['field_title_latin'];
            $columns = array(
                (object)['id'=>'field_id','type'=>'hidden','caption'=>''],
                (object)['id'=>'order','type'=>'input','caption'=>tr('order')],
                (object)['id'=>'title','type'=>'input','caption'=>tr('title')]);
                $res = getvalue($field['field_title_latin'],$values);
                if ($res == "")
                    $data = [];
                else
                    $data = json_decode($res,true);
            require_once HOME . DS . 'views' . DS . 'components' . DS . 'grid.php'; 

            ?>
    </div>
    <?php } else if ($field['field_type'] == 'yesno'){?>
    <div class="form-group">
        <label class="form-group-first" for="<?php echo $field['field_title_latin']  ?>"><?php echo $field['field_title']  ?>:</label>
        <input class="form-group-last" type="checkbox" <?php echo getvalue($field['field_title_latin'],$values) == 1 ? "checked" : "";  ?> />
    </div>
    <?php } ?> 
<?php } ?>
