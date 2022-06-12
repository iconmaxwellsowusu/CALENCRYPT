<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="tripError.jsp"%>
    <%@ page import="java.util.*,java.sql.*" %>
    <%@ page import="com.google.gson.Gson"%>
    <%@ page import="com.google.gson.JsonObject"%>
     
    <%
    Gson gsonObj = new Gson();
    Map<Object,Object> map = null;
    List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
     
    map = new HashMap<Object,Object>(); map.put("label", "KODSON PlUS"); map.put("y", 44); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "KTC"); map.put("y", 9); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "MANNER"); map.put("y", 8); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "JUST GRACE"); map.put("y", 8); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "UNIQUE TIMES"); map.put("y", 2); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "LIDA GHANA"); map.put("y", 29); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "FUEL STATION"); map.put("y", 50); list.add(map);
     
    String dataPoints = gsonObj.toJson(list);
    %>
    
    
    <%
    if(request.getParameter("submit")!=null){
    	
    	String months = request.getParameter("month");
    	String departments = request.getParameter("department"); 
    	HttpSession sess = request.getSession(false);
    	sess.setAttribute("month", months);
    	sess.setAttribute("departments", departments);
    	
    	response.sendRedirect("addpayRoll.jsp");
    }
    
    %>
    
        <%
    if(request.getParameter("payslip")!=null){
    	
    	String months = request.getParameter("month");
    	String departments = request.getParameter("department"); 
    	HttpSession sess = request.getSession(false);
    	sess.setAttribute("month", months);
    	sess.setAttribute("departments", departments);

    	
    	response.sendRedirect("PaySlipList.jsp");
    }
    
    %>
    
            <%
    if(request.getParameter("newSlip")!=null){
    	
    	String months = request.getParameter("month");
    	String departments = request.getParameter("department"); 
    	
    	HttpSession sess = request.getSession(false);
    	sess.setAttribute("month", months);
    	sess.setAttribute("departments", departments);

    	
    	response.sendRedirect("slipReport.jsp");
    }
    
    %>
    
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
    
    
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    
  
    
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


            <link href="https://cdn.syncfusion.com/ej2/ej2-base/styles/material.css" rel="stylesheet" type="text/css" />
            <link href="https://cdn.syncfusion.com/ej2/ej2-buttons/styles/material.css" rel="stylesheet" type="text/css" />
            <link href="https://cdn.syncfusion.com/ej2/ej2-calendars/styles/material.css" rel="stylesheet" type="text/css" />
 
            <!-- Essential JS 2 all script -->
            <!-- <script src="https://cdn.syncfusion.com/ej2/dist/ej2.min.js" type="text/javascript"></script> -->
 
            <!-- Essential JS 2 Calendar's dependent scripts -->
            <script src="https://cdn.syncfusion.com/ej2/ej2-base/dist/global/ej2-base.min.js" type="text/javascript"></script>
            <script src="https://cdn.syncfusion.com/ej2/ej2-inputs/dist/global/ej2-inputs.min.js" type="text/javascript"></script>
            <script src="https://cdn.syncfusion.com/ej2/ej2-buttons/dist/global/ej2-buttons.min.js" type="text/javascript"></script>
            <script src="https://cdn.syncfusion.com/ej2/ej2-lists/dist/global/ej2-lists.min.js" type="text/javascript"></script>
            <script src="https://cdn.syncfusion.com/ej2/ej2-popups/dist/global/ej2-popups.min.js" type="text/javascript"></script>
            <script src="https://cdn.syncfusion.com/ej2/ej2-calendars/dist/global/ej2-calendars.min.js" type="text/javascript"></script>


  <!-- ////////////link --> <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" rel="stylesheet" type="text/css" />
    <title>Kodson vms</title>
    
    
    <script type="text/javascript">
    window.onload = function() { 
     
    <% if(dataPoints != null) { %>
    var chart = new CanvasJS.Chart("chartContainer", {
    	animationEnabled: true,
    	exportEnabled: true,
    	title: {
    		text: "Company wise Head count Distribution"
    	},
    	data: [{
    		type: "pie", //change type to bar, line, area, pie, etc
    		toolTipContent: "<b>{label}</b>: {y}%",
    		indexLabelFontSize: 16,
    		indexLabel: "{label} - {y}%",
    		dataPoints: <%out.print(dataPoints);%>
    		
    	}]
    });
    chart.render();
    <% } %> 
     
    }
    </script>
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
                    <h3 class="logo"><a href="DashBoard.jsp" class="text-secondary logo"><i class="fa fa-dashboard "></i> Dash Board<span class="small "></span></a></h3>
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
                        <div class="menu-icon">
                            <a onclick="alertMe()" data-dismiss="modal" data-toggle="modal" data-target="#companyModal"><i class="fas fa-columns text-success" data-toggle="tooltip" data-placement="top" title="Print Company Based salary List"></i></a>
                                
                               
                           
                         
                        </div>
                        <!--Inbox icon-->
                        
                          <!--Inbox icon-->
                        <div class="menu-icon">
                            <a onclick="alertMe()" data-dismiss="modal" data-toggle="modal" data-target="#payReportModal"><i class="fas fa-book text-warning" data-toggle="tooltip" data-placement="top" title="paySlip Report"></i></a>
                                
                               
                           
                         
                        </div>
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
                                    <li class="child"><a href="#" class="ml-4" data-dismiss="modal" data-toggle="modal" data-target="#oldpayReportModal"><i class="fa fa-angle-right mr-2"></i> PaySlip List</a></li> 
                                    
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
            
                            <div class="modal fade"data-keyboard="false" data-backdrop="static" id="nameModal" tabindex="-1">
                     <div class="modal-dialog">      
                         <div class="modal-content">
                             <div class="modal-header">
                                  <button class="close" data-dismiss="modal"> ${msg} &times;</button>
                                  <h4 class="modal-title"> </h4>
                             </div>
							
   
			<form action="empHistory.jsp" method="post">
				
				<br><br>
				<h5 align="center">Please select Employee Name</h5>
				
								<div class="form-group floating-label col-md-10">
                                   <select class="custom-select" name="empName" required>
                                                          <%
											                  
											                  String url ="jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
											                  String username="kodson_maxwell";
											                  String password="0040105715@Icon";
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="select * from employee";
											                    	   ResultSet rss = stt.executeQuery(query);
											                    	   
											                    	   while(rss.next()){
											                    		   
											                    		   %>
											                    		    
											                    		   <option><%=rss.getString("Name") %></option>  
											                    		   <% 
											                    		   System.out.println();
											                    	   }
											                    	   
											                       }catch(Exception e){
											                    	   
											                       }
                                                          %>
                                                          
                                            </select>
                                    <label for="" class="mt-1"></label>
                                </div>
                                
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
							<button class="btn btn-primary" type="submit" id="submit" name="submit">Get History</button>
						</div>
					</div>
                                
                                
				
			 </form>		
                </div>
                            
                     </div>
                </div>
            
            
                <div class="modal fade"data-keyboard="false" data-backdrop="static" id="myModal" tabindex="-1">
                     <div class="modal-dialog">      
                         <div class="modal-content">
                             <div class="modal-header">
                                  <button class="close" data-dismiss="modal"> ${msg} &times;</button>
                                  <h4 class="modal-title"> </h4>
                             </div>
							
   
			<form action="EmployeeReport.jsp" method="post">
				
				<br><br>
				<h5 align="center">Please select Month</h5>
				
				<div class="form-row">					
					<div class="col-md-12">
						                        							<!-- /////////////////////////   month and year selector ///////////////////////////////-->

							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
							<script
								src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

							<div class="col-md-6 mb-3">
								<label>Select month</label>
								<div class='input-group date datepicker' id='table'>
									<input type="text" name="month" class="form-control" required />
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
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
                         
                         <div class="form-group floating-label col-md-10 mb-3">
											<select name="company" id="company" class="custom-select"
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
											</select> <label for="" class="mt-1">Select Company</label>
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
                
                                <div class="modal fade"data-keyboard="false" data-backdrop="static" id="mModal" tabindex="-1">
                     <div class="modal-dialog">      
                         <div class="modal-content">
                             <div class="modal-header">
                                  <button class="close" data-dismiss="modal"> ${msg} &times;</button>
                                  <h4 class="modal-title"> </h4>
                             </div>
							
   
			<form action="EmployeeBalance.jsp" method="post">
				
				<br><br>
				<h5 align="center">Please select Month</h5>
				
				<div class="form-row">					
					<div class="col-md-12">
						        							<!-- /////////////////////////   month and year selector ///////////////////////////////-->

							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
							<script
								src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

							<div class="col-md-6 mb-3">
								<label>Select month</label>
								<div class='input-group date datepicker' id='table'>
									<input type="text" name="month" class="form-control" required />
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
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
                <!-- /////////////////////////////////////////////////  company modal ////////////////////////////////////// -->
                   <div class="modal fade"data-keyboard="false" data-backdrop="static" id="companyModal" tabindex="-1">
                     <div class="modal-dialog">      
                         <div class="modal-content">
                             <div class="modal-header">
                                  <button class="close" data-dismiss="modal"> &times;</button>
                                  <h4 class="modal-title"> </h4>
                             </div>
							
   
			<form action="companySalary.jsp" method="post">
				
				<br><br>
				<h5 align="center">Please select Month</h5>
				
				<div class="form-row">					
					<div class="col-md-12">
										<!-- /////////////////////////   month and year selector ///////////////////////////////-->

							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
							<script
								src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

							<div class="col-md-6 mb-3">
								<label>Select month</label>
								<div class='input-group date datepicker' id='table'>
									<input type="text" name="month" class="form-control" required />
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
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
                         
                         <div class="form-group floating-label col-md-10 mb-3">
											<select name="company" id="company" class="custom-select"
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
											</select> <label for="" class="mt-1">Select Company</label>
										</div> 
										
								<div class="form-group floating-label col-md-10">
                                   <select class="custom-select" name="department" required>
                                                          <%
											                  
											                  
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="SELECT DISTINCT(department) from employee";
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
                                    <label for="" class="mt-1">Select Department</label>
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

                 	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="empModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">Select Month To Continue</h4>
					<button class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-body">
					<form action="#" method="post">
						<div class="form-row">
			<!-- /////////////////////////   month and year selector for solution ///////////////////////////////-->

							
	                        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
	                   
	                      
							<div class="col-md-6 mb-3">
								<label>Select month for</label>
							
									<div class="form-group">
									   
									    <input type="text" name="month" class="form-control form-control-1 input-sm from">
									</div>
									
									<script type="text/javascript">
									
									var startDate = new Date();
									var fechaFin = new Date();
									var FromEndDate = new Date();
									var ToEndDate = new Date();




									$('.from').datepicker({
									    autoclose: true,
									    minViewMode: 1,
									    format: 'MM/yyyy'
									}).on('changeDate', function(selected){
									        startDate = new Date(selected.date.valueOf());
									        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
									        $('.to').datepicker('setStartDate', startDate);
									    }); 

									$('.to').datepicker({
									    autoclose: true,
									    minViewMode: 1,
									    format: 'mm/yyyy'
									}).on('changeDate', function(selected){
									        FromEndDate = new Date(selected.date.valueOf());
									        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
									        $('.from').datepicker('setEndDate', FromEndDate);
									    });




									
									</script>
								
							</div>


							<!-- //////////////////////////////////////-------------------------//////////////////////// -->


								<div class="form-group floating-label col-md-6 mb-3">
                                   <select class="custom-select" name="department" required>
                                                          <%
											                  
											                  
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="SELECT DISTINCT(department) from employee";
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
                                    <label for="" class="mt-1">Select Department</label>
                                </div>

						</div>

						<button class="btn btn-primary" type="submit" id="submit"
							name="submit">proceed to Create paySlip</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	
		<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="payReportModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">Select Month</h4>
					<button class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-body">
					<form action="" method="post">
						<div class="form-row">
												<!-- /////////////////////////   month and year selector ///////////////////////////////-->

							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
							<script
								src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

							<div class="col-md-6 mb-3">
								<label>Select month</label>
								<div class='input-group date datepicker' id='table'>
									<input type="text" name="month" class="form-control" required />
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
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


											<div class="form-group floating-label col-md-6 mb-3">
                                   <select class="custom-select" name="department" required>
                                                          <%
											                  
											                  
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="SELECT DISTINCT(department) from employee";
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
                                    <label for="" class="mt-1">Select Department</label>
                                </div>

						</div>

						<button class="btn btn-primary" type="submit" id="submit"
							name="newSlip">proceed to paySlip</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="oldpayReportModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">Select Month</h4>
					<button class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-body">
					<form action="#" method="post">
						<div class="form-row">
									<!-- /////////////////////////   month and year selector ///////////////////////////////-->

							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
							<script
								src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

							<div class="col-md-6 mb-3">
								<label>Select month</label>
								<div class='input-group date datepicker' id='table'>
									<input type="text" name="month" class="form-control" required />
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
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


											<div class="form-group floating-label col-md-6 mb-3">
                                   <select class="custom-select" name="department" required>
                                                          <%
											                  
											                  
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="SELECT DISTINCT(department) from employee";
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
                                    <label for="" class="mt-1">Select Department</label>
                                </div>

						</div>

						<button class="btn btn-primary" type="submit" id="submit"
							name="payslip">proceed to paySlip</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	

            <!--Content right-->
            
            
            <div class="col-sm-9 col-xs-12 content pt-3 pl-0">
                <h5 class="mb-3" ><strong>Dashboard</strong></h5>
                
     <div id="chartContainer" style="height: 570px width: 100%;"></div>



                <!--Custom cards section-->
                
                <div class="row">

                
                          <div class="col-sm-12 col-xs-12 content pt-3 pl-0">
                            <div class="row pl-0">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-12 mb-3">
                                    <div class="border shadow p-3 bg-success">
                                        <p class="pw-2 text-center text-white">
                                            <i class="fa fa-list-ol"></i>
                                            <small class="bc-description text-white"></small>
                                        </p>
                                        <p class="mt-2 text-white">Total Departments
                                        
                                   <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(departmentName) from department";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String Dname="";
                                    while(rs.next()){
                                    	Dname = rs.getString(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",Dname);
                                    out.println("<b style=\"font-size:20px;\"> "+Dname+"</b>");
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
                                    <div class="border shadow p-3 bg-danger">
                                        <p class="pw-2 text-center text-white">
                                            <i class="fa fa-building"></i>
                                            <small class="bc-description text-white"></small>
                                        </p>
                                        <p class="mt-2 text-white">Total Sub Companies
                                        
                                          <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(CompanymainName) from subcompany";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String subcomp="";
                                    while(rs.next()){
                                    	subcomp = rs.getString(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",subcomp);
                                    out.println("<b style=\"font-size:20px;\"> "+subcomp+"</b>");
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
                                    <div class="border shadow p-3 bg-primary">
                                        <p class="pw-2 text-center text-white">
                                            <i class="fa fa-users"></i>
                                            <small class="bc-description text-white"></small>
                                        </p>
                                        <p class="mt-2 text-white">Total Employees = 
                                        
                                               <%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Name) from employee where bStatus ='active'";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String bStatus="";
                                    while(rs.next()){
                                    	bStatus = rs.getString(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",bStatus);
                                    out.println("<b style=\"font-size:20px;\"> "+bStatus+"</b>");
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
                                            <i class="fa fa-desktop"></i>
                                            <small class="bc-description text-white">      
                                             <%
         Integer hitsCount = (Integer)application.getAttribute("hitCounter");
         if( hitsCount ==null || hitsCount == 0 ) {
            /* First visit */
            out.println("Welcome to my website!");
            hitsCount = 1;
         } else {
            /* return visit */
            out.println("");
            hitsCount += 1;
         }
         application.setAttribute("hitCounter", hitsCount);
      %></small>
                                        </p>
                                        <p class="mt-2 text-white">Total number of visits to this page =<b> <%= hitsCount%></b>

                                        </p>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                                 


                    <!--Transaction statistics card-->
                </div>
                <!--Custom cards Section-->

                <div class="row pl-0 mt-3">
                    <!--Dashboard widget Contacts-->
                    <div class="col-lg-8 col-md-8 col-sm-4 card-pro mb-3">
                        <div class="card shadow">
                            <div class="card-body">
                                <h5 class="card-title bc-header">Companies</h5>
                                
                                <div class="media border-top border-bottom pt-1">
                                   <a href="kodson.jsp"> <img class="align-self-center mr-2 rounded-circle mb-1" src="logo.jpeg" width="40px" height="40px" alt="Generic placeholder image"></a>
                                    <div class="media-body">
                                        <p class="bc-description mt-2"><a href="kodson.jsp">Kodson Plus <span class="pull-right"><i class="fa fa-eye"> </i></span></a></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                                <div class="media border-bottom pt-1">
                                    <a href="ktc.jsp"><img class="align-self-center mr-2 rounded-circle mb-1" src="logo.jpeg" width="40px" height="40px" alt="Generic placeholder image"></a>
                                    <div class="media-body">
                                        <p class="bc-description mt-2"><a href="ktc.jsp">KTC  <span class="pull-right"><i class="fa fa-eye"></i></span></a></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                                <div class="media border-bottom pt-1">
                                    <a href="kgl.jsp"><img class="align-self-center mr-2 rounded-circle mb-1" src="logo.jpeg" width="40px" height="40px" alt="Generic placeholder image"></a>
                                    <div class="media-body">
                                        <p class="bc-description mt-2"><a href="kgl.jsp">KGL <span class="pull-right"><i class="fa fa-eye"></i></span></a></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                                <div class="media border-bottom pt-1">
                                    <a href="manner.jsp"><img class="align-self-center mr-2 rounded-circle mb-1" src="logo.jpeg" width="40px" height="40px" alt="Generic placeholder image"></a>
                                    <div class="media-body">
                                        <p class="bc-description mt-2"><a href="manner.jsp">Mannaer Logistics <span class="pull-right"><i class="fa fa-eye"></i></span></a></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                                <div class="media border-bottom pt-1">
                                   <a href="justGrace.jsp"> <img class="align-self-center mr-2 rounded-circle mb-1" src="logo.jpeg" width="40px" height="40px" alt="Generic placeholder image"></a> 
                                    <div class="media-body">
                                        <p class="bc-description mt-2"><a href="justGrace.jsp"> Just Grace <span class="pull-right"><i class="fa fa-eye"></i></span></a></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                                <div class="media border-bottom pt-1">
                                    <a href="uniqueTimes.jsp"><img class="align-self-center mr-2 rounded-circle mb-1" src="logo.jpeg" width="40px" height="40px" alt="Generic placeholder image"></a>
                                    <div class="media-body">
                                        <p class="bc-description mt-2"><a href="uniqueTimes.jsp">Unique Times<span class="pull-right"><i class="fa fa-eye"></i></span></a></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                                <div class="media pt-1">
                                   <a href="lida.jsp"> <img class="align-self-center mr-2 rounded-circle mb-1" src="logo.jpeg" width="40px" height="40px" alt="Generic placeholder image"></a>
                                    <div class="media-body">
                                        <p class="bc-description mt-2"><a href="lida.jsp">Lida Ghana <span class="pull-right"><i class="fa fa-eye"></i></span></a></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                
                                 <div class="media pt-1">
                                  <a href="fuelStation.jsp"> <img class="align-self-center mr-2 rounded-circle mb-1" src="logo.jpeg" width="40px" height="40px" alt="Generic placeholder image"></a> 
                                    <div class="media-body">
                                        <p class="bc-description mt-2"><a href="fuelStation.jsp">Fuel Station <span class="pull-right"><i class="fa fa-eye"></i></span></a></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!--Dashboard widget Contacts-->

                    <!--Dashboard Profile card-->
                        
                    <!--Dashboard Profile card-->

                    <div class="col-lg-4 col-md-4 col-sm-4 card-calendar mb-3">
                        <!--Calendar-->
                        <div class="calendar-wrapper panel-head-primary shadow" id="element">
                            
                            
                            
                        </div>
                        <!--Calendar-->

                    </div>
                    
                </div>
                
                 <div class="mt-3 row">
                    <div class="col-sm-12">
                        <div class="mt-1 mb-3 p-3 button-container bg-white shadow-sm border">
                            <h6 class="mb-3">Server Status</h6><hr>
                            
                            <div class="row mb-3">
                                <div class="col-sm-6 ol-12">
                                    <h5></h5>
                                    <h1 class="text-theme"></h1>
                                </div>
                                <div class="col-sm-6 ol-12 text-right">
                                    <h5></h5>
                                    <h1 class="text-danger"></h1>
                                </div>
                            </div>

                            <div id="realtimeDashboard" style="width: 100%; height:150px; overflow-x: auto"></div>
                        </div>
                    </div>
                </div>

                <!--Latest projects-->
 



            </div>
        </div>

        <!--Main Content-->

    </div>




            <!-- live calender  -->
  
    <script>
        // initialize the Calendar component
        var calendar = new ej.calendars.Calendar();
 
        // Render the initialized button.
        calendar.appendTo('#element')
    </script>




    <!--Page Wrapper-->
    
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    
    <script src="js/d3.min.js"></script>
    <script src="js/epoch.min.js"></script>
    

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