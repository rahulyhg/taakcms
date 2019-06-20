function getFileNameFromPath(fullPath){
    var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
    var filename = fullPath.substring(startIndex);
    if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
        filename = filename.substring(1);
    }
    return filename;
}
function validateRequiredFields(){
    var allInputs = $('input[required]');
    for(var i =0;i< allInputs.length;i++){
        var element = allInputs[i];
        if (element.value == ''){
            element.style.border = "1px solid red";
            return false;
        }else{
            element.style.border = "1px solid #ced4da";
        }
    }
    return true;
}