<html >
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    

    <?php
        if ($page_title == ""){
            echo '<link rel="stylesheet" href="includes/css/reset.css">';
            echo '<link rel="stylesheet" href="includes/css/supersized.css">';
            echo '<link rel="stylesheet" href="includes/css/loginstyle.css">';
        }
    ?>
    

</head>
<body>

<?php if ($page_title != ""){ ?>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <a class="navbar-brand" href="index.php?id=product/index">مدیریت محتوای تاک</a>

        <ul class="navbar-nav ml-auto" style="margin-left: 0px !important;">
            <li class="nav-item">
                <a class="nav-link" href="index.php?id=user/logout">Logout <span class="sr-only">(current)</span></a>
            </li>
            
        </ul>
     
        
    </nav>
<?php } ?>

