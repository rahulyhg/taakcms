<?php
use \Firebase\JWT\JWT;
header("Access-Control-Allow-Origin: *");
define ('DS', DIRECTORY_SEPARATOR); 
define ('HOME', dirname(__FILE__)); 
require_once HOME . DS . 'config.php'; 

$key = "rd01J0MVzScT7TzzQof3VQqE";

$contents = file_get_contents("php://input");
$contents = json_decode($contents);

if (array_key_exists('action',$contents)) {
    $action = strtolower($contents->action);
    if ($action == "login"){
        echo login($contents->data);
        return;
    }
    if (!array_key_exists('token',$contents)){
        echo 'missing token';
        return;
    }
    $token = $contents->token;
    try{
        $info = JWT::decode($token, $key, array('HS256'));
    } catch(Exception $e){
        echo 'invalid token!';
        return;
    }
    switch ($action){
        case "getcategories":
            echo getCategories($contents->data,$info);
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
            echo 'invalid action';
    }
}else{
    echo 'invalid action';
}

function login($data){
    if (!array_key_exists('apiKey',$data)){
        return 'missing apiKey in data';
    }
    if (!array_key_exists('clientId',$data)){
        return 'missing clientId in data';
    }
    $product = new product_model();
    
    $result = $product->isExistsApiKey($data->apiKey);
    if ($result){
        $token = array(
            "cli" => $data->clientId,
            "prd" => $data->apiKey,
        );
        global $key;
        $jwt = JWT::encode($token, $key);
        return $jwt;
    }else{
        return 'invalid apiKey';
    }
}

function getCategories($data,$info){
    $category = new category_model();
    if (!array_key_exists('product_id',$data)){
        return 'missing product_id in data';
    }
    $result = $category->getRows($data->product_id);
    return json_encode($result);
}

function getSubcategories($data,$info){
    $subcategory = new subcategory_model();
    if (!array_key_exists('category_id',$data)){
        return 'missing category_id in data';
    }
    $conditions=[];
    if (array_key_exists('conditions',$data)){
        $conditions = $data->conditions;
    }
    $result = $subcategory->getSubcategoriesForApi($data->category_id,$conditions);
    return json_encode($result);
}

function getContents($data,$info){
    $content = new content_model();
    if (!array_key_exists('subcategory_id',$data)){
        return 'missing subcategory_id in data';
    }
    $result = $content->getRowsBySubcategoryId($data->subcategory_id);
    return json_encode($result);
}

function getContent($data,$info){
    $content = new content_model();
    if (!array_key_exists('content_id',$data)){
        return 'missing content_id in data';
    }
    $result = $content->getRowByIdForApi($data->content_id);
    return json_encode($result);
}

?>