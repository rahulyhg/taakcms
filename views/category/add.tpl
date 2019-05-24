
<?php include('views/header.tpl');?>
<?php include('views/menu.tpl');?>
<style>
.item{
    display:flex;
    flex-flow:column;
    width:40%;
    height:60%;
    border:5px solid black;
    border-radius:30px;
    margin-top:100px;
   padding-left:50px;
      padding-top:50px;

}
.name{
       display:flex;
    flex-flow:row;
    width:100%;
    height:25%;
    /*border:1px solid black;*/
    
}
.row{
    width:100%;
    /*border:1px solid black;*/
    margin-right:auto;
    margin-left:auto;
}
label{
    margin:auto;
    font-size:150%;
    color:black;
    
}


.form-group{
    width:150%;
height:40%;
    margin:auto;
}
.btn-primary{
width:80%;
height:50%;
font-size:20px;
margin:auto;
margin-right:200px;
}
.btn-danger{
    width:32%;
height:50%;
font-size:20px;
margin:auto;
margin-right:50px;

}
.custom-switch{
width:50px;
  transform: scale(2, 2);
margin:auto;

}
.custom-file{
    width:40%;
margin-right:auto;
margin:auto;
}

.input-group-prepend {
      width:100%;
height:40%;
    margin:auto;
   
  
}
p{
    font-size:100%;
    margin:auto;
}

    


</style>

<div class="content">
 <div class="item">
 <div class="name">
 <div class="row"><label>عنوان</label></div>
 <div class="row">
  <div class="form-group">
    <input type="text" class="form-control">
  </div>
 </div>

 </div>
  <div class="name">
  <div class="row"><label>زمینه</label></div>
  <div class="row">
   <div class="form-group">
    <input type="text" class="form-control" id="exampleFormControlInput1">
  </div>
  </div>
  </div>
 <div class="name">
 <div class="row"><label>لوگو</label></div>
 <div class="row">
 <div class="input-group mb-3">
  <div class="input-group-prepend">
    <button class="btn btn-outline-secondary" type="button" id="button-addon1"><p>انتخاب فایل</p></button>
  </div>
  <input type="text" class="form-control" >
</div>
 </div>
 </div>
 <div class="name">
 <div class="row"><label>فعال بودن</label></div>
 <div class="row">
 <div class="custom-control custom-switch">
  <input type="checkbox" class="custom-control-input" id="customSwitch1">
<label class="custom-control-label" for="customSwitch1"></label>

</div>
 </div>
 </div>
  <div class="name">
  <div class="row">
  <button type="button" class="btn btn-primary"><p>ذخیره</p></button>


  </div>
  <div class="row">
      <button type="button" class="btn btn-danger"><p>انصراف</p></button>

  </div>
  </div>


 </div>

</div>

<?php include('views/footer.tpl');?>
