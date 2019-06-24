<?php
$data_types;
$data_types['text']='text';
$data_types['number']='number';
$data_types['select']='select';
$data_types['yesno']='yesno';
$data_types['string_list']='string_list';
$data_types['long_text']='long_text';

define ('DataTypes', $data_types);

    function isAdmin(){
        return $_SESSION['admin'];
    }

    function accessed_products(){
        return $_SESSION['accessed_products'];
    }

    function tr($key){
        $xml = new SimpleXMLElement("includes/dictionary/fa.xml",0,true);
        $ret = $xml->xpath("//keyword/string[@id='" . $key . "']"); 
        if (count($ret)>0)
            return $ret[0];
        else 
            return $key;
    }

    function safe($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

?>
