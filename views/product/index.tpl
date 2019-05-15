<?php include('views/header.tpl');?>


<div class="content">
  <a href="index.php?id=product/add">Add Product</a>

  <table width="611" border="0">
    <tr>
      <td width="45"> ID </td>
      <td width="307">Title</td>
      <td width="76"> LOGO</td>
      <td width="104">&nbsp;</td>
    </tr>
  <?php foreach($rows as $row) { ?> 
    <tr>
      <td><?php echo $row['id']; ?> </td>
      <td><?php echo $row['title']; ?> </td>
      <td><?php echo $row['logo']; ?> </td>
      <td>
        <a href="index.php?id=product/delete/<?php echo $row['id']; ?>">delete</a> 
          |    
        <a href="index.php?id=product/edit/<?php echo $row['id']; ?>">edit</a>   </td>
    </tr>
  <?php } ?>
  </table>
</div>

<?php include('views/footer.tpl');?>