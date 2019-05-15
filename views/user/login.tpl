<?php include('views/header.tpl');?>
<form action="index.php?id=user/check" method="post">
<table width="80%" border="0">
  <tr>
    <td>username :</td>
    <td><input name="uname" type="text" /></td>
  </tr>
  <tr>
    <td>password:</td>
    <td><input name="upass" type="password" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input name="" type="submit" value=" Login   " /></td>
  </tr>
</table>

</form>
<?php include('views/footer.tpl');?>