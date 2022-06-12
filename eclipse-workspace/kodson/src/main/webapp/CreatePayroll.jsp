<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="fuelError.jsp"%>

<%@page import="java.sql.*"%>
<%@ page session="true"%>
<% 
    if(request.getParameter("submit")!=null)
    	
    {
    	HttpSession sess = request.getSession(false);
    	
    	
    	
    	
    	
    	String company =(String) sess.getAttribute("company");
    	String department =(String) sess.getAttribute("department");
    	String month =(String) sess.getAttribute("month");
    	String empName =(String) sess.getAttribute("empName");
    	String position =(String) sess.getAttribute("position");
    	
        String employer = request.getParameter("employer");
       
        String paye = request.getParameter("paye");
        double pay = Double.parseDouble(paye);
        String Sd = request.getParameter("Sd");
       
        String dAmount = request.getParameter("dAmount");
        double dam = Double.parseDouble(dAmount);
        String lAmount = request.getParameter("lAmount");
        double lam = Double.parseDouble(lAmount);
        String adjustment = request.getParameter("adjustment");
        double adj = Double.parseDouble(adjustment);
        String bicycle = request.getParameter("bicycle");
        String bank = request.getParameter("bank");
        String transaction = request.getParameter("tansaction");
        String date = request.getParameter("date");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into payroll(company,department,position,payDay,empName,employer,paye,statutoryD,dAmount,loanAmount,adjustment,bicycle,pmethod,status_)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        pst.setString(1, company);
        pst.setString(2, department);
        pst.setString(3, position);
        pst.setString(4, month);
        pst.setString(5, empName);
       
        pst.setString(6, employer);
       
        pst.setDouble(7, pay);
        pst.setString(8, Sd);
        pst.setDouble(9, dam);
        pst.setDouble(10, lam);
        pst.setDouble(11, adj);
        pst.setString(12, bicycle);
        pst.setString(13, bank);
        pst.setString(14, transaction);
       
        pst.executeUpdate();
        HttpSession sess1 = request.getSession(false);
        sess1.setAttribute("bank", bank);
        sess1.setAttribute("employer", employer);
      
        sess1.setAttribute("paye", paye);
        sess1.setAttribute("Sd", Sd);
        sess1.setAttribute("dAmount", dAmount);
        sess1.setAttribute("lAmount", lAmount);
        sess1.setAttribute("adjustment", adjustment);
        sess1.setAttribute("bicycle", bicycle);
        sess1.setAttribute("date", date);
    	
        
       
           %>

<script>   
        alert("Record Addedd");     
    </script>
<% 
    response.sendRedirect("summary.jsp"); 
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


<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />

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
					<h3 class="logo">
						<a href="#" class="text-secondary logo"><i class="fa fa-money"></i>
							Create PaySlip <span class="small "></span></a>
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
					<p>
						<strong>Kodson Plus</strong>
					</p>
					<span class="text-primary small"><strong>HR Admin
							Page</strong></span>
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

		<!-- /////////////////////////////////////////////logout modal  //////////////////////////////////////////////////////////// -->

		<div class="modal fade" data-keyboard="false" data-backdrop="static"
			id="outmodal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">${msg}&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">
						<form action="logout" method="">
							<div class="form-row"></div>
							<button type="submit" id="logout" class="btn btn-danger">
								<i class="fa fa-warning"></i>Logout
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- /////////////////////////////////////////////Reset password modal  //////////////////////////////////////////////////////////// -->


		<!-- /////////////////////////////////////////////Reset password modal  //////////////////////////////////////////////////////////// -->

		<div class="modal fade" data-keyboard="false" data-backdrop="static"
			id="passmodal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">${msg} &times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">
						<form action="ResetAdminpass" method="post">
							<div class="form-row">
								<div class="col-md-6 mb-3">
									<label for="validationDefault01">User Name</label> <input
										type="text" class="form-control" id="validationDefault01"
										placeholder="" required name="username_">
								</div>
								<div class="col-md-6 mb-3">
									<label for="validationDefault02">Current password</label> <input
										type="password" id="inputPassword6"
										class="form-control mx-sm-2"
										aria-describedby="passwordHelpInline" required name="oldpass">
								</div>

								<div class="col-md-6 mb-3">
									<label for="validationDefault02">New password</label> <input
										type="password" id="inputPassword6"
										class="form-control mx-sm-2"
										aria-describedby="passwordHelpInline" name="newpass_">
								</div>

								<div class="col-md-6 mb-3">
									<label for="validationDefault02">Repeat password</label> <input
										type="password" id="inputPassword6"
										class="form-control mx-sm-2"
										aria-describedby="passwordHelpInline" name="Repeatpass">
								</div>

							</div>

							<button class="btn btn-primary" type="submit">Reset</button>
							<input class="btn btn-primary" type="reset" value="Clear form">
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- /////////////////////////////////////////////Reset password modal  //////////////////////////////////////////////////////////// -->


		<!--Content right-->
		<div class="col-sm-9 col-xs-12 content pt-3 pl-0">
			<div class="mt-1 mb-3 p-3 button-container bg-white border shadow-sm">

				<div class="avatar text-center">
					<img src="logo.jpeg" alt="" class="rounded-circle" />
					<p>
						<strong>Kodson Plus</strong>
					</p>

				</div>

				<div align="left">

					<div class="col-md-4 mb-3" id="company">
						<h6>
							Company :
							<% String comp = (String)session.getAttribute("company"); 
                                    out.println("<b> " + comp + "</b>");
                                    %>
						</h6>
					</div>

					<div class="col-md-4 mb-3" id="name">
						<h6>
							Name :
							<% String name = (String)session.getAttribute("empName"); 
                                    out.println("<b> " + name + "</b>");
                                    %>
						</h6>

					</div>

					<div class="col-md-4 mb-3" id="name">
						<h6>
							Department :
							<% String dep = (String)session.getAttribute("department"); 
                                    out.println("<b> " + dep + "</b>");
                                    %>
						</h6>

					</div>

					<div class="col-md-4 mb-3" id="name">
						<h6>
							Position :
							<% String pos = (String)session.getAttribute("position"); 
                                    out.println("<b> " + pos + "</b>");
                                    %>
						</h6>

					</div>


					<div class="col-md-4 mb-3" id="name">
						<h6>
							Date :
							<% String month = (String)session.getAttribute("month"); 
                                    out.println("<b> " + month + "</b>");
                                    %>
						</h6>

					</div>



				</div>



				<div class="dropdown-divider" style="border-color: black;"></div>

				<h5 align="center">PaySlip</h5>

				<div class="dropdown-divider" style="border-color: black;"></div>
				<h6 align="center" style="color: orange"><%=name %>
					Debt Balance before deductions is =
					<%                          
                                    try
                                    {
                                    	String namees = (String)session.getAttribute("empName"); 
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "SELECT (SELECT COALESCE(SUM(amount), 0) FROM loan where employee='"+namees+"') + (SELECT COALESCE(SUM(amount), 0) FROM deduction where employee='"+namees+"') - (SELECT (COALESCE(SUM(dAmount),0) + COALESCE(SUM(loanAmount), 0)+ COALESCE(SUM(adjustment), 0) + COALESCE(SUM(bicycle), 0)) AS 'TOTAL'FROM payroll where empName='"+namees+"')";       
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String Countrun2="";
                                    while(rs.next()){
                                        Countrun2 = rs.getString(1);
                                        double debtBal = Double.parseDouble(Countrun2);
                                        
                                        double roundOff = Math.round(debtBal*100)/100D;
                                        String.format("%.3f", roundOff);
                                        
                                        if(debtBal<0)
                                        	roundOff = Math.max(roundOff, 0);
                                        HttpSession s1 = request.getSession(false);
                                        s1.setAttribute("Countrun2",roundOff);                               
                                        out.println(roundOff);
                                        }
                                        }
                                        catch (Exception e){
                                        e.printStackTrace();
                                        }


                                    %>
				</h6>
				<div class="d-flex justify-content-center">




					<form action="#" method="post">

						<div class="form-row">




							<!-- //////////////////////////////////////-------------------------//////////////////////// -->


                            <div class="col-md-4 mb-3 input-with-post-icon datepicker">
									     <label for="example">Date</label>
										  <input placeholder="Select date" type="date" id="date-of-leaving" class="form-control" name="date" required>										  
						     </div>
						


							<div class="col-md-4 mb-3">
								<label for="Number1">Paye</label>
								<div>
									<input type="text" id="paye" name="paye" class="form-control"
										data-validation="number" value="0.00" required />
								</div>
							</div>



							<div class="col-md-4 mb-3">
								<label for="Number1">Enter Cash
									Taken if any</label>
								<div>
									<input type="text" id="dAmount" name="dAmount"
										class="form-control" data-validation="number" value="0.00"
										required />
								</div>
							</div>

							<div class="col-md-4 mb-3">
								<label for="Number1">Enter Loan/Surcharges Amount to be
									Taken if any</label>
								<div>
									<input type="text" id="lAmount" name="lAmount"
										class="form-control" data-validation="number" value="0.00"
										required />
								</div>
							</div>

							<div class="col-md-4 mb-3">
								<label for="Number1">Enter Adjustments Amount to be
									Taken if any</label>
								<div>
									<input type="text" id="adjustment" name="adjustment"
										class="form-control" data-validation="number" value="0.00"
										required />
								</div>
							</div>

							<div class="col-md-4 mb-3">
								<label for="Number1">Enter Bicycle Deduction Amount to
									be Taken if any</label>
								<div>
									<input type="text" id="bicycle" name="bicycle"
										class="form-control" data-validation="number" value="0.00"
										required />
								</div>
							</div>

							<div class="form-group floating-label col-md-4 mb-3">
								<select name="bank" id="bank" class="custom-select" required>
									<option value="Bank">Bank</option>
									<option>Cash</option>
									<option>Other</option>
								</select> <label for="" class="mt-1">Select payment Method</label>
							</div>

							<div class="form-group floating-label col-md-4 mb-3">
								<select name="tansaction" id="tansaction" class="custom-select"
									required>
									<option>Paid</option>
									<option>Not Paid</option>

								</select> <label for="" class="mt-1">Status</label>
							</div>
						</div>


						<div align="right">
							<button type="submit" id="submit" name="submit" value="submit"
								class="btn btn-primary">Next</button>
							<button type="Cancel" class="btn btn-primary"
								data-dismiss="modal">Cancel</button>
						</div>
					</form>



				</div>
			</div>


		</div>

		<!--Main Content-->

	</div>

	<!--Page Wrapper-->

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
	<!--Flot.JS-->
	<script src="assets/js/charts/jquery.flot.min.js"></script>
	<script src="assets/js/charts/jquery.flot.pie.min.js"></script>
	<script src="assets/js/charts/jquery.flot.categories.min.js"></script>
	<script src="assets/js/charts/jquery.flot.stack.min.js"></script>
	<!--Sparkline-->
	<script src="assets/js/charts/sparkline.min.js"></script>
	<!--Morris.JS-->
	<script src="assets/js/charts/raphael.min.js"></script>
	<script src="assets/js/charts/morris.js"></script>
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
</html>