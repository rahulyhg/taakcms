<?php include('views/header.tpl');?>

<div class="content">
  <div class="flexColumn">
    <div class="card shadow" style="max-width:600px;width: 100%;">
      <form action="index.php?id=product/save" method="post" class="taak_form" enctype="multipart/form-data" >
        <div class="card-header"><?php echo $page_title?></div>
        <div class="card-body">
          <input type="hidden" name="id" readonly="readonly" value="0"></td>
          <div class="form-group">
            <label for="title"><?php echo STRINGS['title']?>:</label>
            <input type="text" class="form-control" name="title" >
          </div>
          <div class="form-group">
            <label for="color"><?php echo STRINGS['color']?>:</label>
            <select name="color" class="custom-select">
              <option selected value=""></option>
                <?php foreach($colors as $color) { ?> 
                  <option style="color:var(--<?php echo $color; ?>)" value="<?php echo $color; ?>"><?php echo $color; ?></option>
                <?php } ?>
            </select>
          </div>
          <div class="form-group">
            <label for="logo"><?php echo STRINGS['logo']?>:</label>
            <input type="file" class="form-control-file border" name="logo" >
          </div>
          <div class="form-group">
            <label for="terms_and_conditions"><?php echo STRINGS['terms_and_conditions']?>:</label>
            <textarea type="text" class="form-control border" name="terms_and_conditions"></textarea>
          </div>
          <div class="form-group">
            <label for="about"><?php echo STRINGS['about']?>:</label>
            <textarea type="text" class="form-control border" name="about"></textarea>
          </div>
          <div class="form-group">
            <label for="banner_id"><?php echo STRINGS['banner_id']?>:</label>
            <input type="text" class="form-control border" name="banner_id"></textarea>
          </div>
        </div>
        <div class="card-footer">
          <button class="btn btn-primary" type="submit" ><?php echo STRINGS['save']?></button>
          <button class="btn btn-danger" type="button" onclick="cancel();"><?php echo STRINGS['cancel']?></button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
function cancel(){
  window.location.href = 'index.php?id=product/index';
}
</script>

<?php include('views/footer.tpl');?>