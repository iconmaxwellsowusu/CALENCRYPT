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
 
   <!-- month css cdn  -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />  
  
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
                        <div class="col-12 col-md-6 order-md-1 order-last ">
                            <h3>Trips</h3>
                        </div>
                        
                       
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Employee</li>
                                </ol>
                             
                             <button type="button" class="btn btn-primary"
                                data-bs-toggle="modal" data-bs-target="#xlarge1">
                                Add Trips <i class="fa-solid fa-truck-moving"></i>
                            </button>
                                
                            <button type="button" class="btn btn-outline-info change"
                                data-bs-toggle="modal" data-bs-target="">
                                Toggle between Processed and Unprocessed Trips
                            </button>
                                
                            </nav>
                        </div>
                    </div>
                </div>
                </br>
<%--                 <section id="basic-input-groups">
                    <div class="row">
                        <div class="col-10">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Select Month and Department and Click Proceed</h4>
                                </div>
                                <div class="card-content container">
                                    <div class="card-body">
                                        
                                        <div class="row justify-content-center" >
                                            
                                           
                                             <!-- /////////////////////////   month and year selector ///////////////////////////////-->                         
                                
									                                
									                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
									                                <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
									
																
																<div class="form-group row  container justify-content-center" >
																<div class="col-md-4 mb-3">
																<label >Select month</label>	                                 
																	<div class='input-group date datepicker' id='table'>						
																	  <input type="text" name="month" id="month" class="form-control" required/>
																	  <span class="input-group-addon input-group-text" id="basic-addon1"><i class="fa-solid fa-circle-arrow-down"></i></span>
																	</div>
																</div>
																
																	<div class="form-group floating-label col-md-4 mb-3">
																	<label for="" class="mt-1">Select Department</label>
							                                         <select class="choices form-select" name="department" id="department" required>
							                                                          <%
							                                                          String url ="jdbc:mysql://localhost/kodsonvms";
																	                  String username="root";
																	                  String password="root";
																		                
																		                  
																		                       try{
																		                    	   Class.forName("com.mysql.jdbc.Driver");
																		                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
																		                    	   Statement stt = conn.createStatement();
																		                    	   String query ="select * from department";
																		                    	   ResultSet rss = stt.executeQuery(query);
																		                    	   
																		                    	   while(rss.next()){
																		                    		   
																		                    		   %>
																		                    		    
																		                    		   <option><%=rss.getString("departmentName") %></option>  
																		                    		   <% 
																		                    		   System.out.println();
																		                    	   }
																		                    	   
																		                       }catch(Exception e){
																		                    	   
																		                       }
							                                                          %>
							                                                          
							                                            </select>
							                                    
							                                </div>
																							
																<div class="col-md-4 mb-3 ">
																 <button type="button" class="btn btn-outline-dark "
									                                   onclick="getall()">
									                                  <span class="d-none d-sm-block"> Proceed <i class="fa-solid fa-arrow-right"></i><i class="fa-solid fa-angles-right"></i> </span>
									                              </button>
					                                             </div> 
																</div>	
																	<script>
																	
																	$('#table').datepicker({
																		  format: 'MM/yyyy',
																		  icons: {
																		    time: 'fa fa-time',
																		    date: 'fa fa-calendar',
																		    up: 'fa fa-chevron-up',
																		    down: 'fa fa-chevron-down',
																		    previous: 'fa fa-chevron-left',
																		    next: 'fa fa-chevron-right',
																		    today: 'fa fa-screenshot',
																		    clear: 'fa fa-trash',
																		    close: 'fa fa-remove'
																		  },
																		  startView: "months",
																		  minViewMode: "months"
																		});
																	
																	</script>
									                         <!-- //////////////////////////////////////-------------------------//////////////////////// -->  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div  id="out"> </div>
                    <input id="in" type="text" class="form-control"/>
                </section> --%>
                
                <br>
                
                
                
                <!--Extra Large Modal -->
              <div class="modal fade text-left w-100" id="xlarge" tabindex="-1"
                  role="dialog" aria-labelledby="myModalLabel16" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-scrollable modal-xl"
                      role="document">
                      <div class="modal-content">
                          <div class="modal-header">
                              <h4 class="modal-title" id="myModalLabel130">Update Trips
                                  Modal</h4>
                              <button type="button" class="close" data-bs-dismiss="modal"
                                  aria-label="Close">
                                  <i data-feather="x"></i>
                              </button>
                          </div>
                          <div class="modal-body">
         <form action="#" id="edit_payslip">
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Select Driver:</b></label>
                                            <div class="col-lg-4">
                                              <input class="form-control" name="driver" id="updriver4"  required>
                                               
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Vehicle Number: </b></label>
                                            <div class="col-lg-4">
                                                 <input type="text" name="vehicleN" id="upvehicleN"  class="form-control" value ="">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"> <b>Loading Date:</b> </label>
                                            <div class="col-lg-4">
                                                <input name="loadingDate" id="uploadingDate" type="date" class="form-control" value ="">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Discharging Date:</b></label>
                                            <div class="col-lg-4">
                                                <input type="date" name="dischargingDate" id="updischargingDate" class="form-control" value ="">
                                            </div>
                                            </div>
                                            <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Main Company:</b></label>
                                            <div class="col-lg-4">
                                            <input class="form-control" name="mCompany" id="upmCompany">
                                           
                                            </div>
                                            
                                              <label class="col-lg-2 col-form-label"><b>Sub Company:</b></label>
                                            <div class="col-lg-4">
                                            <input class="form-control" name="subCompany" id="upsubCompany">
                                        
                                            </div>
                                            
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <hr style="border: 1px solid orange; margin-bottom:0px;">
                            <div class="text-center"><b>TRIP FILEDS</b></div>
                            <hr style="border: 1px solid orange; margin-top:0px;">
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Select Month:</b></label>
                                            <div class="col-lg-4">
                                        
                                            <!-- /////////////////////////   month and year selector ///////////////////////////////-->                         
                                
									                                
									                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
									                                <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
									
																<div class="col-md-12 mb-3">
																                                 
																	<div class='input-group date datepicker' id='table1'>						
																	  <input type="text" name="month" id="upmonth" class="form-control" required/>
																	  <span class="input-group-addon input-group-text" id="basic-addon1"><i class="fa-solid fa-circle-arrow-down"></i></span>
																	</div>
																</div>
																
																
																	<script>
																	
																	$('#table1').datepicker({
																		  format: 'MM/yyyy',
																		  icons: {
																		    time: 'fa fa-time',
																		    date: 'fa fa-calendar',
																		    up: 'fa fa-chevron-up',
																		    down: 'fa fa-chevron-down',
																		    previous: 'fa fa-chevron-left',
																		    next: 'fa fa-chevron-right',
																		    today: 'fa fa-screenshot',
																		    clear: 'fa fa-trash',
																		    close: 'fa fa-remove'
																		  },
																		  startView: "months",
																		  minViewMode: "months"
																		});
																	
																	</script>
									                         <!-- //////////////////////////////////////-------------------------//////////////////////// -->  

                                            </div>
                                            
                                            
                                        <label class="col-lg-2 col-form-label"><b>Product:</b></label>
                                            <div class="col-lg-4">
                                            <input class="form-control" name="product" id="upproduct">
                                            
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Allowable Loss Lit:</b></label>
                                            <div class="col-lg-4">
                                        <input type="text" id="upallowableLoss" name="allowableLoss" class="form-control numbersonly-format" value="" class="form-control numbersonly-format" >
                                            </div>
                                            
                                            
                                        <label class="col-lg-2 col-form-label"><b>Cost per Lit</b></label>
                                            <div class="col-lg-4">
                                            <input type="text" name="costPerL" id="upcostPerL" class="form-control numbersonly-format" value="0.00">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Waybill#:</b></label>
                                            <div class="col-lg-4">
                                        <input type="text" id="upwayBill" name="wayBill" class="form-control numbersonly-format" value="" class="form-control numbersonly-format">
                                            </div>
                                            
                                            
                                        <label class="col-lg-2 col-form-label"><b>OverNight Allowance:</b></label>
                                            <div class="col-lg-4">
                                            <input type="text" name="overnightAllowance" id="upovernightAllowance" class="form-control numbersonly-format" value="0.00">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Quantity:</b></label>
                                            <div class="col-lg-4">
                                            <input type="text" name="quantity" id="upquantity" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Location:</b></label>
                                            <div class="col-lg-4">
                                           <input class="form-control" name="location" id="uplocation" required>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Distance:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="distance" id="updistance" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Rate:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="rate" value="0"  id="uprate" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Amount:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="amount" id="upamount" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Fuel:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="fuel" id="upfuel" value="0.00" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                           
                                            <label class="col-lg-2 col-form-label"><b>Product Loss Lit:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="ploss" id="upploss" value="0.00" class="form-control numbersonly-format">
                                            </div>

                                            
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                         <hr style="border: 1px solid orange; margin-bottom:0px;">
                            <div class="text-center"><b>CALCULATED FILEDS</b></div>
                            <hr style="border: 1px solid orange; margin-top:0px;">
                            
                           <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Shortage Value GH:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="shortageVal" id="upshortageVal" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Deduction At Source:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="deduction" value="0"  id="updeduction" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Payment Due:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="payment" id="uppayment" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Amount Receivable:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="amountR" id="upamountR" value="0.00" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            
                              <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Cash Paid:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="cashPaid" id="upcashPaid" value="0.00" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Actual Loss:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="actualLoss" value="0"  id="upactualLoss" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
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
                                  <span class="d-none d-sm-block">Update</span>
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
                          <div class="modal-header">
                              <h4 class="modal-title" id="myModalLabel130">Trip Form</h4>
                              <button type="button" class="close" data-bs-dismiss="modal"
                                  aria-label="Close">
                                  <i data-feather="x"></i>
                              </button>
                          </div>
                          <div class="modal-body">
                          <form action="#" id="edit_payslip">
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Select Driver:</b></label>
                                            <div class="col-lg-4">
                                              <select class="choices form-select" name="driver" id="driver4"  required>
                                                         <%
                                                        
                                                          String url ="jdbc:mysql://localhost/kodsonvms";
										                  String username="root";
										                  String password="root";
										                  
										                       try{
										                    	   Class.forName("com.mysql.jdbc.Driver");
										                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
										                    	   Statement stt = conn.createStatement();
										                    	   String query ="select * from drivers";
										                    	   ResultSet rss = stt.executeQuery(query);
										                    	   
										                    	   while(rss.next()){
										                    		   
										                    		   %>
										                    		    
										                    		   <option><%=rss.getString("name") %></option>  
										                    		   <% 
										                    		   System.out.println();
										                    	   }
										                    	   
										                       }catch(Exception e){
										                    	   
										                       }
                                                         %>
							                                                          
							                       </select>
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Vehicle Number: </b></label>
                                            <div class="col-lg-4">
                                                 <input readonly type="text" name="vehicleN" id="vehicleN"  class="form-control" value ="">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"> <b>Loading Date:</b> </label>
                                            <div class="col-lg-4">
                                                <input name="loadingDate" id="loadingDate" type="date" class="form-control" value ="">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Discharging Date:</b></label>
                                            <div class="col-lg-4">
                                                <input type="date" name="dischargingDate" id="dischargingDate" class="form-control" value ="">
                                            </div>
                                            </div>
                                            <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Main Company:</b></label>
                                            <div class="col-lg-4">
                                            <select class="choices form-select" name="mCompany" id="mCompany">
                                            <option value=""></option>
											<option value="GOIL">GOIL</option>
											<option value="BOST">BOST</option>
											<option value="ATK">ATK</option>
											<option value="OTHER">OTHER</option>
											
                                                        
                                            </select>
                                            </div>
                                            
                                              <label class="col-lg-2 col-form-label"><b>Sub Company:</b></label>
                                            <div class="col-lg-4">
                                            <select class="choices form-select" name="subCompany" id="subCompany">
                                            <option value=""></option>
											<option value="KODSON">KODSON</option>
											<option value="KTC">KTC</option>
											<option value="KGL">KGL</option>
											<option value="MANNER">MANNER</option>
											<option value="JUST GRACE">JUST GRACE</option>
											<option value="UNIQUE TIMES">UNIQUE TIMES</option>
											<option value="LIDA">LIDA</option>
											<option value="JMP">JMP</option>
                                                        
                                            </select>
                                            </div>
                                            
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <hr style="border: 1px solid orange; margin-bottom:0px;">
                            <div class="text-center"><b>TRIP FILEDS</b></div>
                            <hr style="border: 1px solid orange; margin-top:0px;">
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Select Month:</b></label>
                                            <div class="col-lg-4">
                                        
                                            <!-- /////////////////////////   month and year selector ///////////////////////////////-->                         
                                
									                                
									                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
									                                <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
									
																<div class="col-md-12 mb-3">
																                                 
																	<div class='input-group date datepicker' id='table'>						
																	  <input type="text" name="month" id="month" class="form-control" required/>
																	  <span class="input-group-addon input-group-text" id="basic-addon1"><i class="fa-solid fa-circle-arrow-down"></i></span>
																	</div>
																</div>
																
																
																	<script>
																	
																	$('#table').datepicker({
																		  format: 'MM/yyyy',
																		  icons: {
																		    time: 'fa fa-time',
																		    date: 'fa fa-calendar',
																		    up: 'fa fa-chevron-up',
																		    down: 'fa fa-chevron-down',
																		    previous: 'fa fa-chevron-left',
																		    next: 'fa fa-chevron-right',
																		    today: 'fa fa-screenshot',
																		    clear: 'fa fa-trash',
																		    close: 'fa fa-remove'
																		  },
																		  startView: "months",
																		  minViewMode: "months"
																		});
																	
																	</script>
									                         <!-- //////////////////////////////////////-------------------------//////////////////////// -->  

                                            </div>
                                            
                                            
                                        <label class="col-lg-2 col-form-label"><b>Product:</b></label>
                                            <div class="col-lg-4">
                                            <select class="choices form-select" name="product" id="product">
                                            <option value=""></option>
											<option value="SUPER">SUPER</option>
											<option value="AGO">AGO</option>
											<option value="ATK">ATK</option>
											<option value="OTHER">OTHER</option>
                                            </select>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Allowable Loss Lit:</b></label>
                                            <div class="col-lg-4">
                                        <input type="text" id="allowableLoss" name="allowableLoss" class="form-control numbersonly-format" value="" class="form-control numbersonly-format" readonly>
                                            </div>
                                            
                                            
                                        <label class="col-lg-2 col-form-label"><b>Cost per Lit</b></label>
                                            <div class="col-lg-4">
                                            <input type="text" name="costPerL" id="costPerL" class="form-control numbersonly-format" value="0.00">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Waybill#:</b></label>
                                            <div class="col-lg-4">
                                        <input type="text" id="wayBill" name="wayBill" class="form-control numbersonly-format" value="" class="form-control numbersonly-format">
                                            </div>
                                            
                                            
                                        <label class="col-lg-2 col-form-label"><b>OverNight Allowance:</b></label>
                                            <div class="col-lg-4">
                                            <input type="text" name="overnightAllowance" id="overnightAllowance" class="form-control numbersonly-format" value="0.00">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Quantity:</b></label>
                                            <div class="col-lg-4">
                                            <input type="text" name="quantity" id="quantity" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Location:</b></label>
                                            <div class="col-lg-4">
                                           <select class="choices form-select" name="location" id="location" required>
                                                         <%
                                                        
										                
										                  
										                       try{
										                    	   Class.forName("com.mysql.jdbc.Driver");
										                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
										                    	   Statement stt = conn.createStatement();
										                    	   String query ="select * from location";
										                    	   ResultSet rss = stt.executeQuery(query);
										                    	   
										                    	   while(rss.next()){
										                    		   
										                    		   %>
										                    		    
										                    		   <option><%=rss.getString("locaction") %></option>  
										                    		   <% 
										                    		   System.out.println();
										                    	   }
										                    	   
										                       }catch(Exception e){
										                    	   
										                       }
                                                         %>
							                                                          
							                       </select>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Distance:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="distance" id="distance" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Rate:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="rate" value="0"  id="rate" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Amount:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="amount" id="amount" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Fuel:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="fuel" id="fuel" value="0.00" class="form-control numbersonly-format" readonly>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                           
                                            <label class="col-lg-2 col-form-label"><b>Product Loss Lit:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="ploss" id="ploss" value="0.00" class="form-control numbersonly-format">
                                            </div>

                                            
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                         <hr style="border: 1px solid orange; margin-bottom:0px;">
                            <div class="text-center"><b>CALCULATED FILEDS</b></div>
                            <hr style="border: 1px solid orange; margin-top:0px;">
                            
                           <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Shortage Value GH:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="shortageVal" id="shortageVal" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Deduction At Source:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="deduction" value="0"  id="deduction" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Payment Due:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="payment" id="payment" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Amount Receivable:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="amountR" id="amountR" value="0.00" class="form-control numbersonly-format" readonly>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            
                              <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Cash Paid:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="cashPaid" id="cashPaid" value="0.00" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Actual Loss:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="actualLoss" value="0"  id="actualLoss" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                 


                        </form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-light-secondary"
                                  data-bs-dismiss="modal">
                                  <i class="bx bx-x d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">Close</span>
                              </button>
                              <button type="button" class="btn btn-success ml-1"
                                  data-bs-dismiss="modal" onclick="add()">
                                  <i class="bx bx-check d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">Add Trip</span>
                              </button>
                              
                              
                              <button type="button" class="btn btn-primary ml-1"
                                   onclick="calculate()">
                                  <i class="bx bx-check d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">Calculate <i class="fa-solid fa-calculator"></i></span>
                              </button>
                          </div>
                      </div>
                  </div>
              </div>
              
              <!-- End extra large modal -->
              
            </div>
                	<script type="text/javascript">
												getall();
												getallP();
												function getall()
									            {
									                
									                $('#tbl-student').dataTable().fnDestroy();
									                $.ajax({
									                    
									                    url: "tripData.jsp",
									                    type : "GET",
									                    dataType : "JSON",
									                    data:{"option":'getTrips'},
									                    
									                    success:function(data)
									                    {
									                        
									                       $('#tbl-student').dataTable({
									                           "aaData":data,
									                           "scrollX": false,
									                           
									                           
									                           "aoColumns":
									                                   [
									                                	   {
										                                        "sTitle":
										                                        "all<input type=\"checkbox\" onclick=\"toggle(this)\">",
										                                        "mData": "driver",
										                                        "render" : function(mData,type,row,meta)
										                                        {
										                                        	var ids =row["id"];
										                                        	return '<input  type="checkbox" name="id" value='+ids+'>';
										                                            
										                                        }
										                                   },
									                                	   {"sTitle": "Number","mData": "number"},
									                                    
									                                    {
									                                        "sTitle":
									                                        "NAME",
									                                        "mData": "driver",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                            
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Month",
									                                        "mData": "month1",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; color:red; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "OIL COMPANY",
									                                        "mData": "mCompany",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                   {
									                                        "sTitle":
									                                        "PRODUCT TYPE",
									                                        "mData": "product",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "LOADING DATE",
									                                        "mData": "loadingDate",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "DISCHARGING DATE",
									                                        "mData": "dischargingDate",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "WAYBILL No.",
									                                        "mData": "wayBill",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                  
									                                   {
									                                        "sTitle":
									                                        "VEHICLE No.",
									                                        "mData": "vehicleN",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Quantity",
									                                        "mData": "quantity",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "DISCHARGING PNT",
									                                        "mData": "discharg",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Product Loss Litres",
									                                        "mData": "pLoss",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "ALLOWABLE Loss Litres",
									                                        "mData": "allowableLoss",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Actual Loss Litres",
									                                        "mData": "actualLoss",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Cost per litres",
									                                        "mData": "costPerL",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Shortage Value Gh",
									                                        "mData": "shortagVal",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Overnight Allowance",
									                                        "mData": "overnightAllowance",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Deduction At Source",
									                                        "mData": "deduction",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Payment due BVO",
									                                        "mData": "payment",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Amount Receivable",
									                                        "mData": "amountR",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Company",
									                                        "mData": "subCompany",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
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
									                      
									                    },
									                    error(err){
										        			  alertify.error('Please select month first');
										        		  }
									                  
									                });
									                
									            }
												
												function toggle(source) {
													   checkboxes = document.getElementsByName('id');
													   for (var i = 0, n = checkboxes.length; i < n; i++) {
													      checkboxes[i].checked = source.checked;
													   }
													}
												
												
												function update(ids){
													sessionStorage.setItem("id",ids);
													$.ajax({
										        		  
										        		  type:"POST",
										        		  url:"tripData.jsp",
										        		  data:{"myid" :ids,"option":'show'},
										        		  
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			
										        			  $("#updriver4").val(obj[0].driver);
										        			  $("#upvehicleN").val(obj[0].vehicleN);
										        			  $("#uploadingDate").val(obj[0].loadingDate);
										        			  $("#updischargingDate").val(obj[0].dischargingDate);
										        			  $("#upmCompany").val(obj[0].mCompany);
										        			  $("#upsubCompany").val(obj[0].subCompany);
										        			  $("#upmonth").val(obj[0].month1);
										        			  $("#upproduct").val(obj[0].product);
										        			  $("#upallowableLoss").val(obj[0].allowableLoss);
										        			  $("#upcostPerL").val(obj[0].costPerL);
										        			  $("#upwayBill").val(obj[0].wayBill);
										        			  $("#upovernightAllowance").val(obj[0].overnightAllowance);
										        			  $("#upquantity").val(obj[0].quantity);
										        			  $("#uplocation").val(obj[0].location);
										        			  $("#updistance").val(obj[0].distance);
										        			  $("#uprate").val(obj[0].rate);
										        			  $("#upamount").val(obj[0].amount);
										        			  $("#upfuel").val(obj[0].fuel);
										        			  $("#uproadEx").val(obj[0].payment);
										        			  $("#upshortageVal").val(obj[0].shortagVal);
										        			  $("#updeduction").val(obj[0].deduction);
										        			  $("#uppayment").val(obj[0].payment);
										        			  $("#upamountR").val(obj[0].amountR);
										        			  $("#upcashPaid").val(obj[0].cashPaid);
										        			  $("#upactualLoss").val(obj[0].actualLoss);
										        			  $("#upploss").val(obj[0].pLoss);
										        			  
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
										        		  data:{"driver":$("#driver4").val(), "vehicleN":$("#vehicleN").val() ,"loadingDate":$("#loadingDate").val(),"dischargingDate":$("#dischargingDate").val(),"mCompany":$("#mCompany").val(),
										        			  "subCompany":$("#subCompany").val() ,"month":$("#month").val(), "product":$("#product").val(),"allowableLoss":$("#allowableLoss").val(),"costPerL":$("#costPerL").val(),"wayBill":$("#wayBill").val(),
										        			  "overnightAllowance":$("#overnightAllowance").val(),"quantity":$("#quantity").val(),"location":$("#location").val(),"distance":$("#distance").val(),"rate":$("#rate").val(),"amount":$("#amount").val()
										        			  ,"fuel":$("#fuel").val(),"roadEx":$("#roadEx").val(),"shortagVal":$("#shortageVal").val(),"deduction":$("#deduction").val(),
										        			  "payment":$("#payment").val(),"amountR":$("#amountR").val(),"cashPaid":$("#cashPaid").val(),"actualLoss":$("#actualLoss").val(),"pLoss":$("#ploss").val(),
										        			  "option":'add'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  getall();
										        			  clear();
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
										        		  data:{"myid" :id,"driver":$("#updriver4").val(), "vehicleN":$("#upvehicleN").val() ,"loadingDate":$("#uploadingDate").val(),"dischargingDate":$("#updischargingDate").val(),"mCompany":$("#upmCompany").val(),
										        			  "subCompany":$("#upsubCompany").val() ,"month":$("#upmonth").val(), "product":$("#upproduct").val(),"allowableLoss":$("#upallowableLoss").val(),"costPerL":$("#upcostPerL").val(),"wayBill":$("#upwayBill").val(),
										        			  "overnightAllowance":$("#upovernightAllowance").val(),"quantity":$("#upquantity").val(),"location":$("#uplocation").val(),"distance":$("#updistance").val(),"rate":$("#uprate").val(),"amount":$("#upamount").val()
										        			  ,"fuel":$("#upfuel").val(),"roadEx":$("#uproadEx").val(),"shortagVal":$("#upshortageVal").val(),"deduction":$("#updeduction").val(),
										        			  "payment":$("#uppayment").val(),"amountR":$("#upamountR").val(),"cashPaid":$("#upcashPaid").val(),"actualLoss":$("#upactualLoss").val(),"pLoss":$("#upploss").val(),
										        			  "option":'edit'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  getall();
										        			  clear();
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        	  })
										        	  
										          }
												 
												 
												 function calculate(){
										        	  alert("called.....");
												      var id = sessionStorage.getItem("id");
												      
										        	  $.ajax({
										        		  
										        		  type:"GET",
										        		  url:"tripData.jsp",
										        		  data:{"option":'calculate',"productLoss":$("#ploss").val(),"allowableLoss":$("#allowableLoss").val(),"costPL":$("#costPerL").val(),"overNight":$("#overnightAllowance").val(),"cashPaid":$("#cashPaid").val(),},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  
										        			  $("#actualLoss").val(obj[0].actualLoss);
										        			  $("#shortageVal").val(obj[0].shortageValueGh);
										        			  $("#deduction").val(obj[0].deductionAtSource);
										        			  $("#overnightAllowance").val(obj[0].overnightAllowance);
										        			  $("#payment").val(obj[0].paymentDue);
										        			  $("#amountR").val(obj[0].amountR);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  //getall();
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
										        	  
										          }
												 
												 function getallP()
										            {
										                
										                $('#tbl-students').dataTable().fnDestroy();
										                $.ajax({
										                    
										                    url: "paydata.jsp",
										                    type : "GET",
										                    dataType : "JSON",
										                    data:{"option":'getL',"month":$("#month").val(),"department":$("#department").val()},
										                    
										                    success:function(data)
										                    {
										                        
										                       $('#tbl-students').dataTable({
										                           "aaData":data,
										                           "scrollX": false,
										                           
										                           
										                           "aoColumns":
										                                   [
										                              
										                                	   {"sTitle": "Number","mData": "number"},
										                                    
										                                    {
										                                        "sTitle":
										                                        "ID",
										                                        "mData": "ssnit",
										                                        "render" : function(mData,type,row,meta)
										                                        {
										                                        	var ids =row["id"];
										                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarg" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
										                                            
										                                        }
										                                   },
										                                   {
										                                        "sTitle":
										                                        "Name",
										                                        "mData": "name",
										                                        "render" : function(mData,type,row,meta)
										                                        {
										                                        	var ids =row["id"];
										                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarg" style="cursor:pointer; color:green; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
										                                        }
										                                   },
										                                   {
										                                        "sTitle":
										                                        "Account",
										                                        "mData": "account",
										                                        "render" : function(mData,type,row,meta)
										                                        {
										                                        	var ids =row["id"];
										                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarg" style="cursor:pointer; color:green; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
										                                        }
										                                   },
										                                   
										                                   {
										                                        "sTitle":
										                                        "Bank",
										                                        "mData": "bank",
										                                        "render" : function(mData,type,row,meta)
										                                        {
										                                        	var ids =row["id"];
										                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarg" style="cursor:pointer; color:green; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
										                                        }
										                                   },
										                                   {
										                                        "sTitle":
										                                        "SSNIT",
										                                        "mData": "ssnit",
										                                        "render" : function(mData,type,row,meta)
										                                        {
										                                        	var ids =row["id"];
										                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarg" style="cursor:pointer; color:green; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
										                                        }
										                                   },
										                                   {
										                                        "sTitle":
										                                        "Department",
										                                        "mData": "department",
										                                        "render" : function(mData,type,row,meta)
										                                        {
										                                        	var ids =row["id"];
										                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarg" style="cursor:pointer; color:green; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
										                                        }
										                                   },
										                                   {
										                                        "sTitle":
										                                        "Position",
										                                        "mData": "position",
										                                        "render" : function(mData,type,row,meta)
										                                        {
										                                        	var ids =row["id"];
										                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarg" style="cursor:pointer; color:green; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
										                                        }
										                                   },
										                                  
										                                   {
										                                        "sTitle":
										                                        "Status",
										                                        "mData": "status",
										                                        "render" : function(mData,type,row,meta)
										                                        {
										                                        	var ids =row["id"];
										                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarg" style="cursor:pointer; color:red; font-size:12px" onclick="de('+ids+')">Paid</i></a>';
										                                        }
										                                   },
										                                    
										                                  
										                                   ]
										                       });
										                      
										                    }  
										                  
										                });
										                
										            }
												 
												 function del(id){
													 var doit = confirm("Do you want to delete data");
								            	      if(doit){
								            	    
								            	    	  gone(id);  
								            	    	  
								            	      }else
								            	    	  alertify.error(' Canceled ');
												 }
												 
												 $(document).ready(function(){
													    $('.sendButton').attr('disabled',true);
													    
													    $('#message').keyup(function(){
													        if($(this).val().length !=0){
													            $('.sendButton').attr('disabled', false);
													        }
													        else
													        {
													            $('.sendButton').attr('disabled', true);        
													        }
													    })
													});
												 
												 
												 
								            	 function gone(id){   	
												 
														alert(id);
													
											        	  $.ajax({
											        		  type:"GET",
											        		  url:"paydata.jsp",
											        		  data:{"myid" :id,"option":'delete'},
											        		 
											        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
											        		  success:function(msg){
											        			  
											        			  //var obj = JSON.parse(msg);
											        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
											        			  getall();
																	getallP();
											        		  },
											        		  error(err){
											        			  alertify.error(' an error occured');
											        		  }
											        		  
											        		  
											        	  })
											        	  
											          }
								            	 
								            	 function clear(val){
								            		 alert("clear called")
								            			  const form = document.getElementById('edit_payslip');
								            			    form.reset();
								            	 }
								            	 
								            	 function bringCar(val){
								            		 alert("called....");
								            		 $.ajax({
										        		  type:"GET",
										        		  url:"tripData.jsp",
										        		  data:{"test" :val,"option":'bringCar'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  
										        			  var obj = JSON.parse(msg);
										        			  //var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  
																//$("#out").val(obj[0].test);
																$("#vehicleN").val(obj[0].car);
										        		  },
										        		  error(err){
										        			  alertify.error(' an error occured');
										        		  }
										        		  
										        		  
										        	  })
								            	 }
								            	 
								            	 
								            	 function bringLocation(val){
								            		 alert("called....");
								            		 $.ajax({
										        		  type:"GET",
										        		  url:"tripData.jsp",
										        		  data:{"location" :val,"option":'bringLocation'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  
										        			  var obj = JSON.parse(msg);
										        			  //var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  
																$("#distance").val(obj[0].distance);
																$("#rate").val(obj[0].rate);
																$("#amount").val(obj[0].amount);
																$("#fuel").val(obj[0].fuel);
										        		  },
										        		  error(err){
										        			  alertify.error(' an error occured');
										        		  }
										        		  
										        		  
										        	  })
								            	 }
								         
								         
								        //////////////////\\\\\\\\\\\\\\\\   On Select of drop down \\\\\\\\\\///////////
								            			 $("#driver4").on('change', function(){
								            				 alert("bringing.....");
								            				 var val = $(this).val();
								            				
								            				 bringCar(val);
								            				 
								            				});
								        
								            			 $("#location").on('change', function(){
								            				 alert("bringing..... locations......");
								            				 var val = $(this).val();
								            				
								            				 bringLocation(val);
								            				 
								            				});
								            			 
								        
								            			 $("#product").on('change', function(){
								            				 alert("bringing.....");
								            				 var val = $(this).val();
								            				
								            				 if(val == 'AGO'){
								            					 $("#allowableLoss").val('54.00');
								            				 }else if(val == 'SUPER'){
								            					 $("#allowableLoss").val('108.00');
								            				 }else{
								            					 $("#allowableLoss").val('0.00');
								            				 }
								            				 
								            				});
								        //////////////////\\\\\\\\\\\\\\\\   On Typing \\\\\\\\\\///////////	 
								            			 
								            			 var typingTimer;                //timer identifier
								            			 var doneTypingInterval = 100;  //time in ms, 5 second for example

								            			 //on keyup, start the countdown
								            			 $('#in').keyup(function(){
								            			     clearTimeout(typingTimer);
								            			     if ($('#in').val) {
								            			         typingTimer = setTimeout(function(){
								            			             //do stuff here e.g ajax call etc....
								            			              var v = $("#in").val();
								            			              bring(v);
								            			              $("#out").html(v);
								            			         }, doneTypingInterval);
								            			     }
								            			 });
								            		
								            			 // send checkbox values to database
								            			 function check(){
												        	  alert("checkBox  called.....");
														      var id = [];
														      $("input:checkbox[name=id]:checked").each(function(){
														    	  id.push($(this).val());
														    	});
														      alert(id)
												        	  $.ajax({
												        		  
												        		  type:"GET",
												        		  url:"tripData.jsp",
												        		  data:{"option":'move',"id":id},
												        		 
												        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
												        		  success:function(msg){
												        			  var obj = JSON.parse(msg);
												        			  
												        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
												        			  getall();
												        			  //getall();
												        		  },
												        		  error(err){
												        			  alertify.error('Error');
												        		  }
												        		  
												        		  
												        	  })
												        	  
												          }
								            			 
								               //////////////////\\\\\\\\\\\\\\\\   On Select of drop down \\\\\\\\\\///////////
												</script>
                
                <div class="paid">
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            <h3>Processed Trips</h3><button type="button" class="btn btn-info" onclick="check()">
                                Move Selected Trips to History <i class="fa-solid fa-diamond-turn-right fa-xl"></i>
                            </button>
                        </div>
                        <div class="card-body" style="width:100%;overflow-x:scroll;">
                       
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
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
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
                
                <div class="unpaid">
                 <section class="section">
                    <div class="card">
                        <div class="card-header">
                            <h3>Unprocessed Trips</h3>
                        </div>
                        <div class="card-body">
                       
                    <table id="tbl-students" class="table table-hover table table-sm" cellpadding="0" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
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
            </div>
            
            

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                   
                </div>
            </footer>
        </div>
        
<script type="text/javascript">
$(function(){
	  $('div.unpaid').hide();// hide it initially
	  $('button.change').on('click', function(){
	     $('div.paid, div.unpaid').toggle();
	     getallP();
	  });
	});
</script>
   
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