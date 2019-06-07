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
    background-color: #dc3545;
    padding: 10px 0px;
    display:flex;
    flex-flow:row;
    flex-wrap:wrap;
}
.image-item{
    width: 80px;
    height: 60px;
    margin:0px 5px;
    background-color: blue;
}
.image-item:first-child{
    margin-right:10px;
}
.image-preview{
    width: 100%;
}
.image-add{
    margin: 10px 0px;
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
                                <?php foreach($values['images'] as $image) {
                                    $path = './uploads/$image["title"]';
                                    echo '<img class="image-item" onclick="handlePreviewImage(this); src="'.$path.'"></img>';
                                } ?>
                                <div class="image-item" onclick="handleAddImage();">new image</div>
                            </div> 
                            <div id="image-preview">
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
                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
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
        $('.image-preview').hide();
        $('.image-add').hide();
        
        function handleAddImage(){
            $('.image-preview').hide();
            $('.image-add').show();
        }

        function handlePreviewImage(row){
            $('.image-preview').show();
            $('.image-add').hide();
            $('#imagepreview')[0].src = row.src;
        }

        var xhr = new XMLHttpRequest();
        xhr.onprogress = callback;
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
                fileInput.value='';
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

