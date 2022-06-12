<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="tripError.jsp"%>
<%@page import="java.sql.*"%>
<!--//// jsp code to parse int value to database //////////
   
   String sequenceParam = request.getParameter("sequence");
	int sequence = Integer.parseInt(sequenceParam);
   
    -->

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

<!--Favicon Icon-->
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

		if (session.getAttribute("operations") == null && session.getAttribute("manager") == null && session.getAttribute("maintenance") == null){
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
						<a href="#" class="text-secondary logo"><i class="fa fa-book"></i>
							EPA <span class="small">Page</span></a>
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
								String namee = (String) request.getSession().getAttribute("operations");
								String man = (String) request.getSession().getAttribute("manager");
								String mian = (String) request.getSession().getAttribute("maintenance");
								if ((request.getSession(false).getAttribute("operations") != null)) {
									out.println("<b class=\"badge badge-primary\">" + "Welcome " + namee + "</b>");
								} else if ((request.getSession(false).getAttribute("manager") != null)){
									out.println("<span class=\"badge badge-primary\">" + "Welcome " + man + "</span>");
								}else
									out.println("<span class=\"badge badge-primary\">" + "Welcome " + mian + "</span>");
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
						<span class="text-primary small"><strong>Insurance
								Page</strong></span>
					</div>
					<!--Image Avatar-->

					<!--Sidebar Navigation Menu-->
					<div class="sidebar-menu-container">
						<ul class="sidebar-menu mt-4 mb-4">
							<li class="parent"><a href=" driverManager.jsp "><i
									class="fa fa-car"></i> <span class="none"> Drivers and
										trucks </span> </a></li>
							<li class="parent"><a href="trips.jsp "><i
									class="fa fa-road"></i> <span class="none"> Trips </span> </a></li>
							<li class="parent"><a href=" Locations.jsp "><i
									class="fa fa-map-marker"></i> <span class="none">
										Locations </span> </a></li>
							<li class="parent"><a href=" Companies.jsp "><i
									class="fa fa-building"></i> <span class="none">
										Companies </span> </a></li>
							<li class="parent"><a href=" Categories.jsp "><i
									class="fa fa-pencil-square-o mr-3"></i> <span class="none">
										Categories </span> </a></li>
							<li class="parent"><a href=" PettyCash.jsp "><i
									class="fa fa-credit-card"></i> <span class="none"> Petty
										Cash </span> </a></li>
							<li class="parent"><a href=" Store.jsp "><i
									class="fa fa-shopping-cart mr-3"></i> <span class="none">
										Store </span> </a></li>
							<li class="parent"><a href=" Suppliers.jsp "><i
									class="fa fa-truck"></i> <span class="none"> Suppliers </span>
							</a></li>
							<li class="parent"><a href=" Sta_ob.jsp "><i
									class="fa fa-shield"></i> <span class="none">
										Statutory_Obligations </span> </a></li>
							<li class="parent"><a href=" journey.jsp "><i
									class="fa fa-road"></i> <span class="none"> Journey plan
								</span> </a></li>
						</ul>
					</div>
					<!--Sidebar Naigation Menu-->
				</div>
			</div>
			<!--///////////////////// modals////////////////////////-->

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
					<strong>EPA Data</strong>
				</h5>

				<div class="mt-4 mb-4 p-3 bg-white border shadow-sm lh-sm">

					<div
						class="mt-1 mb-4 p-3 button-container bg-white border shadow-sm">
						<h6 class="mb-2">Data</h6>
						<div class="scrollable">
							<table class="table table-bordered table-hover table-fixed"
								id="testData">
								<thead class="thead-light">

									<tr>
										<th scope="col">#</th>
										<th scope="col">Name</th>
										<th scope="col">Date Inspected</th>
										<th scope="col">Next Inspection Date</th>

										<th scope="col">Count Down</th>
										<th scope="col">UPDATE</th>
										<th scope="col">DELETE</th>
									</tr>
								</thead>
								<tbody>
									<%   
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                
                                  String query = "SELECT id,registrationDate,expiryDate,institution, FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) as Days, FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) % 1440 / 60) as Hours, TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) % 60 as Minutes FROM legal   where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) >1 ";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>

									<tr>
										<td><%=rs.getString(1) %></td>
										<td><%=rs.getString(2) %></td>
										<td><%=rs.getString(3) %></td>
										<td><%=rs.getString(4) %></td>
										<td>
											<%
                                 String d = rs.getString(5);
                                 int dayys = Integer.parseInt(d);
                                 if(dayys>=31){
                                 out.println("<span class=\"badge badge-success\">"+rs.getString(5)+" (days) "+rs.getString(6)+" (hours) "+rs.getString(7)+" (munites)"+"</span>");
                                 }else{
                                	 out.println("<span class=\"badge badge-danger\">"+rs.getString(5)+" (days) "+rs.getString(6)+" (hours) "+rs.getString(7)+" (munites)"+"</span>");
                                	
                                	 
                                 }
                                 %>
										</td>
										<td><a href="updateLegal.jsp?id=<%=id%>"><i
												class="fa fa-pencil text-warning"> </i></a></td>
										<td><a onclick="testDelete(<%=rs.getString(1)%>);"
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

						<div class="navbar-text ">
							<button type="button" class="btn btn-success btn-secondary ">Generate
								Report</button>
						</div>

						<div class="navbar-text ">
							<a href="Sta_ob.jsp">
								<button type="button" class="btn btn-success btn-secondary "
									data-toggle="modal" data-target="#insurancemodal">
									<i class="fa fa-home "></i> home
								</button>
							</a>
						</div>

					</div>
					<!--Chart Section-->
                     <script type="text/javascript">
      
      function testDelete(id){
    	  var doit = confirm("Do you want to delete data");
    	      if(doit){
    	    	  var jspLink = "deleteLegal.jsp?id="+id;
    	    			  window.location.href=jspLink;
    	      }else
    	    	  alert("Cancelled");
      }

</script>
					<!--Chart Section-->

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

		<script src="jquery-3.6.0.js" type="text/javascript"></script>
		<script src="component/jquery/jquery.min.js" type="text/javascript"></script>
		<script src="component/jquery.validate.min.js" type="text/javascript"></script>

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
</body>
</html>