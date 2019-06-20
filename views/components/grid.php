<input type="hidden" id="<?php echo $tableId?>" name="<?php echo $tableId?>" value=""></td>
<table class="table table-sm" id='<?php echo $tableId?>_tbl'>
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
            <td scope="row"><button type="button" class="btn btn-light btn-sm" onclick="addRow();">+</button></td>
            <?php foreach($columns as $column) {
                if ($column->type == 'hidden'){
                    echo '<td style="display:none" ></td>';
                }else{
                    echo '<td></td>';
                }
            } ?>
        </tr>
    </tbody>
    <script>
        const columnList = <?php echo json_encode($columns) ?>;
        const mytable = $('#<?php echo $tableId?>_tbl')[0];
        var <?php echo $tableId?>_data=[];

        <?php 
            if(count($data) > 0){ 
                echo $tableId . "_data=" . json_encode($data) . ";";
                
                echo "setdata();";
            } 
        ?>

        function setdata(){

            for (var row=0;row < <?php echo $tableId?>_data.length ; row++){ 
                var newRow = $("<tr></tr>");
                for (var i=0;i<columnList.length +1;i++){
                    var newelement = $("<td></td>");
                    if (i==0){
                        var btn = document.createElement('button');
                        btn.innerText = "-";
                        btn.className = "btn btn-light btn-sm";
                        btn.onclick=(function() {return function() {
                            removeRow(this.parentElement);
                            }})();
                        btn.type="button";
                        newelement.append(btn);
                    } else if (i==1){
                        newelement = $("<td style='display:none'></td>");
                        var cellValue = <?php echo $tableId?>_data[row][columnList[i-1].id]
                        newelement.append(document.createTextNode(cellValue));

                    } else {
                        var cellValue = <?php echo $tableId?>_data[row][columnList[i-1].id]
                        newelement.append(document.createTextNode(cellValue));
                    }
                    newRow.append(newelement);
                }
                newRow[0].onclick=(function() {return function() {edit(this);}})();
                $('#<?php echo $tableId?>_tbl tr:last').before(newRow);
            }
        }
        
        function getRandomId(){
            return Math.floor(Math.random() * Math.floor(1000)) * -1;
        }

        function addPreRowToResult(){
            const idField = columnList.filter(c=> c.type == 'hidden')[0];
            const node = $('#' + idField.id);
            if (node.length === 0) return;
            const rowId = $('#' + idField.id).val();
            const isNew = rowId == "";
            
            if (isNew){
                $('#' + idField.id).val(getRandomId());
                let currentRow={};
                for (var i=0;i<columnList.length;i++){
                    currentRow[columnList[i].id] = $('#' + columnList[i].id).val();
                }
                currentRow['row_status'] = 'inserted';
                <?php echo $tableId?>_data.push(currentRow);
            }else{
                const index = <?php echo $tableId?>_data.findIndex(c=> c.field_id == rowId);
                for (var i=0;i<columnList.length;i++){
                    <?php echo $tableId?>_data[index][columnList[i].id] = $('#' + columnList[i].id).val();
                }
                if (<?php echo $tableId?>_data[index][idField.id] > 0){
                    <?php echo $tableId?>_data[index]['row_status'] = 'updated';
                }
            }

            var row = node[0].parentElement.parentElement;
            row.onclick=(function() {return function() {edit(this);}})();

            for (var j = 0, col; col = row.cells[j]; j++) {
                if (j!=0){
                    const cellValue = col.children[0].value;
                    col.removeChild(col.children[0]);
                    col.appendChild(document.createTextNode(cellValue));
                }
            } 
            
        }

        function changeToEditMode(row){
            row.onclick=(function() {return function() {}})();

            for (var j = 0, col; col = row.cells[j]; j++) {
                if (j != 0){
                    const cellValue = col.innerText;
                    col.innerText="";
                    if (columnList[j-1].type == 'select'){
                        var select = document.createElement('select');
                        select.className = "custom-select custom-select-sm";
                        select.name = columnList[j-1].id;
                        select.id = columnList[j-1].id;
                        select.value = cellValue;
                        const options = columnList[j-1].options;
                        for (var option=0;option < options.length;option++){
                            var opt = document.createElement('option');
                            opt.appendChild( document.createTextNode(options[option]));
                            opt.value = options[option]; 
                            opt.selected = options[option] == cellValue;
                            select.appendChild(opt); 
                        }
                        col.appendChild(select);
                    }else{
                        var input = document.createElement('input');
                        input.type = columnList[j-1].type == "hidden" ? "hidden" : "text";
                        input.className = "form-control form-control-sm";
                        input.id = columnList[j-1].id;
                        input.value = cellValue;
                        col.appendChild(input);
                    }
                }
            } 
        }

        function edit(row){
            addPreRowToResult();
            changeToEditMode(row);
        }

        function addRow(){
            addPreRowToResult();
            
            var newRow = $("<tr></tr>");
            for (var i=0;i<columnList.length+1;i++){
                const columnInfo = columnList[i-1];
                var newelement = $("<td></td>");
                if (!columnInfo){
                    var btn = document.createElement('button');
                    btn.innerText = "-";
                    btn.className = "btn btn-light btn-sm";
                    btn.onclick=(function() {return function() {
                        removeRow(this.parentElement);
                        }})();
                    btn.type="button";
                    newelement.append(btn);
                } else if (columnInfo.type == 'hidden'){
                    newelement = $("<td style='display:none'></td>");
                    var input = document.createElement('input');
                    input.type = "hidden";
                    input.id = columnList[i-1].id;
                    newelement.append(input);

                } else if (columnInfo.type == 'select'){
                    var select = document.createElement('select');
                    select.className = "custom-select custom-select-sm";
                    select.name = columnInfo.id;
                    select.id = columnInfo.id;
                    const options = columnInfo.options;
                    for (var option=0;option < options.length;option++){
                        var opt = document.createElement('option');
                        opt.appendChild( document.createTextNode(options[option]));
                        opt.value = options[option]; 
                        select.appendChild(opt); 
                    }
                    newelement.append(select);
                } else {
                    var input = document.createElement('input');
                    input.className = "form-control form-control-sm";
                    input.id = columnList[i-1].id;
                    newelement.append(input);
                }
                newRow.append(newelement);
            }

            $('#<?php echo $tableId?>_tbl tr:last').before(newRow);

        }

        function removeRow(row){
            var e = window.event;
            e.cancelBubble = true;
            if (e.stopPropagation) e.stopPropagation();
            
            for( var i = 0; i < <?php echo $tableId?>_data.length; i++){ 
                isNew = Number(row.parentElement.children[1].innerText) < 0;
                if ( <?php echo $tableId?>_data[i].field_id == row.parentElement.children[1].innerText) {
                    if (isNew)
                        <?php echo $tableId?>_data.splice(i, 1); 
                    else
                        <?php echo $tableId?>_data[i]['row_status'] = 'deleted';
                }
            }

            if (row.parentElement){
                row.parentElement.remove();
            }else{
                row.remove();
            }
        }

        function getTableData(){
            addPreRowToResult();
            return JSON.stringify(<?php echo $tableId?>_data);
        }
    </script>
    </table>