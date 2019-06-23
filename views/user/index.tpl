<?php include('views/header.tpl');?>

<div class="content" style="background-color:var(--background)">
    
    <div class="content-card">
        <div class="content-card-header">
            <?php echo $page_title; ?>
            <button type="primary" class="btn btn-sm btn-light" style="float:left;" onclick="add();">
                    <div class="fas fa-plus"></div>
            </button>
        </div>
        <div class="content-card-body-column">
            <div class="action-bar">
                
            </div>
            <table class="table table-bordered table-sm">
                <thead>
                <tr class="d-flex">
                    <th style="display:none;"></th>
                    <th class="col-sm-3"><?php echo tr('username') ?></th>
                    <th class="col-sm-5"><?php echo tr('fullname') ?></th>
                    <th class="col-sm-2"><?php echo tr('role') ?></th>
                    <th class="col-sm-2"><?php echo tr('operations') ?></th>
                </tr>
                </thead>
                <tbody>
                    <?php foreach($rows as $row) { ?> 
                    <tr class="d-flex">
                        <td style="display:none;"><?php echo $row['id']; ?></td>
                        <td class="col-sm-3" ><?php echo $row['username']; ?></td>
                        <td class="col-sm-5" ><?php echo $row['fullname']; ?></td>
                        <td class="col-sm-2" ><?php echo $row['role']; ?></td>
                        <td class="col-sm-2" >
                            <a class="fas fa-edit" onclick="edit(<?php echo $row['id']; ?>)" ></a>
                            <a class="fas fa-trash-alt"  onclick="delete(<?php echo $row['id']; ?>);" ></a>
                        </td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>

    function add(){
        window.location.href = "index.php?id=user/add";
    }

    function edit(id){
        window.location.href = "index.php?id=user/edit/" + id;
    }


</script> 

<?php include('views/footer.tpl');?>