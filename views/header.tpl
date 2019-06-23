<html >
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    
    <link rel="stylesheet" href="./includes/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="./includes/css/bootstrap/rtl-bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="./includes/css/styles.css" crossorigin="anonymous">
    <link rel="stylesheet" href="./includes/css/fontawsome.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="./includes/js/jquery.min.js"></script>
    <script src="./includes/js/popper.min.js"></script>
    <script src="./includes/js/bootstrap.min.js"></script>
    <script src="./includes/js/jquery-3.3.1.slim.min.js"  crossorigin="anonymous"></script>
    <script src="includes/js/common.js"></script>

</head>
<body class="mainBody">
<style>
.navbar-brand{
    color:var(--fontcolor)!important;
}
</style>
<?php if ($page_title != ""){ ?>
    <nav class="navbar navbar-expand-sm navbar-light fixed-top" style="background-color: white;border-bottom: 1px solid var(--border);">
        <a class="navbar-brand" href="index.php?id=product/index"><?php echo STRINGS['site-name'] ?></a>

        <ul class="navbar-nav ml-auto" style="margin-left: 0px !important;">
            <?php if (isAdmin()) { ?>
            <li class="nav-item">
                <a class="nav-link" href="index.php?id=user/index"><?php echo STRINGS['users'] ?> <span class="sr-only">(current)</span></a>
            </li>
            <?php } ?>
            <li class="nav-item">
                <a class="nav-link" href="index.php?id=user/logout"><?php echo STRINGS['logout'] ?> <span class="sr-only">(current)</span></a>
            </li>
            
            
        </ul>
     
        
    </nav>
<?php } ?>

<div class="pagecontent">