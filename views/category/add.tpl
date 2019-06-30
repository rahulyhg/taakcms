<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.form-group-first{
  width:40%;
}
.form-group-last{
  width:60%;
}
</style>
<div class="content">
  <div class="flexColumn">
    <div class="content-card" style="max-width:600px;width: 100%;">
      <form action="index.php?id=category/save" method="post" class="taak_form" enctype="multipart/form-data" >
        <div class="content-card-header"><?php echo $page_title?></div>
        <div class="content-card-body-column">
          <input type="hidden" name="id" readonly="readonly" value="<?php echo $row['id']; ?>"></td>
          <div class="form-group">
            <label class="form-group-first" for="title"><?php echo tr('title')?>:</label>
            <input type="text" class="form-control form-group-last" name="title" required="required" value="<?php echo $row['title']; ?>" >
          </div>
          <div class="form-group">
            <label class="form-group-first" for="content_fieldset"><?php echo tr('content_fieldset')?>:</label>
            <?php 
              $dropdownName="content_fieldset"; 
              $disabled=false; 
              $datasource=$fieldsets; 
              $dropdownValue=$row['content_fieldset_id'];  
              $required=true;
              require_once HOME . DS . 'views' . DS . 'components' . DS . 'dropdown.php' 
            ?>
          </div>
          
          <div class="form-group">
            <label class="form-group-first" for="has_subcategory"><?php echo tr('has_subcategory')?>:</label>
            <input type="checkbox" name="has_subcategory" id="has_subcategory" <?php echo ($row["has_subcategory"] == 1 ? "checked" : ""); ?> />
          </div>
          <div class="form-group">
            <label class="form-group-first" for="subcategory_fieldset"><?php echo tr('subcategory_fieldset')?>:</label>
            <?php 
              $dropdownName="subcategory_fieldset"; 
              $disabled=$row['id'] == 0 || $row['has_subcategory'] == 0; 
              $datasource=$fieldsets; 
              $dropdownValue=$row['subcategory_fieldset_id'] ;  
              $required=false;
              require HOME . DS . 'views' . DS . 'components' . DS . 'dropdown.php' 
            ?>
          </div>
        </div>
        <div class="content-card-footer">
          <button class="btn btn-light btn-sm" type="submit" onclick="return validateRequiredFields();" ><?php echo tr('save')?></button>
          <button class="btn btn-light btn-sm" type="button" onclick="cancel();"><?php echo tr('cancel')?></button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>

$('#has_subcategory').change(function(){
  $('#subcategory_fieldset').prop('disabled', !this.checked) ;
});

$('.has_audio').prop('indeterminate', true)
function cancel(){
  window.location.href = 'index.php?id=content/index/<?php echo $product_id; ?>';
}

</script>

<?php include('views/footer.tpl');?>