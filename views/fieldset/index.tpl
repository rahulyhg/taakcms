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

</style>
<div class="content">
    <div class="content-card">
        <div class="content-card-header">
            <?php echo $page_title ?> 
        </div>
        <div class="content-card-body">
                <?php foreach($rows as $row) { ?> 
                <div class="content-card-item" onclick="edit(<?php echo $row['id'] ?>);">
                    <?php echo $row['title'] ?>
                </div>
                <?php } ?>
                <div class="content-card-item" onclick="add();">
                    <?php echo STRINGS['add'] ?>
                </div>
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

