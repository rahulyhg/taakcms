<!DOCTYPE html>
<html>
<head>
    <title>login JSON</title>
</head>
<body>
    <a href="index.php?id=api/index">index</a>
    <h1>login JSON</h1>
    <form method="POST">
        <textarea name="json" style="width:400px;min-height:200px;"></textarea>
        <br>
        <input type="submit" value="Submit">
    </form>

    <h1>Instructions</h1>
    <h2>This api return a token based on apikey and clientid</h2>
    <p>
        Post JSON data here to get token for a apikey and clientid. This information can be used to send other requests.
    </p>
    <p>
        The login requires two parameters: clientId and apiKey.
    </p>

<h2>Example Data</h2><h3>Return token for the specified info</h3><pre>{
    "action": "login",
    "data":{
        "apiKey": "tokenAsGetFromLoginApi",
        "clientId": "getcategories"
    }
}</pre>

<h3>Sample PHP code</h3>

<pre>

&lt?php

$post = array();
$info["action"] = "login";

$data = array();
$data["apiKey"] = "asdasdasd";
$data["clientId"] = "985618431";

$info["data"] = $data;

$json = json_encode($post);

$url = "[YOUR SERVER ADDRESS]/api.php";
      
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
