<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="fuelError.jsp"%>
<%@page import="java.sql.*"%>

<% 
    if(request.getParameter("submit")!=null)
    { 
    	
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String month = request.getParameter("month");
    String oil = request.getParameter("oil");
    String Ldate = request.getParameter("Ldate");
    String Ddate = request.getParameter("Ddate");
    String waybill = request.getParameter("waybill");
    String truck = request.getParameter("truck");
    String qty = request.getParameter("qty");
    String discharg = request.getParameter("discharg");
    String pLoss = request.getParameter("pLoss");
    double pl = Double.parseDouble(pLoss);
    String cpl = request.getParameter("cpl");
    
    double cpp = Double.parseDouble(cpl);
    double shortgh = pl*cpp;
    String OverNight = request.getParameter("OverNight");
    double over = Double.parseDouble(OverNight);
   
    String Cash = request.getParameter("Cash");
    double cas = Double.parseDouble(Cash);
    String company = request.getParameter("company");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("update trips set name=?,monthh=?,OilCompany=?,loadingDate=?,dischargingDate=?,waybillNumber=?,vehicleNumber=?,qty=?,dischargingPoint=?,productLossLit=?,costPerlit=?,overNightAllowance=?,cashPaid=?,company=? where id=?");
        pst.setString(1, name);
        pst.setString(2, month);
        pst.setString(3, oil);
        pst.setString(4, Ldate);
        pst.setString(5, Ddate);
        pst.setString(6, waybill);
        pst.setString(7, truck);
        pst.setString(8, qty);
        pst.setString(9, discharg);
        pst.setDouble(10, pl);
        pst.setDouble(11, cpp);
        
        pst.setDouble(12, over);

        pst.setDouble(13,cas );
        pst.setString(14, company);
        pst.setString(15, id);
        
        pst.executeUpdate();
        %>

<script>   
            alert("Record Updated");           
       </script>
<%  
    response.sendRedirect("trips.jsp");
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
<!--   <link rel="stylesheet" href="tb.css">-->
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

	<div
		class="col-lg-8 col-md-8 col-sm-8 container justify-content-center">
		<div class="col-sm-8">
			<h1 align="center">Update Trips</h1>
			<form method="POST" action="#">

				<%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                         con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                           
                        String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from trips where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>

				<div class="form-row">

					<div class="form-row">

						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Name</label> <input type="text"
								class="form-control" placeholder="" name="name"
								value="<%=rs.getString("name")%>">
						</div>


						<!-- /////////////////////////   month and year selector ///////////////////////////////-->

						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
						<script
							src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>



						<div class="col-md-4 mb-3">
							<label>Select month</label>
							<div class='input-group date datepicker' id='table'>
								<input type="text" name="month" class="form-control"
									value="<%=rs.getString("monthh") %>" /> <span
									class="input-group-addon"> <span
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


						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Main Company</label> <input
								type="text" class="form-control" placeholder="" name="oil"
								value="<%=rs.getString("OilCompany")%>">
						</div>
						
						
						<div class="col-md-4 mb-3">
										<label for="validationCustom05">Product type</label> <input
											type="text" class="form-control" placeholder=""
											name="type" value="<%=rs.getString("type")%>">
									</div>
									
									<div class="col-md-4 mb-3">
										<label for="validationCustom05">Allowable Loss</label> <input
											type="text" class="form-control" placeholder=""
											name="aloss" value="<%=rs.getString("aloss")%>">
									</div>
						
						<!--////////////////// date picker //////////////////////// -->
						<div class="col-md-4 mb-3 input-with-post-icon datepicker">
							<label for="example">Loading date</label> <input
								placeholder="Select date" type="date" id="example"
								class="form-control" name="Ldate"
								value="<%=rs.getString("loadingDate")%>">

						</div>


						<!--////////////////// date picker //////////////////////// -->
						<div class="col-md-4 mb-3 input-with-post-icon datepicker">
							<label for="example">Discharging date</label> <input
								placeholder="Select date" type="date" id="example"
								class="form-control" name="Ddate"
								value="<%=rs.getString("dischargingDate")%>">

						</div>

						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Waybill Number</label> <input
								type="text" class="form-control" placeholder="" name="waybill"
								value="<%=rs.getString("waybillNumber")%>">
						</div>

						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Truck Number</label> <input
								type="text" class="form-control" placeholder="" name="truck"
								value="<%=rs.getString("vehicleNumber")%>">
						</div>

						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Product Quantity</label> <input
								type="text" class="form-control" placeholder="" name="qty"
								value="<%=rs.getString("qty")%>">
						</div>

						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Discharging Pt</label> <input
								type="text" class="form-control" placeholder="" name="discharg"
								value="<%=rs.getString("dischargingPoint")%>">
						</div>

						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Product Loss Lit</label> <input
								type="text" class="form-control" placeholder="" name="pLoss"
								value="<%=rs.getString("rloss")%>">
						</div>

						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Cost per Lit</label> <input
								type="text" class="form-control" placeholder="" name="cpl"
								value="<%=rs.getString("costPerlit")%>">
						</div>



						<div class="col-md-4 mb-3">
							<label for="validationCustom05">OverNight Allowance</label> <input
								type="text" class="form-control" placeholder="" name="OverNight"
								value="<%=rs.getString("overNightAllowance")%>">
						</div>


						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Cash Paid</label> <input
								type="text" class="form-control" placeholder="" name="Cash"
								value="<%=rs.getString("cashPaid")%>">
						</div>


						<div class="col-md-4 mb-3">
							<label for="validationCustom05">Sub Company</label> <input
								type="text" class="form-control" placeholder="" name="company"
								value="<%=rs.getString("company")%>">
						</div>





					</div>

				</div>


				<% }  %>

				</br> <input type="submit" id="submit" value="Update" name="submit"
					class="btn btn-info">




			</form>
		</div>
	</div>

</body>
</html>