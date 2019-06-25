<?php include('views/header.tpl');?>
<style>
.mainBody{
  margin-top:0px;
  justify-content: center;
  align-items: center;
  background-color: var(--background);
}
.login-container{
  display:flex;
  flex-flow:column;
  padding:40px;
  border: 1px solid var(--border);
  border-radius:4px;
  background-color: #ffffff;
}
.form-container{
  display:flex;
  flex-flow:column;
}
h1{
  font-size:1.1em;
  text-align:center;
  color: var(--fontcolor);
  margin-bottom:40px;

}
div > form{
  display:flex;
  flex-flow:column;
  direction: ltr;
  margin-bottom: 0px;
}
div > form > *{
  margin:5px;
  
}
</style>

  <div class="login-container">
      <h1><?php echo tr('site-name');?></h1>
      <form action="index.php?id=user/check" method="post">
          <input required="required" type="text" name="uname" class="form-control form-control-sm" placeholder="Username">
          <input required="required" type="password" name="upass" class="form-control form-control-sm" placeholder="Password">
          <button class="btn btn-sm btn-light" type="submit"><?php echo tr('enter');?></button>
      </form>
  </div>


<?php include('views/footer.tpl');?>