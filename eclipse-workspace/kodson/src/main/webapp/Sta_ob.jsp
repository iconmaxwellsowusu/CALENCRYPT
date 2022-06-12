<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<% 
    if(request.getParameter("insurance")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String truck_number = request.getParameter("truck_number");
        String insurance_number = request.getParameter("insurance_number");
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into insurance(driver_name,truck_number,insurance_number,registration_date,expiration_date)values(?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, truck_number);
        pst.setString(3, insurance_number);
        pst.setString(4, registration_date);
        pst.setString(5, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("roadW")!=null)
    {
    	
    	 String truck_number = request.getParameter("truck_number");
         
         String registration_date = request.getParameter("registration_date");
         String expiration_date = request.getParameter("expiration_date");
         String capacity = request.getParameter("driver_name");
         String amount = request.getParameter("road_worthy");
        
        double cap = Double.parseDouble(capacity.replace(",", ""));
        double am = Double.parseDouble(amount.replace(",", ""));
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into road_worthy(truck_number,registration_date,expiration_date,capacity,amount)values(?,?,?,?,?)");
        
        pst.setString(1, truck_number);
        pst.setString(2, registration_date);
        pst.setString(3, expiration_date);
        pst.setString(4, capacity);
        pst.setString(5, amount);
       

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("vit")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String truck_number = request.getParameter("truck_number");
        String vit_number = request.getParameter("vit_number");
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into vit(driver_name,truck_number,vit_number,registration_date,expiration_date)values(?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, truck_number);
        pst.setString(3, vit_number);
        pst.setString(4, registration_date);
        pst.setString(5, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("rsi")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String truck_number = request.getParameter("truck_number");
        String rsi_number = request.getParameter("rsi_number");
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into rsi(driver_name,truck_number,rsi_number,registration_date,expiration_date)values(?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, truck_number);
        pst.setString(3, rsi_number);
        pst.setString(4, registration_date);
        pst.setString(5, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("ecl")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String truck_number = request.getParameter("truck_number");
        String calibrattion_number = request.getParameter("ecl_number");
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into ecl(driver_name,truck_number,ecl_number,registration_date,expiration_date)values(?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, truck_number);
        pst.setString(3, calibrattion_number);
        pst.setString(4, registration_date);
        pst.setString(5, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>

<% 
    if(request.getParameter("calibration")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String truck_number = request.getParameter("truck_number");
        String calibrattion_number = request.getParameter("calibrattion_number");
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into calibrations(driver_name,truck_number,calibrattion_number,registration_date,expiration_date)values(?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, truck_number);
        pst.setString(3, calibrattion_number);
        pst.setString(4, registration_date);
        pst.setString(5, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("goods")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String truck_number = request.getParameter("truck_number");
        String goods_insurance_number = request.getParameter("goods_insurance_number");
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into goods_insurance(driver_name,truck_number,goods_insurance_number,registration_date,expiration_date)values(?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, truck_number);
        pst.setString(3, goods_insurance_number);
        pst.setString(4, registration_date);
        pst.setString(5, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("npa")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String truck_number = request.getParameter("truck_number");
        String capacity = request.getParameter("capacity");
        int cap = Integer.parseInt(capacity);
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        String amount = request.getParameter("amount");
        double amo = Double.parseDouble(amount);
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into npa(Dname,Tnumber,capacity,registrationDate,expiryDate,amount)values(?,?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, truck_number);
        pst.setInt(3, cap);
        pst.setString(4, registration_date);
        pst.setString(5, expiration_date);
        pst.setDouble(6, amo);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("legal")!=null)
    {
    	
        String name = request.getParameter("name");
       
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into legal(Dname,registrationDate,expiryDate)values(?,?,?)");
        pst.setString(1, name);
        
        pst.setString(2, registration_date);
        pst.setString(3, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("medical")!=null)
    {
    	
        String name = request.getParameter("name");
        
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into medical(Dname,registrationDate,expiryDate)values(?,?,?)");
        pst.setString(1, name);
        
        pst.setString(2, registration_date);
        pst.setString(3, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("lincense")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String license = request.getParameter("license");
        
        String date1 = request.getParameter("date1");
        String date2 = request.getParameter("date2");
        String date3 = request.getParameter("date3");
        String date4 = request.getParameter("date4");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into lincense(Dname,lincense,Date1,Date2,Date3,Date4)values(?,?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, license);
        pst.setString(3, date1);
        pst.setString(4, date2);
        pst.setString(5, date3);
        pst.setString(6, date4);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("fire")!=null)
    {
    	
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        
        String date = request.getParameter("date");
        
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into fire(Dname,position,expiryDate)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, position);
        pst.setString(3, date);
        

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("epa")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String truck_number = request.getParameter("truck_number");
        String goods_insurance_number = request.getParameter("goods_insurance_number");
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into epa(Dname,Tnumber,epaNumber,registration,expiryDate)values(?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, truck_number);
        pst.setString(3, goods_insurance_number);
        pst.setString(4, registration_date);
        pst.setString(5, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>



<% 
    if(request.getParameter("factory")!=null)
    {
    	
   
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into factory(registrationDate,expiryDate)values(?,?)");
        
        pst.setString(1, registration_date);
        pst.setString(2, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("asserts")!=null)
    {
    	
     
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into asserts(registrationDate,expiryDate)values(?,?)");
       
        pst.setString(1, registration_date);
        pst.setString(2, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
    }
   %>


<% 
    if(request.getParameter("extinguisher")!=null)
    {
    	
        String driver_name = request.getParameter("driver_name");
        String truck_number = request.getParameter("truck_number");
        String goods_insurance_number = request.getParameter("goods_insurance_number");
        String registration_date = request.getParameter("registration_date");
        String expiration_date = request.getParameter("expiration_date");
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("insert into extinguisher(Dname,Tnumber,extinguisherNumber,registration,expiryDate)values(?,?,?,?,?)");
        pst.setString(1, driver_name);
        pst.setString(2, truck_number);
        pst.setString(3, goods_insurance_number);
        pst.setString(4, registration_date);
        pst.setString(5, expiration_date);

        pst.executeUpdate();  
        
        %>
<script>   
        alert("Record Added");     
    </script>
<%             
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
						<a href="#" class="text-secondary logo"><i
							class="fa fa-shield"></i> Statutory <span class="small">Obligations</span></a>
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
						<span class="text-primary small"><strong>Statutory
								Obligations</strong></span>
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
			<!--///////////////////// modals////////////////////////-->


			<!-- ////////////////////////////////////////////////  insurane modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="insurancemodal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">insurance</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">

									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Driver Name</label> <input
											type="text" class="form-control" placeholder=""
											name="driver_name" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Insurance Number</label> <input
											type="text" class="form-control" placeholder=""
											name="insurance_number" required>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">
									</div>

								</div>
								<button type="submit" id="insurance" name="insurance"
									value="submit" class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->




			<!-- ////////////////////////////////////////////////  Road Worthy /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="roadWmodal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Road Worthy</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>
									
									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Capacity</label> <input
											type="text" class="form-control" placeholder=""
											name="driver_name" required>
									</div>
									
									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Amount</label> <input
											type="text" class="form-control" placeholder=""
											name="road_worthy" required>
									</div>


								</div>
								<button type="submit" id="roadW" name="roadW" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  VIT modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="vitmodal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">VIT</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">

									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="driver_name" required>
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">VIT Number</label> <input
											type="text" class="form-control" placeholder=""
											name="vit_number" required>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>
								</div>
								<button type="submit" id="vit" name="vit" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->

			<!-- ////////////////////////////////////////////////  RSI Modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="rsimodal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">R S I</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">

									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Driver Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="driver_name" required>
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">RSI Number</label> <input
											type="text" class="form-control" placeholder=""
											name="rsi_number" required>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>

								</div>
								<button type="submit" id="rsi" name="rsi" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->

			<!-- ////////////////////////////////////////////////  ECL Modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="eclmodal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">ECL</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">

									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Driver Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="driver_name" required>
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">ECL Number</label> <input
											type="text" class="form-control" placeholder=""
											name="ecl_number" required>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>

								</div>
								<button type="submit" id="ecl" name="ecl" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  Calibrations Modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="calibrationmodal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Calibration</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">

									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Driver Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="driver_name" required>
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Calibration Number</label> <input
											type="text" class="form-control" placeholder=""
											name="calibrattion_number" required>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>

								</div>
								<button type="submit" id="calibration" name="calibration"
									value="submit" class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->

			<!-- ////////////////////////////////////////////////  goods modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="goodsmodal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Goods Insurance</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">


									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Driver Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="driver_name" required>
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Goods Insurance Number</label>
										<input type="text" class="form-control" placeholder=""
											name="goods_insurance_number" required>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>

								</div>
								<button type="submit" id="goods" name="goods" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  NPA modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="npa" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">NPA FORM</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">


									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Driver Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="driver_name" required>
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Capacity</label> <input
											type="number" class="form-control" placeholder=""
											name="capacity" required>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date" required>

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date" required>

									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Amount</label> <input
											type="number" class="form-control" placeholder=""
											name="amount" required>
									</div>

								</div>
								<button type="submit" id="npa" name="npa" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  Legal modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="legal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Legal Form</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">


									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Institution</label> <input
											type="text" class="form-control" placeholder="Name"
											name="name" required>
									</div>





									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>

								</div>
								<button type="submit" id="legal" name="legal" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  Medical modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="medical" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">BVO's Medical Form KOPC/HSE/PRO/38</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">


									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="name" required>
									</div>





									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Visit Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Next Visit Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>

								</div>
								<button type="submit" id="medical" name="medical" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  Lincense modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="license" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Drivers Lincence KOPC/HSE/PRO/38</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">


									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Driver Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="driver_name" required>
									</div>



									<div class="form-group floating-label col-md-4 mb-3">

										<select name="license" id="licence" class="custom-select"
											required>
											<option value=""></option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
											<option value="E">E</option>
											<option value="F">F</option>
										</select> <label for="" class="mt-1">Select Lincense Type</label>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">First Renewal Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="date1">

									</div>
									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Second Renewal Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="date2">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Third Renewal Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="date3">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="date4">

									</div>

								</div>
								<button type="submit" id="lincense" name="lincense"
									value="submit" class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  Fire Training modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="fire" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Fire Training</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">


									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="name" required>
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">position</label> <input
											type="text" class="form-control" placeholder=""
											name="position" required>
									</div>



									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example"> Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="date">

									</div>

								</div>
								<button type="submit" id="fire" name="fire" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  EPA modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="epa" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">EPA FORM</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">


									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Driver Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="driver_name" required>
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">EPA Number</label> <input
											type="text" class="form-control" placeholder=""
											name="goods_insurance_number" required>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Registration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>

								</div>
								<button type="submit" id="epa" name="epa" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  Factory inspection modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="factory" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Factory Inspection</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example"> Date Inspected</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Next Inspection Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>

								</div>
								<button type="submit" id="factory" name="factory" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->



			<!-- ////////////////////////////////////////////////  All Asserts modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="asserts" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Asserts Risk Form</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">




									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">First Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date">

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Next Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date">

									</div>

								</div>
								<button type="submit" id="asserts" name="asserts" value="submit"
									class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->


			<!-- ////////////////////////////////////////////////  fire Extinguisher modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="extinguisher" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Extinguisher Form</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="#" method="post">

								<div class="form-row">


									<div class="col-md-4 mb-3">
										<label for="validationCustom03">Driver Name</label> <input
											type="text" class="form-control" placeholder="Name"
											name="driver_name" required>
									</div>



									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Truck Number</label> <input
											type="text" class="form-control" placeholder=""
											name="truck_number" required>
									</div>

									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Extinguisher Number</label> <input
											type="text" class="form-control" placeholder=""
											name="goods_insurance_number" required>
									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Refill Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="registration_date" required>

									</div>

									<!--////////////////// date picker //////////////////////// -->
									<div class="col-md-4 mb-3 input-with-post-icon datepicker">
										<label for="example">Expiration Date</label> <input
											placeholder="Select date" type="date" id="example"
											class="form-control" name="expiration_date" required>

									</div>

								</div>
								<button type="submit" id="extinguisher" name="extinguisher"
									value="submit" class="btn btn-primary">Submit</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->



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
					<strong>Statutor Obligations</strong>
				</h5>

				<!--Dashboard widget-->
				<div class="mt-1 mb-4 button-container">
					<div class="row pl-0">
						<div class="col-sm-2 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="insurance.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#insurancemodal">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total insurance</p>
												<h4>

													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from insurance where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>

												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>Insurance</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from insurance where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-2 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="roadW.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#roadWmodal">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total Road Worthy</p>
												<h4>

													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from road_worthy where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>

												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>Road</h4>
												<h4>Worthy</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from road_worthy where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-2 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="vit.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#vitmodal">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total ViT</p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from vit where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>VIT</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from vit where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="mt-1 mb-4 button-container">
					<div class="row pl-0">
						<div class="col-sm-2 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="rsi.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#rsimodal">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total RSL</p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from rsi where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>RSL</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from rsi where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-2 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="ecl.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#eclmodal">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total Ecl</p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(driver_name) from ecl where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>ECL</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date Due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(driver_name) from ecl where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="calibration.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#calibrationmodal">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total Calibrations</p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from calibrations where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>CALIBRATIONS</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck_number) from calibrations where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="mt-1 mb-4 button-container">
					<div class="row pl-0">
						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="goodsinsurance.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#goodsmodal">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total goods Insurance</p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(driver_name) from goods_insurance where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>GOODS</h4>
												<h4>Insurance</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(driver_name) from goods_insurance where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiration_date) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="npa.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#npa">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total NPA</p>
												<h4>
													<% 
                                            try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Tnumber) from npa where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) >1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String np="";
                                    while(rs.next()){
                                    np = rs.getString(1);
                                   out.println(np);
                                    
                                        }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>

												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>NPA</h4>
												<h4></h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Tnumber) from npa where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) <30 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)>1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String npaday="";
                                    while(rs.next()){
                                    	npaday = rs.getString(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("npaday",npaday);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="legalRegister.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#legal">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p></p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(institution) from legal where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>Legal Register</h4>
												<h4></h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p></p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(institution) from legal where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

					</div>
				</div>


				<div class="mt-1 mb-4 button-container">
					<div class="row pl-0">
						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="medicals.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#medical">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p></p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Dname) from medical where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>Medicals</h4>
												<h4></h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Dname) from medical where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="bvoLincence.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#license">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total Lincence</p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Dname) from lincense where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), Date4) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>BVO</h4>
												<h4>Lincence</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Dname) from lincense where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), Date4) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), Date4) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="fireTraining.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#fire">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p></p>
												<h4></h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>Fire</h4>
												<h4>Traning</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Dates Due</p>

												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Dname) from fire where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="mt-1 mb-4 button-container">
					<div class="row pl-0">
						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="epa.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#epa">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total EPA</p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Dname) from epa where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>EPA</h4>
												<h4></h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Dname) from epa where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)<=30";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="factoryInspection.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#factory">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p></p>
												<h4></h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>Factory</h4>
												<h4>Inspection</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p></p>
												<h4></h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="allAssert.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#asserts">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p></p>
												<h4></h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>All Asset</h4>
												<h4>Risk</h4>
											</div>
											<div class="col-sm-4 col-4 border-left"></div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="mt-1 mb-4 button-container">
					<div class="row pl-0">


						<div class="col-sm-4 col-md-4">
							<!--Profile card-->
							<div class="card shadow">
								<div class="card-body">
									<div class="media">

										<div class="media-body">

											<a href="extinguisher.jsp">
												<button type="button" class="btn btn-primary">
													<i class="fa fa-eye"></i> view
												</button>
											</a>
											<div class="navbar-text ">
												<button type="button" class="btn btn-warning btn-secondary "
													data-toggle="modal" data-target="#extinguisher">
													<i class="fa fa-plus "></i> add data
												</button>
											</div>

										</div>
									</div>

									<div class="mt-4 mb-4">
										<div class="row user-about">
											<div class="col-sm-4 col-4 border-right">
												<p>Total Fire Extinguisher</p>
												<h4>
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Tnumber) from extinguisher where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)>=1";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                   String n= rs.getString(1);
                                     out.println(n);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
											<div class="col-sm-4 col-4">
												<h4>Fire</h4>
												<h4>Extinguisher</h4>
											</div>
											<div class="col-sm-4 col-4 border-left">
												<p>Total date due</p>
												<h4 style="color: red">
													<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(Tnumber) from extinguisher where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) >=1 and FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440)<=10";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    
                                    while(rs.next()){
                                    String ns=rs.getString(1);
                                    out.println(ns);
                                    
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
												</h4>

											</div>
										</div>
									</div>

									<div class="dropdown-divider"></div>
								</div>
							</div>
						</div>

						<!--/Dashboard widget-->








					</div>
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