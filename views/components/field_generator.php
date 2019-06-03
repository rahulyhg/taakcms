<?php foreach($fields as $field) { 
    if ($field['data_type'] == 'text'){ ?>
    
    <div class="form-group">
        <label for="<?php echo $field['title_latin']  ?>"><?php echo $field['title']  ?>:</label>
        <input type="text" class="form-control" name="<?php echo $field['title_latin']  ?>" />
    </div>
    <?php } else if ($field['data_type'] == 'select'){?>
    <div class="form-group">
        <label for="<?php echo $field['title_latin']  ?>"><?php echo $field['title']  ?>:</label>
        <select class="form-control" name="<?php echo $field['title_latin']  ?>" >
            <option value=''></option>
            <?php foreach(explode("/",$field['value']) as $opt){
                echo "<option value='" . $opt . "'>" . $opt . "</option>";
            } ?>
        </select>
    </div>
    <?php } else if ($field['data_type'] == 'yesno'){?>
    <div class="form-group">
        <label for="<?php echo $field['title_latin']  ?>"><?php echo $field['title']  ?>:</label>
        <input type="checkbox" />
    </div>
    <?php } ?> 
<?php } ?>
