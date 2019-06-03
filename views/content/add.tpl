<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>

</style>

<div class="content">
    <div class="content-card">
        <div class="content-card-header">
            <?php echo $page_title ?> 
        </div>
        <div class="content-card-body-column">
            <form action="index.php?id=content/save" method="post" class="taak_form" >
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#home"><?php echo STRINGS['details'] ?></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu1"><?php echo STRINGS['images'] ?></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu2"><?php echo STRINGS['sounds'] ?></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu3"><?php echo STRINGS['videos'] ?></a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div id="home" class="container tab-pane active"><br>
                        <input type="hidden" name="id" readonly="readonly" value="0" />
                        <div class="form-group">
                            <label for="title"><?php echo STRINGS['title']  ?>:</label>
                            <input type="text" class="form-control" name="title" />
                        </div>
                        <?php foreach($fields as $field) { ?>
                            <div class="form-group">
                                <label for="<?php echo $field['title_latin']  ?>"><?php echo $field['title']  ?>:</label>
                                <input type="text" class="form-control" name="<?php echo $field['title_latin']  ?>" />
                            </div>
                        <?php } ?>
                    </div>
                    <div id="menu1" class="container tab-pane fade"><br>
                        <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                    <div id="menu2" class="container tab-pane fade"><br>
                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                    </div>
                    <div id="menu3" class="container tab-pane fade"><br>
                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                    </div>
                </div>
            </div>
            <div class="content-card-footer">
                <button class="btn btn-primary" type="submit" onclick="return validateSubmit();" ><?php echo STRINGS['save']?></button>
                <button class="btn btn-danger" type="button" onclick="cancel();"><?php echo STRINGS['cancel']?></button>
            </div>
            </form>
        </div>
    </div>
    <script>
        function validateSubmit(){
            return true;
        }

        function cancel(){
            window.location.href = 'index.php?id=content/view_contents/1';
        }
    </script>
     
</div>

<?php include('views/footer.tpl');?>

