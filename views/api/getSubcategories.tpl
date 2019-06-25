<!DOCTYPE html>
<html>
<head>
    <title>getSubcategories JSON</title>
</head>
<body>
    <a href="index.php?id=api/index">index</a>
    <h1>getSubcategories JSON</h1>
    <form method="POST">
        <textarea name="json" style="width:400px;min-height:200px;"></textarea>
        <br>
        <input type="submit" value="Submit">
    </form>

    <h1>Instructions</h1>
    <h2>This api returns all subcategories defined in a specific category</h2>
    <p>
        Post JSON data here to get subcategories information for a category. This information can be used to get contents.
    </p>
    <p>
        The getSubcategories requires at least one parameter: 'category_id'.
    </p>
    <p>
        Another paramater named 'conditions' used to query subcategories based on some fields value.
    </p>
    <p>
        'conditions' is an array of object with 'field' and 'value'.
    </p>
    <p>
        token is required to authenticate access to this function.
    </p>

<h2>Example Data</h2><h3>Return categories for the specified product</h3><pre>{
    "token": "tokenAsGetFromLoginApi",
    "action": "getSubcategories",
    "data" : {
        "category_id" : "12",
        "conditions":[
            {"field":"mah","value":"dey"},
            {"field":"name","value":"fff"}
        ]
    } 
}</pre>

<h3>Sample PHP code</h3>

<pre>

&lt?php

$post = array();
$info["action"] = "getCategories";
$info["token"] = "asokdpkasd";

$data = array();
$data["category_id"] = "8";

$conditions = array();

$condition["field"] = "mah";
$condition["value"] = "dey";
$conditions[] = $condition;

$condition["field"] = "name";
$condition["value"] = "fff";
$conditions[] = $condition;

$data["conditions"] = $conditions;

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
