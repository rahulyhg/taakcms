<?php
    function getDataTypes(){
        $data_types;
        $data_types['text']='text';
        $data_types['number']='number';
        $data_types['select']='select';
        $data_types['yesno']='yesno';
        $data_types['string_list']='string_list';
        $data_types['long_text']='long_text';
        return $data_types;
    }

    function isAdmin(){
        if (isset($_SESSION['admin']))
            return $_SESSION['admin'];
        else
            return false;
    }

    function accessed_products(){
        if (isset($_SESSION['accessed_products']))
            return $_SESSION['accessed_products'];
        else
            return [];
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
    
    function encodeId($id){
        $id = ( intval($id) + 9 ) * 7;
        return base64_encode($id);
    }
    
    function decodeId($id){
        $id = base64_decode($id);
        return ( $id / 7 ) - 9;
    }

    function image_types(){
        return array('jpg','jpeg','png');
    }
    function audio_types(){
        return array('mp3');
    }
    function video_types(){
        return array('wmv','mp4','avi');
    }
    function getServerAddress(){
		return "http://" . $_SERVER['SERVER_NAME'] . "/mvc-php-with-login";
    }

?>
