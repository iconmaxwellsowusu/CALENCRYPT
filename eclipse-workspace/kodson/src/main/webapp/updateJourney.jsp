<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" errorPage="tripError.jsp"%>

<% 
    if(request.getParameter("submit")!=null)
    {
        String month = request.getParameter("month");
        String bvo = request.getParameter("bvo");
        String brv = request.getParameter("brv");
        String tripCount = request.getParameter("tripCount");
        int tripC = Integer.parseInt(tripCount);
        String datei = request.getParameter("datei");
        String dateE = request.getParameter("dateE");
        String dateR = request.getParameter("dateR");
        String Rdate = request.getParameter("Rdate");
        String oil = request.getParameter("oil");
        String des = request.getParameter("des");
        String fuel = request.getParameter("fuel");
        double fu = Double.parseDouble(fuel); 
        String ref = request.getParameter("ref");
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("update log set month=?,bvo=?,brv=?,tripCount=?,datei=?,dateE=?,dateR=?,Rdate=?,oil=?,des=?,fuel=?,ref=? where id = ?");
        pst.setString(1, month);
        pst.setString(2, bvo);
        pst.setString(3, brv);
        pst.setInt(4, tripC);
        pst.setString(5, datei);
        pst.setString(6, dateE);
        pst.setString(7, dateR);
        pst.setString(8, Rdate);
        pst.setString(9, oil);
        pst.setString(10, des);
        pst.setDouble(11, fu);
        pst.setString(12, ref);
        pst.setString(13, id);
        
        pst.executeUpdate();
        %>

<script>   
            alert("Record Updated");           
       </script>
<%    
response.sendRedirect("journey.jsp");
    }
 
%>

<!DOCTYPE html>
<html>
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

<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<title>Sleek Admin</title>
</head>
<body>


	<div class=" text-center container">
		<div class="col-sm-12">
			<h1>Update Journey Plan</h1>
							<form action="#" method="post">
							
											<%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                         con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                           
                        String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from log where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>

								<div class="form-row">
								
									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Month</label> <input
											type="text" class="form-control" placeholder=""
											name="month" value="<%=rs.getString("month")%>">
									</div>
																	 									    
							<div class="col-md-4 mb-3">
										<label for="validationCustom03">BVO</label> <input
											type="text" class="form-control" placeholder=""
											name="bvo" value="<%=rs.getString("bvo")%>">
									</div>	
                                
                             <div class="col-md-4 mb-3">
										<label for="validationCustom03">BRV</label> <input
											type="text" class="form-control" placeholder=""
											name="brv" value="<%=rs.getString("brv")%>">
									</div>	
								
								
									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Trip Count</label> <input
											type="text" class="form-control" placeholder=""
											name="tripCount" value="<%=rs.getString("tripCount")%>">
									</div>
								

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Date Issued</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="datei" value="<%=rs.getString("datei")%>">

									</div>
									
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Date Expected</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="dateE" value="<%=rs.getString("dateE") %>">

									</div>

                                     <div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Return Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="dateR" value="<%=rs.getString("dateR")%>">

									</div>
									
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Date Received</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="Rdate" value="<%=rs.getString("Rdate")%>">

									</div>
									
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Customer</label> <input
											placeholder="" type="text" id="example"
											class="form-control" name="oil" value="<%=rs.getString("oil")%>">

									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Destination</label> <input
											type="text" class="form-control" placeholder=""
											name="des" value="<%=rs.getString("des")%>">
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Fuel Issued</label> <input
											type="text" class="form-control" placeholder=""
											name="fuel" value="<%=rs.getString("fuel")%>">
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Reference</label> <input
											type="text" class="form-control" placeholder="" name="ref"
											value="<%=rs.getString("ref")%>">
									</div>

									

								</div>
								<button type="submit" id="submit" name="submit" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
									<%} %>
							</form>
		</div>
	</div>

</body>
</html>