<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String date_ = request.getParameter("date_");
        String driverName = request.getParameter("driverName");
        String truckNumber = request.getParameter("truckNumber");
        String jmpNumber = request.getParameter("jmpNumber");
        String Jfrom = request.getParameter("Jfrom");
        String Jto = request.getParameter("Jto");
        String timeDispathedFromYard = request.getParameter("timeDispathedFromYard");
        String timeDispathedFromDepot = request.getParameter("timeDispathedFromDepot");
        String LoadingPoint = request.getParameter("LoadingPoint");
        String depatcherTime = request.getParameter("depatcherTime");
        String duration = request.getParameter("duration");
        String route = request.getParameter("route");
        String blackSpot = request.getParameter("blackSpot");
        String arrivalTime = request.getParameter("arrivalTime");
        String preparedBy = request.getParameter("preparedBy");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("update journey set date_=?,driverName=?,truckNumber=?,jmpNumber=?,Jfrom=?,Jto=?,timeDispathedFromYard=?,timeDispathedFromDepot=?,LoadingPoint=?,depatcherTime=?,duration=?,route=?,blackSpot=?,arrivalTime=?,preparedBy=? where id = ?");
        pst.setString(1, date_);
        pst.setString(2, driverName);
        pst.setString(3, truckNumber);
        pst.setString(4, jmpNumber);
        pst.setString(5, Jfrom);
        pst.setString(6, Jto);
        pst.setString(7, timeDispathedFromYard);
        pst.setString(8, timeDispathedFromDepot);
        pst.setString(9, LoadingPoint);
        pst.setString(10, depatcherTime);
        pst.setString(11, duration);
        pst.setString(12, route);
        pst.setString(13, blackSpot);
        pst.setString(14, arrivalTime);
        pst.setString(15, preparedBy);
        pst.setString(16, id);
        
        pst.executeUpdate();
        %>

<script>   
            alert("Record Updateddddd");           
       </script>
<%             
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

<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<title>Sleek Admin</title>
</head>
<body>



	<div class=" text-center container">
		<div class="col-sm-12">
			<h1>Print Journey Plan</h1>
			<form method="POST" action="#">

				<%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                         con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                           
                        String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from journey where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>

				<div class="form-row" id="testData">

					<!--////////////////// date picker //////////////////////// -->
					<div class="col-md-4 mb-3 input-with-post-icon datepicker">
						<label for="example">date</label> <input placeholder="Select date"
							value="<%= rs.getString("date_")%>" type="date" id="example"
							class="form-control" name="date_">

					</div>

					<div class="col-md-4 mb-3">
						<label for="validationCustom03">Driver Name</label> <input
							type="text" class="form-control" placeholder=""
							value="<%= rs.getString("driverName")%>" name="driverName"
							required>
					</div>

					<div class="col-md-4 mb-3">
						<label for="validationCustom03">Truck #</label> <input type="text"
							class="form-control" placeholder=""
							value="<%= rs.getString("truckNumber")%>" name="truckNumber"
							required>
					</div>

					<div class="col-md-4 mb-3">
						<label for="validationCustom03">JMP Number</label> <input
							type="text" class="form-control" placeholder=""
							value="<%= rs.getString("jmpNumber")%>" name="jmpNumber" required>
					</div>



					<div class="col-md-4 mb-3">
						<label for="validationCustom05">Journey From</label> <input
							type="text" class="form-control" placeholder=""
							value="<%= rs.getString("Jfrom")%>" name="Jfrom" required>
					</div>

					<div class="col-md-4 mb-3">
						<label for="validationCustom05">Journey To</label> <input
							type="text" class="form-control" placeholder=""
							value="<%= rs.getString("Jto")%>" name="Jto" required>
					</div>

					<div class="col-md-4 mb-3">
						<label for="validationCustom05">time Dispatched From Yard</label>
						<input type="text" class="form-control" placeholder=""
							value="<%= rs.getString("timeDispathedFromYard")%>"
							name="timeDispathedFromYard" required>
					</div>

					<div class="col-md-4 mb-3">
						<label for="validationCustom05">time Dispatched From Depot</label>
						<input type="text" class="form-control" placeholder=""
							value="<%= rs.getString("timeDispathedFromDepot")%>"
							name="timeDispathedFromDepot" required>
					</div>

					<div class="col-md-4 mb-3">
						<label for="validationCustom05">Loading Point</label> <input
							type="text" class="form-control" placeholder=""
							value="<%= rs.getString("LoadingPoint")%>" name="LoadingPoint"
							required>
					</div>

					<div class="col-md-3 mb-2">
						<label for="validationCustom05">Depatcher Time</label> <input
							type="text" class="form-control" placeholder=""
							value="<%= rs.getString("depatcherTime")%>" name="depatcherTime"
							required>
					</div>

					<div class="col-md-3 mb-2">
						<label for="validationCustom05">Duration</label> <input
							type="text" class="form-control" placeholder=""
							value="<%= rs.getString("duration")%>" name="duration" required>
					</div>


					<div class="form-group col-md-12 mb-4">
						<label for="message-text" class="col-form-label">Route To
							Be taken:</label>
						<textarea class="form-control" id="message-text" placeholder=""
							name="route" required><%= rs.getString("route")%></textarea>
					</div>

					<div class="form-group col-md-12 mb-4">
						<label for="message-text" class="col-form-label">Black
							Spot:</label>
						<textarea class="form-control" id="message-text" placeholder=""
							name="blackSpot" required><%= rs.getString("blackSpot")%></textarea>
					</div>

					<div class="col-md-3 mb-3">
						<label for="validationCustom05">Arrival Time</label> <input
							type="text" class="form-control" placeholder=""
							value="<%= rs.getString("arrivalTime")%>" name="arrivalTime"
							required>
					</div>
					<br>
					<div class="col-md-3 mb-3">
						<label for="validationCustom05">Prepared By</label> <input
							type="text" class="form-control" placeholder=""
							value="<%= rs.getString("preparedBy")%>" name="preparedBy"
							required>
					</div>

				</div>


				<% }  %>

				</br>

				<div class="navbar-text ">
					<button type="submit" class="btn btn-success btn-secondary "
						name="shortage" onclick="printForm()">Print</button>
					<a href="journey.jsp">
						<button type="button" class="btn btn-success btn-secondary "
							name="shortage">back</button>
					</a>
				</div>

				<div align="right">
					<p>
						<i class="fa fa-reply text-warning"></i> <a href="journey.jsp">
							Click Back </a> <a href="next.jsp"> Click next </a><i
							class="fa fa-share text-success"></i>
					</p>
				</div>


			</form>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
	<script>
function printForm() {
	alert("printing....");
    var pdf = new jsPDF({
    	orientation: 'landscape', 
    	unit: "mm",
    	format: [700, 1220]
        
    });
    pdf.setFontSize(18);
    
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $('#testData')[0];

    // we support special element handlers. Register them with jQuery-style 
    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
    // There is no support for any other type of selectors 
    // (class, of compound) at this time.
    specialElementHandlers = {
        // element with id of "bypass" - jQuery style selector
        '#bypassme': function (element, renderer) {
            // true = "handled elsewhere, bypass text extraction"
            return true
        }
    };
    margins = {
        top: 10,
        bottom: 60,
        left: 100,
        
    };
    // all coords and widths are in jsPDF instance's declared units
    // 'inches' in this case
    pdf.fromHTML(
    		
    source, // HTML string or DOM elem ref.
    margins.left, // x coord
    margins.top, { // y coord
        'width': margins.width, // max width of content on PDF
        'elementHandlers': specialElementHandlers
    },

    function (dispose) {
        // dispose: object with X, Y of the last line add to the PDF 
        //          this allow the insertion of new lines after html
        
       
        pdf.save('Journey.pdf');
    }, margins);
}


</script>

</body>
</html>