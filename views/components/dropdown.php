<select name="<?php echo $dropdownName ?>" class="custom-select">
    <option <?php echo $dropdownValue == "" ? 'selected' : ''; ?> value=""></option>
    <?php 
    foreach($datasource as $item => $item_value) { 
        echo "<option style='color:var(--" . $item . ")' value='" . $item . "' " . ($dropdownValue == $item ? 'selected' : '') . ">" . $item_value . "</option>";
    }
    ?>
</select>