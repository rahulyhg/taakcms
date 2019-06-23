
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
            <?php echo $page_title; ?>
            <button type="primary" class="btn btn-sm btn-light" style="float:left;" onclick="add_new_subcategory();">
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
                    <th class="col-sm-3"><?php echo STRINGS['count'] . " " . $content_title; ?></th>
                    <th class="col-sm-2"><?php echo STRINGS['edit'] ?></th>
                </tr>
                </thead>
                <tbody>
                    <?php foreach($subcategories as $row) { ?> 
                    <tr class="d-flex" ondblclick="view_subcategory_contents(<?php echo $row['category_id']; ?>,<?php echo $row['id']; ?>)">
                        <td style="display:none;"><?php echo $row['id']; ?></td>
                        <td class="col-sm-1" ><?php echo $row['row_index']; ?></td>
                        <td class="col-sm-6" style="text-align:right;" ><?php echo $row['title']; ?></td>
                        <td class="col-sm-3" ><?php echo $row['content_count']; ?></td>
                        <td class="col-sm-2" >
                            <a class="fas fa-edit" onclick="edit(<?php echo $row['id']; ?>)" ></a>
                            <a class="fas fa-trash-alt"  onclick="deleterow(<?php echo $row['id']; ?>);" ></a>
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
        window.location.href = "index.php?id=subcategory/edit/"+ id;
    }
    function deleterow(id){
        window.location.href = "index.php?id=subcategory/delete/"+ id;
    }
    function view_subcategory_contents(category_id,subcategory_id){
        window.location.href = "index.php?id=content/view_contents/"+ category_id + "/" + subcategory_id ;
    }
    
    function add_new_subcategory(){
        window.location.href = "index.php?id=subcategory/add";
    }
</script>

<?php include('views/footer.tpl');?>
