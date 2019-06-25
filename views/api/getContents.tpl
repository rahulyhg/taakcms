<!DOCTYPE html>
<html>
<head>
    <title>getContents JSON</title>
</head>
<body>
    <a href="index.php?id=api/index">index</a>
    <h1>getContents JSON</h1>
    <form method="POST">
        <textarea name="json" style="width:400px;min-height:200px;"></textarea>
        <br>
        <input type="submit" value="Submit">
    </form>

    <h1>Instructions</h1>
    <h2>This api returns all contents exists in a specific subcategory</h2>
    <p>
        Post JSON data here to get contents for a subcategory. This information can be used to get a specific content.
    </p>
    <p>
        The getContents requires at least one parameter: subcategory_id.
    </p>
    <p>
        token is required to authenticate access to this function.
    </p>

<h2>Example Data</h2><h3>Return contents for the specified subcategory</h3><pre>{
    "token": "tokenAsGetFromLoginApi",
    "action": "getContents",
    "data" : {
        "subcategory_id" : "12"
    } 
}</pre>

<h3>Sample PHP code</h3>

<pre>

&lt?php

$post = array();
$info["action"] = "getContents";
$info["token"] = "asokdpkasd";

$data = array();
$data["subcategory_id"] = "8";

$info["data"] = $data;

$json = json_encode($post);

$url = "http://[YOUR SERVER ADDRESS]/api.php";
      
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
