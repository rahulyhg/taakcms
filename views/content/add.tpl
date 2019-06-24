<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.tab-content{
    height: 100%;
    background-color: white;
    border-left: 1px solid lightgray;
    border-right: 1px solid lightgrey;
    border-bottom: 1px solid lightgrey;
    padding-bottom: 20px;
}
.attachment-tab{
    display:flex;
    flex-flow:column;
}
.attachment-container{
    width: 100%;
    background-color: #e9ecef;
    padding: 5px;
    display:flex;
    flex-flow:row;
    flex-wrap:wrap;
    border: 1px solid lightgray;
}
.attachment-item{
    width: 80px;
    height: 60px;
    margin: 5px;
    border:1px solid lightgray;
    display: flex;
    justify-content: center;
    align-items: center;
}
.attachment-item:hover{
    border:1px solid black;
    cursor:pointer;
}

.attachment-preview{
    width: 100%;
    padding: 10px;
    border: 1px solid lightgray;
}
.attachment-add{
    margin: 10px 0px;
}

.attachment-add-button{
    display:flex;
    flex-flow:column;
    justify-content:center;
    align-items:center;
}
.attachment-title{
    margin:10px;

}
.attachment-bar{
    padding:5px 0px;
    padding-top: 20px;

}
</style>

<div class="content">
    <div class="content-card">
        <div class="content-card-header">
        </div>
        <div class="content-card-body-column">
            <form id="mainform" action="index.php?id=content/save" method="post" class="taak_form" >
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#home"><?php echo tr('details') ?></a>
                    </li>
                    <?php if ($has_image) { ?>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu1"><?php echo tr('images') ?></a>
                    </li>
                    <?php } ?>
                    <?php if ($has_audio) { ?>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu2"><?php echo tr('sounds') ?></a>
                    </li>
                    <?php } ?>
                    <?php if ($has_video) { ?>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu3"><?php echo tr('videos') ?></a>
                    </li>
                    <?php } ?>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div id="home" class="container tab-pane active"><br>
                        <input type="hidden" name="id" id="id" readonly="readonly" value="<?php echo $values['id']; ?>" />
                        <input type="hidden" name="last_row_index" id="last_row_index" readonly="readonly" value="<?php echo $values['row_index']; ?>" />
                        <div class="form-group">
                            <label class="form-group-first" for="row_index"><?php echo tr('row_index')  ?>:</label>
                            <input required="required" type="text" class="form-control form-group-last" name="row_index" value="<?php echo $values['row_index']; ?>" />
                        </div>
                        <div class="form-group">
                            <label class="form-group-first" for="title"><?php echo tr('title')  ?>:</label>
                            <input required="required" type="text" class="form-control form-group-last" name="title" value="<?php echo $values['title']; ?>" />
                        </div>
                        <?php
                            require HOME . DS . 'views' . DS . 'components' . DS . 'field_generator.php';  
                        ?>
                    </div>
                    <div id="menu1" class="container tab-pane fade"><br>
                        <div class="attachment-tab">
                            <div class="attachment-container" id="image-container">
                                <?php foreach($values['images'] as $image) { ?>
                                    <img class="attachment-item" onclick="handlePreviewImage(this,<?php echo $image['id'] ?>)"; src="./uploads/<?php echo $image['title'] ?>"></img>
                                <?php } ?>
                                <div class="attachment-add-button" onclick="handleAddImage();">
                                    <button type="button" class="btn btn-light btn-sm"> <div class="fas fa-plus"></div></button>
                                </div>

                            </div> 
                            <div id="image-preview" >
                                <div class="attachment-bar"><span id="image-title" class="attachment-title"></span><button id="delete-image" type="button" class="btn btn-light btn-sm"><div class="fas fa-times"></div></button></div>
                                <img src="" id='imagepreview' class="attachment-preview" />
                            </div> 
                            <div id="image-add" class="attachment-add">
                                <form method="post" action="index.php?id=content/uploadimage" id="imageform" >
                                    <input type="file" name="newimage" id="newimage" />
                                    <button id="add_image" class="btn btn-light btn-sm" type="button"><div class="fas fa-upload" ></div></button>
                                </form>
                            </div> 
                        </div>
                    </div>
                    <div id="menu2" class="container tab-pane fade"><br>
                        <div class="attachment-tab">
                            <div class="attachment-container" id="audio-container">
                                <?php if (isset($values['sounds'])) foreach($values['sounds'] as $sound) { ?>
                                    <div class="attachment-item" data-filepath="./uploads/<?php echo $sound['title'] ?>" onclick="handlePreviewAudio(this,<?php echo $sound['id'] ?>)"; >
                                        <div class="fas fa-music"></div>
                                    </div>
                                <?php } ?>
                                <div class="attachment-add-button" onclick="handleAddAudio();">
                                    <button type="button" class="btn btn-light btn-sm"> <div class="fas fa-plus"></div></button>
                                </div>
                            </div> 
                            <div id="audio-preview">
                                <div class="attachment-bar"><span id="audio-title" class="attachment-title"></span><button id="delete-audio" type="button" class="btn btn-light btn-sm"><div class="fas fa-times"></div></button></div>
                                <audio id="audiopreview" preload="none" src="" controls="controls" style="float: left;width: 100%;"></audio>
                            </div> 
                            <div id="audio-add" class="attachment-add">
                                <form method="post" action="index.php?id=content/uploadAudio" id="audioform" >
                                    <input type="file" name="newaudio" id="newaudio" />
                                    <button id="add_image" class="btn btn-light btn-sm" type="button"><div class="fas fa-upload" ></div></button>
                                </form>
                            </div> 
                        </div>
                    </div>
                    <div id="menu3" class="container tab-pane fade"><br>
                        <div class="attachment-tab">
                            <div class="attachment-container" id="video-container">
                                <?php if (isset($values['videos'])) foreach($values['videos'] as $video) { ?>
                                    <div class="attachment-item" data-filepath="./uploads/<?php echo $video['title'] ?>" onclick="handlePreviewVideo(this,<?php echo $video['id'] ?>)";>
                                        <div class="fas fa-video"></div>
                                    </div>
                                <?php } ?>
                                <div class="attachment-add-button" onclick="handleAddVideo();">
                                    <button type="button" class="btn btn-light btn-sm"> <div class="fas fa-plus"></div></button>
                                </div>
                            </div> 
                            <div id="video-preview">
                                <div class="attachment-bar"><span id="video-title" class="attachment-title"></span><button id="delete-video" type="button" class="btn btn-light btn-sm"><div class="fas fa-times"></div></button></div>
                                <video id="videopreview" preload="none" src="" controls="controls" style="float: left;width: 100%;"></video>
                            </div> 
                            <div id="video-add" class="attachment-add">
                                <form method="post" action="index.php?id=content/uploadVideo" id="videoform" >
                                    <input type="file" name="newvideo" id="newvideo" />
                                    <button id="add_image" class="btn btn-light btn-sm" type="button"><div class="fas fa-upload" ></div></button>
                                </form>
                            </div> 
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="content-card-footer">
            <button class="btn btn-light btn-sm" id="btn_submit" type="submit" onclick="return validateSubmit();" ><?php echo tr('save')?></button>
            <button class="btn btn-light btn-sm" type="button" onclick="cancel();"><?php echo tr('cancel')?></button>
        </div>
    </div>
    <script>
        $('#image-preview').hide();
        $('#image-add').hide();
        $('#audio-preview').hide();
        $('#audio-add').hide();
        $('#video-preview').hide();
        $('#video-add').hide();
        var xhr = new XMLHttpRequest();
        
        
        function handleAddImage(){
            $('#image-preview').hide();
            $('#image-add').show();
        }

        function handlePreviewImage(row,id){
            $('#image-preview').show();
            $('#image-add').hide();
            $('#imagepreview')[0].src = row.src;
            $('#image-title').html(getFileNameFromPath(row.src));
            $('#delete-image').click(function(){
                xhr.open('POST', 'index.php?id=content/deleteImage/'+id, true);
            });
        }

        
        $("#add_image").click(function (event) {
            xhr.onprogress = image_callback;
            upload('image');

        });
       
        
        function image_callback(event){
            if (event.total === event.loaded){
                //unsetting in load 
                var fileInput = document.getElementById('newimage');
                let imageelement = document.createElement('img');
                imageelement.className = "attachment-item";
                imageelement.onclick = (function() {return function() {
                        handlePreviewImage(this);
                        }})();
                imageelement.src = "./uploads/" + getFileNameFromPath(fileInput.value) ;
                fileInput.value='';

                $('#image-container .attachment-item:last').before(imageelement);
                $("#add_image")[0].disabled = false;
            }
            console.log(event);
        }

        /*Audio*/
        function handlePreviewAudio(row,id){
            $('#audio-preview').show();
            $('#audio-add').hide();
            $('#audiopreview')[0].src = row.getAttribute("data-filepath");
            $('#audio-title').html(getFileNameFromPath(row.getAttribute("data-filepath")));
            $('#delete-audio').click(function(){
                xhr.open('POST', 'index.php?id=content/deleteAudio/'+id, true);
            });
        }
        function handleAddAudio(){
            $('#audio-preview').hide();
            $('#audio-add').show();
        }

        $("#add_audio").click(function (event) {
            xhr.onprogress = audio_callback;
            upload('audio');
        });
        
        function audio_callback(event){
            console.log(event);
            if (event.total === event.loaded){
                //unsetting in load 
                var fileInput = document.getElementById('newaudio');
                let element = document.createElement('img');
                element.className = "attachment-item";
                element.onclick = (function() {return function() {
                        handlePreviewAudio(this);
                        }})();
                element.src = "./includes/img/audio-file.png";
                element.setAttribute("data-filepath", "./uploads/" + getFileNameFromPath(fileInput.value))
                fileInput.value='';

                $('#audio-container .attachment-item:last').before(element);
                $("#add_audio")[0].disabled = false;
            }
            
        }

        /**/
        /*Video*/
        function handlePreviewVideo(row,id){
            $('#video-preview').show();
            $('#video-add').hide();
            $('#videopreview')[0].src = row.getAttribute("data-filepath");
            $('#video-title').html(getFileNameFromPath(row.getAttribute("data-filepath")));
            $('#delete-video').click(function(){
                xhr.open('POST', 'index.php?id=content/deleteVideo/'+id, true);
            });
        }
        function handleAddVideo(){
            $('#video-preview').hide();
            $('#video-add').show();
        }

        $("#add_video").click(function (event) {
            xhr.onprogress = video_callback;
            upload('video');
        });
        
        function video_callback(event){
            console.log(event);
            if (event.total === event.loaded){
                //unsetting in load 
                var fileInput = document.getElementById('newvideo');
                let element = document.createElement('img');
                element.className = "attachment-item";
                element.onclick = (function() {return function() {
                        handlePreviewVideo(this);
                        }})();
                element.src = "./includes/img/video-file.png";
                element.setAttribute("data-filepath", "./uploads/" + getFileNameFromPath(fileInput.value))
                fileInput.value='';

                $('#video-container .attachment-item:last').before(element);
                $("#add_video")[0].disabled = false;
            }
            
        }

        /**/
        
        /**/
        function upload(type){
            var fileInput = document.getElementById('new' + type);
            var id = document.getElementById('id');
            var file = fileInput.files[0];
            var formData = new FormData();
            formData.append(type, file);
            formData.append('id', id.value);
            
            // Add any event handlers here...
            xhr.open('POST', 'index.php?id=content/upload'+type, true);

            //setting in load 
            $("#add_"+type)[0].disabled = true;
            xhr.send(formData);
        }
        /**/
        $('#btn_submit').click(function(){
            var table = $('#<?php echo $tableId; ?>');
            if (table.length){
                table.val(getTableData());
            }
            if (!validateRequiredFields()){
                return false;
            }else{
                $('#mainform').submit();
            }
        });

        function validateSubmit(){
            
            return true;
        }

        function cancel(){
            window.location.href = 'index.php?id=content/view_contents/<?php echo $category_id; ?>/<?php echo $subcategory_id; ?>';
        }
    </script>
     
</div>

<?php include('views/footer.tpl');?>

