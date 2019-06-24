<!DOCTYPE html>
<html>
<head>
    <title>getCategories JSON</title>
</head>
<body>
    <a href="index.php?id=api/index">index</a>
    <h1>getCategories JSON</h1>
    <form method="POST">
        <textarea name="json" style="width:400px;min-height:200px;"></textarea>
        <br>
        <input type="submit" value="Submit">
    </form>

    <h1>Instructions</h1>
    <h2>This api returns all categories defined in a specific product</h2>
    <p>
        Post JSON data here to get categories information for a product. This information can be used to get other contents.
    </p>
    <p>
        The getCategories requires at least one parameter: product_id.
    </p>
    <p>
        token is required to authenticate access to this function.
    </p>

<h2>Example Data</h2><h3>Return categories for the specified product</h3><pre>{
    "token": "tokenAsGetFromLoginApi",
    "action": "getcategories",
    "data" : {
        "product_id" : "12"
    } 
}</pre>

<h3>Sample PHP code</h3>
<?php echo $_SERVER['HTTP_HOST']; ?>
<pre>

&lt?php

/*
* The following sample uses a PHP array to construct the JSON data and php-curl to post it to the API.
* This sample will get the availability for one property with the specified parameters. 
* Change the propId and other parameters to values for your account to use and test.
*/

$post = array();
$info["action"] = "getCategories";
$info["token"] = "asokdpkasd";

$data = array();
$data["product_id"] = "8";

$info["data"] = $data;

$json = json_encode($post);

$url = "http://localhost/taakcms/api.php";
      
$ch=curl_init();
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
$result = curl_exec($ch);
curl_close ($ch);
echo $result;

?&gt
</pre>
</body>
</html>
