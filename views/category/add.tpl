<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>

<div class="content">
  <div class="flexColumn">
    <div class="content-card" style="max-width:600px;width: 100%;">
      <form action="index.php?id=category/save" method="post" class="taak_form" enctype="multipart/form-data" >
        <div class="content-card-header"><?php echo $page_title?></div>
        <div class="content-card-body-column">
          <input type="hidden" name="id" readonly="readonly" value="0"></td>
          <div class="form-group">
            <label class="form-group-first" for="title"><?php echo STRINGS['title']?>:</label>
            <input type="text" class="form-control form-group-last" name="title" >
          </div>
          <div class="form-group">
            <label class="form-group-first" for="has_subcategory"><?php echo STRINGS['has_subcategory']?>:</label>
            <input type="checkbox" name="has_subcategory" />
          </div>
          <div class="form-group">
            <label class="form-group-first" for="fieldset"><?php echo STRINGS['fieldset']?>:</label>
            <?php $dropdownName="fieldset"; $datasource=$fieldsets; $dropdownValue="";  require_once HOME . DS . 'views' . DS . 'components' . DS . 'dropdown.php' ?>
          </div>
        </div>
        <div class="content-card-footer">
          <button class="btn btn-light btn-sm" type="submit" ><?php echo STRINGS['save']?></button>
          <button class="btn btn-light btn-sm" type="button" onclick="cancel();"><?php echo STRINGS['cancel']?></button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
function cancel(){
  window.location.href = 'index.php?id=category/index';
}
</script>

<?php include('views/footer.tpl');?>