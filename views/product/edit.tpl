<form action="index.php?id=product/save" method="post">
  <table width="500" border="0" >
    <tr>
      <td>Sid</td>
      <td>
      <input type="text" name="id" readonly="readonly" value="<?php echo $row['id'] ?>"></td>
    </tr>
    <tr>
      <td>Title</td>
      <td>
      <input type="text" name="title" value="<?php echo $row['title'] ?>" ></td>
    </tr>
    <tr>
      <td>Logo</td>
      <td><input type="text" name="logo" value="<?php echo $row['logo'] ?>" ></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" value="Save"></td>
    </tr>
  </table>
</form>