<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<title>Kodson Plus</title>
</head>
<body>

	<%
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    
    
        if(session.getAttribute("admin")==null && session.getAttribute("manager")==null){
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
						<a href="#" class="text-secondary logo"><i
							class="fa fa-dashboard "></i> Manage Leave Type <span
							class="small "></span></a>
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
						<span class="menu-icon" onclick="toggle_sidebar()"> <span
							id="sidebar-toggle-btn"></span>
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
								<a href="index.jsp" class="dropdown-item">
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

					</div>
					<!--Menu Icons-->


					<!--Search box and avatar-->
					<div
						class="col-sm-8 col-4 text-right flex-header-menu justify-content-end">
						<div class="search-rounded mr-3">
							<%
                                
                                String namee =(String) request.getSession().getAttribute("admin");
                                String man = (String) request.getSession().getAttribute("manager");
                                if ((request.getSession(false).getAttribute("Jplanner")== null)) {
                                out.println("<b class=\"badge badge-primary\">"+"Welcome " + man + "</b>");
                                }else { 
                                	out.println("<span class=\"badge badge-primary\">"+"Welcome " + namee + "</span>");
                                }
                                
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

			<!-- /////////////////////////////////////////////logout modal  //////////////////////////////////////////////////////////// -->

			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="outmodal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" data-dismiss="modal">${msg}
								&times;</button>
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
							<button class="close" data-dismiss="modal">${msg}
								&times;</button>
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
				<h5 class="mb-3">
					<strong>Dashboard</strong>
				</h5>

				<!--Dashboard widget-->
				<div class="mt-1 mb-3 button-container">
					<div class="row pl-0">
						<div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-3">
							<div class="bg-white border shadow">
								<div class="p-2 text-center">
									<h5 class="mb-0 mt-2 text-theme">
										<small><strong>INCOME</strong></small>
									</h5>
									<h1>$36,500</h1>
								</div>
								<div class="align-bottom">
									<span id="incomeBar"></span>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-3">
							<div class="bg-white border shadow">
								<div class="p-2 text-center">
									<h5 class="mb-0 mt-2 text-danger">
										<small><strong>EXPENSES</strong></small>
									</h5>
									<h1>$10,850</h1>
								</div>
								<div class="align-bottom">
									<span id="expensesBar"></span>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-3">
							<div class="bg-white border shadow">
								<div class="p-2 text-center">
									<h5 class="mb-0 mt-2 text-green">
										<small><strong>GROSS PROFIT</strong></small>
									</h5>
									<h1>$25,650</h1>
								</div>
								<div class="align-bottom">
									<span id="profitBar"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/Dashboard widget-->

				<div class="row mt-3">
					<div class="col-sm-12 col-md-8">
						<!--Analytics-->
						<div
							class="mt-1 mb-3 p-3 button-container bg-white shadow-sm border">
							<h6 class="mb-3">Analytics</h6>
							<hr>

							<canvas id="orderRevenue" class="orderRevenue" height="120px"></canvas>

						</div>
						<!--/Analytics-->

					</div>


					<div class="col-sm-12 col-md-4">
						<!--Custom Sales small chart-->
						<div
							class="mt-1 mb-3 button-container bg-white border shadow-sm lh-sm">
							<div class="fb-follow-widget">
								<div class="fb-widget-top bg-theme text-white">
									<div class="row p-3 fb-widget-top-desc">
										<div class="col-sm-6 col-6">
											<h5>Sales</h5>
											<small>2016.9.12</small>
										</div>
										<div class="col-sm-6 col-6 text-right">
											<h5>
												<i class="fa fa-caret-up"></i> 260
											</h5>
											<small>2016.9.12</small>
										</div>
									</div>
									<div class="ct-chart" id="areaChartFb"
										style="width: 100%; height: 100px"></div>
								</div>
								<div class="fb-widget-bottom">
									<div class="row p-3 fb-widget-bottom">
										<div class="col-sm-6 col-6 fb-wb-inner">
											<p>
												<small><i class="fa fa-circle text-danger"></i> 32%
													dietary intake</small>
											</p>
											<p>
												<small><i class="fa fa-circle text-theme"></i> 68%
													motion capture</small>
											</p>
											<h5>
												Total : <span class="text-theme">3000</span>
											</h5>
										</div>
										<div class="col-sm-6 col-6 text-right">
											<div id="fbFollowChart" style="height: 130px"></div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<!--/Custom Sales small chart-->
					</div>
				</div>

				<!--Custom cards section-->
				<div class="row">
					<!--Visitors statistics card-->
					<div class="col-sm-4 custom-card">
						<div
							class="mt-1 mb-3 button-container p-3 bg-white border shadow lh-sm">
							<div class="text-center mb-3">
								<h5 class="mb-0 mt-2">
									<small>Visitors</small>
								</h5>
								<h2>2,367</h2>
							</div>

							<svg viewBox="0 0 36 25" class="circular-chart blue">
                                <path class="circle-bg"
									d="M18 2.0845
                                    a 7.9567 7.9567 0 0 1 0 15.9134
                                    a 7.9567 7.9567 0 0 1 0 -15.9134" />
                                <path class="circle"
									stroke-dasharray="40, 60"
									d="M18 2.0845
                                    a 7.9567 7.9567 0 0 1 0 15.9134
                                    a 7.9567 7.9567 0 0 1 0 -15.9134" />
                                <text x="18" y="12.00"
									class="percentage">&#xf0c0;</text>
                            </svg>
							<div class="row mx-2">
								<div class="col-sm-6 col-12">
									<h5>1,507</h5>
									<span class="text-muted small"><strong>Male
											visitors</strong></span>
								</div>
								<div class="col-sm-6 col-12 text-right">
									<h5>854</h5>
									<span class="text-muted small"><strong>Female
											visitors</strong></span>
								</div>
							</div>
						</div>
					</div>
					<!--/Visitors statistics card-->

					<!--Transaction statistics card-->
					<div class="col-sm-4 custom-card">
						<div
							class="mt-1 mb-3 button-container p-3 bg-white border shadow lh-sm">
							<div class="text-center mb-3">
								<h5 class="mb-0 mt-2">
									<small>Transactions</small>
								</h5>
								<h2>15,367</h2>
							</div>

							<svg viewBox="0 0 36 25" class="circular-chart red">
                                <path class="circle-bg"
									d="M18 2.0845
                                    a 7.9567 7.9567 0 0 1 0 15.9134
                                    a 7.9567 7.9567 0 0 1 0 -15.9134" />
                                <path class="circle"
									stroke-dasharray="40, 60"
									d="M18 2.0845
                                    a 7.9567 7.9567 0 0 1 0 15.9134
                                    a 7.9567 7.9567 0 0 1 0 -15.9134" />
                                <text x="18" y="12.00"
									class="percentage">&#xf1ed;</text>
                            </svg>

							<div class="row mx-2">
								<div class="col-sm-6 col-12">
									<h5>15,300</h5>
									<span class="text-muted small"><strong>Payments
											done</strong></span>
								</div>
								<div class="col-sm-6 col-12 text-right">
									<h5>67</h5>
									<span class="text-muted small"><strong>Payments
											due</strong></span>
								</div>
							</div>
						</div>
					</div>
					<!--/Transaction statistics card-->

					<!--Tasks statistics card-->
					<div class="col-sm-4 custom-card">
						<div
							class="mt-1 mb-3 button-container p-3 bg-white border shadow lh-sm">
							<div class="text-center mb-3">
								<h5 class="mb-0 mt-2">
									<small>Tasks</small>
								</h5>
								<h2>585</h2>
							</div>

							<svg viewBox="0 0 36 25" class="circular-chart green">
                                <path class="circle-bg"
									d="M18 2.0845
                                    a 7.9567 7.9567 0 0 1 0 15.9134
                                    a 7.9567 7.9567 0 0 1 0 -15.9134" />
                                <path class="circle"
									stroke-dasharray="40, 60"
									d="M18 2.0845
                                    a 7.9567 7.9567 0 0 1 0 15.9134
                                    a 7.9567 7.9567 0 0 1 0 -15.9134" />
                                <text x="18" y="12.00"
									class="percentage">&#xf0ae;</text>
                            </svg>

							<div class="row mx-2">
								<div class="col-sm-6 col-12">
									<h5>490</h5>
									<span class="text-muted small"><strong>Completed</strong></span>
								</div>
								<div class="col-sm-6 col-12 text-right">
									<h5>95</h5>
									<span class="text-muted small"><strong>Pending</strong></span>
								</div>
							</div>
						</div>
					</div>
					<!--Transaction statistics card-->
				</div>
				<!--Custom cards Section-->

				<div class="row pl-0 mt-3">
					<!--Dashboard widget Contacts-->
					<div class="col-lg-4 col-md-4 col-sm-4 card-pro mb-3">
						<div class="card shadow">
							<div class="card-body">
								<h5 class="card-title bc-header">Contacts</h5>

								<div class="media border-top border-bottom pt-1">
									<img class="align-self-center mr-2 rounded-circle mb-1"
										src="assets/img/client-img2.png" width="40px" height="40px"
										alt="Generic placeholder image">
									<div class="media-body">
										<p class="bc-description mt-2">
											Sarah Reeves <span class="pull-right"><i
												class="fa fa-pencil"></i></span>
										</p>
										<div class="clearfix"></div>
									</div>
								</div>

								<div class="media border-bottom pt-1">
									<img class="align-self-center mr-2 rounded-circle mb-1"
										src="assets/img/client-img3.png" width="40px" height="40px"
										alt="Generic placeholder image">
									<div class="media-body">
										<p class="bc-description mt-2">
											Hermoine Potter <span class="pull-right"><i
												class="fa fa-pencil"></i></span>
										</p>
										<div class="clearfix"></div>
									</div>
								</div>

								<div class="media border-bottom pt-1">
									<img class="align-self-center mr-2 rounded-circle mb-1"
										src="assets/img/client-img4.png" width="40px" height="40px"
										alt="Generic placeholder image">
									<div class="media-body">
										<p class="bc-description mt-2">
											Max Longbottom <span class="pull-right"><i
												class="fa fa-pencil"></i></span>
										</p>
										<div class="clearfix"></div>
									</div>
								</div>

								<div class="media border-bottom pt-1">
									<img class="align-self-center mr-2 rounded-circle mb-1"
										src="assets/img/client-img5.png" width="40px" height="40px"
										alt="Generic placeholder image">
									<div class="media-body">
										<p class="bc-description mt-2">
											Slyvester Jake <span class="pull-right"><i
												class="fa fa-pencil"></i></span>
										</p>
										<div class="clearfix"></div>
									</div>
								</div>

								<div class="media border-bottom pt-1">
									<img class="align-self-center mr-2 rounded-circle mb-1"
										src="assets/img/profile.jpg" width="40px" height="40px"
										alt="Generic placeholder image">
									<div class="media-body">
										<p class="bc-description mt-2">
											Adam Hussein <span class="pull-right"><i
												class="fa fa-pencil"></i></span>
										</p>
										<div class="clearfix"></div>
									</div>
								</div>

								<div class="media border-bottom pt-1">
									<img class="align-self-center mr-2 rounded-circle mb-1"
										src="assets/img/client-img2.png" width="40px" height="40px"
										alt="Generic placeholder image">
									<div class="media-body">
										<p class="bc-description mt-2">
											Stephenie Mark <span class="pull-right"><i
												class="fa fa-pencil"></i></span>
										</p>
										<div class="clearfix"></div>
									</div>
								</div>

								<div class="media pt-1">
									<img class="align-self-center mr-2 rounded-circle mb-1"
										src="assets/img/client-img3.png" width="40px" height="40px"
										alt="Generic placeholder image">
									<div class="media-body">
										<p class="bc-description mt-2">
											Mariya John <span class="pull-right"><i
												class="fa fa-pencil"></i></span>
										</p>
										<div class="clearfix"></div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!--Dashboard widget Contacts-->

					<!--Dashboard Profile card-->
					<div class="col-lg-4 col-md-4 col-sm-4 card-pro mb-3">
						<div class="card shadow">
							<div class="card-body">
								<div class="media">
									<img class="align-self-center mr-3 rounded-circle"
										src="logo.jpeg" width="80px" height="80px"
										alt="Generic placeholder image">
									<div class="media-body">
										<h6 class="mt-0">
											<strong>Rasheed Rayhan</strong>
										</h6>
										<p class="mb-3 text-info">
											<strong>Web designer</strong>
										</p>
										<button type="button" class="btn btn-primary">
											<i class="fa fa-plus"></i> Follow
										</button>
									</div>
								</div>

								<div class="mt-4 mb-4">
									<div class="row user-about">
										<div class="col-sm-4 col-4 border-right">
											<h4>20</h4>
											<p>Photos</p>
										</div>
										<div class="col-sm-4 col-4">
											<h4>31</h4>
											<p>Videos</p>
										</div>
										<div class="col-sm-4 col-4 border-left">
											<h4>120</h4>
											<p>Tasks</p>
										</div>
									</div>
								</div>

								<div class="dropdown-divider"></div>

								<p class="mb-3 mt-3 text-center p-space">Lorem ipsum dolor
									sit ametetur adipisicing elit, sed do eiusmod tempor incididunt
									adipisicing elit, sed do</p>

								<div class="flex-social mt-4 mb-3">
									<a href=""><i class="fa fa-facebook-square"></i></a> <a href=""><i
										class="fa fa-google-plus-square"></i></a> <a href=""><i
										class="fa fa-spotify"></i></a> <a href=""><i
										class="fa fa-yahoo-square"></i></a> <a href=""><i
										class="fa fa-twitter-square"></i></a> <a href=""><i
										class="fa fa-linkedin-square"></i></a> <a href=""><i
										class="fa fa-pinterest-square"></i></a>
								</div>
							</div>
						</div>
					</div>
					<!--Dashboard Profile card-->

					<div class="col-lg-4 col-md-4 col-sm-4 card-calendar mb-3">
						<!--Calendar-->
						<div class="calendar-wrapper panel-head-primary shadow">
							<div id="calendar" class="calendar-box"></div>
							<div class="dropdown-divider"></div>
							<div class="time pl-3 pr-3 pb-1">
								<h6 class="p-typo">
									<strong>Meet a friend</strong> <span
										class="badge badge-success pull-right">10:00am</span>
								</h6>
							</div>
						</div>
						<!--Calendar-->

						<div class="card text-white bg-success mb-3 mt-2 shadow">
							<div class="card-body">
								<h6 class="card-title mb-1">Notification</h6>
								<p class="card-text small text-white">Some quick example
									text to build on the card title and make up the bulk of the
									card's content.</p>
							</div>
						</div>
					</div>

				</div>

				<!--Latest projects-->
				<div class="row mt-3">
					<div class="col-sm-12">
						<div class="shadow panel-head-primary">
							<h5 class="text-center mt-3 mb-3">
								<strong>Latest Projects</strong>
							</h5>
							<div class="table-responsive">
								<table class="table table-striped" id="project_table">
									<thead>
										<tr>
											<th>Project id</th>
											<th>Project name</th>
											<th>Start date</th>
											<th>Due date</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>01</td>
											<td>Web design</td>
											<td>13 Feb, 2018</td>
											<td>10 June, 2018</td>
											<td><span class="badge badge-success">Completed</span></td>
										</tr>
										<tr>
											<td>02</td>
											<td>App development</td>
											<td>03 July, 2018</td>
											<td>09 November, 2018</td>
											<td><span class="badge badge-warning">Pending</span></td>
										</tr>
										<tr>
											<td>03</td>
											<td>App prototyping</td>
											<td>31 January, 2018</td>
											<td>02 September, 2018</td>
											<td><span class="badge badge-danger">Suspended</span></td>
										</tr>
										<tr>
											<td>04</td>
											<td>Web development</td>
											<td>23 October, 2018</td>
											<td>15 December, 2018</td>
											<td><span class="badge badge-info">Negotiations</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!--Footer-->
				<div class="row mt-5 mb-4 footer">
					<div class="col-sm-8">
						<span>&copy; All rights reserved 2019 designed by <a
							class="text-theme" href="#">A-Fusion</a></span>
					</div>
					<div class="col-sm-4 text-right">
						<a href="#" class="ml-2">Contact Us</a> <a href="#" class="ml-2">Support</a>
					</div>
				</div>
				<!--Footer-->

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