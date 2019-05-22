<?php include('views/header.tpl');?>


<div class="content">
  <div class="flexColumn">
    <h1 style="margin:auto;"><?php echo STRINGS['please_select_a_product']; ?></h1>
    <div class="app_container" >

        <?php foreach($rows as $row) { $color = $row['color'] == '' ? '#a8fcfc80' : $row['color']; ?> 
          <div class="app_item" style="background-color:var(--<?php echo $color; ?>)" onclick="view_product(<?php echo $row['id']; ?>);">
            <div class="app_title"><?php echo $row['title']; ?></div>
            <div class="app_logo" style="background-image:url('uploads/<?php echo $row['logo'] ?>');" ></div>
            <div class="app_actions">
                <a class="fas fa-edit" onclick="edit_product(<?php echo $row['id']; ?>)" ></a>
                <a class="fas fa-trash-alt"  onclick="delete_product(<?php echo $row['id']; ?>);" ></a>
            </div>
          </div>
        <?php } ?>
        <div class="app_item" onclick="add_product();">
          <div class="app_title"><?php echo STRINGS['add_product']; ?></div>
          <div class="app_logo" style="background-image:url('includes/img/plusicon.png');" ></div>
          <div style="height:24px;">
            
          </div>
        </div>
    </div>
  </div>
</div>

<script>
  function view_product(id){
    window.location.href = "index.php?id=content/index/"+ id;
  }

  function edit_product(id){
    var e = window.event;
    e.cancelBubble = true;
    if (e.stopPropagation) e.stopPropagation();
    window.location.href = "index.php?id=product/edit/"+ id;
  }

  function delete_product(id){
    var e = window.event;
    e.cancelBubble = true;
    if (e.stopPropagation) e.stopPropagation();
    window.location.href = "index.php?id=product/delete/"+ id;
  }

  function add_product(){
    window.location.href = "index.php?id=product/add";
  }

</script>

<?php include('views/footer.tpl');?>