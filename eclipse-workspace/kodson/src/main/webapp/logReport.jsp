<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"> 

</script>

	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="monthhlyModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">${msg} &times;</button>
					<h4 class="modal-title"></h4>
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

								<select name="oil" id="oil" class="custom-select" required>
									<option value=""></option>
									<option value="GOIL">GOIL</option>
									<option value="BOST">BOST</option>
									<option value="OTHER">OTHER</option>
								</select> <label for="" class="mt-1">Select Oil Company</label>
							</div>

						</div>

						<button class="btn btn-primary" type="submit" id="submit"
							name="submit">Generate</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /////////////////////////////////////////////Reset password modal  //////////////////////////////////////////////////////////// -->



	<div class="col-sm-12 col-xs-12 content pt-3 pl-0" id="">

		<h5 class="mb-3" align="center">
			<strong></strong>
		</h5>



		<div class="mt-4 mb-4 p-3 bg-white border shadow-sm lh-sm">

			
				<h6 class="mb-2" align="center">
					<%
                     
                     String month = request.getParameter("month");
                     HttpSession sess = request.getSession(false);
                     sess.setAttribute("month", month);
                     
                     out.println( month);
                     %>
				</h6>
				<div class="scrollable" id="printMe">
												<table class="table table-bordered table-hover table-fixed">
								<thead class="thead-light">

									<tr>
                                        <th scope="col">No.</th>
										<th scope="col">Month</th>
										<th scope="col">NAME</th>
										<th scope="col">TRUCK No.</th>
										<th scope="col">Trip Count</th>
										<th scope="col">Date Issued</th>
										<th scope="col">Expected Date</th>
										<th scope="col">Date Received</th>
										<th scope="col">Return Date</th>
										<th scope="col">Customer</th>
										<th scope="col">Location</th>
										<th scope="col">Fuel Issued</th>
										<th scope="col">Reference</th>
										<th scope="col">Date Count</th>
										<th scope="col">Status</th>

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
                                
                                  String query = "SELECT log.*,DATEDIFF(Rdate,datei) FROM log where month='"+month+"'";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>

									<tr>
									    <td><%=rs.getString("id") %></td>
										<td><%=rs.getString("month") %></td>
										<td><%=rs.getString("bvo") %></td>
										<td><%=rs.getString("brv") %></td>
										<td><%=rs.getString("tripCount") %></td>
										<td><%=rs.getString("datei") %></td>
										<td><%=rs.getString("dateE") %></td>
										<td><%=rs.getString("dateR") %></td>
										<td><%=rs.getString("Rdate") %></td>
										<td><%=rs.getString("oil") %></td>
										<td><%=rs.getString("des") %></td>
										<td><%=rs.getString("fuel") %></td>
										<td><%=rs.getString("ref") %></td>
										<td><%=rs.getString(15) %></td>
										<td><%=rs.getString("status") %></td>
										<td><a href="updateJourney.jsp?id=<%=id%>"><i
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

					<div class="navbar-text ">
						<button type="submit" class="btn btn-success btn-secondary "
							name="shortage" onclick="print_font()">Print</button>
						<a href="journey.jsp">
							<button type="button" class="btn btn-success btn-secondary "
								name="shortage">back</button>
						</a>
					</div>
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


				<script src=" https://printjs-4de6.kxcdn.com/print.min.js"></script>


				<script>
$(document).ready( function () {
    $('# id removed').DataTable();
} );


</script>
               
                <script src="https://unpkg.com/jspdf"></script> 
<script src="https://unpkg.com/jspdf-autotable"></script>


				<script>
function print_font() {

	  var doc = new jsPDF()
	  doc.autoTable({ html: '#te' })
	  doc.save('table.pdf')

}


</script>




			</div>

			<!--Dashboard widget-->

		</div>
	</div>


	<!--Popper JS-->
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
	<!--Custom Js Script-->
	<script>
        //Nice select
        $('.bulk-actions').niceSelect();
    </script>
</body>
</html>