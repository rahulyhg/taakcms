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
            <form action="index.php?id=fieldset/saveonly" method="post" class="taak_form" >
                <input type="hidden" name="id" readonly="readonly" value="0"></td>
                <div class="content-row">
                    <div class="col-sm-2"><?php echo STRINGS['title'] ?> </div>
                    <div class="col-sm-10"><input name='title' class="form-control" /></div>
                </div>
                <div class="content-row" style="margin-top:10px">
                    <table class="table table-sm">
                        <thead>
                            <tr>
                            <th scope="col"></th>
                            <th scope="col">#</th>
                            <th scope="col"><?php echo STRINGS['title'] ?></th>
                            <th scope="col"><?php echo STRINGS['title_latin'] ?></th>
                            <th scope="col"><?php echo STRINGS['type'] ?></th>
                            <th scope="col"><?php echo STRINGS['value'] ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <th scope="row"><button type="submit" class="btn btn-primary btn-sm">+</button></th>
                            <th><input id="field_title" class="form-control form-control-sm" /></th>
                            <td><input id="field_title" class="form-control form-control-sm" /></td>
                            <td><input id="field_title_latin" class="form-control form-control-sm" /></td>
                            <td><input id="field_type" class="form-control form-control-sm" /></td>
                            <td><input id="field_value" class="form-control form-control-sm" /></td>
                            </tr>
                        </tbody>
                        </table>
                </div>
           
        </div>
        <div class="content-card-footer">
            <button class="btn btn-primary" type="submit" ><?php echo STRINGS['save']?></button>
            <button class="btn btn-danger" type="button" onclick="cancel();"><?php echo STRINGS['cancel']?></button>
        </div>
        </form>
    </div>
     
</div>
<script>
    
</script>
<?php include('views/footer.tpl');?>

