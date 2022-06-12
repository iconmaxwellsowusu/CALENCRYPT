<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
        String loadingpoint = request.getParameter("loading");
        String dischargingpoint = request.getParameter("discharging");
        String rate = request.getParameter("rate");
        double rat = Double.parseDouble(rate);
        String distance = request.getParameter("distance");
        double dis = Double.parseDouble(distance);
        String fuel = request.getParameter("fuel");
        double fue = Double.parseDouble(fuel);
        String loc = request.getParameter("location");
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("update location set loading_point=?,discharging_point=?,rate_=?,distance_=?,fuel_=?,locaction=? where id=?");

        pst.setString(1, loadingpoint);
        pst.setString(2, dischargingpoint);
        pst.setDouble(3, rat);
        pst.setDouble(4, dis);
        pst.setDouble(5, fue);
        pst.setString(6, loc);
        pst.setString(7, id);
        pst.executeUpdate();
        %>
        
        <script>   
            alert("Record Updated");           
       </script>
    <%  
    response.sendRedirect("Locations.jsp");
    }
 
%>
 
<!DOCTYPE html>
<html>
   <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="description" content="" >
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Meta Responsive tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

    <title>location</title>
  </head>
    <body >
        
        	<%
		response.setHeader("cache-control", "no-cache, no-store, must-revalidate");

		if (session.getAttribute("operations") == null && session.getAttribute("manager") == null && session.getAttribute("Trip") == null){
			response.sendRedirect("index.jsp");
		}
	%>
        
        <div class=" container justify-content-center">
        <h1>Update Location</h1>
            <div class="col-sm-12" align="center">
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                         con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                           
                        String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from location where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    
								    <div class="form-row" align="center">
								    
									    <div class="col-md-4 mb-3">
									      <label for="validationCustom03">Loading Point</label>
									      <input type="text" class="form-control" placeholder="Name" value="<%= rs.getString("loading_point")%>" name="loading">      
									    </div>

									     <div class="col-md-4 mb-3">
									      <label for="validationCustom05">Discharging point</label>
									      <input type="text" class="form-control"  value="<%= rs.getString("discharging_point")%>" name="discharging">
									    </div>
									    
									    <div class="col-md-4 mb-3">
									      <label for="validationCustom05">Rate</label>
									      <input type="text" class="form-control" placeholder="" value="<%= rs.getString("rate_")%>" name="rate">
									    </div>
									    
									    <div class="col-md-4 mb-3">
									      <label for="validationCustom05">Distance</label>
									      <input type="text" class="form-control"  placeholder="" value="<%= rs.getString("distance_")%>" name="distance">
									    </div>
									    
									    <div class="col-md-4 mb-3">
									      <label for="validationCustom05">Fuel</label>
									      <input type="text" class="form-control"  placeholder="" value="<%= rs.getString("fuel_")%>" name="fuel">
									    </div>
									    
									    <div class="col-md-4 mb-3">
									      <label for="validationCustom05">Location</label>
									      <input type="text" class="form-control"  placeholder="" value="<%= rs.getString("locaction")%>" name="location">
									    </div>
									    
									   
									    
									  </div>
								  
                    
                    <% }  %>

                         </br>
                         
                     <div align="right">
                         <input type="submit" id="submit" value="Update" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
  
                </form>
            </div>          
        </div>
  
    </body>
</html>