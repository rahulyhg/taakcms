<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>

</style>

<div class="content">
    <div class="content-card">
        <div class="content-card-header">
            <?php echo $page_title ?> 
        </div>
        <div class="content-card-body-column">
            <form action="index.php?id=content/save" method="post" class="taak_form" >
                <input type="hidden" name="id" readonly="readonly" value="0"></td>
                <div class="form-group">
                    <label for="title"><?php echo STRINGS['title']  ?>:</label>
                    <input type="text" class="form-control" name="title" >
                </div>
                <?php foreach($fields as $field) { ?>
                    <div class="form-group">
                        <label for="<?php echo $field['title_latin']  ?>"><?php echo $field['title']  ?>:</label>
                        <input type="text" class="form-control" name="<?php echo $field['title_latin']  ?>" >
                    </div>
                <?php } ?>
                </div>
                <div class="content-card-footer">
                    <button class="btn btn-primary" type="submit" onclick="return validateSubmit();" ><?php echo STRINGS['save']?></button>
                    <button class="btn btn-danger" type="button" onclick="cancel();"><?php echo STRINGS['cancel']?></button>
                </div>
        </form>
    </div>
    <script>
        function validateSubmit(){
            return true;
        }

        function cancel(){
            window.location.href = 'index.php?id=content/view_contents/1';
        }
    </script>
     
</div>

<?php include('views/footer.tpl');?>

