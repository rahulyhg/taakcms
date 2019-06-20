<select name="<?php echo $dropdownName ?>" id="<?php echo $dropdownName ?>" class="custom-select form-group-last" <?php echo $disabled==true ? 'disabled':'' ?>>
    <option <?php echo $dropdownValue == "" ? 'selected' : ''; ?> value=""></option>
    <?php 
    foreach($datasource as $item => $item_value) { 
        echo "<option style='color:var(--" . $item . ")' value='" . $item . "' " . ($dropdownValue == $item ? 'selected' : '') . ">" . $item_value . "</option>";
    }
    ?>
</select>