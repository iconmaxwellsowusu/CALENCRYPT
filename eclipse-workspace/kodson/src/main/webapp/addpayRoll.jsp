<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="tripError.jsp"%>

<%@page import="java.sql.* "%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.util.Date "%>


<%


String pattern = "yyyy-MM-dd";
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

String date = simpleDateFormat.format(new Date());

%>

<%

double basicSalary; 
double employer=0.00;
double employee=0.00;
double netBefore=0.00;
double debtBefore;
double employerssf;
double employeessf;
double statutoryDeduction =0.00;
double netPay=0.00;
double totalDebt=0.00;
double balanceOutstanding=0.00;
double totaldeduction=0.00;
double netSalaryPayable;
double taxable=0.0;
double payee=0.00;
double netBeforeOther=0.00;
double deduction=0.00;
double bicycle=0.00;
double DebtBal=0.00;
double currentLoan=0.00;
if(request.getParameter("test")!=null){
	
     String payEmpBasic = request.getParameter("payEmpBasic").replaceAll(",", "");
     String tax = request.getParameter("tax");
     String payEmpPaye = request.getParameter("payEmpPaye");
     String payEmpDebtBal = request.getParameter("payEmpDebtBal");
     String payEmpDeduct = request.getParameter("payEmpDeduct");
     String payEmpBicyc = request.getParameter("payEmpBicyc");
     String payEmpCurLoanSur = request.getParameter("payEmpCurLoanSur");
     basicSalary =Double.parseDouble(payEmpBasic);
     double pay = Double.parseDouble(payEmpPaye);
     double deduct =Double.parseDouble(payEmpDeduct);
     double byc =Double.parseDouble(payEmpBicyc);
     double bd=Double.parseDouble(payEmpDebtBal);
     double cLoan = Double.parseDouble(payEmpCurLoanSur);
     payee=pay;
     deduction=deduct;
     bicycle=byc;
     DebtBal=bd;
     double ta;
     double basic = basicSalary;
     employer = basic/100*13.5;
     
     double roundOff = Math.round(employer*100)/100D;
     String.format("%.3f", roundOff);
     employer=roundOff;
     
     if(tax == null){
    	 ta=0.00;
     }else{
    	 ta=Double.parseDouble(tax);
     }
     employee = basic/100*ta;
      roundOff = Math.round(employee*100)/100D;
     String.format("%.3f", roundOff);
     employee=roundOff;
     
    taxable = basic-employee; 
    roundOff = Math.round(taxable*100)/100D;
    String.format("%.3f", roundOff);
    taxable=roundOff;
    
    statutoryDeduction = payee+employee;
     
    roundOff = Math.round(statutoryDeduction*100)/100D;
    String.format("%.3f", roundOff);
    statutoryDeduction=roundOff;
    
    netBeforeOther = basic-statutoryDeduction;
    
    roundOff = Math.round(netBeforeOther*100)/100D;
    String.format("%.3f", roundOff);
    netBeforeOther=roundOff;
    
    double minus=bicycle+deduction;
    
    netPay =  netBeforeOther-minus;
    roundOff = Math.round(netPay*100)/100D;
    String.format("%.3f", roundOff);
    netPay=roundOff;
    double testOut = cLoan+DebtBal;
    
    balanceOutstanding = testOut-minus;
    
    roundOff = Math.round(balanceOutstanding*100)/100D;
    String.format("%.3f", roundOff);
    balanceOutstanding=roundOff;
    
    totaldeduction=statutoryDeduction+minus;
    roundOff = Math.round(totaldeduction*100)/100D;
    String.format("%.3f", roundOff);
    totaldeduction=roundOff;
    System.out.println("total deductins "+totaldeduction);
    
    totalDebt = cLoan+DebtBal;
    roundOff = Math.round(totalDebt*100)/100D;
    String.format("%.3f", roundOff);
    totalDebt=roundOff;
    System.out.println("total Debt is "+totalDebt);
    
}
%>

<%
if(request.getParameter("save") != null){
	
	
	String payEmpName = request.getParameter("payEmpName");
	String date1 = request.getParameter("date");
	String payEmpSsnit = request.getParameter("payEmpSsnit");
	String payEmpCatName = request.getParameter("payEmpCatName");
	String month = (String)session.getAttribute("month");
	String payEmpBasic = request.getParameter("payEmpBasic").replace(",", "");
	String payEmpDebtBal = request.getParameter("payEmpDebtBal");
	String payEmpSFFl = request.getParameter("payEmpSFFl");
	String payEmpCurLoanSur = request.getParameter("payEmpCurLoanSur");
	String payEmpSSFP = request.getParameter("payEmpSSFP");
	String payEmpAdjust = request.getParameter("payEmpAdjust");
	String payEmpTaxableS = request.getParameter("payEmpTaxableS");
	String payEmpDeduct = request.getParameter("payEmpDeduct");
	double dec = Double.parseDouble(payEmpDeduct);//////////////////////////////////
	
	String payEmpPaye = request.getParameter("payEmpPaye");
	String payEmpBicyc = request.getParameter("payEmpBicyc");
	double testB = Double.parseDouble(payEmpBicyc);/////////////////////////////
	double allcalc = dec+testB;//////////////////////////////////
	String payEmpStatuDeduc = request.getParameter("payEmpStatuDeduc");
	String payEmpBeforOdaDeduc = request.getParameter("payEmpBeforOdaDeduc");
	String payEmpNetSal = request.getParameter("payEmpNetSal");
	String payEmpTotDebt = request.getParameter("payEmpTotDebt");
	String payEmpBlaAwt = request.getParameter("payEmpBlaAwt");
	String payEmpTotDeduc = request.getParameter("payEmpTotDeduc");
	String payEmpNetSalPay = request.getParameter("payEmpNetSalPay");
	String payEmpPayMethod = request.getParameter("payEmpPayMethod");
	String payEmpBankBranch = request.getParameter("payEmpBankBranch");
	String payEmpBankNo = request.getParameter("payEmpBankNo");
	String payEmpPaidAmt = request.getParameter("payEmpPaidAmt");
	String payEmpCompany = request.getParameter("company");
	
	double bd = (Double)session.getAttribute("debt");//////////////////////////
	double debtR = bd-allcalc;/////////////////////////////////////
	
	String position = request.getParameter("position");
	String c = (String)session.getAttribute("com");
	
	System.out.println(c);
	
	
	Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
    pst = con.prepareStatement("insert into payroll(empName,date,ssnit,department,payDay,basic,debtBalance,employer,currentLoan,employee,adjustment,taxableSalary,dAmount,paye,bicycle,statutoryD,netpayBefore,netSalary,totalDebt,outstandingBalance,totalDeduction,netpayable,pmethod,bankBrach,accountNumber,paidAmount,deduction,position,Company)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
   
	pst.setString(1, payEmpName);
    pst.setString(2, date1);
    pst.setString(3, payEmpSsnit);
    pst.setString(4, payEmpCatName);
    pst.setString(5, month);
	pst.setString(6, payEmpBasic);
    pst.setString(7, payEmpDebtBal);
    pst.setString(8, payEmpSFFl);
    pst.setString(9, payEmpCurLoanSur);
    pst.setString(10, payEmpSSFP);
	pst.setString(11, payEmpAdjust);
    pst.setString(12, payEmpTaxableS);
    pst.setString(13, payEmpDeduct);
    pst.setString(14, payEmpPaye);
    pst.setString(15, payEmpBicyc);
	pst.setString(16, payEmpStatuDeduc);
    pst.setString(17, payEmpBeforOdaDeduc);
    pst.setString(18, payEmpNetSal);
    pst.setString(19, payEmpTotDebt);
    pst.setString(20, payEmpBlaAwt);
	pst.setString(21, payEmpTotDeduc);
    pst.setString(22, payEmpNetSalPay);
    pst.setString(23, payEmpPayMethod);
    pst.setString(24, payEmpBankBranch);
    pst.setString(25, payEmpBankNo);
    pst.setString(26, payEmpPaidAmt);
    pst.setDouble(27, debtR);////////////////////////
    pst.setString(28, position);
    pst.setString(29, payEmpCompany);
    pst.executeUpdate();
    
    System.out.println("inserted");
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

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css" />
<link rel="stylesheet" type="text/css"
	href="DataTables/datatables.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" />

<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css" />

<!-- 
    RTL version
-->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.rtl.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.rtl.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.rtl.min.css" />
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.rtl.min.css" />
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


<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css" />
<link rel="stylesheet" type="text/css"
	href="DataTables/datatables.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" />

<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<title>Kodson Plus</title>
</head>
<body>

	<%/*
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    
    
        if(session.getAttribute("admin")==null && session.getAttribute("manager")==null){
              response.sendRedirect("index.jsp");   
        }
        
       */ %>

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
						<a href="#" class="text-secondary logo"><i class="fa fa-book "></i>
							Manage Employee<span class="small "></span></a>
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

             <!-- ////////////////////////////////////////////////  mates modal /////////////////////////////////////////////////////////-->
                <div class="modal fade"data-keyboard="false" data-backdrop="static" id="matemodal" tabindex="-1">
                     <div class="modal-dialog ">         
                         <div class="modal-content">
                             <div class="modal-header">
                             <h4 class="modal-title"> Add a new mate</h4>
                                  <button class="close" data-dismiss="modal">&times;</button>
                             </div>
                                  <div class="modal-body">
						
							<form action="#" method="post">

								  <div class="form-group">
								    <label for="formGroupExampleInput">Mate Name</label>
								    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Enter mate's Name" name="name" required >
								  </div>
								  <button type="submit" class="btn btn-primary" id="mate" name="mate" value="submit">Submit</button>
								  <button type="Cancel" class="btn btn-primary" data-dismiss="modal">Cancel</button>
								</form>
                                  </div>
                         </div>      
                     </div>
                </div>
<!-- ////////////////////////////////////////////////  mates modal /////////////////////////////////////////////////////////--> 
			<!--Content right-->
			<div class="col-sm-9 col-xs-12 content pt-3 pl-0">
				            <div class="mt-1 mb-3 p-3 button-container bg-white border shadow-sm">                         
                                                        
                            
                            
                           <div >
                           
                           <form action="#" method="post">
						  	
						  	<%    
                        Connection ccon;
                        PreparedStatement ppst;
                        ResultSet rrs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                         ccon = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                           
                        String idd = request.getParameter("id");
                          
                        ppst = ccon.prepareStatement("select * from employee where id = ?");
                        ppst.setString(1, idd);
                        rrs = ppst.executeQuery();
                        
                         while(rrs.next())
                         {
                        	 
                        	String com = rrs.getString("Company");
                        	HttpSession s = request.getSession(false);
                        	s.setAttribute("com", com);
                    
                    %>
									  									  
					
                <div class="col-sm-12">

                            <div class="card-body">
                        <form action="#" id="edit_payslip">
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Employee Name:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="payEmpName" id="payEmpName" class="form-control" value ="<%=rrs.getString("Name")%>">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Payroll Date:</b></label>
                                            <div class="col-lg-4">
                                                 <input readonly type="text" name="date"  class="form-control" value ="<% out.println(date);%>">
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
                                                <input readonly name="payEmpSsnit" id="payEmpSsnit" type="text" class="form-control" value ="<%=rrs.getString("ssnit")%>">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Department:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly readonly type="text" name="payEmpCatName" id="payEmpCatName" class="form-control" value ="<%=rrs.getString("department")%>">
                                            </div>
                                            <br>
                                            
                                            <label class="col-lg-2 col-form-label"><b>Position:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly readonly type="text" name=position id="position" class="form-control" value ="<%=rrs.getString("position")%>">
                                            </div>
                                            
                                              <label class="col-lg-2 col-form-label"><b>Company:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly readonly type="text" name=company id="company" class="form-control" value ="<%=rrs.getString("Company")%>">
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
                                        <input type="text" id="payEmpbasic" name="payEmpBasic" class="form-control numbersonly-format" value="<%=rrs.getString("basicSalary")%>" class="form-control numbersonly-format">
                                            </div>
                                            
                                            
                                        <label class="col-lg-2 col-form-label"><b>Debt Bal B/D:</b></label>
                                            <div class="col-lg-4">
                                            <input readonly type="text" name="payEmpDebtBal" id="payEmpDebtBal" value="<%
                                            
                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
                                            String namees = rrs.getString("Name");
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                            Statement st=con.createStatement();
                                            String strQuery = "SELECT (SELECT COALESCE(SUM(amount), 0) FROM loan where employee='"+namees+"') + (SELECT COALESCE(SUM(amount), 0) FROM deduction where employee='"+namees+"') - (SELECT (COALESCE(SUM(dAmount),0) + COALESCE(SUM(loanAmount), 0)+ COALESCE(SUM(adjustment), 0) + COALESCE(SUM(bicycle), 0)) AS 'TOTAL'FROM payroll where empName='"+namees+"')";       
                                            ResultSet rs = st.executeQuery(strQuery);
                                            String debt="";
                                            while(rs.next()){
                                            	 debt = rs.getString(1);
                                            double debtBal = Double.parseDouble(debt);

                                            double roundOff = Math.round(debtBal*100)/100D;
                                            String.format("%.3f", roundOff);

                                            HttpSession session1 = request.getSession(false);
                                            session1.setAttribute("debt", roundOff);

                                            if(debtBal<0)
                                            	roundOff = Math.max(roundOff, 0);

                                            netBefore=roundOff;
                                           // out.println(netBefore);
                                            }
                                            
                                            
                                            
                                 
                                 Class.forName("com.mysql.jdbc.Driver").newInstance();                                 
                                 String strQuery3 =  "SELECT deduction FROM payroll WHERE id=(SELECT max(id) FROM payroll) and empName='"+namees+"'";               
                                 ResultSet rs3 = st.executeQuery(strQuery3);
                                 double debt1=0.00;
                                 while(rs3.next()){
                                 	 debt1 = rs3.getDouble(1);
                                 }
                                 double debtBal1 = debt1;
                                 double roundOff1 = Math.round(debtBal1*100)/100D;
                                 String.format("%.3f", roundOff1);

                                 HttpSession session1 = request.getSession(false);
                                 session1.setAttribute("debt1", roundOff1);

                                 if(roundOff1<=0)
                                 
                                    roundOff1=0.00;
                                    out.println( roundOff1);
                                    //System.out.println("-----------" + roundOff1);
                                    
                                    
                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                    
                                 %>" class="form-control numbersonly-format">
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
                        <input readonly type="text" name="payEmpSFFl" id="payEmpSSFl" value="<% out.println(employer); %>" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Current Loans/ Surcharges:</b></label>
                                            <div class="col-lg-4">
                    <input readonly type="text" name="payEmpCurLoanSur" id="payEmpCurLoanSur" value="<%
        
                    
                    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    
                     
                     double dbtest = (Double)session.getAttribute("debt");
                     double dbtest1 = (Double)session.getAttribute("debt1");
                    
                     double val=0.00;
                     
                     Class.forName("com.mysql.jdbc.Driver").newInstance();
                     
                     String strQuery1 = "select sum(dAmount) from payroll where empName='"+namees+"'";
                     ResultSet rs1 = st.executeQuery(strQuery1);
                     
                     while(rs1.next()){
                    	 val=rs1.getDouble(1);
                     }
                     out.println(dbtest - dbtest1);   
                     //System.out.println("+++++++++++++"+dbtest1); 
     ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    
                    
                    
                    %>" class="form-control numbersonly-format">
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
                                                <input readonly type="text" name="payEmpSSFP" id="payEmpSSFP" value="<% out.println(employee); %>" class="form-control numbersonly-format">
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
                                                <input readonly type="text" name="payEmpTaxableS" id="payEmpTaxableS" value="<% out.println(taxable); %>" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Deductions:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="payEmpDeduct" id="payEmpDeduct" value="<% out.println(deduction); %>" class="form-control numbersonly-format">
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
                                                <input type="text" name="payEmpPaye" id="payEmpPaye" value="<% out.println(payee); %>" class="form-control numbersonly-format">
                                            </div>

                                            <label class="col-lg-2 col-form-label"><b>Bicycle Deductions:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="payEmpBicyc" id="payEmpBicyc" value="<%out.println(bicycle); %>" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="row">
                             
                                <div class="row" style="margin:10px;">
                                    <label class="d-block font-weight-semibold" style="color:red;">(Please do not select any if you do not want changes) &nbsp;&nbsp;</label><span style="color:red;"></span>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" name="tax" value="5.5" id="allow_emp">
                    <label class="custom-control-label" for="allow_emp">Use Employee 5.5%
                                               </label> 
                                    </div>

                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" name="tax1" value="13.5" id="allow_empler">
                                 <label class="custom-control-label" for="allow_empler">Use Employer 13.5%
                                                </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Statutory Deduction:</b></label>
                                            <div class="col-lg-4">
                                                <input type="text" name="payEmpStatuDeduc" id="payEmpStatuDeduc" value="<% out.println(statutoryDeduction); %>" class="form-control numbersonly-format">
                                            </div>
                                        </div>
                                    </fieldset>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label"><b>Net Before Other Deductions:</b></label>
                                            <div class="col-lg-4">
                                                <input readonly type="text" name="payEmpBeforOdaDeduc" id="payEmpBeforOdaDeduc" value="<%out.println(netBeforeOther); %>" class="form-control numbersonly-format">
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
                                                    <input readonly type="text" name="payEmpNetSal" id="payEmpNetSal" value=" <%out.println(netPay); %>" class="form-control numbersonly-format">
                                                </div>

                                                <label class="col-lg-2 col-form-label"><b>Total Debt:</b></label>
                                                <div class="col-lg-4">
                                                    <input readonly name="payEmpTotDebt" id="payEmpTotDebt" value="<%out.println(totalDebt); %>" type="text" class="form-control numbersonly-format">
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
                                                    <input readonly type="text" name="payEmpBlaAwt" id="payEmpBlaAwt" value="<%out.println(balanceOutstanding); %>" class="form-control numbersonly-format">
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
                                                    <input readonly type="text" name="payEmpTotDeduc" id="payEmpTotDeduc" value="<%out.println(totaldeduction); %>" class="form-control numbersonly-format">
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
                                                    <input readonly type="text" name="payEmpNetSalPay" id="payEmpNetSalPay" value=" <%out.println(netPay); %>" class="form-control numbersonly-format">
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
                                                    <input readonly type="text" name="payEmpBankBranch" id="payEmpBankBranch" class="form-control" value="<%
                                                    String bank = rrs.getString("BankName");
                                                    String branch = rrs.getString("BankBranch");
                                                    out.println(bank+"/"+branch+" Branch");
                                                    
                                                    %>">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label><b>Bank Account#:</b></label>
                                                    <input readonly type="text" name="payEmpBankNo" id="payEmpBankNo" class="form-control" value="<%=rrs.getString("AccountNumber")%>">
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label><b>Paid Amount:</b></label>
                                                    <input readonly type="text" name="payEmpPaidAmt" id="payEmpPaidAmt" value=" <%out.println(netPay); %>" class="form-control">
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

                        <div class="row">
                            <div class="col-md-12">
                            <button type="submit" name ="test" class="btn btn-success">Calaculte Values</button>
                                
                               <button type="submit" name ="save" class="btn btn-primary">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
                
                <%} %>
                           </div>
                        </div>

                   

				<div class="col-sm-12">

					<div class="panel-body">

						<table id="testData" class="table" style="color:Red">
							<thead>
								<tr>
									<th>id</th>
									<th>Name</th>
									<th>Phone number</th>
									<th>Department</th>
									<th>Designation</th>
									<th>Status</th>
									<th>Actions</th>


								</tr>

							</thead>

							<tbody>
								<%   
                                 int k = 0;
                                Connection co;
                                PreparedStatement ps;
                                ResultSet r;
                                
                                String dep = (String)session.getAttribute("departments");
        
                                Class.forName("com.mysql.jdbc.Driver");
                                co = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                
                                  String query =  "SELECT * FROM employee WHERE  Name NOT IN(SELECT empName FROM payroll where payroll.payDay = CONCAT(MONTHNAME(now()),'/',year(payroll.date)))and department='"+dep+"' and bStatus='Active'";
                                  Statement stt = co.createStatement();
                                  
                                    r =  stt.executeQuery(query);
                                    
                                        while(r.next())
                                        {
                                            String id = r.getString("id");
                                            
                                   %>

								<tr>
									<td><%out.println(k+=1); %></td>
									<td><%=r.getString("Name") %></td>
									<td><%=r.getString("phone1") %></td>
									<td><%=r.getString("department") %></td>
									<td><%=r.getString("position") %></td>
									<td><%=r.getString("bStatus") %></td>
									<td><a href="addpayRoll.jsp?id=<%=id%>"><button type="button" class="btn btn-outline-secondary"><i class="fa fa-plus text-warning" data-toggle="modal" data-target="#matemodal">
									 </i></button></a> </td>

								</tr>
								<%
                                 
                                 }
                               %>

							</tbody>

					   	</table>
                        <table id="testDat" class="table" style="color:Green">
							<thead>
								<tr>
									<th>id</th>
									<th>Name</th>
									<th>Phone number</th>
									<th>Department</th>
									<th>Designation</th>
									<th>Status</th>
								</tr>

							</thead>

							<tbody>
								<%   
 
                              
                                int i=0;
                               // String depp = (String)session.getAttribute("departments");
        
                                Class.forName("com.mysql.jdbc.Driver");
                                co = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                
                                  String queryy = "SELECT * FROM employee WHERE  Name IN(SELECT empName FROM payroll where payroll.payDay = CONCAT(MONTHNAME(now()),'/',year(payroll.date)))and department='"+dep+"'";
                                  Statement st = co.createStatement();
                                  
                                    r =  st.executeQuery(queryy);
                                    
                                        while(r.next())
                                        {
                                            String id = r.getString("id");
                                            
                                   %>

								<tr>
									<td><%out.println(i+=1); %></td>
									<td><%=r.getString("Name") %></td>
									<td><%=r.getString("phone1") %></td>
									<td><%=r.getString("department") %></td>
									<td><%=r.getString("position") %></td>
									<td><%=r.getString("bStatus") %></td>
									

								</tr>


								<%
                                 
                                 }
                               %>

							</tbody>

						</table>
						
						
						
						

                     <script type="text/javascript">
      
      function testDelete(id){
    	  var doit = confirm("Do you want to delete data");
    	      if(doit){
    	    	  var jspLink = "deleteEmployee.jsp?id="+id;
    	    			  window.location.href=jspLink;
    	      }else
    	    	  alert("Cancelled");
      }

</script>

					</div>

					<script src="jquery-3.6.0.js" type="text/javascript"></script>
					<script src="component/jquery/jquery.min.js" type="text/javascript"></script>
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

					<script>
$(document).ready( function () {
    $('#testDat').DataTable();
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



	<!--Page Wrapper-->
	<script
		src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

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
</html>