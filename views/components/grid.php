<input type="hidden" id="<?php echo $tableId?>_data" name="<?php echo $tableId?>_data" value=""></td>
<table class="table table-sm" id='<?php echo $tableId?>'>
    <thead>
        <tr>
            <th scope="col"></th>
            <?php foreach($columns as $column) {
                if ($column->type == 'hidden')
                    echo '<th style="display:none" scope="col"> ' . $column->caption . ' </th>';
                else
                    echo '<th scope="col"> ' . $column->caption . ' </th>';
                
            } ?>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td scope="row"><button type="button" class="btn btn-primary btn-sm" onclick="addRow();">+</button></td>
            <?php foreach($columns as $column) {
                if ($column->type != 'hidden')
                    echo '<td></td>';
            } ?>
        </tr>
    </tbody>
    <script>
        const columnList=<?php echo json_encode($columns) ?>;
        
        var <?php echo $tableId?>_data=[];
        var mytable = $('#<?php echo $tableId?>')[0];
        function getRandomId(){
            return Math.floor(Math.random() * Math.floor(1000));
        }

        function addPreRowToResult(){
            const idField = columnList.filter(c=> c.type == 'hidden')[0];
            const node = $('#' + idField.id);
            if (node.length === 0) return;
            $('#' + idField.id).val(getRandomId());
            let currentRow={};
            for (var i=0;i<columnList.length;i++){
                currentRow[columnList[i].id] = $('#' + columnList[i].id).val();
            }
            <?php echo $tableId?>_data.push(currentRow);

            mytable.rows[mytable.rows.length-2].onclick=(function() {return function() {edit(this.parentElement.parentElement);}})();

            for (var j = 0, col; col = mytable.rows[mytable.rows.length-2].cells[j]; j++) {
                if (j!=0){
                    const cellValue = col.children[0].value;
                    col.removeChild(col.children[0]);
                    col.appendChild(document.createTextNode(cellValue));
                }
            } 
        }

        function edit(row){
            

        }

        function addRow(){
            addPreRowToResult();
            
            var newRow = $("<tr></tr>");
            for (var i=0;i<7;i++){
                var newelement = $("<td></td>");
                if (i==0){
                    var btn = document.createElement('button');
                    btn.innerText = "-";
                    btn.className = "btn btn-danger btn-sm";
                    btn.onclick=(function() {return function() {removeRow(this.parentElement.parentElement);}})();
                    btn.type="button";
                    newelement.append(btn);
                } else if (i==1){
                    newelement = $("<td style='display:none'></td>");
                    var input = document.createElement('input');
                    input.type = "hidden";
                    input.id = columnList[i-1].id;
                    newelement.append(input);

                } else {
                    var input = document.createElement('input');
                    input.className = "form-control form-control-sm";
                    input.id = columnList[i-1].id;
                    newelement.append(input);
                }
                newRow.append(newelement);
            }

            $('#<?php echo $tableId?> tr:last').before(newRow);

        }

        function removeRow(row){
            for( var i = 0; i < <?php echo $tableId?>_data.length; i++){ 
                if ( <?php echo $tableId?>_[i].field_id == row.children[1].innerText) {
                    <?php echo $tableId?>_data.splice(i, 1); 
                }
            }
            row.remove();
        }

        function getTableData(){
            addPreRowToResult();
            return JSON.stringify(<?php echo $tableId?>_data);
        }
    </script>
    </table>