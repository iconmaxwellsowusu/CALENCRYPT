<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="fuelError.jsp"%>
    <%@page import="java.sql.*" %>
    
 <% 
    if(request.getParameter("submit")!=null)
    	try
    {	
    	
    	String company =(String) session.getAttribute("company");
    	String department =(String) session.getAttribute("department");
    	String position =(String) session.getAttribute("position");
    	String month =(String) session.getAttribute("month");
    	String empName =(String) session.getAttribute("empName");  	
    	String debtAmount = (String)session.getAttribute("dAmount");
    	String loanAmount = (String)session.getAttribute("lAmount");
    	String adjustments = (String)session.getAttribute("adjustment");
    	String bicycle = (String)session.getAttribute("bicycle");
    	String bank = (String)session.getAttribute("bank");
        String employer = (String)session.getAttribute("employer");
        String employee = (String)session.getAttribute("employee");
        String paye = (String)session.getAttribute("paye");
        String basic = (String)session.getAttribute("Countrunb");
    	
        int taxableSalary = (Integer)session.getAttribute("taxableSalary");
        
        int statutoryDeduction = (Integer)session.getAttribute("statutoryDeduction");
        int netBeforeOtherDiductions = (Integer)session.getAttribute("netBeforeOtherDiductions");
        int netPay = (Integer)session.getAttribute("netBeforeOtherDiductions");
        double debtBalance = (Double)session.getAttribute("Countrun2");
        double totalDebt = (Double)session.getAttribute("Count");
        double outstandingDebt = (Double)session.getAttribute("out");
        double totalDeductions = (Double)session.getAttribute("totalDeduc");
        double netSalaryPayable = (Double)session.getAttribute("netPayable");
        String paymentMethod = (String)session.getAttribute("bank");
        String bankBranch = (String)session.getAttribute("Countrun");
        String accountNumber = (String)session.getAttribute("Countrun5");
        double paidAmount = (Double)session.getAttribute("Countrun6");
       
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into payslip(company,department,position,month,empName,debtAmount,loanAmount,adjustments,bicycle,bank,employer,employee,paye,basic,taxableSalary,statutoryDeduction,netBeforeOtherDiductions,netPay,debtBalance,totalDebt,outstandingDebt,totalDeductions,netSalaryPayable,paymentMethod,bankBranch,accountNumber,paidAmount)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        pst.setString(1, company);
        pst.setString(2, department);
        pst.setString(3, position);
        pst.setString(4, month);      
        pst.setString(5, empName);
        pst.setString(6, debtAmount);
        pst.setString(7, loanAmount);
        pst.setString(8, adjustments);
        pst.setString(9, bicycle);
        pst.setString(10, bank);
        pst.setString(11, employer);
        pst.setString(12, employee);
        pst.setString(13, paye);
        pst.setString(14, basic);
        pst.setInt(15, taxableSalary);
        pst.setInt(16, statutoryDeduction);
        pst.setInt(17, netBeforeOtherDiductions);
        pst.setInt(18, netPay);
        pst.setDouble(19, debtBalance);
        pst.setDouble(20, totalDebt);
        pst.setDouble(21, outstandingDebt);
        pst.setDouble(22, totalDeductions);
        pst.setDouble(23, netSalaryPayable);
        pst.setString(24, paymentMethod);
        pst.setString(25, bankBranch);
        pst.setString(26, accountNumber);
        pst.setDouble(27, paidAmount);

        pst.executeUpdate();
        
        %> 
    <%             
    }catch(Exception e){
      out.println(e);
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
    <link rel="stylesheet" href="NewFile.css">
    <!--Nice select -->
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" type="text/css" href="https://printjs-4de6.kxcdn.com/print.min.css">
    
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    
    

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
                    <h3 class="logo"><a href="#" class="text-secondary logo"><i class="fa fa-money"></i> Create PaySlip <span class="small "></span></a></h3>
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

            <!--Content right-->
            <div class="col-sm-9 col-xs-12 content pt-3 pl-0" >             
              <div class="mt-1 mb-3 p-3 button-container bg-white border shadow-sm" id="testDat">
                 
                 
               
                            
		    
                                 <div class="col-sm-12" id="testPrint">
                                 
                    
                         
                    <div class="avatar text-center">
                        <img src="logo.jpeg" alt="" class="rounded-circle" />
                        <p><strong>Kodson Plus</strong></p>
                       
                    </div>
         <h4>KODSON PLUS CO.LTD <br></h4>
         <h6>GPS: GT-117-2071. Box co3186, TEMA</h6>
         <h6>TEL: 0303305730</h6>
                <div class="panel-body">
                                      <%    
                        Connection connect;
                        PreparedStatement prepare;
                        ResultSet result;
        
                         Class.forName("com.mysql.jdbc.Driver");
                         connect = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                           
                        String id = request.getParameter("id");
                          
                        prepare = connect.prepareStatement("select * from payslip where id = ?");
                        prepare.setString(1, id);
                        result = prepare.executeQuery();
                        
                         while(result.next())
                         {
                    
                    %>
                <h6 align="center" style="color:black">PaySlip for <% String months = result.getString("month"); 
                                    out.println("<b> "+ months + "</b>");
                                    %> </h6> 
                     <table id="testData" class="table table " >
                        <thead>
                              <tr>
                                  
                                  <th scope="col">Employee Name</th>
                                  <th scope="col">Payroll Date</th>
                                  <th scope="col">SSNIT Number</th>
                                  <th scope="col">Category</th>
                                  
                                  
                                                     
                              </tr>

                        </thead>
                        
                      
                        <tbody>
                        
                                 <td style="LINE-HEIGHT:10px">  <% String name = result.getString("empName"); 
                                    out.println("<b> "+ name + "</b>");
                                    %> </td>
                                 <td style="LINE-HEIGHT:10px""><% String pDate = result.getString("pdate"); 
                                    out.println("<b> "+ pDate + "</b>");
                                    %></td>
                                 <td style="LINE-HEIGHT:10px"><%=result.getString(29) %> </td>
                                 <td style="LINE-HEIGHT:10px">  <% String dep = result.getString("department"); 
                                    out.println("<b> "+ dep + "</b>");
                                    %> </td>
                        
                        </tbody>
                          </table>
                        
                        <table class="table table ">
                           <thead>
                              <tr>
                                  
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  
                                  
                                                     
                              </tr>

                        </thead>
                        
                          <thead>
                              <tr>
                                  
                                  <th>Description</th>
                                  <th>Amount</th>
                                  <th>Description</th>
                                  <th>Amount</th>
                                  
                                  
                                                     
                              </tr>

                        </thead>
                        
                      
                        
                         <tbody>
             
                             <tr>
                                 <td class="mt-5"><b >Basic:</b></td>
                                 <td class="mt-5"><% String Basic = result.getString("basic"); 
                                    out.println("<b> " + Basic + "</b>");
                                    %></td>
                                 <td class="mt-5"><b>Employer(SSF)</b></td>
                                 <td class="mt-5">   <% String emssf = result.getString("employer"); 
                                        out.println("<b> " + emssf + "</b>");
                                    %></td>
                                 
                               
						      
                             </tr> 
                             
                              <tr>
                                 <td style="LINE-HEIGHT:10px"><b>Employee(SSF) :</b></td>
                                 <td style="LINE-HEIGHT:10px"> <% String employeessf = result.getString("employee"); 
                                        out.println("<b> " + employeessf + "</b>");
                                    %></td>
                                 <td style="LINE-HEIGHT:10px"><b>Taxable Salary :</b></td>
                                 <td style="LINE-HEIGHT:10px">     <% String taxable = result.getString("taxableSalary"); 
                                        out.println("<b> " + taxable + "</b>");
                                    %></td>
                                 
                               
						      
                             </tr> 
                             <tr>
                                 <td><b>Paye :</b></td>
                                 <td>  <% String paye = result.getString("paye"); 
                                        out.println("<b> " + paye + "</b>");
                                    %></td>
                                 <td><b>Statutory Deduction :</b></td>
                                 <td>  <% String statu = result.getString("statutoryDeduction"); 
                                        out.println("<b> " + statu + "</b>");
                                    %></td>
                                 
                               
						      
                             </tr> 
                             
                             
                                                          <tr>
                                 <td class="mt-5"><b>Net Before Other Deduction :</b></td>
                                 <td class="mt-5">    <% String netB = result.getString("netBeforeOtherDiductions"); 
                                        out.println("<b> " + netB + "</b>");
                                    %></td>
                                 <td class="mt-5"> <b>Net Pay :</b></td>
                                 <td class="mt-5">   <% String netP = result.getString("netPay"); 
                                        out.println("<b> " + netP + "</b>");
                                    %></td>
                                    

                                 
                               
						      
                             </tr> 
                             
                              <tr>
                                 <td style="LINE-HEIGHT:10px"><b >Debt Bal Before Deduction :</b></td>
                                 <td style="LINE-HEIGHT:10px"><% String debtBal = result.getString("DbD"); 
                                        out.println("<b> " + debtBal + "</b>");
                                    %></td>
                                 <td style="LINE-HEIGHT:10px"><b>Current Loan/Surcharges :</b></td>
                                 <td style="LINE-HEIGHT:10px">   <% String current = result.getString("loanAmount"); 
                                        out.println("<b> " + current + "</b>");
                                    %></td>
                                 
                               
						      
                             </tr> 
                             <tr>
                                 <td><b >Adjustments :</b></td>
                                 <td>     <% String adjust = result.getString("adjustments"); 
                                        out.println("<b> " + adjust + "</b>");
                                    %></td>
                                 <td><b>Cash Paid :</b></td>
                                 <td>     <% String Deductions = result.getString("debtAmount"); 
                                        out.println("<b> " + Deductions + "</b>");
                                    %></td>
                                 
                               
						      
                             </tr> 
                             
                                                           <tr>
                                 <td style="LINE-HEIGHT:10px"><b>Bicycle Deduction :</b></td>
                                 <td style="LINE-HEIGHT:10px">          <% String Bicycle = result.getString("bicycle"); 
                                        out.println("<b> " + Bicycle + "</b>");
                                    %></td>
                                 <td style="LINE-HEIGHT:10px"><b>Total Debt :</b></td>
                                 <td style="LINE-HEIGHT:10px"> <% String totDebt = result.getString("totalDebt"); 
                                        out.println("<b> " + totDebt + "</b>");
                                    %></td>
                                 
                               
						      
                             </tr> 
                             <tr>
                                                                     
                                     <td class="mt-5"> <b>Debt Balance After Deduction :</b></td>
                                     <td class="mt-5">   <% String DbD = result.getString("debtBalance"); 
                                        out.println("<b> " + DbD + "</b>");
                                    %></td> 
                                    
                                 <td><b><b>Total Deductions : </b></td>
                                 <td>       <% String total = result.getString("totalDeductions"); 
                                        out.println("<b> " + total + "</b>");
                                    %></td>
                                 
                               
						      
                             </tr> 
                             
                                                           <tr>
                                 <td style="LINE-HEIGHT:10px"><b>Net Salary Payable :</b></td>
                                 <td style="LINE-HEIGHT:10px"><% String nSalary = result.getString("netSalaryPayable"); 
                                        out.println("<b> " + nSalary + "</b>");
                                    %></td>
                                    
                                     
						      
                             </tr> 
                             
                             
                             
		                 
                 </tbody>

                     </table>
                     
                                          <table id="testData" class="table table " >
                        <thead>
                              <tr >
                                  
                                  <th scope="col"><b>Payment Method :</b></th>
                                  <th scope="col"><b>Bank Branch: </b></th>
                                  <th scope="col"><b>Account Number :</b></th>
                                  <th scope="col"><b>Paid Amount :</b></th>
                                  
                                  
                                                     
                              </tr>

                        </thead>
                        
                      
                        <tbody>
                        
                                 <td>  <% String Payment = result.getString("paymentMethod"); 
                                        out.println("<b> " + Payment + "</b>");
                                    %></td>
                                 <td>  <% String branch = result.getString("bankBranch"); 
                                        out.println("<b> " + branch + "</b>");
                                    %>     
                                      </td>
                                 <td><% String Account = result.getString("accountNumber"); 
                                        out.println("<b> " + Account + "</b>");
                                    %> </td>
                                 <td>     <% String paid = result.getString("paidAmount"); 
                                        out.println("<b> " + paid + "</b>");
                                    %></td>
                        
                        </tbody>
                          </table>
                          
                          <div align="right">Approved by General Manager....................................................</div>
                          
                          <%} %>
                
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
                          

 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>     

 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.js"></script>   
 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.js"></script>   
 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.min.js"></script>   
 <script>
        function print_font()
        {
        	alert("printig........");
        	 var element = document.getElementById('testPrint');
        	 html2pdf(element); 

        }
    </script>                            
        
                        </div>  

                              <div align="right"> 
							<button type="submit" class="btn btn-success btn-secondary " name="shortage" onclick="print_font()">Print</button>
							<a href="PaySlipList.jsp"><button type="submit" class="btn btn-success btn-secondary " >Back</button></a>
								</div> 
								
								
								
								
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
  <script>
function printForm() {
	alert("printing....");
    var pdf = new jsPDF({
    	orientation: 'landscape', 
    	unit: "mm",
    	format: [600, 1220]
        
    });
    pdf.setFontSize(20);
    
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $('#testDat')[0];

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
        bottom: 10,
        left: 10,
        
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