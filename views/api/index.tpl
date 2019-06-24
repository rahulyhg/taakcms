<?php 

$selected = "getCategories";

if (isset($_POST['action'])){
    $selected = $_POST['action'];
}



?>
<form action="" method="POST">
    <select name='action' id='action' value="">
        <option value='getCategories'>getCategories</option>
        <option value='getSubcategories'>getSubcategories</option>
        <option value='getContents'>getContents</option>
        <option value='get'>get</option>
    </select>
    <textarea>

    </textarea>
    <button>send</button>
</form>
input:


output:
