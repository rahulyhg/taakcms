<style>
.menu{
    background-color: #f1f2f3;
    width: 300px;
    display:flex;
    flex-flow:column;
    justify-content:start;
    height: calc(100vh - 56px);
}

.menu_title{
    font-size:xx-large;
    text-align: center;
    color:<?php echo $_SESSION['product_color'] ?>
}
.menu_categories{
    
}
.menu_actions{
    display:flex;
    flex-flow:row;
}

.menu_actions > a{
    width: 100%;
    margin:2px;
    font-size:smaller;
}

.list-group-item-action > a{
    float:left;
    cursor:pointer;
    margin-left:4px;
}
.list-group-flush >li{
    cursor:pointer;
}
</style>

<div class="menu">

    <div class="menu_title">
        <a href="index.php?id=content/index/<?php echo $_SESSION['product_id'] ?>"> <?php echo $_SESSION['product_title'] ?> </a>
    </div>
    <div class="menu_categories">
        <ul class="list-group list-group-flush">
            <?php foreach($_SESSION['categories'] as $category) { $isActive = $_SESSION['active_category_id'] == $category['id']; ?> 
            <li onclick="view_contents(<?php echo $category['id']; ?>);" class="list-group-item list-group-item-action <?php echo $isActive ? 'active' : ''; ?> ">
                <?php echo $category['title']; ?>
                <a class="fas fa-trash-alt" onclick="delete_category(<?php echo $category['id']; ?>)" ></a>
                <a class="fas fa-edit" onclick="edit_category(<?php echo $category['id']; ?>)" ></a>
            </li>
            <?php } if (count($_SESSION['categories']) == 0) { ?>
                no category defined!
            <?php } ?>
            
        </ul>
    </div>
    <div class="menu_actions">
        <a class="btn btn-secondary btn-lg" href='index.php?id=category/add' ><?php echo STRINGS['add_category'] ?></a>
        <a class="btn btn-secondary btn-lg" href='index.php?id=fieldset/index' ><?php echo STRINGS['manage_fieldsets'] ?></a>
    </div>
    <script>
        function view_contents(id){
            window.location.href = "index.php?id=content/view_contents/" + id;
        }
    </script>

</div>