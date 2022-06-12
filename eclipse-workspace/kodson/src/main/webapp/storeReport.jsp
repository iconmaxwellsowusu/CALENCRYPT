<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="tb.css">
<link rel="icon" href="favicon.ico" type="image/x-icon">
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

<link rel="stylesheet" type="text/css"
	href="https://printjs-4de6.kxcdn.com/print.min.css">


<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"> 
</script>

	<script type="text/javascript">
 $(document).ready(function() {
     if (sessionStorage.getItem('#monthhlyModal') !== 'true') {
         $('#monthhlyModal').modal('show');
         sessionStorage.setItem('#myModal','true');     
     }
 });
</script>

	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="monthhlyModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">${msg} &times;</button>
					<h4 class="modal-title"></h4>
				</div>


				<form action="#" method="post">

					<br>
					<br>
					<h5 align="center">Please select Date</h5>

					<div class="form-row">
						<div class="col-md-12">
							<div class="row">
								<div class="form-group col-md-1"></div>
								<div class="form-group col-md-4 float-left">
									From: <input type="date" class="datepicker"
										data-date-format="mm/dd/yyyy" name="form_date">
								</div>
								<div class="form-group col-md-4 float-right">
									To: <input type="date" class="datepicker"
										data-date-format="mm/dd/yyyy" name="to_date">
								</div>
							</div>
							<div class="form-row"></div>
							<div class="row">
								<div class="col-4"></div>
								<div class="form-row"></div>
								<button class="btn btn-primary" type="submit" id="submit"
									name="submit">Generate</button>
							</div>
						</div>
					</div>

				</form>
			</div>

		</div>
	</div>
	<!-- /////////////////////////////////////////////Reset password modal  //////////////////////////////////////////////////////////// -->



	<div class="col-sm-12 col-xs-12 content pt-3 pl-0">

		<%   
						 if(request.getParameter("submit")!=null)
						    {
							 %>
		<div class="mt-4 mb-4 p-3 bg-white border shadow-sm lh-sm">

			<div class="mt-1 mb-4 p-3 button-container bg-white border shadow-sm">
				<h6 class="mb-2" align="center">
					<%
                     String form_date = request.getParameter("form_date");
                     String to_date = request.getParameter("to_date");
                     HttpSession sess = request.getSession(false);
                     sess.setAttribute("form_date", form_date);
                     sess.setAttribute("to_date", to_date);
                    
                     %>
				</h6>
				<div class="scrollable" id="printMe">

					<h5 class="mb-3" align="center">
						<strong>Procurement Report</strong>
					</h5>

					<table class="table table-bordered table-hover table-fixed">
						<thead class="thead-light">

							<tr>
								<th scope="col">No.</th>
								<th scope="col">Date</th>
								<th scope="col">Item NAME</th>
								<th scope="col">Quantity</th>
								<th scope="col">Price</th>
								<th scope="col">Total GhC</th>


							</tr>
						</thead>
						<tbody>
							<% 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                String f_date = (String)session.getAttribute("form_date");
                                String t_date = (String)session.getAttribute("to_date");
                                  String query = "select * from purchase where orderDate between '"+f_date+"' and '"+t_date+"'";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>

							<tr>
								<td><%=rs.getString("id") %></td>
								<td><%=rs.getString("orderDate") %></td>
								<td><%=rs.getString("itemname") %></td>
								<td><%=rs.getString("quantity") %></td>
								<td><%=rs.getString("price") %></td>
								<td><%=rs.getString("totalPrice") %></td>


							</tr>


							<%
                                
                                 
                                 }
                               %>

							<%             
    }
   %>


						</tbody>

					</table>
				</div>
				<div class="navbar-text ">
					<button type="submit" class="btn btn-success btn-secondary "
						name="shortage" onclick="print_font()">Print</button>
					<a href="dash_board.jsp">
						<button type="button" class="btn btn-success btn-secondary "
							name="shortage">back</button>
					</a>
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
    $('#testData').DataTable();
} );


</script>

				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.8.0/html2pdf.bundle.min.js"></script>
				<script>
        function print_font()
        {
        	alert("printig........");
        	 var element = document.getElementById('printMe');
        	 html2pdf(element); 

        }
    </script>




			</div>

			<!--Dashboard widget-->

		</div>
	</div>


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