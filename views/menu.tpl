<style>
.menu{
    
    width: 300px;
    display:flex;
    flex-flow:column;
    justify-content:start;
    height: calc(100vh - 56px);
}

.menu_title{
    font-size:x-large;
    padding: 5px;
    display:flex;
    flex-flow:row;
    color:<?php echo $_SESSION['product_color'] ?>
}
.menu_categories{
    margin: 10px 0px;
}
.menu_actions{
    display:flex;
    flex-flow:row;
}

.menu_actions > button{
    width: 100%;
    margin:2px;
    font-size:smaller;
}

.list-group-item-action > button{
    float:left;
    cursor:pointer;
    margin-left:4px;
}
.list-group-flush >li{
    cursor:pointer;
}
.list-group-item:hover , .list-group-item.active{
    background-color:var(--background);
    border:1px solid var(--background);
    color:var(--fontcolor);

}
</style>

<div class="menu">

    <div class="menu_title">
        <a href="index.php?id=content/index/<?php echo $_SESSION['product_id'] ?>"> <?php echo $_SESSION['product_title'] ?> </a>
        <?php if (isAdmin()) { ?>
            <button style="margin-right: auto;" data-toggle="tooltip" title="<?php echo tr('manage_fieldsets') ?>" type="button" class="btn btn-sm btn-light" onclick="manage_fieldsets();">
                <div class="fas fa-cog"></div>
            </button>
            <button type="button" data-toggle="tooltip" title="<?php echo tr('add_category') ?>" class="btn btn-sm btn-light" onclick="add_category();">
                <div class="fas fa-plus"></div>
            </button>
        <?php } ?>
    </div>
    <div class="menu_categories">
        <ul class="list-group list-group-flush">
            <?php foreach($_SESSION['categories'] as $category) { $isActive = $_SESSION['active_category_id'] == $category['id']; ?> 
            <li onclick="view_contents(<?php echo $category['id']; ?>,<?php echo $category['subcategory_id']; ?>);" class="list-group-item list-group-item-action <?php echo $isActive ? 'active' : ''; ?> ">
                <?php echo $category['title']; ?>
                <?php if (isAdmin()) { ?>
                    <button class="btn btn-sm btn-light" onclick="delete_category(<?php echo $category['id']; ?>)"><div class="fas fa-trash"></div></button>
                    <button class="btn btn-sm btn-light" onclick="edit_category(<?php echo $category['id']; ?>)"><div class="fas fa-edit"></div></button>
                <?php } ?>
            </li>
            <?php } ?>
            <?php if (count($_SESSION['categories']) == 0) { 
                echo tr('nodacategory');
                } ?>
        </ul>
    </div>
    <script>
        function edit_category(id){
            var e = window.event;
            e.cancelBubble = true;
            if (e.stopPropagation) e.stopPropagation();
            window.location.href = "index.php?id=category/edit/" + id;
        }
        function delete_category(id){
            var e = window.event;
            e.cancelBubble = true;
            if (e.stopPropagation) e.stopPropagation();
            window.location.href = "index.php?id=category/delete/" + id;
        }
        function manage_fieldsets(){
            window.location.href = "index.php?id=fieldset/index";
        }
        function add_category(){
            window.location.href = "index.php?id=category/add";
        }

        function view_contents(category_id,subcategory_id){
            if (subcategory_id == 0){
                window.location.href = "index.php?id=subcategory/index/" + category_id;
            }else{
                window.location.href = "index.php?id=content/view_contents/" + category_id + "/" + subcategory_id;
            }
        }
    </script>

</div>