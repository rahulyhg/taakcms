<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>

<link rel="stylesheet" href="./includes/css/attachment.css">

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
                                    <img class="attachment-item" data-id="image_<?php echo $image['id'] ?>" data-title="<?php echo $image['title'] ?>" onclick="handlePreviewImage(this,<?php echo $image['id'] ?>)"; src="./uploads/<?php echo $image['filename'] ?>"></img>
                                <?php } ?>
                                <div class="attachment-add-button attachment-item" onclick="handleAddImage();">
                                    <button type="button" class="btn btn-light btn-sm"> <div class="fas fa-plus"></div></button>
                                </div>
                            </div> 
                            <div id="image-preview" >
                                <div class="attachment-bar"><span id="image-title" class="attachment-title"></span><button id="delete-image" type="button" class="btn btn-light btn-sm"><div class="fas fa-times"></div></button></div>
                                <img src="" id='imagepreview' class="attachment-preview" />
                            </div> 
                            <div id="image-add" class="attachment-add">
                                <form method="post" class="form-inline" action="index.php?id=content/uploadimage" id="imageform" >
                                    <div class="form-group">
                                        <input type="file" name="newimage" id="newimage" />
                                        <input type="text" class="form-control form-control-sm" style="margin-right: 10px;" placeholder="title" name="titleimage" id="titleimage" />
                                        <button id="add_image" class="btn btn-light btn-sm" style="margin-right: 10px;" type="button"><div class="fas fa-upload" ></div></button>
                                    </div>
                                    <div class="form-group">
                                        <div class="progress" style="display:none">
                                            <div class="progress-bar progress-bar-success myprogress" role="progressbar" style="width:0%">0%</div>
                                        </div>
                                        <div class="msg"></div>
                                    </div>
                                </form>
                            </div> 
                        </div>
                    </div>
                    <div id="menu2" class="container tab-pane fade"><br>
                        <div class="attachment-tab">
                            <div class="attachment-container" id="audio-container">
                                <?php if (isset($values['sounds'])) foreach($values['sounds'] as $sound) { ?>
                                    <div class="attachment-item" data-id="audio_<?php echo $sound['id'] ?>" data-title="<?php echo $sound['title'] ?>" data-filepath="./uploads/<?php echo $sound['filename'] ?>" onclick="handlePreviewAudio(this,<?php echo $sound['id'] ?>)"; >
                                        <div class="fas fa-music"></div>
                                    </div>
                                <?php } ?>
                                <div class="attachment-add-button attachment-item" onclick="handleAddAudio();">
                                    <button type="button" class="btn btn-light btn-sm"> <div class="fas fa-plus"></div></button>
                                </div>
                            </div> 
                            <div id="audio-preview">
                                <div class="attachment-bar"><span id="audio-title" class="attachment-title"></span><button id="delete-audio" type="button" class="btn btn-light btn-sm"><div class="fas fa-times"></div></button></div>
                                <audio id="audiopreview" preload="none" src="" controls="controls" style="float: left;width: 100%;"></audio>
                            </div> 
                            <div id="audio-add" class="attachment-add">
                                <form method="post" class="form-inline" action="index.php?id=content/uploadAudio" id="audioform" >
                                    <div class="form-group">
                                        <input type="file" name="newaudio" id="newaudio" />
                                        <input type="text" class="form-control form-control-sm" style="margin-right: 10px;" placeholder="title" name="titleaudio" id="titleaudio" />
                                        <button id="add_audio" class="btn btn-light btn-sm" style="margin-right: 10px;" type="button"><div class="fas fa-upload" ></div></button>
                                    </div>
                                    <div class="form-group">
                                        <div class="progress" style="display:none">
                                            <div class="progress-bar progress-bar-success myprogress" role="progressbar" style="width:0%">0%</div>
                                        </div>
                                        <div class="msg"></div>
                                    </div>
                                </form>
                            </div> 
                        </div>
                    </div>
                    <div id="menu3" class="container tab-pane fade"><br>
                        <div class="attachment-tab">
                            <div class="attachment-container" id="video-container">
                                <?php if (isset($values['videos'])) foreach($values['videos'] as $video) { ?>
                                    <div class="attachment-item" data-id="video_<?php echo $video['id'] ?>" data-title="<?php echo $video['title'] ?>" data-filepath="./uploads/<?php echo $video['filename'] ?>" onclick="handlePreviewVideo(this,<?php echo $video['id'] ?>)";>
                                        <div class="fas fa-video"></div>
                                    </div>
                                <?php } ?>
                                <div class="attachment-add-button attachment-item" onclick="handleAddVideo();">
                                    <button type="button" class="btn btn-light btn-sm"> <div class="fas fa-plus"></div></button>
                                </div>
                            </div> 
                            <div id="video-preview">
                                <div class="attachment-bar"><span id="video-title" class="attachment-title"></span><button id="delete-video" type="button" class="btn btn-light btn-sm"><div class="fas fa-times"></div></button></div>
                                <video id="videopreview" preload="none" src="" controls="controls" style="float: left;width: 100%;"></video>
                            </div> 
                            <div id="video-add" class="attachment-add">
                            
                                <form method="post" class="form-inline" action="index.php?id=content/uploadVideo" id="videoform" >
                                    <div class="form-group">
                                        <input type="file" name="newvideo" id="newvideo" />
                                        <input type="text" class="form-control form-control-sm" style="margin-right: 10px;" placeholder="title" name="titlevideo" id="titlevideo" />
                                        <button id="add_video" class="btn btn-light btn-sm" style="margin-right: 10px;" type="button"><div class="fas fa-upload" ></div></button>
                                    </div>
                                    <div class="form-group">
                                        <div class="progress" style="display:none">
                                            <div class="progress-bar progress-bar-success myprogress" role="progressbar" style="width:0%">0%</div>
                                        </div>
                                        <div class="msg"></div>
                                    </div>
                                </form>
                            </div> 
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="content-card-footer">
            <button class="btn btn-light btn-sm" id="btn_submit" type="submit" ><?php echo tr('save')?></button>
            <button class="btn btn-light btn-sm" type="button" onclick="cancel();"><?php echo tr('cancel')?></button>
        </div>
    </div>
    <?php 
        $place='content';
        require_once HOME . DS . 'views' . DS . 'components' . DS . 'uploadHelper.php'; 
    ;?>
    <script>
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
        function cancel(){
            window.location.href = 'index.php?id=subcategory/index/<?php echo $category_id ?>';
        }
    </script>
</div>

<?php include('views/footer.tpl');?>

