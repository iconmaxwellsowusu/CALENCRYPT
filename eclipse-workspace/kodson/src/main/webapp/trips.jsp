<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>

<%
if(request.getParameter("print")!=null){

	Calendar cal = Calendar.getInstance();
	String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"/"+new SimpleDateFormat("yyyy").format(cal.getTime());
	
	Document document = new Document(PageSize.A4.rotate());
	
	
	
	 Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD,6, BaseColor.BLACK);
	
	 float[] columnWidths = {1, 10, 5,5,5,5,5,5,5,5,5,3,5,5,5,5,5,5};
	 float[] columnWidths1 = {5, 10, 5,5,5,5,5,5,5,5,5,3,5,5,5,5,5,5};
	
	    response.setContentType("test/pdf");
		response.setHeader("Content-Disposition","Inline; filename=\"document.pdf\"");
       
   PdfWriter.getInstance(document,response.getOutputStream());
   document.open();

PdfPTable tab = new PdfPTable(1);
tab.addCell(new PdfPCell(new Phrase("                                                                                                                  "+ m)));
tab.setWidthPercentage(108);



PdfPTable table = new PdfPTable(columnWidths);
table.setWidthPercentage(108);


Font font1 = FontFactory.getFont(FontFactory.HELVETICA_BOLD,7, BaseColor.BLACK);

PdfPCell c1 = new PdfPCell(new Phrase("#",font));
c1.setFixedHeight(10);
c1.setBackgroundColor(BaseColor.CYAN);
table.addCell(c1);
PdfPCell c2 = new PdfPCell(new Phrase("NAME",font));
c2.setBackgroundColor(BaseColor.CYAN);
c2.setPaddingTop(7);
c2.setPaddingLeft(35);
c2.setFixedHeight(10);
table.addCell(c2);
PdfPCell c3 = new PdfPCell(new Phrase("LOADING DATE",font));
c3.setBackgroundColor(BaseColor.CYAN);
c3.setFixedHeight(10);
table.addCell(c3);

PdfPCell d6 = new PdfPCell(new Phrase("PRODUCT TYPE",font));
d6.setBackgroundColor(BaseColor.CYAN);
d6.setFixedHeight(10);

table.addCell(d6);

PdfPCell c4 = new PdfPCell(new Phrase("DISCHARGING DATE",font));
c4.setBackgroundColor(BaseColor.CYAN);
table.addCell(c4);
PdfPCell c5 = new PdfPCell(new Phrase("WAYBILL No.",font));
c5.setBackgroundColor(BaseColor.CYAN);
table.addCell(c5);
PdfPCell c6 = new PdfPCell(new Phrase("VEHICLE No.",font));
c6.setBackgroundColor(BaseColor.CYAN);
table.addCell(c6);
PdfPCell c7 = new PdfPCell(new Phrase("DISCHARGING POINT",font));
c7.setBackgroundColor(BaseColor.CYAN);
table.addCell(c7);
PdfPCell c8 = new PdfPCell(new Phrase("PRODUCT  LOSS  LITRES",font));
c8.setBackgroundColor(BaseColor.CYAN);
table.addCell(c8);

PdfPCell v8 = new PdfPCell(new Phrase("ALLOWABLE  LOSS  LITRES",font));
v8.setBackgroundColor(BaseColor.CYAN);
table.addCell(v8);

PdfPCell f8 = new PdfPCell(new Phrase("ACTUAL  LOSS  LITRES",font));
f8.setBackgroundColor(BaseColor.CYAN);
table.addCell(f8);

PdfPCell c9 = new PdfPCell(new Phrase("COST PER LITRES",font));
c9.setBackgroundColor(BaseColor.CYAN);
table.addCell(c9);
PdfPCell c10 = new PdfPCell(new Phrase("SHORTAGE  VALUE  GH",font));
c10.setBackgroundColor(BaseColor.CYAN);
table.addCell(c10);
PdfPCell c11 = new PdfPCell(new Phrase("OVERNIGHT  ALLOWANCE",font));
c11.setBackgroundColor(BaseColor.CYAN);
table.addCell(c11);
PdfPCell c12 = new PdfPCell(new Phrase("DEDUCTION AT  SOURCE",font));
c12.setBackgroundColor(BaseColor.CYAN);
table.addCell(c12);
PdfPCell c13 = new PdfPCell(new Phrase("PAYMENT  DUE  BVO",font));
c13.setBackgroundColor(BaseColor.CYAN);
table.addCell(c13);
PdfPCell c14 = new PdfPCell(new Phrase("AMOUNT  RECIEVABLE",font));
c14.setBackgroundColor(BaseColor.CYAN);
table.addCell(c14);


PdfPCell c16 = new PdfPCell(new Phrase("COMPANY",font));
c16.setBackgroundColor(BaseColor.CYAN);
table.addCell(c16);


table.setHeaderRows(1);


Connection con;
PreparedStatement pst;
ResultSet rs;


Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");

String select[] = request.getParameterValues("id"); 

double actualloss =0;
double valuegh=0;
double night = 0;
double atsource =0;
double paymentdue=0;
double amountrecieve =0;
int j=0;
if (select != null && select.length != 0) {
	System.out.println("You have selected: ");
    for (int i = 0; i < select.length; i++) {
        System.out.println(select[i]); 
        
        
        String query = "select * from trips where id = '"+select[i]+"'";
        Statement st = con.createStatement();
        
     
        
          rs =  st.executeQuery(query);
          
              while(rs.next())
              {
              	/////////////////////////////////*shortage*///////////////////////////////////
                  String pll = rs.getString("productLossLit");
                  String cpl = rs.getString("costPerlit");
                  
                  double p = Double.parseDouble(pll);
                  double c = Double.parseDouble(cpl);
                  
                  double shortage = c*p;
                  
                  double roundOo = Math.round(shortage*100)/100D;
                     String.format("%.3f", roundOo);
                     
                     if(shortage<0)
                  	   roundOo = Math.max(roundOo, 0);
					   
                  
                  String al = String.valueOf(roundOo);
                 /////////////////////////////////*at saurce*///////////////////////////////////
              	double over = rs.getDouble("overNightAllowance");
					double ploss = rs.getDouble("productLossLit");
					double deduction;
					if(shortage >= over){
						deduction=over;
						
					 }else if(shortage <= over){
						 deduction=shortage;
						 	
					}else{
						deduction=0.00;
						
						
					}
					
					 double roundO = Math.round(deduction*100)/100D;
                     String.format("%.3f", roundO);
                     
                     if(deduction<0)
                     	roundO = Math.max(roundO, 0);
					   
					
					String to = String.valueOf(roundO);
                /////////////////////////////////*payment due*///////////////////////////////////
                
                     double due;
                     double results=over-shortage;
                     if(results <=0 || shortage>over){
                  	   due=0.00;
                     }else{
                  	   due=results;
                        
                     }
                     
                     double round = Math.round(due*100)/100D;
                     String.format("%.3f", round);
                     
                     if(due<0)
                     	round = Math.max(round, 0);
                     
                     String te = String.valueOf(round);
          /////////////////////////////////*amount*///////////////////////////////////
          
          
						double amount;
                         if(shortage>over){
                      	   amount = shortage-over;
                      	   
                         }
                         else{
                      	   amount = 0.00;
                         }
                         
                         double roun = Math.round(amount*100)/100D;
                         String.format("%.3f", roun);
                         
                         if(due<0)
                         	roun = Math.max(roun, 0);
                         String alo = String.valueOf(roun);
          
                j+=1;
                String k = String.valueOf(j);
                         
              	PdfPCell c150 = new PdfPCell(new Phrase(k,font1));
              	
				    table.addCell(c150);
				    PdfPCell c151 = new PdfPCell(new Phrase(rs.getString("Name"),font1));
				    c151.setPaddingTop(7);
				    c151.setPaddingBottom(7);
				    table.addCell(c151);
				    
					Calendar calen = Calendar.getInstance();
					Date dat = rs.getDate("loadingDate", calen);
					String pat = "dd-MM-yyyy";
					String datef = new SimpleDateFormat(pat).format(dat);									    
				    PdfPCell load = new PdfPCell(new Phrase(datef,font1));
				    load.setPaddingTop(7);
				    load.setPaddingBottom(7);
				    
				    table.addCell(load);
				    
				    PdfPCell type = new PdfPCell(new Phrase(rs.getString("type"),font1));
				    type.setPaddingTop(7);
				    type.setPaddingBottom(7);
				    table.addCell(type);
				    
					Calendar calen1 = Calendar.getInstance();
					Date dat1 = rs.getDate("dischargingDate", calen1);
					String pat1 = "dd-MM-yyyy";
					String datef1 = new SimpleDateFormat(pat).format(dat1);				    
				    PdfPCell dis = new PdfPCell(new Phrase(datef1,font1));
				    dis.setPaddingTop(7);
				    dis.setPaddingBottom(7);
				    
				    table.addCell(dis);
				    PdfPCell way = new PdfPCell(new Phrase(rs.getString("waybillNumber"),font1));
				    way.setPaddingTop(7);
				    way.setPaddingBottom(7);
				    table.addCell(way);
				    PdfPCell vehi = new PdfPCell(new Phrase(rs.getString("vehicleNumber"),font1));
				    vehi.setPaddingTop(7);
				    vehi.setPaddingBottom(7);
				    table.addCell(vehi);
				    PdfPCell charge = new PdfPCell(new Phrase(rs.getString("dischargingPoint"),font1));
				    charge.setPaddingTop(7);
				    charge.setPaddingBottom(7);
				    table.addCell(charge);
				    PdfPCell pro = new PdfPCell(new Phrase(rs.getString("rloss"),font1));
				    pro.setPaddingTop(7);
				    pro.setPaddingBottom(7);
				    table.addCell(pro);
				    
				    PdfPCell allow = new PdfPCell(new Phrase(rs.getString("aloss"),font1));
				    allow.setPaddingTop(7);
				    allow.setPaddingBottom(7);
				    table.addCell(allow);
				    
				    PdfPCell actual = new PdfPCell(new Phrase(rs.getString("productLossLit"),font1));
				    actual.setPaddingTop(7);
				    actual.setPaddingBottom(7);
				    table.addCell(actual);
				    
				    PdfPCell cost = new PdfPCell(new Phrase(rs.getString("costPerlit"),font1));
				    cost.setPaddingTop(7);
				    cost.setPaddingBottom(7);
				    table.addCell(cost);
				    PdfPCell d2 = new PdfPCell(new Phrase(al,font1));
				    d2.setPaddingTop(7);
				    d2.setPaddingBottom(7);
				    table.addCell(d2);
				    PdfPCell d3 = new PdfPCell(new Phrase(rs.getString("overNightAllowance"),font1));
				    d3.setPaddingTop(7);
				    d3.setPaddingBottom(7);
				    table.addCell(d3);
				    PdfPCell d4 = new PdfPCell(new Phrase(to,font1));
				    d4.setPaddingTop(7);
				    d4.setPaddingBottom(7);
				    table.addCell(d4);
				    PdfPCell d5 = new PdfPCell(new Phrase(te,font1));
				    d5.setPaddingTop(7);
				    d5.setPaddingBottom(7);
				    table.addCell(d5);
				    PdfPCell com = new PdfPCell(new Phrase(alo,font1));
				    com.setPaddingTop(7);
				    com.setPaddingBottom(7);
				    table.addCell(com);
				    
				    PdfPCell c20 = new PdfPCell(new Phrase(rs.getString("company"),font1));
				    c20.setPaddingTop(7);
				    c20.setPaddingBottom(7);
				    table.addCell(c20);
				    
				    double act = rs.getDouble("productLossLit");
				    actualloss = actualloss+=act;
				    
				    valuegh = valuegh+=roundOo;
				    
				    double sum = rs.getDouble("overNightAllowance");
				    night = night+=sum;
				    
				    atsource =atsource+=roundO;
				    
				    paymentdue = paymentdue+=round;
				   
				    
				    amountrecieve=amountrecieve+=roun;
				    
				   
              }

   
        
    }
}

double ro = Math.round(paymentdue*100)/100D;
String.format("%.3f", ro);
paymentdue=ro;

double rod = Math.round(actualloss*100)/100D;
String.format("%.3f", rod);
actualloss=rod;

double ros = Math.round(valuegh*100)/100D;
String.format("%.3f", ros);
valuegh=ros;

double ron = Math.round(night*100)/100D;
String.format("%.3f", ron);
night=ron;

double roa = Math.round(atsource*100)/100D;
String.format("%.3f", roa);
atsource=roa;

double rom = Math.round(amountrecieve*100)/100D;
String.format("%.3f", rom);
amountrecieve=rom;

PdfPTable t = new PdfPTable(columnWidths1);
PdfPCell total = new PdfPCell(new Phrase("Total",font1));
t.addCell(total);

PdfPCell total1 = new PdfPCell(new Phrase("",font1));
total1.setBorder(Rectangle.NO_BORDER);
total1.setVerticalAlignment(Element.ALIGN_MIDDLE);
t.addCell(total1);

PdfPCell total2 = new PdfPCell(new Phrase("",font1));
total2.setVerticalAlignment(Element.ALIGN_MIDDLE);
total2.setBorder(Rectangle.NO_BORDER);
t.addCell(total2);

PdfPCell total3 = new PdfPCell(new Phrase("",font1));
total3.setVerticalAlignment(Element.ALIGN_MIDDLE);
total3.setBorder(Rectangle.NO_BORDER);
t.addCell(total3);

PdfPCell total4 = new PdfPCell(new Phrase("",font1));
total4.setVerticalAlignment(Element.ALIGN_MIDDLE);
total4.setBorder(Rectangle.NO_BORDER);
t.addCell(total4);

PdfPCell total5 = new PdfPCell(new Phrase("",font1));
total5.setVerticalAlignment(Element.ALIGN_MIDDLE);
total5.setBorder(Rectangle.NO_BORDER);
t.addCell(total5);

PdfPCell total6 = new PdfPCell(new Phrase("",font1));
total6.setVerticalAlignment(Element.ALIGN_MIDDLE);
total6.setBorder(Rectangle.NO_BORDER);
t.addCell(total6);

PdfPCell total7 = new PdfPCell(new Phrase("",font1));
total7.setVerticalAlignment(Element.ALIGN_MIDDLE);
total7.setBorder(Rectangle.NO_BORDER);
t.addCell(total7);

PdfPCell total8 = new PdfPCell(new Phrase("",font1));
total8.setVerticalAlignment(Element.ALIGN_MIDDLE);
total8.setBorder(Rectangle.NO_BORDER);
t.addCell(total8);

PdfPCell total9 = new PdfPCell(new Phrase("",font1));
total9.setVerticalAlignment(Element.ALIGN_MIDDLE);
total9.setBorder(Rectangle.NO_BORDER);
t.addCell(total9);

PdfPCell total0 = new PdfPCell(new Phrase(""+actualloss,font1));
total0.setVerticalAlignment(Element.ALIGN_MIDDLE);
total0.setBorder(Rectangle.NO_BORDER);
t.addCell(total0);

PdfPCell total13 = new PdfPCell(new Phrase("",font1));
total13.setVerticalAlignment(Element.ALIGN_MIDDLE);
total13.setBorder(Rectangle.NO_BORDER);
t.addCell(total13);

PdfPCell total14 = new PdfPCell(new Phrase(""+valuegh,font1));
total14.setVerticalAlignment(Element.ALIGN_MIDDLE);
total14.setBorder(Rectangle.NO_BORDER);
t.addCell(total14);

PdfPCell total15 = new PdfPCell(new Phrase(""+night,font1));
total15.setVerticalAlignment(Element.ALIGN_MIDDLE);
total15.setBorder(Rectangle.NO_BORDER);
t.addCell(total15);

PdfPCell total16 = new PdfPCell(new Phrase(""+atsource,font1));
total16.setVerticalAlignment(Element.ALIGN_MIDDLE);
total16.setBorder(Rectangle.NO_BORDER);
t.addCell(total16);

PdfPCell total22 = new PdfPCell(new Phrase(""+paymentdue,font1));
total22.setVerticalAlignment(Element.ALIGN_MIDDLE);
total22.setBorder(Rectangle.NO_BORDER);
t.addCell(total22);

PdfPCell total21 = new PdfPCell(new Phrase(""+amountrecieve,font1));
total21.setVerticalAlignment(Element.ALIGN_MIDDLE);
total21.setBorder(Rectangle.NO_BORDER);
t.addCell(total21);

PdfPCell total33 = new PdfPCell(new Phrase("",font1));
total33.setVerticalAlignment(Element.ALIGN_MIDDLE);
total33.setBorder(Rectangle.NO_BORDER);
t.addCell(total33);


t.setWidthPercentage(108);

document.add(tab);
document.add(table);
document.add(t);

document.close();
System.out.println("allowance ="+night);
}



%>


<%
if(request.getParameter("history")!=null){
	
	
	String select[] = request.getParameterValues("id"); 

    if (select != null && select.length != 0) {
    	System.out.println("You have selected: ");
        for (int i = 0; i < select.length; i++) {
            System.out.println(select[i]); 
            
           
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
            pst = con.prepareStatement("update trips set status='Moved' where id = '"+select[i]+"'");
            pst.executeUpdate();  
            
      
        }
    }
	
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
    
    

<title>trips</title>
</head>
<body>

	<%/*
		response.setHeader("cache-control", "no-cache, no-store, must-revalidate");

		if (session.getAttribute("operations") == null && session.getAttribute("manager") == null && session.getAttribute("Trip") == null){
			response.sendRedirect("index.jsp");
		}
	*/%>


<script type="text/javascript">
window.onload = function(){
    document.getElementById('pro').style.display = 'none';
}
</script>

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
						<a href="#" class="text-secondary logo"><i class="fa fa-road"></i>
							Trip <span class="small">Management</span></a>
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
								String mian = (String) request.getSession().getAttribute("Trip");
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
						<span class="text-primary small"><strong>Trips
								Management</strong></span>
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
									
									                                     
							<li class="parent"><a href="Locations.jsp "><i
									class="fa fa-map"></i> <span class="none"> Location </span> </a></li>
                                
                                
                                                                
							<li class="parent"><a href="trips.jsp "><i
									class="fa fa-building"></i> <span class="none"> Company </span> </a></li>
                                
                                </ul>
                            </li>


                        </ul>
                    </div>
                    <!--Sidebar Naigation Menu-->
				</div>
			</div>
			<!--///////////////////// modals////////////////////////-->


			<!-- ////////////////////////////////////////////////  trip modal /////////////////////////////////////////////////////////-->
			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="Tripmodal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Select Driver and Location</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form action="tripForm.jsp" method="post">

								<div class="form-row">

									<div class="form-group floating-label col-md-8 mb-8">
										<select class="custom-select" name="name" required>
											<%
											                  
											                  String url ="jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
											                  String username="kodson_maxwell";
											                  String password="0040105715@Icon";
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="select * from drivers";
											                    	   ResultSet rss = stt.executeQuery(query);
											                    	   
											                    	   while(rss.next()){
											                    		   
											                    		   %>

											<option><%=rss.getString("name") %></option>
											<% 
											                    		   System.out.println();
											                    	   }
											                    	   
											                       }catch(Exception e){
											                    	   
											                       }
                                                          %>

										</select> <label for="" class="mt-1">Select Name</label>
									</div>


									
								
									<div class="form-group floating-label col-md-8 mb-8">
										<select class="custom-select" name="location" required>
											<%
											                  
											                  
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="select * from location";
											                    	   ResultSet rss = stt.executeQuery(query);
											                    	   
											                    	   while(rss.next()){
											                    		   
											                    		   %>

											<option><%=rss.getString("locaction") %> </option>
											<% 
											                    		   System.out.println();
											                    	   }
											                    	   
											                       }catch(Exception e){
											                    	   
											                       }
                                                          %>

										</select> <label for="" class="mt-1">Select Loading & Discharging point</label>
									</div>
                                  
									  


								</div>
								<div align="right">
								<button type="submit" id="submit" name="submi" value="submit"
									class="btn btn-primary">Next</button>
								<button type="Cancel" class="btn btn-primary"
									data-dismiss="modal">Cancel</button></div>
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
			
			<!-- /////////////////////////////////////////////id modal  //////////////////////////////////////////////////////////// -->
			

           			<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="idReport" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Select your ID</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">


<form action="idReport.jsp" method="post">
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
							
							<div class="form-group floating-label col-md-6 mb-6">
										<select class="custom-select" name="form_date" required>
											<%
											                  
											                 
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="select * from trips";
											                    	   ResultSet rss = stt.executeQuery(query);
											                    	   
											                    	   while(rss.next()){
											                    		   
											                    		   %>

											<option><%=rss.getString("id") %></option>
											<% 
											                    		   System.out.println();
											                    	   }
											                    	   
											                       }catch(Exception e){
											                    	   
											                       }
                                                          %>

										</select> <label for="" class="mt-1">Select First ID</label>
									</div>


									
								
									<div class="form-group floating-label col-md-6 mb-6">
										<select class="custom-select" name="to_date" required>
											<%
											                  
											                  
											                  
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="select * from trips";
											                    	   ResultSet rss = stt.executeQuery(query);
											                    	   
											                    	   while(rss.next()){
											                    		   
											                    		   %>

											<option><%=rss.getString("id") %> </option>
											<% 
											                    		   System.out.println();
											                    	   }
											                    	   
											                       }catch(Exception e){
											                    	   
											                       }
                                                          %>

										</select> <label for="" class="mt-1">Select Last id</label>
									</div>

						</div>

						<button class="btn btn-primary" type="submit" id="submit"
							name="submit">Generate</button>

					</form>
						</div>
					</div>

				
						</div>
					</div>

			<!-- /////////////////////////////////////////////Monthly Report modal  //////////////////////////////////////////////////////////// -->
                  
                  	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="monthModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">Select Month</h4>
					<button class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-body">
					<form action="monthlyReport.jsp" method="post">
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
	
	
	
				<!-- /////////////////////////////////////////////perTruck Report modal  //////////////////////////////////////////////////////////// -->
                  
                  	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="truckTripModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">Generate Report Per Each Truck</h4>
					<button class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-body">
					<form action="truckTrips.jsp" method="post">
						<div class="form-row">
				
				<div class="form-row">
						<div class="col-md-12">
							<div class="row">
								<div class="form-group col-md-1"></div>
								<div class="form-group col-md-5 float-left">
									From: <input type="date" class="datepicker"
										data-date-format="mm/dd/yyyy" name="from_date">
								</div>
								<div class="form-group col-md-5 float-right">
									To: <input type="date" class="datepicker"
										data-date-format="mm/dd/yyyy" name="to_date">
								</div>
							</div>
							
						</div>
					</div>

							
							<div class="form-group floating-label col-md-10 mb-6" align="center">

								<select class="custom-select" name="truck" required>
											<%
											                       try{
											                    	   Class.forName("com.mysql.jdbc.Driver");
											                    	   Connection conn = (Connection) DriverManager.getConnection(url,username,password);
											                    	   Statement stt = conn.createStatement();
											                    	   String query ="select * from trucks_";
											                    	   ResultSet rss = stt.executeQuery(query);
											                    	   
											                    	   while(rss.next()){
											                    		   
											                    		   %>

											<option><%=rss.getString("truck_number") %> </option>
											<% 
											                    		 
											                    	   }
											                    	   
											                       }catch(Exception e){
											                    	   
											                       }
                                                          %>

										</select> <label for="" class="mt-1">Select a Truck</label>
							</div>
							
							
								
										
										
									</div>

						

						<button class="btn btn-primary" type="submit" id="submit"
							name="submit">Generate</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
				<!-- /////////////////////////////////////////////perCompany Report modal  //////////////////////////////////////////////////////////// -->
                  
       	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="perCompany" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">Select Month</h4>
					<button class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-body">
					<form action="perCompany.jsp" method="post">
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

					
														
										<select name="company" id="company" class="custom-select"
											required>
											<option value=""></option>
											<option value="KODSON">KODSON</option>
											<option value="KTC">KTC</option>
											<option value="KGL">KGL</option>
											<option value="MANNER">MANNER</option>
											<option value="JUST GRACE">JUST GRACE</option>
											<option value="UNIQUE TIMES">UNIQUE TIMES</option>
											<option value="LIDA">LIDA</option>
											<option value="JMP">JMP</option>
										</select> <label for="" class="mt-1">Select Company</label>
									</div>
							

						</div>

						<button class="btn btn-primary" type="submit" id="submit"
							name="submit">Generate</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	
	
<!-- /////////////////////////////////////////////shortage Report modal  //////////////////////////////////////////////////////////// -->


	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="shortageModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<form action="shortageReport.jsp" method="post">
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

<!-- /////////////////////////////////////////////yearly Report modal  //////////////////////////////////////////////////////////// -->

	<div class="modal fade" data-keyboard="false" data-backdrop="static"
				id="yearlyModal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Select your Dates</h4>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">


				<form action="yearlyReport.jsp" method="post">

					<br>
					<br>
					<h5 align="center">Please select Date</h5>

					<div class="form-row">
						<div class="col-md-12">
							<div class="row">
								<div class="form-group col-md-1"></div>
								<div class="form-group col-md-5 float-left">
									From: <input type="date" class="datepicker"
										data-date-format="mm/dd/yyyy" name="form_date">
								</div>
								<div class="form-group col-md-5 float-right">
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
			</div>

			<!--Content right-->
			<div class="col-sm-9 col-xs-12 content pt-3 pl-0">


				<div class="mt-1 mb-3 button-container">
					<div class="row pl-0">
						<div class="col-lg-3 col-md-3 col-sm-6 col-12 mb-3">
							<div class="border shadow p-3 bg-success">
								<p class="pw-2 text-center text-white">
									<i class="fa fa-road"></i> <small
										class="bc-description text-white"></small>
								</p>
								<p class="mt-2 text-white">
									Over All Total Number Of Trips =

									<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(loadingDate) from trips";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String totalTrips="";
                                    while(rs.next()){
                                    totalTrips = rs.getString(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalTrips",totalTrips);
                                    out.println("<b style=\"font-size:20px;\">"+totalTrips+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>


								</p>
							</div>
						</div>

						<div class="col-lg-3 col-md-3 col-sm-6 col-12 mb-3">
							<div class="border shadow p-3 bg-danger">
								<p class="pw-2 text-center text-white">
									<i class="fa fa-users"></i> <small
										class="bc-description text-white"></small>
								</p>
								<p class="mt-2 text-white">
									Total Number Of Drivers =

									<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(truck) from drivers";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String totalDrivers="";
                                    while(rs.next()){
                                   	totalDrivers = rs.getString(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("totalDrivers",totalDrivers);
                                    out.println("<b style=\"font-size:20px;\">"+totalDrivers+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>

								</p>
							</div>
						</div>

						<div class="col-lg-3 col-md-3 col-sm-6 col-12 mb-3">
							<div class="border shadow p-3 bg-primary">
								<p class="pw-2 text-center text-white">
									<i class="fa fa-file-text"></i> <small
										class="bc-description text-white"></small>
								</p>
								<p class="mt-2 text-white">
									Total Shortage value =
									<%                          
                                    try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select sum(productLossLit) from trips";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String loss="";
                                    while(rs.next()){
                                    	loss = rs.getString(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("loss",loss);
                                    out.println("<b style=\"font-size:20px;\">"+loss+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>
								</p>
							</div>
						</div>

						<div class="col-lg-3 col-md-3 col-sm-6 col-12 mb-3">
							<div class="border shadow p-3 bg-warning">
								<p class="pw-2 text-center text-white">
									<i class="fa fa-th-list"></i> <small
										class="bc-description text-white"></small>
								</p>
								<p class="mt-2 text-white">
									Over All Trips =
									<% 
                                          try
                                    {
                                    
                                        
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                    Statement st=con.createStatement();
                                    String strQuery = "select count(dischargingDate) from trips";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String disc="";
                                    while(rs.next()){
                                    	disc = rs.getString(1);
                                    HttpSession s = request.getSession(false);
                                    s.setAttribute("disc",disc);
                                    out.println("<b style=\"font-size:20px;\">"+disc+"</b>");
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }

                                    %>

								</p>
							</div>
						</div>

					</div>
				</div>


<button type="button" class="btn btn-outline-theme change"><i class="fa fa-arrow-left"></i>||<i class="fa fa-arrow-right"></i> toggle between processed and unprocessed trips</button>
              <div class="mt-4 mb-4 p-3  unpro" >
								
								<h5 class="mb-3">
					<strong>Unprocessed Trips</strong>
				</h5>

					
						<div>
						<form action="#">
						
							<table class="table table-bordered table-hover table-fixed"
								id="testData">
								<thead class="thead-light">

									<tr class="text-center">
										<th scope="col" style="color:red"><input type="checkbox" onClick="toggle(this)" />check all</th>
										<th scope="col">NAME</th>
										<th scope="col">Month</th>
										<th scope="col">OIL COMPANY</th>
										<th scope="col">PRODUCT TYPE</th>
										<th scope="col">LOADING DATE</th>
										<th scope="col">DISCHARGING DATE</th>
										<th scope="col">WAYBILL No.</th>
										<th scope="col">VEHICLE No.</th>
										<th scope="col">Quantity</th>
										<th scope="col">DISCHARGING PNT</th>
										<th scope="col">Product Loss Litres</th>
										<th scope="col">ALLOWABLE Loss Litres</th>
										<th scope="col">Actual Loss Litres</th>
										<th scope="col">Cost per litres</th>
										<th scope="col">Shortage Value Gh</th>
										<th scope="col">Overnight Allowance</th>
										<th scope="col">Deduction At Source</th>
										<th scope="col">Payment due BVO</th>
										<th scope="col">Amount Receivable</th>
										
										<th scope="col">Company</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<%   
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                
                                  String quer = "select * from trips where status ='Not Moved' and dischargingDate = ''";
                                  Statement s = con.createStatement();
                                  
                                    rs =  s.executeQuery(quer);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>

									<tr >
										<td class="align-middle text-center"> <input type="checkbox" name="id" value="<%=rs.getString("id")%>"></td>
										<td class="align-middle text-center"><%=rs.getString("name") %></td>
										<td class="align-middle text-center"><%=rs.getString("monthh") %></td>
										<td class="align-middle text-center"><%=rs.getString("OilCompany") %></td>
										<td class="align-middle text-center"><%=rs.getString("type") %></td>
										<td class="align-middle text-center"><%
										
										Calendar cal = Calendar.getInstance();
										Date t = rs.getDate("loadingDate", cal);
										String pattern1 = "dd-MM-yyyy";
										String mydis = new SimpleDateFormat(pattern1).format(t);
										out.println(mydis); %></td>
										
										
										<td class="align-middle text-center"><%
										
										Calendar cal1 = Calendar.getInstance();
										Date t1 = rs.getDate("dischargingDate", cal1);
										String pattern = "dd-MM-yyyy";
										String mydis1 = new SimpleDateFormat(pattern1).format(t1);
										out.println(mydis1);
										
										
										%></td>
										<td class="align-middle text-center"><%=rs.getString("waybillNumber") %></td>
										<td class="align-middle text-center"><%=rs.getString("vehicleNumber") %></td>
										<td class="align-middle text-center"><%=rs.getString("qty") %></td>
										<td class="align-middle text-center"><%=rs.getString("dischargingPoint") %></td>
										<!--  /////////////////////////////////////-->
										<td class="align-middle text-center"><%=rs.getString("rloss") %></td>
										<td class="align-middle text-center"><%=rs.getString("aloss") %></td>
										<td class="align-middle text-center"><%=rs.getString("productLossLit") %></td>
										<td class="align-middle text-center"><%=rs.getString("costPerlit") %></td>
										<td class="align-middle text-center">
											<%
                               String pll = rs.getString("productLossLit");
                               String cpl = rs.getString("costPerlit");
                               
                               double p = Double.parseDouble(pll);
                               double c = Double.parseDouble(cpl);
                               
                               double all = c*p;
                               out.println(all);
                               
                               %>
										</td>
										<td class="align-middle text-center"><%=rs.getString("overNightAllowance") %>
										</td>
										<td class="align-middle text-center">
											<%
											double over = rs.getDouble("overNightAllowance");
											double ploss = rs.getDouble("productLossLit");
											double deduction;
											if(ploss >= 100){
												deduction = all-over;
											out.println(deduction); }else if(ploss != 0.00){
												deduction = all;	
											}else{
												deduction=0.00;
											}
											out.println(deduction);
											%>
											
										</td>
										<td class="align-middle text-center">
											<%
                               
                               
                               double results=over-all;
                               if(results <=0 || all>over){
                            	   out.println(0.00);
                               }else{
                                  out.println(results);
                               }
                               %>
										</td>
										<td class="align-middle text-center">
											<%
                               if(all>over){
                            	   out.println(all-over);
                               }
                               else{
                            	   out.println(0.00);
                               }
                               %>
										</td>
										
										<td class="align-middle text-center"><%=rs.getString("company") %>
										</td>

										<td class="align-middle text-center"><a
											href="updateTrip.jsp?id=<%=id%>"><i
												class="fa fa-pencil btn btn-success"> </i></a> <a
											onclick="testDelete(<%=rs.getString(1)%>);" data-toggle="tooltip"
											data-placement="top" title="Click to update data"><i
												class="fa fa-trash btn btn-danger"> </i></a></td>
									</tr>


									<%
                                 
                                 }
                               %>

								</tbody>
							</table>
							  <button class="btn btn-primary" name="print">print selected trips </button>
							  <button class="btn btn-warning" name="history">move selected trips to history </button>
							</form>
						</div>

                     <script type="text/javascript">
      
      function testDelete(id){
    	  var doit = confirm("Do you want to delete data");
    	      if(doit){
    	    	  var jspLink = "deleteTrip.jsp?id="+id;
    	    			  window.location.href=jspLink;
    	      }else
    	    	  alert("Cancelled");
      }

</script>
						<script src="jquery-3.6.0.js" type="text/javascript"></script>
						<script src="component/jquery/jquery.min.js"
							type="text/javascript"></script>
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


						<script>
$(document).ready( function () {
    $('#testDat').DataTable();
} );


</script>




						<div class="navbar-text ">
							
							
							    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#Tripmodal" data-toggle="tooltip"data-placement="top" title="add a trip"><i class="fa fa-plus-circle"></i> </button>
						</div>
						
						<div class="navbar-text ">
							
								--
							
						</div>
						
						<div class="navbar-text ">
							
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#idReport" data-toggle="tooltip"data-placement="top" title="add a trip"><i class="fa fa-dot-circle"></i> </button>
						</div>
						
						
						<div class="navbar-text ">
							
								-- 
							
						</div>


						<div class="navbar-text ">
							
							<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#monthModal" data-toggle="tooltip"data-placement="top" title="add a trip"><i class="fa fa-moon"></i>  </button>
						</div>
						
						
						<div class="navbar-text ">
							
								--
							
						</div>


						<div class="navbar-text ">
						
							<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#shortageModal" data-toggle="tooltip"data-placement="top" title="add a trip"><i class="fa fa-flask "></i> </button>
						</div>
						
						<div class="navbar-text ">
							
								-- 
							
						</div>

						<div class="navbar-text ">
						
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#yearlyModal" data-toggle="tooltip"data-placement="top" title="add a trip"><i class="fa fa fa-calendar "></i> </button>
						</div>
						
						<div class="navbar-text ">
							
								-- 
							
						</div>
						
						<div class="navbar-text ">
						
							<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#truckTripModal" data-toggle="tooltip"data-placement="top" title="Generate Trips Per Truck"><i class="fa fa-truck "></i> </button>
						</div>
						
						<div class="navbar-text ">
							
								-- 
							
						</div>
						
						<div class="navbar-text ">
						
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#perCompany" data-toggle="tooltip"data-placement="top" title="Generate Freight Claims"><i class="fa fa-building"></i> </button>
						</div>

					</div>


              <div class="mt-4 mb-4 p-3  pro" id="pro" >
								
								<h5 class="mb-3">
					<strong>Processed Trips</strong>
				</h5>

					
						<div>
						<form action="#">
						
							<table class="table table-bordered table-hover table-fixed"
								id="testDat">
								<thead class="thead-light">

									<tr class="text-center">
										<th scope="col" style="color:red"><input type="checkbox" onClick="toggle(this)" />check all</th>
										<th scope="col">NAME</th>
										<th scope="col">Month</th>
										<th scope="col">OIL COMPANY</th>
										<th scope="col">PRODUCT TYPE</th>
										<th scope="col">LOADING DATE</th>
										<th scope="col">DISCHARGING DATE</th>
										<th scope="col">WAYBILL No.</th>
										<th scope="col">VEHICLE No.</th>
										<th scope="col">Quantity</th>
										<th scope="col">DISCHARGING PNT</th>
										<th scope="col">Product Loss Litres</th>
										<th scope="col">ALLOWABLE Loss Litres</th>
										<th scope="col">Actual Loss Litres</th>
										<th scope="col">Cost per litres</th>
										<th scope="col">Shortage Value Gh</th>
										<th scope="col">Overnight Allowance</th>
										<th scope="col">Deduction At Source</th>
										<th scope="col">Payment due BVO</th>
										<th scope="col">Amount Receivable</th>
										
										<th scope="col">Company</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<%   
 
                               
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
                                
                                  String query = "select * from trips where status ='Not Moved' and dischargingDate !=''";
                                  Statement s1 = con.createStatement();
                                  
                                    rs =  s1.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>

									<tr >
										<td class="align-middle text-center"> <input type="checkbox" name="id" value="<%=rs.getString("id")%>"></td>
										<td class="align-middle text-center"><%=rs.getString("name") %></td>
										<td class="align-middle text-center"><%=rs.getString("monthh") %></td>
										<td class="align-middle text-center"><%=rs.getString("OilCompany") %></td>
										<td class="align-middle text-center"><%=rs.getString("type") %></td>
										<td class="align-middle text-center"><%
										
										Calendar cal = Calendar.getInstance();
										Date t = rs.getDate("loadingDate", cal);
										String pattern1 = "dd-MM-yyyy";
										String mydis = new SimpleDateFormat(pattern1).format(t);
										
										out.println(mydis);

										%></td>
										<td class="align-middle text-center"><%

										Calendar cal1 = Calendar.getInstance();
										Date t1 = rs.getDate("dischargingDate", cal1);
										String pattern = "dd-MM-yyyy";
										String mydis1 = new SimpleDateFormat(pattern1).format(t1);
										out.println(mydis1);

										%></td>
										<td class="align-middle text-center"><%=rs.getString("waybillNumber") %></td>
										<td class="align-middle text-center"><%=rs.getString("vehicleNumber") %></td>
										<td class="align-middle text-center"><%=rs.getString("qty") %></td>
										<td class="align-middle text-center"><%=rs.getString("dischargingPoint") %></td>
										<!--  /////////////////////////////////////-->
										<td class="align-middle text-center"><%=rs.getString("rloss") %></td>
										<td class="align-middle text-center"><%=rs.getString("aloss") %></td>
										<td class="align-middle text-center"><%=rs.getString("productLossLit") %></td>
										<td class="align-middle text-center"><%=rs.getString("costPerlit") %></td>
										<td class="align-middle text-center">
											<%
                               String pll = rs.getString("productLossLit");
                               String cpl = rs.getString("costPerlit");
                               
                               double p = Double.parseDouble(pll);
                               double c = Double.parseDouble(cpl);
                               
                               double all = c*p;
                               double roall = Math.round(all*100)/100D;
                               String.format("%.3f", roall);
                               all=roall;
                               out.println(all);
                               
                               %>
										</td>
										<td class="align-middle text-center"><%=rs.getString("overNightAllowance") %>
										</td>
										<td class="align-middle text-center">
											<%
											double over = rs.getDouble("overNightAllowance");
											double ploss = rs.getDouble("productLossLit");
											double deduction;
											if(ploss >= 100){
												deduction = all-over;
											out.println(deduction); }else if(ploss != 0.00){
												deduction = all;	
											}else{
												deduction=0.00;
											}
											double rode = Math.round(deduction*100)/100D;
				                               String.format("%.3f", rode);
				                               deduction=rode;
											out.println(deduction);
											%>
											
										</td>
										<td class="align-middle text-center">
											<%
                               
                               
                               double results=over-all;
                               if(results <=0 || all>over){
                            	   out.println(0.00);
                               }else{
                            	   double rore = Math.round(results*100)/100D;
	                               String.format("%.3f", rore);
	                               results=rore;
                                  out.println(results);
                               }
                               %>
										</td>
										<td class="align-middle text-center">
											<%
											double see =0.00;
											
                               if(all>over){
                            	   
                            	   see=all-over;
                            	   double rosee = Math.round(see*100)/100D;
	                               String.format("%.3f", rosee);
	                               see=rosee;
                            	   out.println(see);
                               }
                               else{
                            	   out.println(0.00);
                               }
                               %>
										</td>
										
										<td class="align-middle text-center"><%=rs.getString("company") %>
										</td>

										<td class="align-middle text-center"><a
											href="updateTrip.jsp?id=<%=id%>"><i
												class="fa fa-pencil btn btn-success"> </i></a> <a
											onclick="testDelete(<%=rs.getString(1)%>);" data-toggle="tooltip"
											data-placement="top" title="Click to update data"><i
												class="fa fa-trash btn btn-danger"> </i></a></td>
									</tr>


									<%
                                 
                                 }
                               %>

								</tbody>
							</table>

							  <button class="btn btn-primary" name="print">print selected trips </button>
							  <button class="btn btn-warning" name="history">move selected trips to history </button>
							</form>
						</div>
						
                     <script type="text/javascript">
      
      function testDelete(id){
    	  var doit = confirm("Do you want to delete data");
    	      if(doit){
    	    	  var jspLink = "deleteTrip.jsp?id="+id;
    	    			  window.location.href=jspLink;
    	      }else
    	    	  alert("Cancelled");
      }

</script>

						
			<script type="text/javascript">
			
			function toggle(source) {
				   checkboxes = document.getElementsByName('id');
				   for (var i = 0, n = checkboxes.length; i < n; i++) {
				      checkboxes[i].checked = source.checked;
				   }
				}
			
			</script>


		<div class="navbar-text ">
							    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#Tripmodal"><i class="fa fa-plus-circle"></i> </button>
						</div>
						
						<div class="navbar-text ">
							
								--
							
						</div>
						
						<div class="navbar-text ">
							
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#idReport"><i class="fa fa-dot-circle"></i> </button>
						</div>
						
						
						<div class="navbar-text ">
							
								-- 
							
						</div>


						<div class="navbar-text ">
							
							<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#monthModal"><i class="fa fa-moon"></i>  </button>
						</div>
						
						
						<div class="navbar-text ">
							
								--
							
						</div>


						<div class="navbar-text ">
						
							<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#shortageModal"><i class="fa fa-flask "></i> </button>
						</div>
						
						<div class="navbar-text ">
							
								-- 
							
						</div>

						<div class="navbar-text ">
						
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#yearlyModal"><i class="fa fa fa-calendar "></i> </button>
						</div>
						
						<div class="navbar-text ">
						
							<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#truckTripModal" data-toggle="tooltip"data-placement="top" title="Generate Trips Per Truck"><i class="fa fa-truck "></i> </button>
						</div>
						
						<div class="navbar-text ">
							
								-- 
							
						</div>
						
						<div class="navbar-text ">
						
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#perCompany" data-toggle="tooltip"data-placement="top" title="Generate Freight Claims"><i class="fa fa-building"></i> </button>
						</div>

					</div>

					<!--Dashboard widget-->

				</div>
			</div>
			<!--/Dashboard widget-->



			<!--Chart Section-->

			<!--Chart Section-->



			<!--Footer-->

			<!--Footer-->

		</div>
	</div>


<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->
<script type="text/javascript">

$(function(){
	  $('div.pro').hide();// hide it initially
	  $('button.change').on('click', function(){
	     $('div.unpro, div.pro').toggle();
	  });
	});


</script>


	<!--Main Content-->



	<!--Page Wrapper-->

	<!-- Page JavaScript Files-->

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