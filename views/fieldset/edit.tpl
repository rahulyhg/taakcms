<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.table-sm > thead{
    text-align:center;
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
                <div class="content-row">
                    <div class="col-sm-2"><?php echo STRINGS['title'] ?> </div>
                    <div class="col-sm-10"><input name='title' class="form-control" value="<?php echo $fieldset['title']; ?>" /></div>
                </div>
                <div class="content-row" style="margin-top:10px">
                    <?php 

                        $tableId="mytbl";
                        $columns = array(
                            (object)['id'=>'field_id','type'=>'hidden','caption'=>''],
                            (object)['id'=>'field_order','type'=>'input','caption'=>STRINGS['order']],
                            (object)['id'=>'field_title','type'=>'input','caption'=>STRINGS['title']],
                            (object)['id'=>'field_title_latin','type'=>'input','caption'=>STRINGS['title_latin']],
                            (object)['id'=>'field_type','type'=>'select','caption'=>STRINGS['type'],'options'=>DataTypes],
                            (object)['id'=>'field_value','type'=>'input','caption'=>STRINGS['value']]);
                        
                        $data = $fieldset['details'];

                        require_once HOME . DS . 'views' . DS . 'components' . DS . 'grid.php'; 
                    ?>
                </div>
           
        </div>
        <div class="content-card-footer">
            <button class="btn btn-primary" type="submit" onclick="return validateSubmit();" ><?php echo STRINGS['save']?></button>
            <button class="btn btn-danger" type="button" onclick="cancel();"><?php echo STRINGS['cancel']?></button>
        </div>
        </form>
    </div>
    <script>
        function validateSubmit(){
            $('#mytbl').val(getTableData());
            return true;
        }

        function cancel(){
            window.location.href = 'index.php?id=fieldset/index';
        }
    </script>
     
</div>

<?php include('views/footer.tpl');?>

