
<!DOCTYPE html>
<html>
<head>
    <title>API</title>
    <style>
        div {margin:10px;}
    </style>
</head>
<body>
    <h1>API</h1>
    <p>
        To use these functions, you need an API Key generated in product define.
    </p>
    <h2>Usage</h2>
    <p>
        Please observe the following guidelines when using the API
        <ul>
            <li>
                Calls should be designed to send and recieve only the minimum required data.
            </li>
            <li>
                Only one API call at a time is allowed, You must wait for the first call to complete before starting the next API call.
            </li>
            <li>
                Multiple calls should be spaced with a few seconds delay between each call.
            </li>
        </ul>
    </p>


    <h2>JSON</h2>
    <p>
        Functions based on JSON data format
    </p>
    <div>
        <a href="index.php?id=api/login">login</a>
    </div>
    <div>
        <a href="index.php?id=api/getCategories">getCategories</a>
    </div>
    <div>
        <a href="index.php?id=api/getSubcategories">getSubcategories</a>
    </div>
    <div>
        <a href="index.php?id=api/getContents">getContents</a>
    </div>
    <div>
        <a href="index.php?id=api/getContent">getContent</a>
    </div>

    <br>
    <br>
    <br>


    <h2>Common Error Codes</h2>
    <table>
        <tr><th>Error Code</th><th>Error Meaning</th></tr>
        <tr><td> 1009 </td><td> Not allowed for this role </td></tr>
        <tr><td> 1021 </td><td> Account has no credit </td></tr>
        <tr><td> 1022 </td><td> Not whitelisted </td></tr>
    </table>

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

</body>
</html>
