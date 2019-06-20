<?php include('views/header.tpl');?>

<style>
.app_container{
    width: 90%;
    margin-top:30px;
    margin-bottom: auto;
    display: flex;
    flex-flow:row;
    flex-wrap: wrap;
    justify-content: center;

}
.app_item{
    width: 250px;
    align-content: center;
    text-align: left;
    background-color: white;
    cursor: pointer;
    margin: 10px;
    display: flex;
    flex-flow: column;
    border: 1px solid var(--border);
    border-radius: 4px;
}

.app_item:hover{
    cursor: pointer;
    box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
}
.app_actions{
    padding: 5px 10px;
    border-top: 1px solid var(--border);
}

.app_title{
    text-align: center;
    margin:10px;
    color: var(--fontcolor);
    height:24px;
}

.app_logo{
    width: 70px;
    height: 70px;
    border-radius: 50%;
    margin: auto; 
    text-align: center;
    background-color: white;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    margin-top: 40px;
    margin-bottom: 40px;
    
}
.fas{
  color:gray !important;
}
.fa-plus{
  line-height:191px;
  text-align:center;
  font-size:50px;

}
</style>
<div class="content">
  <div class="flexColumn">
    <div class="app_container" >

        <?php foreach($rows as $row) { $color = $row['color'] == '' ? '#a8fcfc80' : $row['color']; ?> 
          <div class="app_item" onclick="view_product(<?php echo $row['id']; ?>);">
            <div class="app_logo" style="border:1px solid <?php echo $row['color']; ?>; background-image:url('uploads/<?php echo $row['logo'] ?>');" ></div>
            <div class="app_title"><?php echo $row['title']; ?></div>
            <div class="app_actions">
                <button class="btn btn-sm btn-light" onclick="edit_product(<?php echo $row['id']; ?>)"><div class="fas fa-edit"></div></button>
                <button class="btn btn-sm btn-light" onclick="delete_product(<?php echo $row['id']; ?>);"><div class="fas fa-trash"></div></button>
            </div>
          </div>
        <?php } ?>
        <div class="app_item" onclick="add_product();">
          <span class="fas fa-plus "></span>
          <div class="app_actions">
                <div style="color:white">+</div>
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