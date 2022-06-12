<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KODSON ERP</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">

    <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/preloader.css">
    <link rel="shortcut icon" href="assets/images/logo.JPG" type="image/x-icon">
    
    <link rel="stylesheet" href="assets/vendors/choices.js/choices.min.css" />
    
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        
        
         <!-- Alertify CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
  <!-- Alertify js -->  
 <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 
    <style>
    
body{margin-top:20px;}
.preloader {
  position: fixed;
  left: 0;
  width: 0;
  height: 100%;
  width: 100%;
  text-align: center;
  z-index: 9999999;
  -webkit-transition: .9s;
  transition: .9s;
}

.preloader .loader {
  position: absolute;
  width: 80px;
  height: 80px;
  border-radius: 50%;
  display: inline-block;
  left: 0;
  right: 0;
  margin: 0 auto;
  top: 45%;
  -webkit-transform: translateY(-45%);
          transform: translateY(-45%);
  -webkit-transition: 0.5s;
  transition: 0.5s;
}

.preloader .loader .loader-outter {
  position: absolute;
  border: 4px solid #ffffff;
  border-left-color: transparent;
  border-bottom: 0;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  -webkit-animation: loader-outter 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
          animation: loader-outter 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
}

.preloader .loader .loader-inner {
  position: absolute;
  border: 4px solid #ffffff;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  left: calc(40% - 21px);
  top: calc(40% - 21px);
  border-right: 0;
  border-top-color: transparent;
  -webkit-animation: loader-inner 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
          animation: loader-inner 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
}

.preloader .loader .indicator {
  position: absolute;
  right: 0;
  left: 0;
  top: 50%;
  -webkit-transform: translateY(-50%) scale(1.5);
          transform: translateY(-50%) scale(1.5);
}

.preloader .loader .indicator svg polyline {
  fill: none;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
}

.preloader .loader .indicator svg polyline#back {
  stroke: #ffffff;
}

.preloader .loader .indicator svg polyline#front {
  stroke: #1A76D1;
  stroke-dasharray: 12, 36;
  stroke-dashoffset: 48;
  -webkit-animation: dash 1s linear infinite;
          animation: dash 1s linear infinite;
}

.preloader::before, .preloader::after {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 60%;
  z-index: -1;
  background: #1A76D1;
  -webkit-transition: .9s;
  transition: .9s;
}

.preloader::after {
  left: auto;
  right: 0;
}

.preloader.preloader-deactivate {
  visibility: hidden;
}

.preloader.preloader-deactivate::after, .preloader.preloader-deactivate::before {
  width: 0;
}

.preloader.preloader-deactivate .loader {
  opacity: 0;
  visibility: hidden;
}

@-webkit-keyframes loader-outter {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}

@keyframes loader-outter {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}

@-webkit-keyframes loader-inner {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(-360deg);
            transform: rotate(-360deg);
  }
}

@keyframes loader-inner {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(-360deg);
            transform: rotate(-360deg);
  }
}

@-webkit-keyframes dash {
  62.5% {
    opacity: 0;
  }
  to {
    stroke-dashoffset: 0;
  }
}

@keyframes dash {
  62.5% {
    opacity: 0;
  }
  to {
    stroke-dashoffset: 0;
  }
}
    </style>
</head>

<body>

<div class="preloader">
    <div class="loader">
        <div class="loader-outter"></div>
        <div class="loader-inner"></div>

        <div class="indicator"> 
            <svg width="16px" height="12px">
                <polyline id="back" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                <polyline id="front" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
            </svg>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       
        <script src="component/jquery/jquery.js" type="text/javascript"></script>
        <script src="component/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="component/jquery.validate.min.js" type="text/javascript"></script>
        <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript">

$(window).on('load', function() {
    //for use in production please remove this setTimeOut
    setTimeout(function(){ 
        $('.preloader').addClass('preloader-deactivate');
    }, 30);
    
   
    //uncomment this line for use this snippet in production
    //	$('.preloader').addClass('preloader-deactivate');
});
</script>

    <div id="app">
    
    <!-- start side bar -->
    
           
        
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="index.html"><img src="assets/images/logo.JPG" alt="Logo" srcset="" style="width:150px; height:120px;" ></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item  ">
                            <a href="dashBoard.jsp" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="fa-solid fa-bacon"></i>
                                <span>Trips</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="trips.jsp">Add Trips</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="tracksTrip.jsp">Trips Per Truck</a>
                                </li>
                               
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="fa-regular fa-clipboard"></i>
                                <span>Freight Claims</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="fClaims.jsp">Claims</a>
                                </li>
                                
                               
                            </ul>
                        </li>


                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="fa-solid fa-map-location"></i>
                                <span>Locations</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="locations.jsp">Add a Location</a>
                                </li>
                                
                               
                            </ul>
                        </li>
                        
                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="fa-solid fa-user"></i>
                                <span>Drivers</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="addDriver.jsp">Add a Driver</a>
                                </li>
                                
                                <li class="submenu-item ">
                                    <a href="Shortage.jsp">Add Shortage</a>
                                </li>
                                
                                <li class="submenu-item ">
                                    <a href="payShortage.jsp">Pay Shortage</a>
                                </li>
                                
                               
                            </ul>
                        </li>
                        

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="fa-regular fa-calendar"></i>
                                <span>Reports</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="reports.jsp">Monthly Report</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="periodic.jsp">Periodic Report</a>
                                </li>
                               
                            </ul>
                        </li>

                       

                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        
        <!-- end side bar -->
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Employee</h3>
                           
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Employee</li>
                                </ol>
                                
                            <button type="button" class="btn btn-outline-info"
                                data-bs-toggle="modal" data-bs-target="#xlarge">
                                Add Location
                            </button>
                                
                            </nav>
                            

                            
                        </div>
                    </div>
                </div>
                
                <br>
                
                	<script type="text/javascript">
												getall();
												
												function getall()
									            {
									                
									                $('#tbl-student').dataTable().fnDestroy();
									                $.ajax({
									                    
									                    url: "tripData.jsp",
									                    type : "GET",
									                    dataType : "JSON",
									                    data:{"option":'getLocations'},
									                    
									                    success:function(data)
									                    {
									                        
									                       $('#tbl-student').dataTable({
									                           "aaData":data,
									                           "scrollX": false,
									                           
									                           
									                           "aoColumns":
									                                   [
									                              
									                                	   {"sTitle": "#","mData": "number"},
									                                    
									                                    
									                                   {
									                                        "sTitle":
									                                        "Loading Point",
									                                        "mData": "loading",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Discharging Point",
									                                        "mData": "discharging",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                   {
									                                        "sTitle":
									                                        "Rate",
									                                        "mData": "rate",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Distance",
									                                        "mData": "distance",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Fuel",
									                                        "mData": "fuel",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Actions",
									                                        "mData": "number",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                    
									                                  
									                                   ]
									                       });
									                      
									                    }  
									                  
									                });
									                
									            }
												
												function update(ids){
													sessionStorage.setItem("id",ids);
													$.ajax({
										        		  
										        		  type:"POST",
										        		  url:"tripData.jsp",
										        		  data:{"myid" :ids,"option":'showLocation'},
										        		  
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			
										        			  $("#ld").val(obj[0].loading);
										        			  $("#ds").val(obj[0].discharging);
										        			  $("#ra").val(obj[0].rate);
										        			  $("#dis").val(obj[0].distance);
										        			  $("#fu").val(obj[0].fuel);
										        			
										        			  
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
												}
												
												
												 function add(){
										        	  
												        
										        	  $.ajax({
										        		  
										        		  type:"POST",
										        		  url:"tripData.jsp",
										        		  data:{"lpoint":$("#lpoint").val() ,"dpoint":$("#dpoint").val(),"rate":$("#rate").val(),"distance":$("#distance").val(),"fuel":$("#fuel").val(),"option":'addLocations'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  getall();
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
										        	  
										          }
												 
												 function edit(){
										        	  
												      var id = sessionStorage.getItem("id");
												      
										        	  $.ajax({
										        		  
										        		  type:"POST",
										        		  url:"tripData.jsp",
										        		  data:{"myid" :id,"lpoint":$("#ld").val(),"dpoint":$("#ds").val(),"rate":$("#ra").val(),"distance":$("#dis").val(),"fuel":$("#fu").val(),"option":'editLocation'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  getall();
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
										        	  
										          }
												
												</script>
                
                <!--Extra Large Modal -->
              <div class="modal fade text-left w-100" id="xlarge" tabindex="-1"
                  role="dialog" aria-labelledby="myModalLabel16" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-scrollable modal-xl"
                      role="document">
                      <div class="modal-content">
                          <div class="modal-header">
                              <h4 class="modal-title" id="myModalLabel130">Add a new Location</h4>
                              <button type="button" class="close" data-bs-dismiss="modal"
                                  aria-label="Close">
                                  <i data-feather="x"></i>
                              </button>
                          </div>
                          <div class="modal-body">
         <form id="regForm" action="insert" method="post" enctype="multipart/form-data">
			<div class="row">
			<section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12" >
                        
                        
                        <br>
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <div class="form-group row  container justify-content-center">
                                   <!-- Employee Details  -->
                                        <div class="col-md-4 mb-3">
											<label> Loading Point</label> <input type="text" class="form-control"
												placeholder="" name="lpoint" id="lpoint" required>
										</div>

										<div class="col-md-4 mb-3">
											<label>Discharging Point</label>
											<div>
												<input type="text" id="dpoint" class="form-control"
													 name="dpoint" />
											</div>
										</div>
										
										<div class="col-md-4 mb-3">
											<label>Rate</label>
											<div>
												<input type="text" id="rate" class="form-control"
													 name="rate" />
											</div>
										</div>
                                           

										<div class="col-md-4 mb-3">
											<label>Distance</label>
											<div>
												<input  id="distance" class="form-control"
													 name="distance" />
											</div>
										</div>

										<div class="col-md-4 mb-3">
											<label>Fuel</label>
											<div>
												<input type="text" id="fuel" class="form-control"
													 name="fuel" />
											</div>
										</div>

									                            
                                                                            
                                     <!-- End of Employee Details -->                                              
                                   </div>
                            </div>
                            
                            

                       
                          
                        </div>
                    </div>
                </div>
         
        </section>
																				
			</div>
				</form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-light-secondary"
                                  data-bs-dismiss="modal">
                                  <i class="bx bx-x d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">Close</span>
                              </button>
                              <button type="button" class="btn btn-primary ml-1"
                                  data-bs-dismiss="modal" onclick="add()">
                                  <i class="bx bx-check d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">Add Location</span>
                              </button>
                          </div>
                      </div>
                  </div>
              </div>
              
              <!-- End extra large modal -->
              
              <!--Extra Large Modal -->
              <div class="modal fade text-left w-100" id="xlarge1" tabindex="-1"
                  role="dialog" aria-labelledby="myModalLabel16" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-scrollable modal-xl"
                      role="document">
                      <div class="modal-content">
                          
                          <div class="modal-body">
         <form id="regForm" action="insert" method="post" enctype="multipart/form-data">
			<div class="row">
			<section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12" >
                        
                        <div class="tab-content" id="nav-tabContent">
                        <br>
                            <div class="tab-pane fade show active" id="nav-home1" role="tabpanel" aria-labelledby="nav-home-tab1">
                                <div class="form-group row  container justify-content-center">
                                   <!-- Employee Details  -->
                                        <div class="col-md-4 mb-3">
											<label> Loading Date</label> <input type="text" class="form-control"
												placeholder="" name="Name" id="ld" required>
										</div>

										<div class="col-md-4 mb-3">
                                                <label>Discharging Point</label>
                                                
                                                
                                                    <input class="form-control" name="gender" id="ds">
                                                        
                                                
                                            </div>
                                            
                                            <div class="col-md-4 mb-3">
                                                <label>Rate</label>
                                                
                                                
                                                    <input class="form-control" name="Mstatus" id="ra">
                                                       
                                                
                                            </div>

										<div class="col-md-4 mb-3">
											<label>Distance</label>
											<div>
												<input type="text" id="dis" class="form-control"
													 name="email" id="dis"/>
											</div>
										</div>

										<div class="col-md-4 mb-3">
											<label>Fuel</label>
											<div>
												<input type="text" id="fu" class="form-control"
													data-validation="number" name="Number11" />
											</div>
										</div>

                                     <!-- End of Employee Details -->                                              
                                   </div>
                            </div>
            
                        </div>
                    </div>
                </div>
            </div>
        </section>
																				
			</div>
				</form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-light-secondary"
                                  data-bs-dismiss="modal">
                                  <i class="bx bx-x d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">Close</span>
                              </button>
                              <button type="button" class="btn btn-primary ml-1"
                                  data-bs-dismiss="modal" onclick="edit()">
                                  <i class="bx bx-check d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">update</span>
                              </button>
                          </div>
                      </div>
                  </div>
              </div>
              
              <!-- End extra large modal -->
              
            </div>
                
                
                
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            Employees List
                        </div>
                        <div class="card-body">
                       
                    <table id="tbl-student" class="table table-hover table table-sm" cellpadding="0" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                              
                            </tr>  
                        </thead>  
                    </table>  
                
                        </div>
                    </div>

                </section>
            </div>
            
            
            

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                   
                </div>
            </footer>
        </div>
   
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
    <script>
        // Simple Datatable
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
    </script>

    <script src="assets/vendors/choices.js/choices.min.js"></script>
    <script src="assets/js/pages/form-element-select.js"></script>

    <script src="assets/js/main.js"></script>
</body>

</html>