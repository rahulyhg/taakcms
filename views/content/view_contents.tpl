
<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.table{
    margin-top:10px;
}
.action-bar{
    width:100%;
}
</style>
<div class="content" style="background-color:var(--<?php echo $_SESSION['product_color'] ?>-light)">
    
    <div class="content-card">
        <div class="content-card-header">
            <?php echo $page_title ?> 
        </div>
        <div class="content-card-body-column">
            <div class="action-bar">
                <button type="primary" class="btn btn-sm btn-primary" onclick="add_new_content();"><?php echo STRINGS['add'] ?></button>
            </div>
            <table class="table table-bordered table-sm">
                <thead>
                <tr>
                    <th style="display:none;"></th>
                    <th><?php echo STRINGS['order'] ?></th>
                    <th><?php echo STRINGS['title'] ?></th>
                    <th><?php echo STRINGS['date'] ?></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                    <?php foreach($contents as $row) { ?> 
                    <tr>
                        <td style="display:none;"><?php echo $row['id']; ?></td>
                        <td><?php echo $row['row_index']; ?></td>
                        <td><?php echo $row['title']; ?></td>
                        <td><?php echo $row['title']; ?></td>
                        <td>
                            <a class="fas fa-edit" onclick="edit(<?php echo $row['id']; ?>)" ></a>
                            <a class="fas fa-trash-alt"  onclick="delete(<?php echo $row['id']; ?>);" ></a>
                        </td>
                    </tr>
                    <?php } ?>
                    
                </tbody>
            </table>
        </div>
    </div>

    
    
</div>
<script>
    function edit(id){
        window.location.href = "index.php?id=content/edit/"+ id;
    }
    
    function add_new_content(){
        window.location.href = "index.php?id=content/add";
    }
</script>

<?php include('views/footer.tpl');?>
