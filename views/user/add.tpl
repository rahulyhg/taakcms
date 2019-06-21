<?php include('views/header.tpl');?>

<div class="content">
  <div class="flexColumn">
    <div class="content-card" style="max-width:600px;width: 100%;">
      <form action="index.php?id=user/save" method="post" class="taak_form" >
        <div class="content-card-header"><?php echo $page_title?></div>
        <div class="content-card-body-column">
          <input type="hidden" name="id" readonly="readonly" value="0"></td>
          <div class="form-group">
            <label class="form-group-first" for="username"><?php echo STRINGS['username']?>:</label>
            <input required="required" type="text" class="form-control form-group-last" name="username" >
          </div>
          <div class="form-group">
            <label class="form-group-first" for="fullname"><?php echo STRINGS['fullname']?>:</label>
            <input required="required" type="text" class="form-control form-group-last" name="fullname" >
          </div>
          <div class="form-group">
            <label class="form-group-first" for="role"><?php echo STRINGS['role']?>:</label>
            <?php $dropdownName="role"; $disabled=false; $datasource=$roles; $dropdownValue=""; require_once HOME . DS . 'views' . DS . 'components' . DS . 'dropdown.php' ?>
          </div>
          <div class="form-group">
            <label class="form-group-first" for="accessed_products"><?php echo STRINGS['accessed_products']  ?>:</label>

            <?php 

            $tableId='accessed_products';
            $columns = array(
                (object)['id'=>'field_id','type'=>'hidden','caption'=>''],
                (object)['id'=>'product','type'=>'select','caption'=>STRINGS['products'],'options'=>$products]);
               
                $data = [];
                
            require_once HOME . DS . 'views' . DS . 'components' . DS . 'grid.php'; 

            ?>
          </div>
        </div>
        <div class="content-card-footer">
          <button class="btn btn-light btn-sm" type="submit" onclick="return validateSubmit();" ><?php echo STRINGS['save']?></button>
          <button class="btn btn-light btn-sm" type="button" onclick="cancel();"><?php echo STRINGS['cancel']?></button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
$("input[required]").parent().children(0).addClass("required");
function cancel(){
  window.location.href = 'index.php?id=user/index';
}
function validateSubmit(){
    $('#accessed_products').val(getTableData());
  return validateRequiredFields();
}
</script>

<?php include('views/footer.tpl');?>