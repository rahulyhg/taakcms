<?php include('views/header.tpl');?>
<style>
.app-logo{
  width: 80;
  height: 60;
  background-size: cover;
}
.form-group-first{
  width:30%;
}
</style>
<div class="content">
  <div class="flexColumn">
    <div class="content-card" style="max-width:600px;width: 100%;">
      <form action="index.php?id=product/save" method="post" class="taak_form" enctype="multipart/form-data" >
        <div class="content-card-header"><?php echo $page_title?></div>
        <div class="content-card-body-column">
          <input type="hidden" name="id" readonly="readonly" value="<?php echo $row['id'] ?>"></td>
          <div class="form-group">
            <label class="form-group-first" for="title"><?php echo tr('title')?>:</label>
            <input type="text" required="required" class="form-control form-group-last" name="title" value="<?php echo $row['title'] ?>" >
          </div>
          <div class="form-group">
            <label class="form-group-first" for="color"><?php echo tr('color')?>:</label>
            <?php $dropdownName="color"; $datasource=$colors; $dropdownValue=$row['color']; $disabled=false; require_once HOME . DS . 'views' . DS . 'components' . DS . 'dropdown.php' ?>
          </div>
          <div class="form-group">
            <label class="form-group-first" class="form-group-first" for="logo"><?php echo tr('logo')?>:</label>
            <div class="form-group-last">
              <input type="file" class="form-control-file border" name="logo" value="<?php echo $row['logo'] ?>" >
              <div class="app-logo " style="background-image:url('uploads/<?php echo $row['logo'] ?>');" ></div>
            </div>
          </div>
          <div class="form-group">
            <label class="form-group-first" for="terms_and_conditions"><?php echo tr('terms_and_conditions')?>:</label>
            <textarea type="text" class="form-control border form-group-last" name="terms_and_conditions"><?php echo $row['terms_and_conditions'] ?></textarea>
          </div>
          <div class="form-group">
            <label class="form-group-first" for="about"><?php echo tr('about')?>:</label>
            <textarea type="text" class="form-control border form-group-last" name="about"><?php echo $row['about'] ?></textarea>
          </div>
          <div class="form-group">
            <label class="form-group-first" for="banner_id"><?php echo tr('banner_id')?>:</label>
            <input type="text" class="form-control border form-group-last" name="banner_id" value="<?php echo $row['baner_contentId'] ?>"></textarea>
          </div>
          <div class="form-group">
            <label class="form-group-first" for="banner_id">api key:</label>
            <label class="form-control border form-group-last" ><?php echo $row['api_key']; ?></textarea>
          </div>
        </div>
        <div class="content-card-footer">
          <button class="btn btn-light btn-sm" type="submit" onclick="return validateSubmit();" ><?php echo tr('save')?></button>
          <button class="btn btn-light btn-sm" type="button" onclick="cancel();"><?php echo tr('cancel')?></button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
function cancel(){
  window.location.href = 'index.php?id=product/index';
}
function validateSubmit(){
  return validateRequiredFields();
}
</script>
<?php include('views/footer.tpl');?>