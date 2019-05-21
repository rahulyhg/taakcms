<html >
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.rtlcss.com/bootstrap/v4.2.1/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="includes/css/styles.css" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"  crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.rtlcss.com/bootstrap/v4.2.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>

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

