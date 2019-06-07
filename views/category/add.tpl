
<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.content{
     display:flex;
    flex-flow:column;
    justify-content:center;
    align-items:center;
}
.item{
    display:flex;
    flex-flow:column;
    max-width:60%;
    justify-content:center;
    align-items:center;
    height:60%;
    width:40%;
    border:5px solid black;
    border-radius:30px;

}
.name{
       display:flex;
    flex-flow:row;
    width:90%;
    height:25%;
  /*border:1px solid black;*/
    
}
.row{
    width:100%;
   /* border:1px solid black;*/
    margin-right:auto;
    margin-left:auto;
}
label{
    margin:auto;
    font-size:120%;
    
    color:black;
    
}


.form-group{
    width:100%;
height:40%;
    margin:auto;
}
.btn-primary{
width:30%;
height:50%;
margin:auto;
}
.btn-danger{
    width:30%;
height:50%;
margin:auto;

}
.custom-switch{

  transform: scale(2, 2);
margin:auto;
}
.custom-file{
    width:40%;
    height:30%;

margin-right:auto;
margin:auto;
}

.input-group-prepend {
      width:100%;
height:50%;
   
   
  
}

.input-group{
    height:50%;
}


    


</style>

<form action="index.php?id=category/save" method="post" class="taak_form"  enctype="multipart/form-data"  >

<input type="hidden" name='id' >
<div class="content">
 <div class="item">
 <div class="name">
 <div class="row"><label>عنوان</label></div>
 <div class="row">
  <div class="form-group">
    <input type="text" name='title' class="form-control">
  </div>
 </div>

 </div>
  <div class="name">
  <div class="row"><label>فیلدست</label></div>
  <div class="row">
   <div class="form-group">
    <?php $dropdownName="fieldset"; $datasource=$fieldsets; $dropdownValue="";  require_once HOME . DS . 'views' . DS . 'components' . DS . 'dropdown.php' ?>
  </div>
  </div>
  </div>
 <div class="name">
 <div class="row"><label>لوگو</label></div>
 <div class="row">
 <div class="input-group mb-3">
  <div class="input-group-prepend">
  </div>
  <input type="file" name='logo' class="form-control" >
</div>
 </div>
 </div>
 <div class="name">
 <div class="row"><label>فعال بودن</label></div>
 <div class="row">
 <div class="custom-control custom-switch">
  <input type="checkbox" name='active' class="custom-control-input" id="active">
<label class="custom-control-label" for="active"></label>

</div>
 </div>
 </div>
  <div class="name">
  <div class="row">


  </div>
  <div class="row">
        <button type="submit" class="btn btn-primary"><p>ذخیره</p></button>
        <button type="button" class="btn btn-danger"><p>انصراف</p></button>
  </div>
  </div>


 </div>

</div>
 </form>
<?php include('views/footer.tpl');?>
