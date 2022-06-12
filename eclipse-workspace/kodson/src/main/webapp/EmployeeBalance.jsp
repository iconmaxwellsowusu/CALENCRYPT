<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %> 
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="description" content="" >
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Meta Responsive tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

               <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
               <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
               <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"/>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>

<!-- 
    RTL version
-->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.rtl.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.rtl.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.rtl.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.rtl.min.css"/>
    <!--Bootstrap CSS-->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!--Custom style.css-->
    <link rel="stylesheet" href="assets/css/quicksand.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <!--Font Awesome-->
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <!--Animate CSS-->
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <!--Chartist CSS-->
    <link rel="stylesheet" href="assets/css/chartist.min.css">
    <!--Morris Css-->
    <link rel="stylesheet" href="assets/css/morris.css">
    <!--Map-->
    <link rel="stylesheet" href="assets/css/jquery-jvectormap-2.0.2.css">
    <!--Bootstrap Calendar-->
    <link rel="stylesheet" href="assets/js/calendar/bootstrap_calendar.css">
    <!--Nice select -->
    <link rel="stylesheet" href="assets/css/nice-select.css">
    
    
               <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
               <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
               <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"/>

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>Kodson Plus</title>
  </head>
  <body>
  
  	<%
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    
    
        if(session.getAttribute("admin")==null && session.getAttribute("manager")==null && session.getAttribute("operations")==null){
              response.sendRedirect("index.jsp");   
        }
        
        %>
  <body>
    <!--Page loader-->
    <div class="loader-wrapper">
        <div class="loader-circle">
            <div class="loader-wave"></div>
        </div>
    </div>
    <!--Page loader-->
    
    <!--Page Wrapper-->

    <div class="container-fluid">

        <!--Header-->
        <div class="row header shadow-sm">
            
            <!--Logo-->
            <div class="col-sm-3 pl-0 text-center header-logo">
               <div class="bg-theme mr-3 pt-3 pb-2 mb-0">
                    <h3 class="logo"><a href="#" class="text-secondary logo"><i class="fa fa-book "></i> Manage Employee<span class="small "></span></a></h3>
               </div>
            </div>
            <!--Logo-->

            <!--Header Menu-->
                             <div class="col-sm-9 header-menu pt-2 pb-0">
                <div class="row">
                    
                    <!--Menu Icons-->
                    <div class="col-sm-4 col-8 pl-0">
                        <!--Toggle sidebar-->
                        <span class="menu-icon" onclick="toggle_sidebar()">
                            <span id="sidebar-toggle-btn"></span>
                        </span>
                        <!--Toggle sidebar-->
                        
                        						<!--Notification icon-->
						<div class="menu-icon">
							<a class="" href="" onclick="toggle_dropdown(this); return false"
								role="button" class="dropdown-toggle"> <i class="fa fa-user"></i>
							</a>
							<div class="dropdown dropdown-left bg-white shadow border">
								<a class="dropdown-item"><strong>Reset Account</strong></a>
								<div class="dropdown-divider"></div>
								<a href="" class="dropdown-item" data-toggle="modal"
									data-target="#passmodal">
									<div class="media">
										<div
											class="align-self-center mr-3 rounded-circle notify-icon bg-primary">
											<i class="fa fa-bookmark"></i>
										</div>
										<div class="media-body">
											<h6 class="mt-0">
												<strong>Reset Account</strong>
											</h6>

										</div>
									</div>
								</a>
								<div class="dropdown-divider"></div>

								<a class="dropdown-item" data-toggle="modal"
									data-target="#outmodal">
									<div class="media">
										<div
											class="align-self-center mr-3 rounded-circle notify-icon bg-secondary">
											<i class="fa fa-link"></i>
										</div>
										<div class="media-body">
											<h6 class="mt-0">
												<strong>Logout</strong>
											</h6>
											<p>Click here to logout</p>

										</div>
									</div>
								</a>

								<div class="dropdown-divider"></div>

							</div>
						</div>
						<!--Notication icon-->
                        
                         <div class="menu-icon">
                            <a onclick="alertMe()" data-dismiss="modal" data-toggle="modal" data-target="#myModal"><i class="fa  fa-calendar" data-toggle="tooltip" data-placement="top" title="Generate SSNIT Report"></i></a>
                                
                             
                          
        
                        </div>
                        <!--Notification icon-->
                       <div class="menu-icon">
                            <a onclick="alertMe()" data-dismiss="modal" data-toggle="modal" data-target="#mModal"><i class="fa fa-edit (alias)" data-toggle="tooltip" data-placement="top" title="Generate Debt Balance"></i></a>
                                
                               
                           
                         
                        </div>
                        <!--Notication icon-->
                        <div class="menu-icon">
                            <a onclick="alertMe()" data-dismiss="modal" data-toggle="modal" data-target="#nameModal"><i class="fas fa-id-card" data-toggle="tooltip" data-placement="top" title="View Employee Salary History"></i></a>
                                
                               
                           
                         
                        </div>
                        <!--Inbox icon-->
                        
                        <!--Inbox icon-->
                     
                    </div>
                    <!--Menu Icons-->

					<!--Search box and avatar-->
					<div
						class="col-sm-8 col-4 text-right flex-header-menu justify-content-end">
						<div class="search-rounded mr-3">
							<%
							String opera = (String) request.getSession().getAttribute("operations");
                                String namee =(String) request.getSession().getAttribute("admin");
                                String man = (String) request.getSession().getAttribute("manager");
                                if ((request.getSession(false).getAttribute("admin")!= null)) {
                                out.println("<b class=\"badge badge-primary\">"+"Welcome " + namee + "</b>");
                                }else if((request.getSession(false).getAttribute("operations")!= null)){ 
                                	out.println("<span class=\"badge badge-primary\">"+"Welcome " + opera + "</span>");
                                }else
                                	out.println("<span class=\"badge badge-primary\">"+"Welcome " + man + "</span>");
                                
                                %>
							<input type="text" class="form-control search-box"
								placeholder="Enter Truck Number..." />
						</div>
						<div calss="input-group-btn">
							<button type="submit" value="search" class="btn btn-primary">
								<span class="fa fa-search"> search </span>
							</button>
						</div>
						<!-- ///////////////////////////////////////////////////////////////////////////////// -->
					</div>
					<!--Search box and avatar-->
                </div>    
            </div>
            <!--Header Menu-->
        </div>
        <!--Header-->

        <!--Main Content-->

        <div class="row main-content">
            <!--Sidebar left-->
            <div class="col-sm-3 col-xs-6 sidebar pl-0">
                <div class="inner-sidebar mr-3">
                    <!--Image Avatar-->
                    <div class="avatar text-center">
                        <img src="logo.jpeg" alt="" class="rounded-circle" />
                        <p><strong>Kodson Plus</strong></p>
                        <span class="text-primary small"><strong>HR Admin Page</strong></span>
                    </div>
                    <!--Image Avatar-->

                             <!--Sidebar Navigation Menu-->
                    <div class="sidebar-menu-container">
                        <ul class="sidebar-menu mt-4 mb-4">
                        <!--//////////////////////// General Manager/Director //////////////////////////-->
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('dashboard'); return false" class=""><i class="fa fa-user mr-3"> </i>
                                    <span class="none">General Manager/Director <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="dashboard">
                                    <li class="child"><a href="gmHome.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Home/Dashboard</a></li>

                                </ul>
                            </li>
                           
                           <!--//////////////////////// Operations //////////////////////////-->
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('ul_element'); return false" class=""><i class="fa fa-cogs mr-3"></i>
                                    <span class="none">Operations Manager <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="ul_element">
                                    <li class="child"><a href="driverManager.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Manage Trucks,BVO's and Assistants</a></li>

                                </ul>
                            </li>
                            
                            <!--//////////////////////// HR-Manager //////////////////////////-->
                            
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('form_element'); return false" class=""><i class="fa fa-pencil-square mr-3"></i>
                                    <span class="none">HR-Admin <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="form_element">
                            <li class="parent">
                                <a href="DashBoard.jsp"><i class="fa fa-dashboard mr-3"> </i>
                                    <span class="none">PayRoll Dashboard </span>
                                </a>
                              
                            </li>
                                    <li class="child"><a href="AddEmployee.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Add Employee</a></li>
                                    <li class="child"><a href="ManageEmployee.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Manage Employee</a></li>
                                    <li class="child"><a href="CreateDepartment.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Add Department</a></li>
                                    <li class="child"><a href="ManageDepartment.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Add Position</a></li>
                                    <li class="child"><a href="DailyAttendace.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Daily Attendance</a></li>
                                    <li class="child"><a href="AttendanceReport.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Attendance Report</a></li>
                                    <li class="child"><a href="AddLeave.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Add leave</a></li>
                                    <li class="child"><a href="ManageLeave.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Manage Leave</a></li>
                                    <li class="child"><a href="AddLeaveType.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Add Leave Type</a></li>
                                    <li class="child"><a href="ManageLeaveType.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Manage Leave Type</a></li>
                                                                <li class="parent">
                                <a href="Diduction.jsp"><i class="fa fa-minus mr-3"> </i>
                                    <span class="none">Deductions </span>
                                </a>
                              
                            </li>
                            
                           <li class="parent">
                                <a href="Loan.jsp"><i class="fa fa-money mr-3"> </i>
                                    <span class="none">Loans/Surcharges </span>
                                </a>
                              
                            </li>
                            
                                    <li class="child"><a href="#" class="ml-4" data-dismiss="modal" data-toggle="modal" data-target="#empModal"><i class="fa fa-angle-right mr-2"></i> Create PaySlip</a></li>
                                    <li class="child"><a href="PaySlipList.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> PaySlip List</a></li> 
                                    
                                   <li class="parent"><a href="pettyDash.jsp" class=""><i
									class="fa fa-dashboard mr-3"> </i> <span class="none">PettyCash Dashboard
								</span> </a></li>

							<li class="parent"><a href="addCategory.jsp" class=""><i
									class="fa  fa-cubes mr-3"></i> <span class="none">Categories
								</span> </a></li>
							<li class="parent"><a href="addCredit.jsp" class=""><i
									class="fa fa-puzzle-piece mr-3"></i> <span class="none">Credit
								</span> </a></li>
							<li class="parent"><a href="addDebit.jsp" class=""><i
									class="fa fa-pencil-square mr-3"></i> <span class="none">Debit
								</span> </a></li>                                  
                                </ul>
                            </li>
                            
                            <!--//////////////////////// Maintenance Manager //////////////////////////-->
                            
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('editors'); return false" class=""><i class="fa fa-wrench mr-3"></i>
                                    <span class="none">Maintenance Manager <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="editors">
                           <li class="parent">
                                <a href="mDash.jsp"  class=""><i class="fa fa-dashboard mr-3"> </i>
                                    <span class="none">Dashboard </span>
                                </a>
                               
                            </li>
                                    <li class="child"><a href="clients.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Add A Client</a></li>
                                    <li class="child"><a href="clientService.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Client Services</a></li>
                                    <li class="child"><a href="expensesCategory.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Add Expenses Category</a></li>
                                    <li class="child"><a href="expenses.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Add Expenses</a></li>
                                    <li class="child"><a href="expensesReport.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Expenses Report</a></li>
                                    <li class="child"><a href="fixtyre.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Tyre Fixing</a></li>
                               <li class="parent">
                                <a href="tools.jsp" class=""><i class="fa fa-wrench mr-3"></i>
                                    <span class="none">Tools <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                
                            </li>
                            
                                    <li class="child"><a href="itemPrices.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Add Stock Item</a></li>
                                    <li class="child"><a href="itemRequest.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Request Item From Head Office</a></li>
                                    <li class="child"><a href="itemService.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Item Service</a></li>
                            
                            <li class="parent">
                                <a href="NumberPlate.jsp" class=""><i class="fa fa-minus-square mr-3"></i>
                                    <span class="none">Number Plate</span>
                                </a>
                            </li>
                            
                                    <li class="child"><a href="generalServicing.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> General Servicing</a></li>
                                    <li class="child"><a href="engineOil.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Engine Oil</a></li>
                                    <li class="child"><a href="monthlyHubGreasing.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Monthly Hub Greasing</a></li>
                                    <li class="child"><a href="spillKit.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Spill Kit</a></li>
                                    <li class="child"><a href="sprayingPlan.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Spraying Plan</a></li>
                                    <li class="child"><a href="spareTyre.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Spare Tyre</a></li>
                             
                                    <li class="child"><a href="fireExtinguiser.jsp" class="ml-4"><i class="fa fa-angle-right mr-2"></i> Fire Extinguisher</a></li>
                                    
                            <li class="parent">
                                <a href="itemPrices.jsp" class=""><i class="fa fa-columns mr-3"> </i>
                                    <span class="none">Item Prices </span>
                                </a>
                            </li>
                            
                            <li class="parent">
                                <a href="upholsry.jsp" class=""><i class="fa fa-clipboard mr-3"> </i>
                                    <span class="none">Upholsry </span>
                                </a>
                            </li>
                            
                            <li class="parent">
                                <a href="coolant.jsp" class=""><i class="fa fa-tint mr-3"> </i>
                                    <span class="none">Coolant </span>
                                </a>
                            </li>
                            <li class="parent">
                                <a href="transitBreadown.jsp" class=""><i class="fa fa-chain-broken mr-3"> </i>
                                    <span class="none">Transit Breakdown </span>
                                </a>
                            </li>
                            <li class="parent">
                                <a href="BrvHistory.jsp" class=""><i class="fa fa-book mr-3"> </i>
                                    <span class="none">BRV history </span>
                                </a>
                            </li>
                            <li class="parent">
                                <a href="batteryManage.jsp" class=""><i class="fa fa-flash (alias) mr-3"> </i>
                                    <span class="none">Battery Management </span>
                                </a>
                            </li>
                            
                                    
                                </ul>
                            </li>
                            
                            <!--//////////////////////// Statutory Obligations //////////////////////////-->
                            
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('tables'); return false" class=""><i class="fa  fa-sliders mr-3"></i>
                                    <span class="none">Statutory Obligations/Compliance <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="tables">
                            <li class="parent">
                                <a href=" Sta_ob.jsp " ><i class="fa fa-shield"></i>
                                    <span class="none">  Statutory_Obligations </span>
                                </a>
                            </li>
                                </ul>
                            </li>
                            
                                            <!--//////////////////////// Fuel Management //////////////////////////-->
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('charts'); return false" class=""><i class="fa fa-pie-chart mr-3"></i>
                                    <span class="none">Fuel Management <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="charts">
                            <li class="parent">
                                <a href="fuelDash.jsp" class=""><i class="fa fa-dashboard mr-3"> </i>
                                    <span class="none">Fuel Management Dashboard </span>
                                </a>
                                
                            </li>
                            
                            <li class="parent">
                                <a href="fuelDischarged.jsp" class=""><i class="fa fa-truck mr-3"></i>
                                    <span class="none">Fuel Discharged </span>
                                </a>
                            </li>
                            <li class="parent">
                                <a href="fuelDispensed.jsp" class=""><i class="fa fa-plus-circle mr-3"></i>
                                    <span class="none">Fuel Dispensed </span>
                                </a>
                                
                            </li>
                                </ul>
                            </li>
                            
                                         <!--//////////////////////// ProcureMent //////////////////////////-->
 
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('ecommerce'); return false" class=""><i class="fa fa-shopping-cart mr-3"></i>
                                    <span class="none">Procurement/Stores <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="ecommerce">
                            <li class="parent">
                                <a href="dash_board.jsp" return false" class=""><i class="fa fa-dashboard mr-3"> </i>
                                    <span class="none">Dashboard </span>
                                </a>
                                
                            </li>
                            
                            <li class="parent">
                                <a href="addSupplier.jsp" class=""><i class="fa fa-truck mr-3"></i>
                                    <span class="none">Add Suppliers </span>
                                </a>
                            </li>
                            <li class="parent">
                                <a href="addItem.jsp" class=""><i class="fa fa-plus-circle mr-3"></i>
                                    <span class="none">Add Items </span>
                                </a>
                                
                            </li>
                            <li class="parent">
                                <a href="purchaseItem.jsp"  class=""><i class="fas fa-handshake mr-3"></i>
                                    <span class="none">Purchase Items </span>
                                </a>
                               
                            </li>
                            <li class="parent">
                                <a href="sellitem.jsp" class=""><i class="fa fa-bullhorn mr-3"></i>
                                    <span class="none">Sell Items</span>
                                </a>
                                
                            </li>
                            <li class="parent">
                                <a href="myStock.jsp" class=""><i class="fa fa-cubes mr-3"></i>
                                    <span class="none">MyStock</span>
                                </a>
                                
                            </li>
                                </ul>
                            </li>
                            
                            <!--//////////////////////// Journey Planner //////////////////////////-->
                            
                            
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('maps'); return false" class=""><i class="fa fa-map mr-3"></i>
                                    <span class="none">Journey Planner <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="maps">
                            <li class="parent">
                                <a href=" journey.jsp " ><i class="fa fa-road"></i>
                                    <span class="none">  Journey plan </span>
                                </a>
                            </li>
                                </ul>
                            </li>
                            
                                                   <!--//////////////////////// Trips //////////////////////////-->
                            <li class="parent">
                                <a href="#" onclick="toggle_menu('pages'); return false" class=""><i class="fa fa-road mr-3"></i>
                                    <span class="none">Trip Management <i class="fa fa-angle-down pull-right align-bottom"></i></span>
                                </a>
                                <ul class="children" id="pages">
							<li class="parent"><a href="trips.jsp "><i
									class="fa fa-road"></i> <span class="none"> Trips </span> </a></li>
                                </ul>
                            </li>


                        </ul>
                    </div>
                    <!--Sidebar Naigation Menu-->
                </div>
            </div>
            <!--Sidebar left-->

            <!--Content right-->
            <div class="col-sm-9 col-xs-12 content pt-3 pl-0">
            
            <button type="submit" class="btn btn-success btn-secondary " name="shortage" onclick="print_font()">Print</button>
                
                



          <div class="col-sm-12" id="printMe">
         
         <h4>KODSON PLUS CO.LTD <br></h4>
         <h6>GPS: GT-117-2071. Box co3186, TEMA</h6>
         <h6>TEL: 0303305730</h6>
                <div class="panel-body">
                 <div align="center"><% String m = request.getParameter("month"); out.println("<b>"+m+"</b>"); %> </div>
                     <table class="table table-bordered" cellpadding="0" cellspacing="0" width ="100%">
                        <thead>
                              <tr>
                                  <th>id</th>
                                  <th>Name</th>
                                  <th>Basic Salary</th>
                                  <th>Total Statutory </th>
                                  <th>Gross Pay </th>
                                  <th>Debt Before Deduction</th>
                                  <th>Surcharge/Loan GHC </th>
                                  <th>Deduction</th>
                                  <th>Debt Balance After Deduction</th>
                                  <th>Take Home Pay</th>
                                  
                                  
                                                     
                              </tr>

                        </thead>
                        
                         <tbody>
						 <%   
 
					        String month = request.getParameter("month");
					       
					        
					        HttpSession sess = request.getSession(false);
		                     sess.setAttribute("month", month);
		                    

                             Connection con;
                             PreparedStatement pst;
                             ResultSet rs;
     
                             Class.forName("com.mysql.jdbc.Driver");
                             con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                             
                             String f_date = (String)session.getAttribute("month");
                            
                             String query = "select * from payroll where payDay= '"+month+"'";
                             
                               Statement st = con.createStatement();
                               int i = 0;
                                 rs =  st.executeQuery(query);
                                 
                                     while(rs.next())
                                     {
                                         String id = rs.getString("id");
                                
                                   %>
             
                             <tr>
                                 <td><%out.println(i+=1);%></td>
                                 <td><%=rs.getString("empName") %></td>
                                 
                                  
                                  <td><%=rs.getString("basic") %></td>
                                 <td><%=rs.getString("statutoryD") %></td>
                                 <td><%=rs.getString("netpayBefore") %></td>
                                 <td><%=rs.getString("currentLoan") %></td>
                                 <td><%=rs.getString("dAmount") %></td>
                                 <td><%=rs.getString("totalDeduction") %></td>                               
                                 <td><%=rs.getString("deduction") %></td>   
                                 <td><%=rs.getString("paidAmount") %></td>                               
                                 
						      
                             </tr> 
                            
                             
                                <%
                                 
                                 }
                               %>
		                 
                 </tbody>
                 
                  <tr>
                             <th>total</th>
                             <td></td>
                             <td>             <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement stt=con.createStatement();
                                    String strQuery = "select sum(basic) from payroll where payDay= '"+month+"'";
                                    ResultSet rss = stt.executeQuery(strQuery);
                                    double subcomp;
                                    while(rss.next()){
                                    	subcomp = rss.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",subcomp);
                                    
                                    double roundOo = Math.round(subcomp*100)/100D;
			                           String.format("%.3f", roundOo);
			                           
			                           if(subcomp<0)
			                        	   roundOo = Math.max(roundOo, 0);
                                    
                                    out.println("<b style=\"font-size:20px;\"> "+roundOo+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %></td>
                             <td>        
                               <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement stt=con.createStatement();
                                    String strQuery = "select sum(statutoryD) from payroll where payDay= '"+month+"'";
                                    ResultSet rss = stt.executeQuery(strQuery);
                                    double subcomp;
                                    while(rss.next()){
                                    	subcomp = rss.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",subcomp);
                                    
                                    double roundOo = Math.round(subcomp*100)/100D;
			                           String.format("%.3f", roundOo);
			                           
			                           if(subcomp<0)
			                        	   roundOo = Math.max(roundOo, 0);
                                    
                                    out.println("<b style=\"font-size:20px;\"> "+roundOo+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %></td>
                             <td>
                                       <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement stt=con.createStatement();
                                    String strQuery = "select sum(netpayBefore) from payroll where payDay= '"+month+"'";
                                    ResultSet rss = stt.executeQuery(strQuery);
                                    double subcomp;
                                    while(rss.next()){
                                    	subcomp = rss.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",subcomp);
                                    
                                    double roundOo = Math.round(subcomp*100)/100D;
			                           String.format("%.3f", roundOo);
			                           
			                           if(subcomp<0)
			                        	   roundOo = Math.max(roundOo, 0);
                                    
                                    out.println("<b style=\"font-size:20px;\"> "+roundOo+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
                             </td>
                             <td>
                                       <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement stt=con.createStatement();
                                    String strQuery = "select sum(currentLoan) from payroll where payDay= '"+month+"'";
                                    ResultSet rss = stt.executeQuery(strQuery);
                                    double subcomp;
                                    while(rss.next()){
                                    	subcomp = rss.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",subcomp);
                                    
                                    double roundOo = Math.round(subcomp*100)/100D;
			                           String.format("%.3f", roundOo);
			                           
			                           if(subcomp<0)
			                        	   roundOo = Math.max(roundOo, 0);
                                    
                                    out.println("<b style=\"font-size:20px;\"> "+roundOo+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
                             </td>
                             <td>
                                       <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement stt=con.createStatement();
                                    String strQuery = "select sum(dAmount) from payroll where payDay= '"+month+"'";
                                    ResultSet rss = stt.executeQuery(strQuery);
                                    double subcomp;
                                    while(rss.next()){
                                    	subcomp = rss.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",subcomp);
                                    
                                    double roundOo = Math.round(subcomp*100)/100D;
			                           String.format("%.3f", roundOo);
			                           
			                           if(subcomp<0)
			                        	   roundOo = Math.max(roundOo, 0);
                                    
                                    out.println("<b style=\"font-size:20px;\"> "+roundOo+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
                             </td>
                             <td>
                                       <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement stt=con.createStatement();
                                    String strQuery = "select sum(totalDeduction) from payroll where payDay= '"+month+"'";
                                    ResultSet rss = stt.executeQuery(strQuery);
                                    double subcomp;
                                    while(rss.next()){
                                    	subcomp = rss.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",subcomp);
                                    
                                    double roundOo = Math.round(subcomp*100)/100D;
			                           String.format("%.3f", roundOo);
			                           
			                           if(subcomp<0)
			                        	   roundOo = Math.max(roundOo, 0);
                                    
                                    out.println("<b style=\"font-size:20px;\"> "+roundOo+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
                             </td>
                             <td>
                                       <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement stt=con.createStatement();
                                    String strQuery = "select sum(deduction) from payroll where payDay= '"+month+"'";
                                    ResultSet rss = stt.executeQuery(strQuery);
                                    double subcomp;
                                    while(rss.next()){
                                    	subcomp = rss.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",subcomp);
                                    
                                    double roundOo = Math.round(subcomp*100)/100D;
			                           String.format("%.3f", roundOo);
			                           
			                           if(subcomp<0)
			                        	   roundOo = Math.max(roundOo, 0);
                                    
                                    out.println("<b style=\"font-size:20px;\"> "+roundOo+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
                             </td>
                             <td>
                                       <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement stt=con.createStatement();
                                    String strQuery = "select sum(paidAmount) from payroll where payDay= '"+month+"'";
                                    ResultSet rss = stt.executeQuery(strQuery);
                                    double subcomp;
                                    while(rss.next()){
                                    	subcomp = rss.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",subcomp);
                                    
                                    double roundOo = Math.round(subcomp*100)/100D;
			                           String.format("%.3f", roundOo);
			                           
			                           if(subcomp<0)
			                        	   roundOo = Math.max(roundOo, 0);
                                    
                                    out.println("<b style=\"font-size:20px;\"> "+roundOo+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
                             </td>
                             
                             </tr>

                     </table>
                
                </div>
                
                       <script src="jquery-3.6.0.js" type="text/javascript"></script>
                       <script src="component/jquery/jquery.min.js" type="text/javascript"></script>
                       <script src="component/jquery.validate.min.js" type="text/javascript"></script>
                       
                       <script type="text/javascript" src="DataTables/datatables.min.js"></script>
                       <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>
                       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                       <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>


<script>
$(document).ready( function () {
    $('#testData').DataTable();
} );


</script>
         
           </div>
        </div>
      
            </div>
        </div>
        
               <script>
               function conf(){
            	   
            	   alertify.success('employee deleted');
               }
               
               </script>  

        <!--Main Content-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>


<script>
function print_font() {
    var pdf = new jsPDF({
    	orientation: 'landscape', 
    	unit: "mm",
    	format: [700, 1220]
        
    });
    pdf.setFontSize(18);
    
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $('#printMe')[0];

    // we support special element handlers. Register them with jQuery-style 
    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
    // There is no support for any other type of selectors 
    // (class, of compound) at this time.
    specialElementHandlers = {
        // element with id of "bypass" - jQuery style selector
        '#bypassme': function (element, renderer) {
            // true = "handled elsewhere, bypass text extraction"
            return true
        }
    };
    margins = {
        top: 10,
        bottom: 60,
        left: 100,
        
    };
    // all coords and widths are in jsPDF instance's declared units
    // 'inches' in this case
    pdf.fromHTML(
    		
    source, // HTML string or DOM elem ref.
    margins.left, // x coord
    margins.top, { // y coord
        'width': margins.width, // max width of content on PDF
        'elementHandlers': specialElementHandlers
    },

    function (dispose) {
        // dispose: object with X, Y of the last line add to the PDF 
        //          this allow the insertion of new lines after html
        
       
        pdf.save('Test.pdf');
    }, margins);
}


</script>   
    

    <!--Page Wrapper-->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- Page JavaScript Files-->
    <script src="assets/js/popper.min.js"></script>
    <!--Bootstrap-->
    <script src="assets/js/bootstrap.min.js"></script>
    <!--Sweet alert JS-->
    <script src="assets/js/sweetalert.js"></script>
    <!--Progressbar JS-->
    <script src="assets/js/progressbar.min.js"></script>
    <!--Flot.JS-->
    <script src="assets/js/charts/jquery.flot.min.js"></script>
    <script src="assets/js/charts/jquery.flot.pie.min.js"></script>
    <script src="assets/js/charts/jquery.flot.categories.min.js"></script>
    <script src="assets/js/charts/jquery.flot.stack.min.js"></script>
    <!--Chart JS-->
    <script src="assets/js/charts/chart.min.js"></script>
    <!--Chartist JS-->
    <script src="assets/js/charts/chartist.min.js"></script>
    <script src="assets/js/charts/chartist-data.js"></script>
    <script src="assets/js/charts/demo.js"></script>
    <!--Maps-->
    <script src="assets/js/maps/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="assets/js/maps/jquery-jvectormap-world-mill-en.js"></script>
    <script src="assets/js/maps/jvector-maps.js"></script>
    <!--Bootstrap Calendar JS-->
    <script src="assets/js/calendar/bootstrap_calendar.js"></script>
    <script src="assets/js/calendar/demo.js"></script>
    <!--Nice select-->
    <script src="assets/js/jquery.nice-select.min.js"></script>

    <!--Custom Js Script-->
    <script src="assets/js/custom.js"></script>
  </body>
</html>.