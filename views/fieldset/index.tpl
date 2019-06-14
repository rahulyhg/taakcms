<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.content-card-body{
    
}
.content-card-item{
    width:100%;
    padding: 10px;
    border: 1px solid gray;
    cursor: pointer;
    margin:4px;
}
.content-card-item:hover{
    background-color:#ffffff94;
}

.content-card-item:hover{
    border:1px solid black;
    
}
.table{
    margin-top:10px;
}
.action-bar{
    width:100%;
    text-align:left;
}
</style>
<div class="content">
    <div class="content-card">
        <div class="content-card-header">
            <?php echo $page_title ?> 
        </div>
        <div class="content-card-body-column">
            <div class="action-bar">
                <button type="primary" class="btn btn-sm btn-light" onclick="add();">
                    <div class="fas fa-plus"></div>
                </button>
            </div>
            <table class="table table-bordered table-sm">
                <thead>
                <tr>
                    <th style="display:none;"></th>
                    <th><?php echo STRINGS['title'] ?></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                    <?php foreach($rows as $row) { ?> 
                    <tr>
                        <td style="display:none;"><?php echo $row['id']; ?></td>
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
        window.location.href = "index.php?id=fieldset/edit/"+ id;
    }
    function add(){
        window.location.href = "index.php?id=fieldset/add";
    }
</script>
<?php include('views/footer.tpl');?>

