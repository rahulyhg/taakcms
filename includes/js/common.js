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
    var allSelects = $('select[required]');
    let valid=true;
    valid = validate(allInputs) && valid;
    valid = validate(allSelects) && valid;
    return valid;
}

function validate(list){
    for(var i =0;i< list.length;i++){
        var element = list[i];
        if (element.value == ''){
            element.style.border = "1px solid red";
            return false;
        }else{
            element.style.border = "1px solid #ced4da";
        }
    }
    return true;
}

