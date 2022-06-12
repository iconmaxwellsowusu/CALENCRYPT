<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
    Gson gsonObj = new Gson();
    Map<Object,Object> map = null;
    List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
    String dataPoints = null;
     
    try{
    	Class.forName("com.mysql.jdbc.Driver"); 
    	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
    	Statement statement = connection.createStatement();
    	String xVal, yVal;
    	
    	ResultSet resultSet = statement.executeQuery("select * from datapoints");
    	
    	while(resultSet.next()){
    		xVal = resultSet.getString("x");
    		yVal = resultSet.getString("y");
    		map = new HashMap<Object,Object>(); map.put("x", Double.parseDouble(xVal)); map.put("y", Double.parseDouble(yVal)); list.add(map);
    		dataPoints = gsonObj.toJson(list);
    	}
    	connection.close();
    }
    catch(SQLException e){
    	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
    	dataPoints = null;
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

<link rel="stylesheet" type="text/css" href="css/epoch.min.css">

<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


<link href="https://cdn.syncfusion.com/ej2/ej2-base/styles/material.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdn.syncfusion.com/ej2/ej2-buttons/styles/material.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdn.syncfusion.com/ej2/ej2-calendars/styles/material.css"
	rel="stylesheet" type="text/css" />

<!-- Essential JS 2 all script -->
<!-- <script src="https://cdn.syncfusion.com/ej2/dist/ej2.min.js" type="text/javascript"></script> -->

<!-- Essential JS 2 Calendar's dependent scripts -->
<script
	src="https://cdn.syncfusion.com/ej2/ej2-base/dist/global/ej2-base.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.syncfusion.com/ej2/ej2-inputs/dist/global/ej2-inputs.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.syncfusion.com/ej2/ej2-buttons/dist/global/ej2-buttons.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.syncfusion.com/ej2/ej2-lists/dist/global/ej2-lists.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.syncfusion.com/ej2/ej2-popups/dist/global/ej2-popups.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.syncfusion.com/ej2/ej2-calendars/dist/global/ej2-calendars.min.js"
	type="text/javascript"></script>


<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css" />
<link rel="stylesheet" type="text/css"
	href="DataTables/datatables.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" />


<title>Kodson vms</title>


<script type="text/javascript">
    window.onload = function() { 
     
    <% if(dataPoints != null) { %>
    var chart = new CanvasJS.Chart("chartContainer", {
    	animationEnabled: true,
    	exportEnabled: true,
    	title: {
    		text: "FUEL STATION Department wise Headcount"
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
</head>
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
						<a href="DashBoard.jsp" class="text-secondary logo"><i
							class="fa fa-dashboard "></i> Dash Board<span class="small "></span></a>
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

						<!--Notication icon-->

						<!--Inbox icon-->

						<!--Inbox icon-->

					</div>
					<!--Menu Icons-->

					<!--Search box and avatar-->

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

			<!--Content right-->


			<div class="col-sm-9 col-xs-12 content pt-3 pl-0">
				<h5 class="mb-3">
					<strong>Dashboard</strong>
				</h5>


				<div id="chartContainer" style="height: 570px; width: 100%;"></div>
				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>






				<!-- live calender  -->

				<script>
        // initialize the Calendar component
        var calendar = new ej.calendars.Calendar();
 
        // Render the initialized button.
        calendar.appendTo('#element')
    </script>



				<div class="col-sm-12">

					<div class="panel-body">

						<table id="testData" class="table table-bordered" cellpadding="0"
							cellspacing="0" width="100%">
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
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                
                                  String query = "select * from employee where company='FUEL STATION'";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>

								<tr>
									<td><%=rs.getString("id") %></td>
									<td><%=rs.getString("Name") %></td>
									<td><%=rs.getString("phone1") %></td>
									<td><%=rs.getString("department") %></td>
									<td><%=rs.getString("position") %></td>
									<td><%=rs.getString("bStatus") %></td>
									<td><a href="updateEmployee.jsp?id=<%=id%>"><i
											class="fa fa-pencil text-warning"> </i></a> <a
										onclick="testDelete(<%=rs.getString(1)%>);"
										data-toggle="tooltip" data-placement="top"
										title="Click to update data"><i
											class="fa fa-trash text-danger"> </i></a></td>

								</tr>


								<%
                                 
                                 }
                               %>

							</tbody>

						</table>

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


					<script>
$(document).ready( function () {
    $('#testData').DataTable();
} );


</script>

				</div>


























				<!--Page Wrapper-->

				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

				<script src="js/d3.min.js"></script>
				<script src="js/epoch.min.js"></script>


				<!-- Page JavaScript Files-->
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