<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>



<%                          
                                    try
                                    {
                                   
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "SELECT (SELECT COALESCE(SUM(amount), 0) as totalDis FROM pettycash) - (SELECT COALESCE(SUM(debitAmount), 0)as totalsell FROM pettycash where status_ ='Approved') as remaining";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    double balance;
                                    while(rs.next()){
                                    	balance = rs.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("balance",balance);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>

<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select sum(amount) as total from pettycash";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    double credit;
                                    while(rs.next()){
                                    	credit = rs.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("credit",credit);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>

<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select sum(debitAmount) as total from pettycash where status_ ='Approved'";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    double debit;
                                    while(rs.next()){
                                    	debit = rs.getDouble(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("debit",debit);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="description" content="">
<meta name="author" content="">
<meta name="keywords" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!--Meta Responsive tag-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!--Custom style.css-->
<link rel="stylesheet" href="assets/css/quicksand.css">
<link rel="stylesheet" href="assets/css/style.css">
<!--Font Awesome-->
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/fontawesome.css">
<!--Chartist CSS-->
<link rel="stylesheet" href="assets/css/chartist.min.css">
<!--Datatable-->
<link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">
<!--Bootstrap Calendar-->
<link rel="stylesheet" href="assets/js/calendar/bootstrap_calendar.css">

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
					<h3 class="logo">
						<a href="pettyDash.jsp" class="text-secondary logo"><i
							class="fa fa-money"></i> PETTY CASH<span class="small"></span></a>
					</h3>
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
                            <a class="" href="" onclick="toggle_dropdown(this); return false" role="button" class="dropdown-toggle">
                                <i class="fa fa-user"></i>                             
                            </a>
                            <div class="dropdown dropdown-left bg-white shadow border">
                                <a class="dropdown-item" ><strong>Reset Account</strong></a>
                                <div class="dropdown-divider"></div>
                                <a href="" class="dropdown-item" data-toggle="modal" data-target="#passmodal" >
                                    <div class="media" >
                                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-primary" >
                                            <i class="fa fa-bookmark"></i>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-0" ><strong>Reset Account</strong></h6>
                                            
                                        </div>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="index.jsp" class="dropdown-item">
                                    <div class="media">
                                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-secondary">
                                            <i class="fa fa-link"></i>
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-0"><strong>Logout</strong></h6>
                                            <p>Click here to logout</p>
                                            
                                        </div>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                
                            </div>
                        </div>
                        <!--Notication icon-->

                    </div>
                    <!--Menu Icons-->

                    <!--Search box and avatar-->
                    <div class="col-sm-8 col-4 text-right flex-header-menu justify-content-end">
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
                            <input type="text" class="form-control search-box" placeholder="Enter Truck Number..." />
                        </div>
                        <div calss="input-group-btn">
                              <button type="submit" value="search" class="btn btn-primary"> <span class="fa fa-search"> search </span> </button>
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
						<img src="logo2.jpeg" alt="" class="rounded-circle" />
						<p>
							<strong>KODSON PLUS</strong>
						</p>
						<span class="text-primary small"><strong>Petty
								Cash Dash board</strong></span>
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
                                    <span class="none">Diductions </span>
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
			
			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->           
                <div class="modal fade"data-keyboard="false" data-backdrop="static" id="myModal" tabindex="-1">
                     <div class="modal-dialog">      
                         <div class="modal-content">
                             <div class="modal-header">
                                  <button class="close" data-dismiss="modal"> ${msg} &times;</button>
                                  <h4 class="modal-title"> </h4>
                             </div>
							
   
			<form action="pettyReport.jsp" method="post">
				
				<br><br>
				<h5 align="center">Please select Date</h5>
				
				<div class="form-row">					
					<div class="col-md-12">
						<div class="row">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-4 float-left">
								From: <input type="date" class="datepicker" data-date-format="mm/dd/yyyy" name="form_date">
							</div>
							<div class="form-group col-md-4 float-right">
								To: <input type="date" class="datepicker" data-date-format="mm/dd/yyyy" name="to_date">
							</div>
						</div>
						<div class="form-row"></div>
						<div class="row">
							<div class="col-4"></div>
							<div class="form-row"></div>
							<button class="btn btn-primary" type="submit" id="submit" name="submit">Generate</button>
						</div>
					</div>
				</div>
				
			</form>		
                </div>
                            
                     </div>
                </div>
    <!-- /////////////////////////////////////////////Reset password modal  //////////////////////////////////////////////////////////// -->
    
    
    
    <div class="modal fade"data-keyboard="false" data-backdrop="static" id="monthhlyModal" tabindex="-1">
                     <div class="modal-dialog">      
                         <div class="modal-content">
                             <div class="modal-header">
                                  <button class="close" data-dismiss="modal"> ${msg} &times;</button>
                                  <h4 class="modal-title"> </h4>
                             </div>
							<div class="modal-body">
								<form action="categoryReport.jsp" method="post">
								  <div class="form-row">
						  
                                
									    
							  <div class="form-group floating-label ">
                                   <select class="custom-select" name="category" required>
                                                          <%
											                  
											                  String url ="jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
											                  String username="kodson_maxwell";
											                  String password="0040105715@Icon";
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String queryy ="select * from categories";
											                    	   ResultSet rss = stt.executeQuery(queryy);
											                    	   
											                    	   while(rss.next()){
											                    		   
											                    		   %>
											                    		    
											                    		   <option><%=rss.getString("categoryName") %></option>  
											                    		   <% 
											                    		   String category = rss.getString("categoryName");
											                    		   
											                    		   
											                    		   System.out.println();
											                    	   }
											                    	   
											                       }catch(Exception e){
											                    	   
											                       }
                                                          %>
                                                          
                                            </select>
                                    <label for="" class="mt-1">Select Category</label>
                                </div> 
								 
								  </div>
								  <div align="right">
								  <button class="btn btn-primary" type="submit" id="submit" name="submit">Generate</button>
								  </div>
								</form>
                                  </div>
                         </div>      
                     </div>
                </div>
    <!-- /////////////////////////////////////////////Reset password modal  //////////////////////////////////////////////////////////// -->
			

			<!--Content right-->
			<div class="col-sm-9 col-xs-12 content pt-3 pl-0">
				

				<div class="row mt-3">
					<div class="col-sm-12">


						<!--Dashboard widget 2-->
						<div class="mt-1 mb-3 button-container">
							<div class="row pl-0">
								<div class="col-lg-3 col-md-3 col-sm-6 col-12 mb-3">
									<div class="border shadow p-3 bg-success">
										<p class="pw-2 text-center text-white">
											<i class="fa fa-weixin"></i> <small
												class="bc-description text-white"></small>
										</p>
										<p class="mt-2 text-white">Total Approved Debit =
										
										<%
								    	                       
	                                    try
	                                    {
	                                    
	                                        
	                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
	                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
	                                    Statement st=con.createStatement();
	                                    String strQuery = "select sum(debitAmount) from pettycash where status_='Approved'";
	                                    ResultSet rs = st.executeQuery(strQuery);
	                                    String sellq="";
	                                    while(rs.next()){
	                                    	sellq = rs.getString(1);
	                                   
	                                    out.println(sellq);
	                                    }
	                                    }
	                                    catch (Exception e){
	                                    e.printStackTrace();
	                                    }

	                                    %>
										
										<a></a></p>
									</div>
								</div>

								<div class="col-lg-3 col-md-3 col-sm-6 col-12 mb-3">
									<div class="border shadow p-3 bg-danger">
										<p class="pw-2 text-center text-white">
											<i class="fa fa-users"></i> <small
												class="bc-description text-white"></small>
										</p>
										<p class="mt-2 text-white">Total Declined Debit =
										
						      			<%
								    	                       
	                                    try
	                                    {
	                                    
	                                        
	                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
	                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
	                                    Statement st=con.createStatement();
	                                    String strQuery = "select sum(debitAmount) from pettycash where status_='Declined'";
	                                    ResultSet rs = st.executeQuery(strQuery);
	                                    String sellq="";
	                                    while(rs.next()){
	                                    	sellq = rs.getString(1);
	                                   
	                                    out.println(sellq);
	                                    }
	                                    }
	                                    catch (Exception e){
	                                    e.printStackTrace();
	                                    }

	                                    %>
										
										<a></a></p>
									</div>
								</div>

								<div class="col-lg-3 col-md-3 col-sm-6 col-12 mb-3">
									<div class="border shadow p-3 bg-primary">
										<p class="pw-2 text-center text-white">
											<i class="fa fa-shopping-cart"></i> <small
												class="bc-description text-white"></small>
										</p>
										<p class="mt-2 text-white">Total Pending Debit=
										
										<%
								    	                       
	                                    try
	                                    {
	                                    
	                                        
	                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
	                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
	                                    Statement st=con.createStatement();
	                                    String strQuery = "select sum(debitAmount) from pettycash where status_='Pending'";
	                                    ResultSet rs = st.executeQuery(strQuery);
	                                    String sellq="";
	                                    while(rs.next()){
	                                    	sellq = rs.getString(1);
	                                   
	                                    out.println(sellq);
	                                    }
	                                    }
	                                    catch (Exception e){
	                                    e.printStackTrace();
	                                    }

	                                    %>
										
										</p>
									</div>
								</div>

								<div class="col-lg-3 col-md-3 col-sm-6 col-12 mb-3">
									<div class="border shadow p-3 bg-warning">
										<p class="pw-2 text-center text-white">
											<i class="fa fa-envelope-o"></i> <small
												class="bc-description text-white"></small>
										</p>
										<p class="mt-2 text-white">Number Of Debits =
											<%
								    	                       
	                                    try
	                                    {
	                                    
	                                        
	                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
	                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
	                                    Statement st=con.createStatement();
	                                    String strQuery = "select count(debitAmount) from pettycash";
	                                    ResultSet rs = st.executeQuery(strQuery);
	                                    String sellq="";
	                                    while(rs.next()){
	                                    	sellq = rs.getString(1);
	                                   
	                                    out.println(sellq);
	                                    }
	                                    }
	                                    catch (Exception e){
	                                    e.printStackTrace();
	                                    }

	                                    %>
										
										</p>
									</div>
								</div>

							</div>
						</div>
						<!--/Dashboard widget-->

						<div class="row border-bottom mb-4">
							<div class="col-sm-8 pt-2">
								<h6 class="mb-4 bc-header" align="center">Petty Cash Credit
									And Debit Info</h6>
							</div>
							<div class="col-sm-4 text-right pb-3">
					
									<button  class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#myModal">Generate Report</button>
							

							</div>
							<div class="col-sm-4 text-left pb-3">

							
									<button  class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#monthhlyModal">
										<i class="fa fa-calendar"></i> Generate Report Based On
										Category
									</button>
								
							</div>

						</div>

						<div class="col-sm-12">

							<div class="panel-body">

								<table id="testData" class="table table-bordered"
									cellpadding="0" cellspacing="0" width="100%">
									<thead>
										<tr>

											<th>Over All Amount Credit</th>

											<th>Over All Debit</th>
											<th>Current Balance</th>
											<th>Current Balance Status</th>


										</tr>

									</thead>

									<tbody>


										<tr>

											<td>
												<%   
                                  double allDis = (Double)session.getAttribute("credit");
                                  
                                  out.println("<b style=\"font-size : 40px\">"+allDis+"<b>");
                                  
                                  %>
											</td>
											<td>
												<%
                                  
                                  double allsell = (Double)session.getAttribute("debit");
                                 
                                  out.println("<b style=\"font-size : 40px\">"+allsell+"<b>");
                                  
                                  %>
											</td>
											<td>
												<%
                                  
                                  double quantity = (Double)session.getAttribute("balance");
                                 
                                  
                                  out.println("<b style=\"font-size : 40px\">"+quantity+"<b>");
                                  
                                  %>
											</td>

											<td>
												<% 
                                  String outt ="Low Balance";
                                  String minimum =" Balance getting Finished";
                                  String in = "High Balance";
                                  
                                  double val = (Double)session.getAttribute("balance");
                                 
                                  
                                  if(val <=200){
                                	  out.println("<span style='color:red'>");
                                	  out.println("<b style=\"font-size : 40px\">"+outt+"<b>");
                                	  out.println("</span>");
                                  }else if(val >=1000){
                                	  out.println("<span style='color:green'>");
                                	  out.println("<b style=\"font-size : 40px\">"+in+"<b>");
                                	  out.println("</span>");
                                  }else{
                                	  out.println("<span style='color:blue'>");
                                	  out.println("<b style=\"font-size : 40px\">"+minimum+"<b>");
                                	  out.println("</span>");
                                  }
                                  
                                  
                                  %>
											</td>

										</tr>




									</tbody>

								</table>

							</div>

							<script src="jquery-3.6.0.js" type="text/javascript"></script>
							<script src="component/jquery/jquery.min.js"
								type="text/javascript"></script>
							<script src="component/jquery.validate.min.js"
								type="text/javascript"></script>

							<script type="text/javascript" src="DataTables/datatables.min.js"></script>
							<script type="text/javascript"
								src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>
							<script
								src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
							<script
								src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>


							<script>
$(document).ready( function () {
    $('#testData').DataTable();
} );

</script>

						</div>
						<!--/Product Listing-->
					</div>



				</div>
			</div>
			<!--Footer-->

		</div>
	</div>

	<!--Main Content-->



	<!--Page Wrapper-->

	<!-- Page JavaScript Files-->
	<!-- Page JavaScript Files-->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery-1.12.4.min.js"></script>
	<!--Popper JS-->
	<script src="assets/js/popper.min.js"></script>
	<!--Bootstrap-->
	<script src="assets/js/bootstrap.min.js"></script>
	<!--Sweet alert JS-->
	<script src="assets/js/sweetalert.js"></script>
	<!--Progressbar JS-->
	<script src="assets/js/progressbar.min.js"></script>
	<!--Datatable-->
	<script src="assets/js/jquery.dataTables.min.js"></script>
	<script src="assets/js/dataTables.bootstrap4.min.js"></script>
	<!--Bootstrap Calendar JS-->
	<script src="assets/js/calendar/bootstrap_calendar.js"></script>
	<script src="assets/js/calendar/demo.js"></script>
	<!--Bootstrap Calendar-->

	<!--Custom Js Script-->
	<script src="assets/js/custom.js"></script>
	<!--Custom Js Script-->
	<script>
        $("#productList").DataTable();
    </script>
	<!--Custom Js Script-->
</body>
</html>