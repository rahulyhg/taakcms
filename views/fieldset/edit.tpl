<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.table-sm > thead{
    text-align:center;
}
.form-group-last{
    width:100%;
}
</style>

<div class="content">
    <div class="content-card">
        <div class="content-card-header">
            <?php echo $page_title ?> 
        </div>
        <div class="content-card-body-column">
            <form action="index.php?id=fieldset/save" method="post" class="taak_form" >
                <input type="hidden" name="id" readonly="readonly" value="<?php echo $fieldset['id']; ?>"></td>
                <div class="form-group">
                    <label class="form-group-first" for="has_subcategory"><?php echo tr('title')?>:</label>
                    <input required="required" name='title' class="form-control" value="<?php echo $fieldset['title']; ?>"/>
                </div>
                <div class="content-row" style="margin-top:10px">
                    <?php 

                        $tableId="mytbl";
                        $columns = array(
                            (object)['id'=>'field_id','type'=>'hidden','caption'=>''],
                            (object)['id'=>'field_order','type'=>'input','caption'=>tr('order')],
                            (object)['id'=>'field_title','type'=>'input','caption'=>tr('title')],
                            (object)['id'=>'field_title_latin','type'=>'input','caption'=>tr('title_latin')],
                            (object)['id'=>'field_type','type'=>'select','caption'=>tr('type'),'options'=>DataTypes],
                            (object)['id'=>'field_value','type'=>'input','caption'=>tr('value')]);
                        
                        $data = $fieldset['details'];

                        require_once HOME . DS . 'views' . DS . 'components' . DS . 'grid.php'; 
                    ?>
                </div>
           
        </div>
        <div class="content-card-footer">
            <button class="btn btn-light" type="submit" onclick="return validateSubmit();" ><?php echo tr('save')?></button>
            <button class="btn btn-light" type="button" onclick="cancel();"><?php echo tr('cancel')?></button>
        </div>
        </form>
    </div>
    <script>
        function validateSubmit(){
            $('#mytbl').val(getTableData());
            return validateRequiredFields();
        }

        function cancel(){
            window.location.href = 'index.php?id=fieldset/index';
        }
    </script>
     
</div>

<?php include('views/footer.tpl');?>

