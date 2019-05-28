
<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>

<div class="content" style="background-color:var(--<?php echo $_SESSION['product_color'] ?>-light)">
    <div>
        <button type="primary" class="btn btn-sm btn-primary" onclick="add_new_content();"><?php echo STRINGS['add'] ?></button>
    </div>
</div>
<script>
    function add_new_content(){
        window.location.href = "index.php?id=content/add";
    }
</script>

<?php include('views/footer.tpl');?>
