<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.tab-content{
    height: 100%;
    background-color: white;
    border-left: 1px solid lightgray;
    border-right: 1px solid lightgrey;
    border-bottom: 1px solid lightgrey;
}
.imagestab{
    display:flex;
    flex-flow:column;
}
.image-containert{
    width: 100%;
    background-color: #e9ecef;
    padding: 5px;
    display:flex;
    flex-flow:row;
    flex-wrap:wrap;
    border: 1px solid lightgray;
}
.image-item{
    width: 80px;
    height: 60px;
    margin: 5px;
    border:1px solid lightgray;
    background-color: blue;
}
.image-item:hover{
    border:1px solid black;
    cursor:pointer;
}

.image-preview{
    width: 100%;
    padding: 10px;
    border: 1px solid lightgray;
}
.image-add{
    margin: 10px 0px;
}

.image-add-button{
    background-image:url('./includes/img/plusicon.png');
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    background-color: transparent;
}
#image-title{
    margin:10px;

}
.image-bar{
    padding:5px 0px;

}
</style>

<div class="content">
    <div class="content-card">
        <div class="content-card-header">
            <?php echo $page_title ?> 
        </div>
        <div class="content-card-body-column">
            <form id="mainform" action="index.php?id=content/save" method="post" class="taak_form" >
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#home"><?php echo STRINGS['details'] ?></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu1"><?php echo STRINGS['images'] ?></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu2"><?php echo STRINGS['sounds'] ?></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu3"><?php echo STRINGS['videos'] ?></a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div id="home" class="container tab-pane active"><br>
                        <input type="hidden" name="id" id="id" readonly="readonly" value="<?php echo $values['id']; ?>" />
                        <div class="form-group">
                            <label for="title"><?php echo STRINGS['title']  ?>:</label>
                            <input type="text" class="form-control" name="title" value="<?php echo $values['title']; ?>" />
                        </div>
                        <?php
                            require HOME . DS . 'views' . DS . 'components' . DS . 'field_generator.php';  
                        ?>
                    </div>
                    <div id="menu1" class="container tab-pane fade"><br>
                        <div class="imagestab">
                            <div class="image-containert">
                                <?php foreach($values['images'] as $image) { ?>
                                    <img class="image-item" onclick="handlePreviewImage(this,<?php echo $image['id'] ?>)"; src="./uploads/<?php echo $image['title'] ?>"></img>
                                <?php } ?>
                                <div class="image-item image-add-button" onclick="handleAddImage();"></div>
                            </div> 
                            <div id="image-preview">
                                <div class="image-bar"><span id="image-title"></span><button id="delete-image" type="button" class="btn btn-danger btn-sm">delete</button></div>
                                <img src="" id='imagepreview' class="image-preview" />
                            </div> 
                            <div class="image-add">
                                <form method="post" action="index.php?id=content/uploadimage" id="imageform" >
                                    <input type="file" name="newimage" id="newimage" />
                                    <button id="add_image" class="btn btn-primary btn-sm" type="button">Upload</button>
                                </form>
                            </div> 
                        </div>
                    </div>
                    <div id="menu2" class="container tab-pane fade"><br>
                        <audio preload="none" src="" controls="controls" style="float: left;width: 100%;"></audio>
                    </div>
                    <div id="menu3" class="container tab-pane fade"><br>
                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                    </div>
                </div>
            </form>
        </div>
        <div class="content-card-footer">
            <button class="btn btn-primary" id="btn_submit" type="submit" onclick="return validateSubmit();" ><?php echo STRINGS['save']?></button>
            <button class="btn btn-danger" type="button" onclick="cancel();"><?php echo STRINGS['cancel']?></button>
        </div>
    </div>
    <script>
        $('#image-preview').hide();
        $('.image-add').hide();
        var xhr = new XMLHttpRequest();
        xhr.onprogress = callback;
        
        function handleAddImage(){
            $('#image-preview').hide();
            $('.image-add').show();
        }

        function handlePreviewImage(row,id){
            $('#image-preview').show();
            $('.image-add').hide();
            $('#imagepreview')[0].src = row.src;
            $('#image-title').html(getFileNameFromPath(row.src));
            $('#delete-image').click(function(){
                xhr.open('POST', 'index.php?id=content/deleteImage/'+id, true);
            });
        }

        
        $("#add_image").click(function (event) {
            var fileInput = document.getElementById('newimage');
            var id = document.getElementById('id');
            var file = fileInput.files[0];
            var formData = new FormData();
            formData.append('image', file);
            formData.append('id', id.value);
            
            // Add any event handlers here...
            xhr.open('POST', 'index.php?id=content/uploadimage', true);


            //setting in load 
            $("#add_image")[0].disabled = true;
            xhr.send(formData);

        });
        $('#btn_submit').click(function(){
            $('#mainform').submit();
        });
        
        function callback(event){
            if (event.total === event.loaded){
                //unsetting in load 
                var fileInput = document.getElementById('newimage');
                let imageelement = document.createElement('img');
                imageelement.className = "image-item";
                imageelement.onclick = (function() {return function() {
                        handlePreviewImage(this);
                        }})();
                imageelement.src = "./uploads/" + getFileNameFromPath(fileInput.value) ;
                fileInput.value='';

                $('.image-containert .image-item:last').before(imageelement);
                $("#add_image")[0].disabled = false;
            }
            console.log(event);
        }
        
        function validateSubmit(){
            return true;
        }

        function cancel(){
            window.location.href = 'index.php?id=content/view_contents/1';
        }
    </script>
     
</div>

<?php include('views/footer.tpl');?>

