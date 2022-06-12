<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %> 
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



               <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
               <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
               <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"/>
               
               <link rel="stylesheet" type="text/css" href="https://printjs-4de6.kxcdn.com/print.min.css">


    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />

</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"> 
</script>
  

                <div class = "navbar-text ">
                <button type="submit" class="btn btn-success btn-secondary " name="shortage" onclick="printForm()">Print</button>
               <a href="pettyDash.jsp"> <button type="button" class="btn btn-success btn-secondary " name="shortage">back</button></a>
                </div>

                
                
               <div class="col-sm-12 col-xs-12 content pt-3 pl-0" id="testData">
                
                         <div class="scrollable">                   
						  <table class="table table-bordered table-hover table-fixed" >
						  <thead class="thead-light">
						  
						    <tr>
						          <th scope="col" class="align-middle text-center">No.</th>
							      <th scope="col" class="align-middle text-center">Debit Amount</th>
							      <th scope="col" class="align-middle text-center">Date</th>
							      <th scope="col" class="align-middle text-center">Cost Center</th>
							      <th scope="col" class="align-middle text-center">Description</th>
							      <th scope="col" class="align-middle text-center">Received By</th>
							      <th scope="col" class="align-middle text-center">Category</th>
							      <th scope="col" class="align-middle text-center">Status</th>

							      <th scope="col">Credit</th>
							      
							      <th scope="col">Balance</th>
							     
							     
                            </tr>
						  </thead>
						  <tbody>
						 <% 
					        String form_date = request.getParameter("form_date");
					        String to_date = request.getParameter("to_date");
					        
					        HttpSession sess = request.getSession(false);
		                     sess.setAttribute("form_date", form_date);
		                     sess.setAttribute("to_date", to_date);

                             Connection con;
                             PreparedStatement pst;
                             ResultSet rs;
     
                             Class.forName("com.mysql.jdbc.Driver");
                             con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                             
                             String f_date = (String)session.getAttribute("form_date");
                             String t_date = (String)session.getAttribute("to_date");
                             String query = "select pettycash.*,sum(pettycash.debitAmount) over ( order by id) from pettycash where date_ between '"+f_date+"' and '"+t_date +"'";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td class="align-middle text-center"><%=rs.getString(1) %>
                                 
                                 </td>
                                 <td class="align-middle text-center"><%
                                 
                                 if(rs.getString(2)!=null){
                                	 out.println(rs.getString(2));
                                	 }
                                	 %></td>
                                 <td class="align-middle text-center"><%
                                 if(rs.getString(3)!=null){
                                	 out.println(rs.getString(3));
                                	 }
                                 %></td>
                                 <td class="align-middle text-center"><%
                                 if(rs.getString(4)!=null){
                                	 out.println(rs.getString(4));
                                	 }
                                 %></td>
                                 <td class="align-middle text-center"><%
                                 if(rs.getString(5)!=null){
                                	 out.println(rs.getString(5));
                                	 }
                                 %></td>
                                 <td class="align-middle text-center"><%
                                 if(rs.getString(6)!=null){
                                	 out.println(rs.getString(6));
                                	 }
                                 %></td>
                                 <td class="align-middle text-center"><%
                                 if(rs.getString(7)!=null){
                                	 out.println(rs.getString(7));
                                	 }
                                 %></td>
                                 <td class="align-middle text-center"><%
                                 if(rs.getString(8)!=null){
                                	 out.println(rs.getString(8));
                                	 }
                                 %></td>
                                
                                 <td><%
                                 if(rs.getString(10)!=null){
                                	 out.println(rs.getString(10));
                                	 }
                                 %></td>
                                
                               <td>-<%=rs.getString(12) %></td>
						    
                             </tr> 
                             
               
                                <%
                                
                                 
                                 }
                               %>
                               
                            <%             
    
   %>
   
   
                 </tbody>
                 
          </table>
               
          
</div>

                       <script src="jquery-3.6.0.js" type="text/javascript"></script>
                       <script src="component/jquery/jquery.min.js" type="text/javascript"></script>
                       <script src="component/jquery.validate.min.js" type="text/javascript"></script>
                       
                       <script type="text/javascript" src="DataTables/datatables.min.js"></script>
                       <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>
                       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                       <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>


  <script src=" https://printjs-4de6.kxcdn.com/print.min.js"></script> 


<script>
$(document).ready( function () {
    $('#testData').DataTable();
} );



</script>

                
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
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
        
       
        pdf.save('Test.pdf');
    }, margins);
}


</script>      
                

               
                </div>
                
     
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