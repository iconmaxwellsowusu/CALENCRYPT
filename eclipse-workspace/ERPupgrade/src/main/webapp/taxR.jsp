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
    <link rel="shortcut icon" href="assets/images/profile.jpeg" type="image/x-icon">
    
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
                            <a href="index.html"><img src="assets/images/profile.jpeg" alt="Logo" srcset="" style="width:150px; height:120px;" ></a>
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
                            <a href="hrDashboard.jsp" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>Employee</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="addEmployee.jsp">Add Employee</a>
                                </li>
                               
                                <li class="submenu-item ">
                                    <a href="activateEmp.jsp">Activate Employee</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="deactivateEmp.jsp">Deactivate Employee</a>
                                </li>
                                
                                <li class="submenu-item ">
                                    <a href="empCard.jsp">Generate Employee ID Card</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="empFiles.jsp">Upload Employee File</a>
                                </li>
                               
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-collection-fill"></i>
                                <span>Departments</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="department.jsp">Add Department</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="position.jsp">Add Position</a>
                                </li>
                               
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-grid-1x2-fill"></i>
                                <span>Attendance</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a >1</a>
                                </li>
                                <li class="submenu-item ">
                                    <a>2</a>
                                </li>
                                <li class="submenu-item ">
                                    <a>3</a>
                                </li>
                                <li class="submenu-item ">
                                    <a>4</a>
                                </li>
                             
                            </ul>
                        </li>

                        <li class="sidebar-title">Loans,Surcharges &amp; Repayments</li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-hexagon-fill"></i>
                                <span>Loan/Surcharge</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="loan.jsp">Add Loan</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="surcharge.jsp">Add SurCharge</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="loanReports.jsp">Report</a>
                                </li>
                               
                            </ul>
                        </li>

                    

                        <li class="sidebar-title">Payroll,Payslip &amp; Reports</li>

                        

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-pentagon-fill"></i>
                                <span>Payroll</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="createPay.jsp">Create PaySlip</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="paySlip.jsp">PaySlip List</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="taxR.jsp">Tax Return</a>
                                </li>
                                
                                <li class="submenu-item ">
                                    <a href="payR.jsp">PaySlip Report</a>
                                </li>
                                
                                <li class="submenu-item ">
                                    <a href="debtR.jsp">Debt Report</a>
                                </li>
                                
                                <li class="submenu-item ">
                                    <a href="payRoll.jsp">Pay Roll Report</a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-egg-fill"></i>
                                <span>Petty Cash</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="pettyCash.jsp">Petty cash </a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="credit.jsp">Add Credit</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="debit.jsp">Add Debit</a>
                                </li>
                                
                                 <li class="submenu-item ">
                                    <a href="category.jsp">Add Category</a>
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
                            <h3>T A X - R E T U R N S    R E P O R T</h3>
                        </div>
                        
                       
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Employee</li>
                                </ol>
                                
                          
                                
                            </nav>
                        </div>
                    </div>
                </div>
                </br>
                <section id="basic-input-groups">
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
																	<label for="" class="mt-1">Select Company</label>
							                                         <select class="choices form-select" name="department" id="department" required>
							                                                          <%
							                                                          String url ="jdbc:mysql://localhost/kodsonvms";
																	                  String username="root";
																	                  String password="root";
																		                
																		                  
																		                       try{
																		                    	   Class.forName("com.mysql.jdbc.Driver");
																		                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
																		                    	   Statement stt = conn.createStatement();
																		                    	   String query ="select distinct Company from payroll";
																		                    	   ResultSet rss = stt.executeQuery(query);
																		                    	   
																		                    	   while(rss.next()){
																		                    		   
																		                    		   %>
																		                    		    
																		                    		   <option><%=rss.getString(1) %></option>  
																		                    		   <% 
																		                    		   System.out.println();
																		                    	   }
																		                    	   
																		                       }catch(Exception e){
																		                    	   
																		                       }
							                                                          %>
							                                                          
							                                            </select>
							                                    
							                                </div>
							                                
																							
																<div class="col-md-4 mb-3 ">
																 <button type="button" class="btn btn-outline-info "
									                                   onclick="getall()">
									                                  <span class="d-none d-sm-block"> Generate Report <i class="fa-solid fa-hand-point-right"></i></span>
									                              </button>
									                              
									                              <button type="button" class="btn btn-outline-danger "
									                                   onclick="print1()">
									                                  <span class="d-none d-sm-block"> Print Report <i class="fa-solid fa-file-export"></i> </span>
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
                </section>
                
                <br>
                
                	<script type="text/javascript">
												//getall();
												getallP();
												function getall()
									            {
									                
									                $('#tbl-student').dataTable().fnDestroy();
									                $.ajax({
									                    
									                    url: "paydata.jsp",
									                    type : "GET",
									                    dataType : "JSON",
									                    data:{"option":'tax',"month":$("#month").val(),"department":$("#department").val()},
									                    
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
									                                        "Name",
									                                        "mData": "empName",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; color:red; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Basic",
									                                        "mData": "basic",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                   {
									                                        "sTitle":
									                                        "SSNIT NO.",
									                                        "mData": "ssnit",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Paye",
									                                        "mData": "paye",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Amount Payable",
									                                        "mData": "paidAmount",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Employer",
									                                        "mData": "employer",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                   {
									                                        "sTitle":
									                                        "Employee",
									                                        "mData": "employee",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+' </a>';
									                                        	
									                                        }
									                                   },
									                                   
									                                  
									                                   ]
									                       });
									                         
									                       test();
									                         },
									                    error(err){
										        			  alertify.error('Please select month first');
										        		  }
									                  
									                });
									                
									            }
												
												function test(){
													$.ajax({
										        		  
										        		  type:"GET",
										        		  url:"paydata.jsp",
										        		  data:{"option":'sesion'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  $(".paye").html(obj[0].pa);
										        			  $(".amountPaid").html(obj[0].am);
										        			  $(".employer").html(obj[0].em);
										        			  $(".employee").html(obj[0].emp);
										        			  
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
												}
												
												/* function getallList()
									            {
									                
									                $('#tbl-student').dataTable().fnDestroy();
									                $.ajax({
									                    
									                    url: "paydata.jsp",
									                    type : "GET",
									                    dataType : "JSON",
									                    data:{"option":'getList',"month":$("#month").val(),"department":$("#department").val()},
									                    
									                    success:function(data)
									                    {
									                        
									                       $('#tbl-student').dataTable({
									                           "aaData":data,
									                           "scrollX": false,
									                           
									                           
									                           "aoColumns":
									                                   [
									                              
									                                	   {"sTitle": "Number","mData": "number"},
									                                    
									                                  
									                                   {
									                                        "sTitle":
									                                        "Name",
									                                        "mData": "name",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; color:red; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Basic",
									                                        "mData": "account",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                   {
									                                        "sTitle":
									                                        "Month",
									                                        "mData": "bank",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Amount Paid",
									                                        "mData": "ssnit",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Deduction",
									                                        "mData": "department",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Outstanding",
									                                        "mData": "position",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                  
									                                   {
									                                        "sTitle":
									                                        "Actions",
									                                        "mData": "status",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a style="cursor:pointer; font-size:12px" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                    
									                                  
									                                   ]
									                       });
									                      
									                    },
									                    error(err){
										        			  alertify.error('Please select month first');
										        		  }
									                  
									                });
									                
									            } */
												
												function update(ids){
													sessionStorage.setItem("id",ids);
													$.ajax({
										        		  
										        		  type:"POST",
										        		  url:"paydata.jsp",
										        		  data:{"myid" :ids,"option":'show'},
										        		  
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			
										        			  $("#Name1").val(obj[0].name);
										        			  $("#gender1").val(obj[0].gender);
										        			  $("#Mstatus1").val(obj[0].Mstatus);
										        			  $("#email1").val(obj[0].email);
										        			  $("#Number11").val(obj[0].Number1);
										        			  $("#Number21").val(obj[0].Number2);
										        			  $("#adr").val(obj[0].localAddress);
										        			  $("#refrence1").val(obj[0].reference);
										        			  $("#ssnit1").val(obj[0].ssnit);
										        			  $("#company1").val(obj[0].company);
										        			  $("#department1").val(obj[0].department);
										        			  $("#position1").val(obj[0].position);
										        			  $("#date-of-joining1").val(obj[0].dateofjoining);
										        			  $("#date-of-leaving1").val(obj[0].dateofleaving);
										        			  $("#b-status1").val(obj[0].bStatus);
										        			  $("#basicSalary1").val(obj[0].basicSalary);
										        			  $("#accountHolder1").val(obj[0].accountHolder);
										        			  $("#accountNumber1").val(obj[0].accountNumber);
										        			  $("#bankName1").val(obj[0].bankName);
										        			  $("#bankBranch1").val(obj[0].bankBranch);
										        			  $("#bankShortCode1").val(obj[0].bankShortCode);
										        			  $("#date1").val(obj[0].date);
										        			  $("#payEmpDebtBal").val(obj[0].debtB);
										        			  $("#payEmpCurLoanSur").val(obj[0].currentL);
										        			  $("#payEmpSSFl").val(obj[0].employer);
										        			  
										        			  $("#hes").val(obj[0].name);
										        			  
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
												}
												
												
												 function add(){
										        	  
										        	  $.ajax({
										        		  
										        		  type:"POST",
										        		  url:"paydata.jsp",
										        		  data:{"payEmpName":$("#Name1").val(), "month":$("#month").val() ,"date1":$("#date1").val(),"payEmpSsnit":$("#ssnit1").val(),"payEmpCatName":$("#department1").val(),
										        			  "payEmpBasic":$("#basicSalary1").val() ,"payEmpDebtBal":$("#payEmpDebtBal").val(), "payEmpSFFl":$("#payEmpSSFl").val(),"payEmpCurLoanSur":$("#payEmpCurLoanSur").val(),"payEmpSSFP":$("#payEmpSSFP").val(),"payEmpAdjust":$("#payEmpAdjust").val(),
										        			  "payEmpTaxableS":$("#payEmpTaxableS").val(),"payEmpDeduct":$("#payEmpDeduct").val(),"payEmpPaye":$("#payEmpPaye").val(),"payEmpBicyc":$("#payEmpBicyc").val(),"payEmpStatuDeduc":$("#payEmpStatuDeduc").val(),"payEmpBeforOdaDeduc":$("#payEmpBeforOdaDeduc").val()
										        			  ,"payEmpNetSal":$("#payEmpNetSal").val(),"payEmpTotDebt":$("#payEmpTotDebt").val(),"payEmpBlaAwt":$("#payEmpBlaAwt").val(),"payEmpTotDeduc":$("#payEmpTotDeduc").val(),
										        			  "payEmpNetSalPay":$("#payEmpNetSalPay").val(),"payEmpPayMethod":$("#payEmpPayMethod").val(),"payEmpBankBranch":$("#bankBranch1").val(),"payEmpBankNo":$("#accountNumber1").val(),"payEmpPaidAmt":$("#payEmpPaidAmt").val(),
										        			  "payEmpCompany":$("#company1").val(),"position":$("#position1").val(),
										        			  "option":'add'},
										        		 
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
												 
												 function calculate(){
										        	  
												      var id = sessionStorage.getItem("id");
												      
										        	  $.ajax({
										        		  
										        		  type:"POST",
										        		  url:"paydata.jsp",
										        		  data:{"myid" :id,"basic":$("#basicSalary1").val() ,"deduction":$("#payEmpDeduct").val(),"paye":$("#payEmpPaye").val(),"byc":$("#payEmpBicyc").val(),"employee":$('input[name=tax]:checked').val(),
										        			  "employer":$('input[name=tax1]:checked').val(),"option":'calculate'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  
										        			  $("#payEmpSSF1").val(obj[0].employer);
										        			  $("#payEmpSSFP").val(obj[0].employee);
										        			  $("#payEmpTaxableS").val(obj[0].taxable);
										        			  $("#payEmpStatuDeduc").val(obj[0].statutory);
										        			  $("#payEmpBeforOdaDeduc").val(obj[0].netBefore);
										        			  $("#payEmpNetSal").val(obj[0].netpay);
										        			  $("#payEmpTotDebt").val(obj[0].totalDebt);
										        			  $("#payEmpBlaAwt").val(obj[0].outstanding);
										        			  $("#payEmpTotDeduc").val(obj[0].totalDedution);
										        			  $("#payEmpNetSalPay").val(obj[0].netSalary);
										        			  $("#payEmpPaidAmt").val(obj[0].paidAmount);
										        			 
										        			  
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  //getall();
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
										        	  
										          }
												 
												/*  function getallP()
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
										                
										            } */
												 
												 function del(id){
													 var doit = confirm("Do you want to delete data");
								            	      if(doit){
								            	    alert("deleting.....")
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
								            	 
								            	 function print(id){   	
												
													
											        	  $.ajax({
											        		  type:"GET",
											        		  url:"itext7",
											        		  data:{"id" :id,"moth":$("#month").val(),"depart":$("#department").val()},
											        		 
											        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
											        		  success:function(msg){
											        			  
											        			  var obj = JSON.parse(msg);
											        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
											        			  getall();
																	getallP();
											        		  },
											        		  error(err){
											        			  alertify.error(' an error occured');
											        		  }
											        		  
											        		  
											        	  })
											        	  
											          }
								            	 
								            	 function print1(id){   	
														
														
										        	  $.ajax({
										        		  type:"GET",
										        		  url:"bulkPrint",
										        		  data:{"id" :id,"moth":$("#month").val(),"depart":$("#department").val()},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  
										        			  var obj = JSON.parse(msg);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  getall();
																getallP();
										        		  },
										        		  error(err){
										        			  alertify.error(' an error occured');
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
                              <h4 class="modal-title" id="myModalLabel130">Add a new employee
                                  Modal</h4>
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
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Employee Details</a>
                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Company Details</a>
                                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Financial Details</a>
                                <a class="nav-item nav-link" id="nav-contact-tab1" data-toggle="tab" href="#nav-contact1" role="tab" aria-controls="nav-contact1" aria-selected="false">Bank Details</a>
                                
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                        <br>
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <div class="form-group row  container justify-content-center">
                                   <!-- Employee Details  -->
                                        <div class="col-md-4 mb-3">
											<label> Name</label> <input type="text" class="form-control"
												placeholder="" name="Name" id="Name" required>
										</div>

										<div class="col-md-4 mb-3">
                                                <label>Gender</label>
                                                
                                                
                                                    <select class="choices form-select" name="gender" id="gender">
                                                        <option value="square">Male</option>
                                                        <option value="rectangle">Female</option>
                                                        
                                                    </select>
                                                
                                            </div>
                                            
                                            <div class="col-md-4 mb-3">
                                                <label>Gender</label>
                                                
                                                
                                                    <select class="choices form-select" name="Mstatus" id="Mstatus">
                                                        <option value="single">Single</option>
											        	<option value="married">Married</option>
                                                        
                                                    </select>
                                                
                                            </div>

										<div class="col-md-4 mb-3">
											<label>Email</label>
											<div>
												<input type="email" id="email" class="form-control"
													data-validation="email" name="email" />
											</div>
										</div>

										<div class="col-md-4 mb-3">
											<label>Phone Number 1</label>
											<div>
												<input type="text" id="Number1" class="form-control"
													data-validation="number" name="Number1" />
											</div>
										</div>

										<div class="col-md-4 mb-3">
											<label>Phone Number 2</label>
											<div>
												<input type="text" id="Number2" class="form-control"
													data-validation="number" name="Number2" />
											</div>
										</div>

										<div class="col-md-4 mb-3">
											<label>Local Address</label>
											<div>
												<textarea rows="1.5" class="form-control" id="adr"
													placeholder="" name="localAddress"></textarea>
											</div>
										</div>

										
										<div class="col-md-4 mb-3">
											<label for="validationCustom05">Reference </label> <input
												type="text" class="form-control" placeholder=""
												id="reference" name="reference" value="Reference">
										</div>

										<div class="col-md-4 mb-3">
											<label for="validationCustom05">SSNIT Number</label> <input
												type="text" class="form-control" placeholder="" name="ssnit"
												id="ssnit" value="--">
										</div>
                                                                            
                                                                            
                                                                            
                                     <!-- End of Employee Details -->                                              
                                   </div>
                            </div>
                            
                            
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <div class="form-group row  container justify-content-center">
                                                                     <!-- Start Company Details -->
                                                                           
                                       <div class="form-group floating-label col-md-4 mb-3">
                                        <label for="" class="mt-1">Select Company</label>
											<select name="company" id="company" class="choices form-select" 
												required>
												<option value=""></option>
												<option value="KODSON PLUS">KODSON PLUS</option>
												<option value="KTC">KTC</option>
												<option value="KGL CONSTRUCTION">KGL CONSTRUCTION</option>
												<option value="MANNER LOGISTICS">MANNER LOGISTICS</option>
												<option value="JUST GRACE">JUST GRACE</option>
												<option value="UNIQUE TIMES">UNIQUE TIMES</option>
												<option value="LIDA GHANA">LIDA GHANA</option>
												<option value="FUEL STATION">FUEL STATION</option>
											</select>
										</div>




										<div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">Select Department</label>
                                         <select class="choices form-select" name="department" id="department" required>
                                                          <%
                                                        
											                
											                  
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

									
										<div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">Select Position</label>
                                   <select class="choices form-select" name="position" id="position" required>
                                                          <%
											                  
											                
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="select * from positions";
											                    	   ResultSet rss = stt.executeQuery(query);
											                    	   
											                    	   while(rss.next()){
											                    		   
											                    		   %>
											                    		    
											                    		   <option><%=rss.getString("positionName") %></option>  
											                    		   <% 
											                    		   System.out.println();
											                    	   }
											                    	   
											                       }catch(Exception e){
											                    	   
											                       }
                                                          %>
                                                          
                                            </select>
                                    
                                </div>
										<!--////////////////// date picker //////////////////////// -->
										<div class="col-md-4 mb-3 input-with-post-icon datepicker">
											<label for="example">Date of Joining</label> <input
												placeholder="Select date" type="date" id="date-of-joining"
												class="form-control" name="date-of-joining" value=" ">
										</div>

										<!--////////////////// date picker //////////////////////// -->
										<div class="col-md-4 mb-3 input-with-post-icon datepicker">
											<label for="example">Date of Leaving</label> <input
												placeholder="Select date" type="date" id="date-of-leaving"
												class="form-control" name="date-of-leaving">
										</div>

										<div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">Status</label>
											<select name="b-status" id="b-status" class="choices form-select">
												<option value=""></option>
												<option value="active">Active</option>
												<option value="not-active">Not Active</option>
											</select> 
										</div>
                                       <!-- End Company Details -->      
                                            
                                         </div>
                                      
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                               															  
																			<br>
															  
															    <div class="form-group row  container justify-content-center">
															    
															    <!-- Start -->
															    
						                <div class="col-md-4 mb-3">
											<label for="validationCustom03">Basic Salary</label> <input
												type="text" id="basicSalary" name="basicSalary"
												class="form-control" data-validation="number" required />
										</div>
                                                                        
                                                                 <!-- Start --> 
                                                                        </div>
                                                                          
                                                                      
																		
                            </div>
                            
                            <div class="tab-pane fade" id="nav-contact1" role="tabpanel" aria-labelledby="nav-contact-tab1">
                            <div class="form-group row  container justify-content-center">
                                                                           <div class="col-md-4 mb-3">
											<label for="validationCustom03">Account Holders Name</label>
											<input type="text" class="form-control" placeholder=""
												name="accountHolder" id="accountHolder">
										</div>

										<div class="col-md-4 mb-3">
											<label for="validationCustom03">Bank Account Number</label> <input
												type="text" id="accountNumber" class="form-control"
												data-validation="number" name="accountNumber" />
										</div>

										<div class="col-md-4 mb-3">
											<label for="validationCustom03">Bank Name</label> <input
												type="text" class="form-control" placeholder=""
												name="bankName" id="bankName">
										</div>

										<div class="col-md-4 mb-3">
											<label for="validationCustom05">Bank Branch</label> <input
												type="text" class="form-control" placeholder=""
												name="bankBrach" id="bankBranch">
										</div>

										<div class="col-md-4 mb-3">
											<label for="validationCustom03">Bank Short Code</label> <input
												type="text" id="bankShortCode" class="form-control"
												data-validation="number" name="bankShortCode" />
										</div>
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
                                  data-bs-dismiss="modal" onclick="add()">
                                  <i class="bx bx-check d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">Submit</span>
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
                              <h4 class="modal-title" id="myModalLabel130">Employee Name :  <input class="form-control" id="hes" readonly></h4>
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
                                            <label class="col-lg-2 col-form-label"><b>Employee Name:</b></label>
                                            <div class="col-lg-4">
                                               <input type="text" class="form-control"
												placeholder="" name="Name" id="Name1" readonly>
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Payroll Date:</b></label>
                                            <div class="col-lg-4">
                                                 <input readonly type="text" name="date" id="date1"  class="form-control" value ="">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"> <b>Employee SSNIT No.:</b> </label>
                                            <div class="col-lg-4">
                                                <input readonly name="payEmpSsnit" id="ssnit1" type="text" class="form-control" value ="">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Department:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly readonly type="text" name="payEmpCatName" id="department1" class="form-control" value ="">
                                            </div>
                                            </div>
                                            <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Position:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly readonly type="text" name=position id="position1" class="form-control" value ="">
                                            </div>
                                            
                                              <label class="col-lg-2 col-form-label"><b>Company:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly readonly type="text" name=company id="company1" class="form-control" value ="">
                                            </div>
                                            
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <hr style="border: 1px solid orange; margin-bottom:0px;">
                            <div class="text-center"><b>PAYROLL FILEDS</b></div>
                            <hr style="border: 1px solid orange; margin-top:0px;">
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Basic Salary:</b></label>
                                            <div class="col-lg-4">
                                        <input type="text" id="basicSalary1" name="payEmpBasic" class="form-control numbersonly-format" value="" class="form-control numbersonly-format">
                                            </div>
                                            
                                            
                                        <label class="col-lg-2 col-form-label"><b>Debt Bal B/D:</b></label>
                                            <div class="col-lg-4">
                                            <input readonly type="text" name="payEmpDebtBal" id="payEmpDebtBal" value="0.00" class="form-control numbersonly-format">
                                            </div>
                                            
                                            
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Employer(SSF):</b></label>
                                            <div class="col-lg-4">
                                            <input readonly type="text" name="payEmpSFFl" id="payEmpSSFl" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Current Loans/ Surcharges:</b></label>
                                            <div class="col-lg-4">
                    <input readonly type="text" name="payEmpCurLoanSur" id="payEmpCurLoanSur" value="" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Employee(SSF):</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="payEmpSSFP" id="payEmpSSFP" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Adjustments:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="payEmpAdjust" value="0"  id="payEmpAdjust" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Taxable Salary:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="payEmpTaxableS" id="payEmpTaxableS" value="" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Deductions:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="payEmpDeduct" id="payEmpDeduct" value="0.00" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Paye:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="payEmpPaye" id="payEmpPaye" value="0.00" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Bicycle Deductions:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="payEmpBicyc" id="payEmpBicyc" value="0.00" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row ">
                             <div class="col-md-12">
                             <fieldset>
                                <div class="row" style="margin:10px;" align="center">
                                    <label class="d-block font-weight-semibold" style="color:red;">(Please do not select any if you do not want changes) &nbsp;&nbsp;</label><span style="color:red;"></span>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input emp5" name="tax" value="5.5" id="allow_emp">
                                     <label class="custom-control-label" for="allow_emp">Use Employee 5.5%
                                               </label> 
                                    </div>

                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input emp13" name="tax1" value="13.5" id="allow_empler">
                                 <label class="custom-control-label" for="allow_empler">Use Employer 13.5%
                                                </label>
                                    </div>
                                </div>
                                </fieldset>
                                </div>
                            </div>
                          
                             <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Statutory Deduction:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="payEmpStatuDeduc" id="payEmpStatuDeduc" value="" class="form-control numbersonly-format" readonly>
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Net Before Other Deductions:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="payEmpBeforOdaDeduc" id="payEmpBeforOdaDeduc" value="" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            
                            
                            <div style="background-color:#e8e1e1; <padding:8></padding:8>px;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <fieldset>
                                            <div class="form-group row" style="margin-top:8px;">
                                                <label class="col-lg-2 col-form-label"><b>Net Pay:</b></label>
                                                <div class="col-lg-4">
                                                    <input readonly type="text" name="payEmpNetSal" id="payEmpNetSal" value="" class="form-control numbersonly-format">
                                                </div>

                                                <label class="col-lg-2 col-form-label"><b>Total Debt:</b></label>
                                                <div class="col-lg-4">
                                                    <input readonly name="payEmpTotDebt" id="payEmpTotDebt" value="" type="text" class="form-control numbersonly-format">
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <fieldset>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label"></label>
                                                <div class="col-lg-4">
                                                </div>

                                                <label class="col-lg-2 col-form-label"><b>Balance Outstanding:</b></label>
                                                <div class="col-lg-4">
                                                    <input readonly type="text" name="payEmpBlaAwt" id="payEmpBlaAwt" value="" class="form-control numbersonly-format">
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <fieldset>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label"></label>
                                                <div class="col-lg-4">
                                                </div>

                                                <label class="col-lg-2 col-form-label"><b>Total Deductions:</b></label>
                                                <div class="col-lg-4">
                                                    <input readonly type="text" name="payEmpTotDeduc" id="payEmpTotDeduc" value="" class="form-control numbersonly-format">
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <fieldset>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label"></label>
                                                <div class="col-lg-4">
                                                </div>

                                                <label class="col-lg-2 col-form-label"><b>Net Salary Payable:</b></label>
                                                <div class="col-lg-4">
                                                    <input readonly type="text" name="payEmpNetSalPay" id="payEmpNetSalPay" value="" class="form-control numbersonly-format">
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                            <hr style="margin-top:8px; margin-bottom:0px; border: 1px solid orange;">
                            <div class="text-center"><b>NET PAY DISTRIBUTION</b></div>
                            <hr style="border: 1px solid orange; margin-top:0px;">


                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label><b>Payment Method:</b></label>
                                                    <input type="text" name="payEmpPayMethod" id="payEmpPayMethod"  class="form-control" value="Bank">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label><b>Bank Branch:</b></label>
                                                    <input readonly type="text" name="payEmpBankBranch" id="bankBranch1" class="form-control" value="<%
                                                                                                        
                                                    %>">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label><b>Bank Account#:</b></label>
                                                    <input readonly type="text" name="payEmpBankNo" id="accountNumber1" class="form-control" value="">
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label><b>Paid Amount:</b></label>
                                                    <input readonly type="text" name="payEmpPaidAmt" id="payEmpPaidAmt" value=" " class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="row">
                                            <div class="col-md-12">
                                                
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <hr style="border: 1px solid orange;">
                            <hr style="border: 1px solid orange;">

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
                                  <span class="d-none d-sm-block">Submit</span>
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
                
                
                <div class="paid">
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            <h3>Tax Returns Report</h3>
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
                                <th></th>
                            </tr>  
                        </thead>
                         <tfoot>
					        <tr>
					        <th>Total</th>
					        <th></th>
					        <th></th>
					        <th></th>
					        <th><div class="paye"></div></th>
					        <th><div class="amountPaid"></div></th>
					        <th><div class="employer"></div></th>
					        <th><div class="employee"></div></th>
					        </tr>
					    </tfoot>
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
/*$(function(){
	  $('div.unpaid').hide();// hide it initially
	  $('button.change').on('click', function(){
	     $('div.paid, div.unpaid').toggle();
	     getallP();
	  });
	}); */
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