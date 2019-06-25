<?php
use \Firebase\JWT\JWT;
header("Access-Control-Allow-Origin: *");
define ('DS', DIRECTORY_SEPARATOR); 
define ('HOME', dirname(__FILE__)); 
require_once HOME . DS . 'config.php'; 

$key = "rd01J0MVzScT7TzzQof3VQqE";
try{
    $contents = file_get_contents("php://input");
    $contents = json_decode($contents);
}catch(Exception $e){
    echo 'error: invalid data!';
    return;
}

if ($contents == null){
    echo 'error: invalid data!';
    return;
}

if (array_key_exists('action',$contents)) {
    $action = strtolower($contents->action);
    if ($action == "login"){
        echo login($contents->data);
        return;
    }
    if (!array_key_exists('token',$contents)){
        echo 'error: missing token';
        return;
    }
    $token = $contents->token;
    try{
        $info = JWT::decode($token, $key, array('HS256'));
    } catch(Exception $e){
        echo 'error: invalid token!';
        return;
    }
    switch ($action){
        case "getcategories":
            echo getCategories($info);
            break;
        case "getsubcategories":
            echo getSubcategories($contents->data,$info);
            break;
        case "getcontents":
            echo getContents($contents->data,$info);
            break;
        case "getcontent":
            echo getContent($contents->data,$info);
            break;
        default:
            echo 'error: invalid action';
    }
}else{
    echo 'error: invalid action';
}

function login($data){
    if (!array_key_exists('apiKey',$data)){
        return 'error: missing apiKey in data';
    }
    if (!array_key_exists('clientId',$data)){
        return 'error: missing clientId in data';
    }
    $product = new product_model();
    $product_id = $product->getProductIdByApiKey($data->apiKey);
    if ($product_id > 0){
        $token = array(
            "cli" => $data->clientId,
            "pid" => $product_id,
        );
        global $key;
        $jwt = JWT::encode($token, $key);
        return $jwt;
    }else{
        return 'error: invalid apiKey';
    }
}

function getCategories($info){
    $category = new category_model();
    if (!array_key_exists('pid',$info)){
        return 'error: token is broken';
    }
    $result = $category->getRows($info->pid);
    return json_encode($result,JSON_UNESCAPED_UNICODE);
}

function getSubcategories($data,$info){
    $subcategory = new subcategory_model();
    if (!array_key_exists('category_id',$data)){
        return 'error: missing category_id in data';
    }
    $conditions=[];
    if (array_key_exists('conditions',$data)){
        $conditions = $data->conditions;
    }
    $result = $subcategory->getSubcategoriesForApi($data->category_id,$conditions);
    return json_encode($result,JSON_UNESCAPED_UNICODE);
}

function getContents($data,$info){
    $content = new content_model();
    if (!array_key_exists('subcategory_id',$data)){
        return 'error: missing subcategory_id in data';
    }
    $result = $content->getRowsBySubcategoryId($data->subcategory_id);
    return json_encode($result,JSON_UNESCAPED_UNICODE);
}

function getContent($data,$info){
    $content = new content_model();
    if (!array_key_exists('content_id',$data)){
        return 'error: missing content_id in data';
    }
    $result = $content->getRowByIdForApi($data->content_id);
    return json_encode($result,JSON_UNESCAPED_UNICODE);
}

?>