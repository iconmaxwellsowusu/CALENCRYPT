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
						<strong>Fuel Dispensed Report </strong>
					</h5>

					<table class="table table-bordered table-hover table-fixed">
						<thead class="thead-light">

							<tr>
								<th>#</th>
								<th>Dispense Date</th>
								<th>From</th>
								<th>To</th>
								<th>Driver Name</th>
								<th>Quantity Dispensed</th>
								<th>Truck Number</th>
								<th>Purpose</th>
								<th>Status</th>


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
                                  String query = "select * from sellfuel where selldate between '"+f_date+"' and '"+t_date+"'";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>

							<tr>
								<td><%=rs.getString("id") %></td>
								<td><%=rs.getString("selldate") %></td>
								<td><%=rs.getString("from_") %></td>
								<td><%=rs.getString("to_") %></td>
								<td><%=rs.getString("drivesName") %></td>
								<td><%=rs.getString("quantityTaken") %></td>
								<td><%=rs.getString("truckNumber") %></td>
								<td><%=rs.getString("purpose") %></td>
								<td><%=rs.getString("status_") %></td>

							</tr>


							<%
                                
                                 
                                 }
                               %>

							<%             
    }
   %>


							<%
                
               	                        
                try
                {
                
                    
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                Statement st=con.createStatement();
                String f_date = (String)session.getAttribute("form_date");
                String t_date = (String)session.getAttribute("to_date");
                String strQuery = "select sum(quantityTaken) as total from sellfuel where selldate between '"+f_date+"' and '"+t_date+"'";
                ResultSet rs = st.executeQuery(strQuery);
                String sellq="";
                
                while(rs.next()){
                sellq = rs.getString(1);
                HttpSession ses = request.getSession(false);
                ses.setAttribute("sellq", sellq);
                out.println("<b >"+"Total Quantity = "+sellq+" litres"+"</b>");
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
                String f_date = (String)session.getAttribute("form_date");
                String t_date = (String)session.getAttribute("to_date");
                String strQuery = "select sum(quantityTaken) as total from sellfuel where selldate between '"+f_date+"' and '"+t_date+"' and purpose='Transit' and status_='Goil'";
                ResultSet rs = st.executeQuery(strQuery);
                String goil="";
                
                while(rs.next()){
                	goil = rs.getString(1);
                HttpSession ses = request.getSession(false);
                ses.setAttribute("goil", goil);
                out.println("<b >"+"Total Quantity Goil Transit= "+goil+" litres"+"</b>");
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
                String f_date = (String)session.getAttribute("form_date");
                String t_date = (String)session.getAttribute("to_date");
                String strQuery = "select sum(quantityTaken) as total from sellfuel where selldate between '"+f_date+"' and '"+t_date+"' and purpose ='Transit' and status_='Bost'";
                ResultSet rs = st.executeQuery(strQuery);
                String Bost="";
                
                while(rs.next()){
                	Bost = rs.getString(1);
                HttpSession ses = request.getSession(false);
                ses.setAttribute("Bost", Bost);
                out.println("<b >"+"Total Quantity Bost Transit = "+Bost+" litres"+"</b>");
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
                String f_date = (String)session.getAttribute("form_date");
                String t_date = (String)session.getAttribute("to_date");
                String strQuery = "select sum(quantityTaken) as total from sellfuel where selldate between '"+f_date+"' and '"+t_date+"' and purpose ='Maintenance'";
                ResultSet rs = st.executeQuery(strQuery);
                String maintenance="";
                
                while(rs.next()){
                	maintenance = rs.getString(1);
                HttpSession ses = request.getSession(false);
                ses.setAttribute("maintenance", maintenance);
                out.println("<b >"+"Total Quantity For Maintenance = "+maintenance+" litres"+"</b>");
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
                String f_date = (String)session.getAttribute("form_date");
                String t_date = (String)session.getAttribute("to_date");
                String strQuery = "select sum(quantityTaken) as total from sellfuel where selldate between '"+f_date+"' and '"+t_date+"' and purpose ='Operations'";
                ResultSet rs = st.executeQuery(strQuery);
                String operations="";
                
                while(rs.next()){
                	operations = rs.getString(1);
                HttpSession ses = request.getSession(false);
                ses.setAttribute("operations", operations);
                out.println("<b >"+"Total Quantity By Operations = "+operations+" litres"+"</b>");
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
                String f_date = (String)session.getAttribute("form_date");
                String t_date = (String)session.getAttribute("to_date");
                String strQuery = "select sum(quantityTaken) as total from sellfuel where selldate between '"+f_date+"' and '"+t_date+"' and purpose ='Mechanic'";
                ResultSet rs = st.executeQuery(strQuery);
                String mechanic="";
                
                while(rs.next()){
                	mechanic = rs.getString(1);
                HttpSession ses = request.getSession(false);
                ses.setAttribute("mechanic", mechanic);
                out.println("<b >"+"Total Quantity By Mechanic = "+mechanic+" litres"+"</b>");
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
                String f_date = (String)session.getAttribute("form_date");
                String t_date = (String)session.getAttribute("to_date");
                String strQuery = "select sum(quantityTaken) as total from sellfuel where selldate between '"+f_date+"' and '"+t_date+"' and purpose ='OTHER'";
                ResultSet rs = st.executeQuery(strQuery);
                String other="";
                
                while(rs.next()){
                	other = rs.getString(1);
                HttpSession ses = request.getSession(false);
                ses.setAttribute("other", other);
                out.println("<b >"+"Total Quantity used by Others = "+other+" litres"+"</b>");
                }
                }
                catch (Exception e){
                e.printStackTrace();
                }

                %>
                

						</tbody>

					</table>
				</div>
				<div class="navbar-text ">
					<button type="submit" class="btn btn-success btn-secondary "
						name="shortage" onclick="print_font()">Print</button>
					<a href="fuelDash.jsp">
						<button type="button" class="btn btn-success btn-secondary "
							name="shortage">back</button>
					</a>
				</div>



				<h2>
					Total Fuel Dispensed Based On Date Selected:

					<%
                 String tell = (String)session.getAttribute("sellq");
                 out.println("<b>"+ tell+" litres"+"</b>");
                 
                 %>


				</h2>




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
        	 var element = document.getElementById('id removed');
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