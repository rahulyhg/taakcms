<?php
header("Access-Control-Allow-Origin: *");
define ('DS', DIRECTORY_SEPARATOR); 
define ('HOME', dirname(__FILE__)); 
require_once HOME . DS . 'config.php'; 

if (isset($_POST['action'])) {
    $action = strtolower($_POST['action']);
    switch ($action){
        case "getcategories":
            $data = json_decode($_POST['data'],true);
            echo getCategories($data);
            break;
        case "getsubcategories":
            $data = json_decode($_POST['data'],true);
            echo getSubcategories($data);
            break;
        case "getcontents":
            $data = json_decode($_POST['data'],true);
            echo getContents($data);
            break;
        case "get":
            $data = json_decode($_POST['data'],true);
            echo getContent($data);
            break;
        default:
            echo 'invalid action';
    }
}else{
    echo 'invalid action';
}


function getCategories($data){
    $category = new category_model();
    if (!isset($data['product_id'])){
        return 'missing product_id in data';
    }
    $result = $category->getRows($data['product_id']);
    return json_encode($result);
}

function getSubcategories($data){
    $subcategory = new subcategory_model();
    if (!isset($data['category_id'])){
        return 'missing category_id in data';
    }
    $conditions=[];
    if (isset($data['conditions'])){
        $conditions =$data['conditions'];
    }
    $result = $subcategory->getSubcategoriesForApi($data['category_id'],$conditions);
    return json_encode($result);
}

function getContents($data){
    $content = new content_model();
    if (!isset($data['subcategory_id'])){
        return 'missing subcategory_id in data';
    }
    $result = $content->getRowsBySubcategoryId($data['subcategory_id']);
    return json_encode($result);
}

function getContent($data){
    $content = new content_model();
    if (!isset($data['content_id'])){
        return 'missing content_id in data';
    }
    $result = $content->getRowByIdForApi($data['content_id']);
    return json_encode($result);
}

?>