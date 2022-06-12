<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");

        String name = request.getParameter("name");
        String category = request.getParameter("category");

        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("update drivers set name=?,category=? where id = ?");

        pst.setString(1, name);
        pst.setString(2, category);
        pst.setString(3, id);
        
        pst.executeUpdate();
        %>

<script>   
            alert("Driver updated");           
       </script>
<%    
    response.sendRedirect("driverManager.jsp");
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

	<br>


	<div
		class="col-lg-8 col-md-8 col-sm-8 container justify-content-center">
		<div class="col-sm-8">
			<form method="POST" action="#">

				<%    
                        Connection ccon;
                        PreparedStatement ppst;
                        ResultSet rrs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                         ccon = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                           
                        String idd = request.getParameter("id");
                          
                        ppst = ccon.prepareStatement("select * from drivers where id = ?");
                        ppst.setString(1, idd);
                        rrs = ppst.executeQuery();
                        
                         while(rrs.next())
                         {
                    
                    %>

				<div class="form-row">



					<div class="col-sm-6 mb-2">
						<div class="form-group">

							<div class="form-group">
								<label for="formGroupExampleInput">Driver Name</label> <input
									type="text" class="form-control" id="formGroupExampleInput"
									placeholder="Enter driver's Name" name="name"
									value=" <%= rrs.getString("name") %>">
							</div>
							<div class="form-group">
								<label for="validationDefault01">Category</label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Enter driver's Category" name="category"
									value=" <%= rrs.getString("category") %>">
							</div>

						</div>
					</div>




				</div>


				<% }  %>

				</br>

				<div class="form-group" align="center">
					<input type="submit" id="submit" value="Update" name="submit"
						class="btn btn-info">

				</div>


			</form>
		</div>
	</div>

</body>
</html>