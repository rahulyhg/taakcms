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
    $('#image-title').html(row.getAttribute("data-title"));
    $('#delete-image').click(function(){
        deletefile(row.getAttribute("data-id"));
    });
}

function deletefile(id){
    if (confirm('Are you sure you want to delete this file from the database?')){
        return;
    }
    return;
}


$("#add_image").click(function (event) {
    $('.msg').text('');
    $('.progress').hide();
    xhr.onprogress = image_callback;
    let title = $('#titleimage')[0];
    let newimage = $('#newimage')[0];
    if (title.value == ''){
        title.style.border = '1px solid red';
        return;
    }else{
        title.style.border = '1px solid #ced4da';
    }

    if (newimage.value == ''){
        newimage.style.border = '1px solid red';
        return;
    }else{
        newimage.style.border = '1px solid #ced4da';
    }

    upload('image');
});


function image_callback(event){
    $('.progress').show();
    if (event.lengthComputable) {
        var percentComplete = event.loaded / event.total;
        percentComplete = parseInt(percentComplete * 100);
        $('.myprogress').text(percentComplete + '%');
        $('.myprogress').css('width', percentComplete + '%');
        if (percentComplete == 100){
            setTimeout(function(){ 
                $('.progress').hide();
            },1000);
        }
    }
    if (event.total === event.loaded && event.target.status == '200'){
        //unsetting in load 
        const res = JSON.parse(event.target.response);
        if (res.result){
            var fileInput = document.getElementById('newimage');
            let imageelement = document.createElement('img');
            imageelement.className = "attachment-item";
            imageelement.onclick = (function() {return function() {
                    handlePreviewImage(this);
                    }})();
            imageelement.setAttribute("data-title", res.title)
            imageelement.src = "./uploads/" + res.message ;
            $('#image-container .attachment-item:last').before(imageelement);
            $('.msg').text('<?php echo tr('fileUploadedSuccessfully'); ?>');
        }else{
            $('.msg').text('<?php echo tr('errorOnUpload'); ?>');
            alert(res.message);
        }
    }else{
        alert(event.target.response);
    } 
    $("#add_image")[0].disabled = false;
    $('#titleimage')[0].value="";
    $('#newimage')[0].value="";
    console.log(event);
}

/*Audio*/
function handlePreviewAudio(row,id){
    $('#audio-preview').show();
    $('#audio-add').hide();
    $('#audiopreview')[0].src = row.getAttribute("data-filepath");
    $('#audio-title').html(row.getAttribute("data-title"));
    $('#delete-audio').click(function(){
        deletefile(row.getAttribute("data-id"));
    });
}
function handleAddAudio(){
    $('#audio-preview').hide();
    $('#audio-add').show();
}

$("#add_audio").click(function (event) {
    $('.msg').text('');
    $('.progress').hide();
    xhr.onprogress = audio_callback;
    let title = $('#titleaudio')[0];
    let newaudio = $('#newaudio')[0];
    if (title.value == ''){
        title.style.border = '1px solid red';
        return;
    }else{
        title.style.border = '1px solid #ced4da';
    }

    if (newaudio.value == ''){
        newaudio.style.border = '1px solid red';
        return;
    }else{
        newaudio.style.border = '1px solid #ced4da';
    }

    upload('audio');
});

function audio_callback(event){
    console.log(event);
    $('.progress').show();
    if (event.lengthComputable) {
        var percentComplete = event.loaded / event.total;
        percentComplete = parseInt(percentComplete * 100);
        $('.myprogress').text(percentComplete + '%');
        $('.myprogress').css('width', percentComplete + '%');
        if (percentComplete == 100){
            setTimeout(function(){ 
                $('.progress').hide();
            },1000);
        }
    }

    if (event.total === event.loaded && event.target.status == '200'){
        //unsetting in load 
        const res = JSON.parse(event.target.response);
        if (res.result){
            var fileInput = document.getElementById('newaudio');
            let element = document.createElement('div');
            element.className = "attachment-item";
            element.onclick = (function() {return function() {
                    handlePreviewAudio(this);
                    }})();
            element.innerHTML = "<div class='fas fa-music'></div>";
            element.setAttribute("data-filepath", "./uploads/" + res.message)
            element.setAttribute("data-title", res.title)
            fileInput.value='';
            $('.msg').text('<?php echo tr('fileUploadedSuccessfully'); ?>');
            $('#audio-container .attachment-item:last').before(element);
        }else{
            $('.msg').text('<?php echo tr('errorOnUpload'); ?>');
            alert(res.message);
        }
    }else{
        alert(event.target.response);
    }   
    $("#add_audio")[0].disabled = false;
    $('#titleaudio')[0].value= "";
    $('#newaudio')[0].value = "";       
}

/**/
/*Video*/
function handlePreviewVideo(row,id){
    $('#video-preview').show();
    $('#video-add').hide();
    $('#videopreview')[0].src = row.getAttribute("data-filepath");
    $('#video-title').html(row.getAttribute("data-title"));
    $('#delete-video').click(function(){
        deletefile(row.getAttribute("data-id"));
    });
}
function handleAddVideo(){
    $('#video-preview').hide();
    $('#video-add').show();
}

$("#add_video").click(function (event) {
    $('.msg').text('');
    $('.progress').hide();
    xhr.onprogress = video_callback;
    let title = $('#titlevideo')[0];
    let newvideo = $('#newvideo')[0];
    if (title.value == ''){
        title.style.border = '1px solid red';
        return;
    }else{
        title.style.border = '1px solid #ced4da';
    }

    if (newvideo.value == ''){
        newvideo.style.border = '1px solid red';
        return;
    }else{
        newvideo.style.border = '1px solid #ced4da';
    }
    upload('video');
});

function video_callback(event){
    console.log(event);
    $('.progress').show();
    if (event.lengthComputable) {
        var percentComplete = event.loaded / event.total;
        percentComplete = parseInt(percentComplete * 100);
        $('.myprogress').text(percentComplete + '%');
        $('.myprogress').css('width', percentComplete + '%');
        if (percentComplete == 100){
            setTimeout(function(){ 
                $('.progress').hide();
            },1000);
        }
    }
    
    if (event.total === event.loaded && event.target.status == '200'){
        //unsetting in load 
        const res = JSON.parse(event.target.response);
        if (res.result){
            var fileInput = document.getElementById('newvideo');
            let element = document.createElement('div');
            element.className = "attachment-item";
            element.onclick = (function() {return function() {
                    handlePreviewVideo(this);
                    }})();
            element.innerHTML = "<div class='fas fa-video'></div>";
            element.setAttribute("data-filepath", "./uploads/" + res.message);
            element.setAttribute("data-title", res.title);
            $('.msg').text('<?php echo tr('fileUploadedSuccessfully'); ?>');
            $('#video-container .attachment-item:last').before(element);
        }else{
            $('.msg').text('<?php echo tr('errorOnUpload'); ?>');
            alert(res.message);
        }
    }else{
        alert(event.target.response);
    } 
    $("#add_video")[0].disabled = false;
    $('#titlevideo')[0].value="";
    $('#newvideo')[0].value="";
}

/**/

/**/
function upload(type){
    var fileInput = document.getElementById('new' + type);
    var titleInput = document.getElementById('title' + type);
    var id = document.getElementById('id');
    var file = fileInput.files[0];
    var formData = new FormData();
    formData.append(type, file);
    formData.append('id', id.value);
    formData.append('title', titleInput.value);
    
    // Add any event handlers here...
    xhr.open('POST', 'index.php?id=<?php echo $place;?>/upload'+type, true);

    //setting in load 
    $("#add_"+type)[0].disabled = true;
    xhr.send(formData);
}
/**/




</script>