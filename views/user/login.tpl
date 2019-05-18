<?php include('views/header.tpl');?>


  <div class="page-container">
      <h1><?php echo STRINGS['enter_taak_cms'];?></h1>
      <form action="index.php?id=user/check" method="post">
          <input type="text" name="uname" class="username" placeholder="<?php echo STRINGS['username'];?>">
          <input type="password" name="upass" class="password" placeholder="<?php echo STRINGS['password'];?>">
          <button type="submit"><?php echo STRINGS['enter'];?></button>
          <div class="error"><span>+</span></div>
      </form>
      <div class="connect">
            </p>
      </div>
  </div>


<?php include('views/footer.tpl');?>