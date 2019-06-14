
<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.table{
    margin-top:10px;
    text-align: center;
}
.table-bordered {
    border:1px solid white;
}
.action-bar{
    width:100%;
    text-align:left;
}
</style>
<div class="content" style="background-color:var(--background)">
    
    <div class="content-card">
        <div class="content-card-header">
            <?php echo $subcategory_title; ?>
            <button type="primary" class="btn btn-sm btn-light" style="float:left;" onclick="add_new_content();">
                    <div class="fas fa-plus"></div>
            </button>
        </div>
        <div class="content-card-body-column">
            <div class="action-bar">
                
            </div>
            <table class="table table-bordered table-sm">
                <thead>
                <tr class="d-flex">
                    <th style="display:none;"></th>
                    <th class="col-sm-1"><?php echo STRINGS['order'] ?></th>
                    <th class="col-sm-6"><?php echo STRINGS['title'] ?></th>
                    <th class="col-sm-3"><?php echo STRINGS['date'] ?></th>
                    <th class="col-sm-2"><?php echo STRINGS['edit'] ?></th>
                </tr>
                </thead>
                <tbody>
                    <?php foreach($contents as $row) { ?> 
                    <tr class="d-flex">
                        <td style="display:none;"><?php echo $row['id']; ?></td>
                        <td class="col-sm-1" ><?php echo $row['row_index']; ?></td>
                        <td class="col-sm-6" style="text-align:right;" ><?php echo $row['title']; ?></td>
                        <td class="col-sm-3" ><?php echo $row['title']; ?></td>
                        <td class="col-sm-2" >
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
