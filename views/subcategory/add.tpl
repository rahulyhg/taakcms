<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.tab-content{
    height: 100%;
    background-color: white;
    border-left: 1px solid lightgray;
    border-right: 1px solid lightgrey;
    border-bottom: 1px solid lightgrey;
    padding-bottom: 20px;
}
</style>

<div class="content">
    <div class="content-card">
        <div class="content-card-header">
        </div>
        <div class="content-card-body-column">
            <form id="mainform" action="index.php?id=subcategory/save" method="post" class="taak_form" >
                <div class="tab-content">
                    <div id="home" class="container tab-pane active"><br>
                        <input type="hidden" name="id" id="id" readonly="readonly" value="<?php echo $values['id']; ?>" />
                        <input type="hidden" name="last_row_index" id="last_row_index" readonly="readonly" value="<?php echo $values['row_index']; ?>" />
                        <div class="form-group">
                            <label class="form-group-first" for="row_index"><?php echo STRINGS['row_index']  ?>:</label>
                            <input type="text" class="form-control form-group-last" name="row_index" value="<?php echo $values['row_index']; ?>" />
                        </div>
                        <div class="form-group">
                            <label class="form-group-first" for="title"><?php echo STRINGS['title']  ?>:</label>
                            <input type="text" class="form-control form-group-last" name="title" value="<?php echo $values['title']; ?>" />
                        </div>
                        <?php
                            require HOME . DS . 'views' . DS . 'components' . DS . 'field_generator.php';  
                        ?>
                    </div>
                </div>
            </form>
        </div>
        <div class="content-card-footer">
            <button class="btn btn-light btn-sm" id="btn_submit" type="submit" onclick="return validateSubmit();" ><?php echo STRINGS['save']?></button>
            <button class="btn btn-light btn-sm" type="button" onclick="cancel();"><?php echo STRINGS['cancel']?></button>
        </div>
    </div>
    <script>
        
        /**/
        $('#btn_submit').click(function(){
            $('#mainform').submit();
        });

        function validateSubmit(){
            return true;
        }

        function cancel(){
            window.location.href = 'index.php?id=subcategory/index/<?php echo $category_id ?>';
        }
    </script>
     
</div>

<?php include('views/footer.tpl');?>

