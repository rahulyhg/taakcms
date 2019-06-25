<!DOCTYPE html>
<html>
<head>
    <title>getContent JSON</title>
</head>
<body>
    <a href="index.php?id=api/index">index</a>
    <h1>getContent JSON</h1>
    <form method="POST">
        <textarea name="json" style="width:400px;min-height:200px;"></textarea>
        <br>
        <input type="submit" value="Submit">
    </form>

    <h1>Instructions</h1>
    <h2>This api returns all information about one content</h2>
    <p>
        Post JSON data here to get content details.
    </p>
    <p>
        The getContent requires at least one parameter: content_id.
    </p>
    <p>
        token is required to authenticate access to this function.
    </p>

<h2>Example Data</h2><h3>Return all information about a content </h3><pre>{
    "token": "tokenAsGetFromLoginApi",
    "action": "getContent",
    "data" : {
        "content_id" : "12"
    } 
}</pre>

<h3>Sample PHP code</h3>

<pre>

&lt?php

$post = array();
$info["action"] = "getContents";
$info["token"] = "asokdpkasd";

$data = array();
$data["content_id"] = "8";

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
