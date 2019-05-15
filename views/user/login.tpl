<?php include('views/header.tpl');?>


  <div class="page-container">
      <h1>ورود به پنل محتوای تاک</h1>
      <form action="index.php?id=user/check" method="post">
          <input type="text" name="uname" class="username" placeholder="نام کاربری">
          <input type="password" name="upass" class="password" placeholder="رمز عبور">
          <button type="submit">وارد شوید</button>
          <div class="error"><span>+</span></div>
      </form>
      <div class="connect">
            </p>
      </div>
  </div>


<?php include('views/footer.tpl');?>