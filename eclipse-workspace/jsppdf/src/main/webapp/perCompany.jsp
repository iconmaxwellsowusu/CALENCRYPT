<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="tripError.jsp"%>

<%@page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%@page import="java.sql.*"%>
<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>



								<%
								
								Calendar cal = Calendar.getInstance();
								Calendar cal1 = Calendar.getInstance();
								String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
								
								String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
								
								 String months = (String)session.getAttribute("month");
                                 String cop = (String)session.getAttribute("comp");
                                
                                 String di = (String)session.getAttribute("disc");
                                 String shortag = (String)session.getAttribute("shortage");
                                 String overnigh = (String)session.getAttribute("overnight");
                                 String paymen = (String)session.getAttribute("payment");
                                 String amountreceiv = (String)session.getAttribute("amountreceive");
                                 String paymentdu = (String)session.getAttribute("paymentdue");
                                 String cashpai = (String)session.getAttribute("cashpaid");
                                 
                                 double actualloss =0;
                                 double valuegh=0;
                                 double night = 0;
                                 double atsource =0;
                                 double paymentdue=0;
                                 double amountrecieve =0;
                                 
                                 double amountBefore=0.00;
                                 double totalAmount =0.00;
                                 
								if(request.getParameter("shortage") != null){
									
									Document document = new Document(PageSize.A4.rotate());

								    response.setContentType("test/pdf");
									response.setHeader("Content-Disposition","Inline; filename=\"document.pdf\"");
							        
							    PdfWriter.getInstance(document,response.getOutputStream());
							    document.open();

								
								    
							        Font font3 = FontFactory.getFont(FontFactory.HELVETICA_BOLD,16, BaseColor.BLACK);
								    Font font1 = FontFactory.getFont(FontFactory.HELVETICA_BOLD,8, BaseColor.BLACK);
								    Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD,8, BaseColor.BLACK);
								    
								    String kumasi ="KUMASI AND BUIPE FREIGHT CLAIMS FOR "+m;
                                    
                                    Paragraph paragraph = new Paragraph(kumasi,font3);
                                   
                                    
                                    String accra="\nPRESENTED TO THE MANAGING DIRECTOR\n BULK OIL STORAGE TRANSPORTATION CO LTD ACCRA \n TRANSPORTER "+cop+"CO LTD\n P.O.BOX CO 3186, TEMA \n 0303 305730/0501577846\n\n DATE: "+m4+"\n       ";
                                    Paragraph paragraph1 = new Paragraph(accra,font);
                                 
								    float[] columnWidths = {5, 6, 7,5,5,5,5,5,6,5,5,8};
								    float[] columnWidths1 = {5, 5, 5,5,5,5,5,5,5,5,5,10};
								    
								    PdfPTable tab = new PdfPTable(1);
									tab.addCell(new PdfPCell(new Phrase("                                                                                           "+cop +" "+months)));
									tab.setWidthPercentage(108);
									
									 PdfPTable table = new PdfPTable(columnWidths);
									    table.setWidthPercentage(108);
									    table.setPaddingTop(10);
									    PdfPCell c1 = new PdfPCell(new Phrase("NUMBER",font));
									    c1.setPaddingTop(7);
        							    c1.setPaddingBottom(7); 
									    c1.setPaddingLeft(20);
									    
									   
									    c1.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c1);
									    PdfPCell c2 = new PdfPCell(new Phrase("LOADING DATE",font));
									    c2.setBackgroundColor(BaseColor.CYAN);
									    c2.setPaddingTop(7);
        							    c2.setPaddingBottom(7);
									    
									   
									    table.addCell(c2);
									    PdfPCell c3 = new PdfPCell(new Phrase("DISCHARGING DATE",font));
									    c3.setBackgroundColor(BaseColor.CYAN);
									    c3.setPaddingTop(7);
        							    c3.setPaddingBottom(7);
									    table.addCell(c3);

									    PdfPCell d6 = new PdfPCell(new Phrase("WAYBILL NO.",font));
									    d6.setBackgroundColor(BaseColor.CYAN);
									    d6.setPaddingTop(7);
        							    d6.setPaddingBottom(7);

									    table.addCell(d6);

									    PdfPCell c4 = new PdfPCell(new Phrase("VEHICLE NO.",font));
									    c4.setBackgroundColor(BaseColor.CYAN);
									    c4.setPaddingTop(7);
        							    c4.setPaddingBottom(7);
									    table.addCell(c4);
									    PdfPCell c5 = new PdfPCell(new Phrase("PRDT",font));
									    c5.setBackgroundColor(BaseColor.CYAN);
									    c5.setPaddingTop(7);
        							    c5.setPaddingBottom(7);
									    table.addCell(c5);
									    PdfPCell c6 = new PdfPCell(new Phrase("QTY",font));
									    c6.setBackgroundColor(BaseColor.CYAN);
									    c6.setPaddingTop(7);
        							    c6.setPaddingBottom(7);
									    table.addCell(c6);
									    PdfPCell c7 = new PdfPCell(new Phrase("LOADING PT",font));
									    c7.setBackgroundColor(BaseColor.CYAN);
									    c7.setPaddingTop(7);
        							    c7.setPaddingBottom(7);
									    table.addCell(c7);
									    PdfPCell c8 = new PdfPCell(new Phrase("DISCHARGING PT",font));
									    c8.setBackgroundColor(BaseColor.CYAN);
									    c8.setPaddingTop(7);
        							    c8.setPaddingBottom(7);
									    table.addCell(c8);

									    PdfPCell v8 = new PdfPCell(new Phrase("DISTANCE",font));
									    v8.setBackgroundColor(BaseColor.CYAN);
									    v8.setPaddingTop(7);
        							    v8.setPaddingBottom(7);
									    table.addCell(v8);

									    PdfPCell f8 = new PdfPCell(new Phrase("RATE",font));
									    f8.setBackgroundColor(BaseColor.CYAN);
									    f8.setPaddingTop(7);
        							    f8.setPaddingBottom(7);
									    table.addCell(f8);

									    PdfPCell c9 = new PdfPCell(new Phrase("AMOUNT BEFORE TAX",font));
									    c9.setBackgroundColor(BaseColor.CYAN);
									    c9.setPaddingTop(7);
        							    c9.setPaddingBottom(7);
									    table.addCell(c9);
									   
						
							    table.setHeaderRows(1);
							    
							    
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
                                
                               
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");
                                
                               
                                String query = "select * from trips where monthh='"+months+"' and company='"+cop+"'";
                                  Statement st = con.createStatement();
                                  int no=0;
                                    rs =  st.executeQuery(query);
                                    
                                    while(rs.next())
                                    {
                                    	
			                    
                                      no+=1;
                                      String n = String.valueOf(no);
                                    	PdfPCell c150 = new PdfPCell(new Phrase(n,font1));
                                        c150.setPaddingTop(7);
   									    c150.setPaddingLeft(31);
   									    c150.setFixedHeight(10);
        							    table.addCell(c150);
        							    
        							    
        							    Calendar calen = Calendar.getInstance();
        								Date dat = rs.getDate("loadingDate", calen);
        								String pat = "dd-MM-yyyy";
        								String datef = new SimpleDateFormat(pat).format(dat);									    
        							    PdfPCell c151 = new PdfPCell(new Phrase(datef,font1));
        							    c151.setPaddingTop(7);
        							    c151.setPaddingBottom(7);        							    
        							    table.addCell(c151);
        							    
        							    
        							    
        							    Calendar calen1 = Calendar.getInstance();
        								Date dat1 = rs.getDate("dischargingDate", calen1);
        								String pat1 = "dd-MM-yyyy";
        								String datef1 = new SimpleDateFormat(pat).format(dat1);				    
        							    PdfPCell load = new PdfPCell(new Phrase(datef1,font1));
        							    load.setPaddingTop(7);
        							    load.setPaddingBottom(7);
        							    
        							    PdfPCell type = new PdfPCell(new Phrase(rs.getString("waybillNumber"),font1));
        							    type.setPaddingTop(7);
        							    type.setPaddingBottom(7);
        							    table.addCell(type);
        							    
        							    PdfPCell dis = new PdfPCell(new Phrase(rs.getString("vehicleNumber"),font1));
        							    dis.setPaddingTop(7);
        							    dis.setPaddingBottom(7);
        							    table.addCell(dis);
        							    PdfPCell way = new PdfPCell(new Phrase(rs.getString("type"),font1));
        							    way.setPaddingTop(7);
        							    way.setPaddingBottom(7);
        							    table.addCell(way);
        							    PdfPCell vehi = new PdfPCell(new Phrase(rs.getString("qty"),font1));
        							    vehi.setPaddingTop(7);
        							    vehi.setPaddingBottom(7);
        							    table.addCell(vehi);
        							    PdfPCell charge = new PdfPCell(new Phrase(rs.getString("loadingPoint"),font1));
        							    charge.setPaddingTop(7);
        							    charge.setPaddingBottom(7);
        							    table.addCell(charge);
        							    PdfPCell pro = new PdfPCell(new Phrase(rs.getString("dischargingPoint"),font1));
        							    pro.setPaddingTop(7);
        							    pro.setPaddingBottom(7);
        							    table.addCell(pro);
        							    
        							    PdfPCell allow = new PdfPCell(new Phrase(rs.getString("distance"),font1));
        							    allow.setPaddingTop(7);
        							    allow.setPaddingBottom(7);
        							    table.addCell(allow);
        							    
        							    PdfPCell actual = new PdfPCell(new Phrase(rs.getString("rate"),font1));
        							    actual.setPaddingTop(7);
        							    actual.setPaddingBottom(7);
        							    table.addCell(actual);
        							    
        							    double qty=rs.getDouble("qty");
        							    double rate=rs.getDouble("rate");
        							    
        							    amountBefore = qty*rate;
        							    totalAmount+=amountBefore;
        							    String am = String.valueOf(amountBefore);
        							    
        							    
        							    PdfPCell cost = new PdfPCell(new Phrase(am,font1));
        							    cost.setPaddingTop(7);
        							    cost.setPaddingBottom(7);
        							    table.addCell(cost);

        							   
                                    }

                                 

                                    PdfPTable t = new PdfPTable(columnWidths1);
                                   
                                    PdfPCell total = new PdfPCell(new Phrase("TOTAL",font3));
                                    total.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total);


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

                                    PdfPCell total0 = new PdfPCell(new Phrase("",font1));
                                    total0.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total0.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total0);

                                    PdfPCell total13 = new PdfPCell(new Phrase("",font1));
                                    total13.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total13.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total13);

                                    PdfPCell total14 = new PdfPCell(new Phrase("",font1));
                                    total14.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total14.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total14);

                                    PdfPCell total15 = new PdfPCell(new Phrase("",font1));
                                    total15.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total15.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total15);

                                    PdfPCell total16 = new PdfPCell(new Phrase("",font1));
                                    total16.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total16.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total16);

                                    PdfPCell total22 = new PdfPCell(new Phrase("",font1));
                                    total22.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total22.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total22);

                                    PdfPCell total21 = new PdfPCell(new Phrase("",font3));
                                    total21.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total21.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total21);
                                    
                                    String value = String.valueOf(totalAmount);

                                    PdfPCell total33 = new PdfPCell(new Phrase("      "+value,font3));
                                    total33.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total33.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total33);
                                    t.setWidthPercentage(108);
                                    
                                    String para2 ="\n\n..............................................\nFor And On Behalf of \n"+cop+" GHANA";
                                    
                                    Paragraph paragraph2 = new Paragraph(para2,font1);
                                    paragraph2.setPaddingTop(30);	
                                    
                                    
                                    document.add(paragraph);
                                    document.add(paragraph1);
                                        //document.add(tab);
                                        document.add(table);
                                        document.add(t);
                                        
                                        document.add(paragraph2);
                                        
        							    
							    document.close();
							    response.sendRedirect("trips.jsp");
								}
                                 
                               %>



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

	<div class="col-sm-12 col-xs-12 content pt-3 pl-0" id="printMe">

		


		<div class="mt-4 mb-4 p-3 ">

			<div class="mt-1 mb-4 p-3 button-container ">
				<h6 class="mb-2" align="center">
					<%
                     String comp = request.getParameter("company");
                     String month = request.getParameter("month");
                     HttpSession sess = request.getSession(false);
                     sess.setAttribute("month", month);
                     sess.setAttribute("comp", comp);
                     //out.println(comp +" - "+ month);
                     %>
				</h6>
				
				<h3 class="mb-3" align="left">
				
			     <strong>KUMASI AND BUIPE FREIGHT CLAIMS FOR<%out.println(" "+m); %></strong><br>
		        </h3>
		        <h5 style="color:black; font-size:12px;"><strong>PRESENTED TO THE MANAGING DIRECTOR <br>
		        BULK OIL STORAGE AND TRANSPORTATION CO LTD
		        ACCRA<br>
		        TRANSPORTER <% out.println(comp +" GHANA CO.LTD"); %><br>
		        P.O.BOX CO 3186, TEMA<br>
		        0303 305730/0501577846
		       </strong> </h5>
				
				
				<div class="scrollable">
				
				<h5><strong>DATE:  <%String m1 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
				out.println(m1);
				%></strong></h5>
					<table class="table table-bordered table-hover table-fixed"
						id="testData">
						<thead class="thead-light">
								<tr class="text-center">
										<th scope="col">NUMBER</th>
										<th scope="col">LOADING DATE</th>
										<th scope="col">DISCHARGING DATE</th>
										<th scope="col">WAYBILL NO.</th>
										<th scope="col">VEHICLE NO.</th>
										<th scope="col">PRDT</th>
										<th scope="col">QTY</th>
										<th scope="col">LOADING PT</th>
										<th scope="col">DISCHARGING PT</th>
										<th scope="col">DISTANCE</th>
										<th scope="col">RATE</th>
										<th scope="col">AMOUNT BEFORE TAX</th>
									
									</tr>
						</thead>
						<tbody>
							<% 
							
						    String f_date = (String)session.getAttribute("month");
                            String t_date = (String)session.getAttribute("comp");
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");
                              
                                  String query = "select * from trips where monthh='"+f_date+"' and company='"+t_date+"'";
                                  Statement st = con.createStatement();
                                  
                                  int no=0;
                                  double amount=0.00;
                                  double total=0.00;
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                            no+=1;
                                   %>

										<tr >
										<td class="align-middle text-center"><% out.println(no); %></td>
										<td class="align-middle text-center"><%
										
										
										Date t = rs.getDate("loadingDate", cal);
										String pattern1 = "dd-MM-yyyy";
										String mydis = new SimpleDateFormat(pattern1).format(t);
										out.println(mydis); %></td>
										
										
										<td class="align-middle text-center"><%
										
										
										Date t1 = rs.getDate("dischargingDate", cal1);
										String pattern = "dd-MM-yyyy";
										String mydis1 = new SimpleDateFormat(pattern1).format(t1);
										out.println(mydis1);
										
										
										%></td>
										<td class="align-middle text-center"><%=rs.getString("waybillNumber") %></td>
										<td class="align-middle text-center"><%=rs.getString("vehicleNumber") %></td>
										<td class="align-middle text-center"><%=rs.getString("type") %></td>
										<td class="align-middle text-center"><%=rs.getString("qty") %></td>
										<td class="align-middle text-center"><%=rs.getString("loadingPoint") %></td>
										<td class="align-middle text-center"><%=rs.getString("dischargingPoint") %></td>
										<td class="align-middle text-center"><%=rs.getString("distance") %></td>
										<td class="align-middle text-center"><%=rs.getString("rate") %></td>
										<!--  /////////////////////////////////////-->
										<td class="align-middle text-center"><% 
										
										double qtty=rs.getDouble("qty");
										double rate = rs.getDouble("rate");
										amount=qtty*rate;
										total+=amount;
										
										out.println(amount);
										
										%></td>
									</tr>


							<%
                                
                                 
                                 }
                               %>

                        <tr style="color:black; font-weight:900px;">
                            <td colspan="11" class="align-right"><strong>TOTAL</strong></td>
                            
                            <td><% out.println(total); %></td>
                        </tr>

						</tbody>

					</table>
					
					
					<div>
					     
					    <br> .....................................<br>
					     <h6 style="color:black; font-size:12px;">For And On Behalf of <br>
					     <%out.println(t_date +" GHANA"); %>
					     </h6>
					
					</div>
					

					<div class="navbar-text "><form action="#">
						<button type="submit" class="btn btn-success btn-secondary "
							name="shortage" onclick="">Print</button>
						<a href="trips.jsp">
							<button type="button" class="btn btn-success btn-secondary "
								name="shortage">back</button>
						</a></form>
					</div>
				</div>
				
				
											 <% 
                            try
                      {

                            	
                      Class.forName("com.mysql.jdbc.Driver").newInstance();
                      
                      String strQuery = "select sum(productLossLit) from trips where monthh='"+f_date+"' and OilCompany='"+t_date+"'";
                      ResultSet rsst = st.executeQuery(strQuery);
                      String disc="";
                      while(rsst.next()){
                      	disc = rsst.getString(1);
                      HttpSession s = request.getSession(false);
                      s.setAttribute("disc",disc);
                      
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

                      String strQuery = "select sum(shortageValueGh) from trips where monthh='"+f_date+"' and OilCompany='"+t_date+"'";
                      ResultSet rest = st.executeQuery(strQuery);
                      String shortage="";
                      while(rest.next()){
                    	  shortage = rest.getString(1);
                      HttpSession s = request.getSession(false);
                      s.setAttribute("shortage",shortage);
                      
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

                      String strQuery = "select sum(overNightAllowance) from trips where monthh='"+f_date+"' and OilCompany='"+t_date+"'";
                      ResultSet rst = st.executeQuery(strQuery);
                      String overnight="";
                      while(rst.next()){
                    	  overnight = rst.getString(1);
                      HttpSession s = request.getSession(false);
                      s.setAttribute("overnight",overnight);
                      
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

                      String strQuery = "select sum(diductionAtSource) from trips where monthh='"+f_date+"' and OilCompany='"+t_date+"'";
                      ResultSet rss = st.executeQuery(strQuery);
                      String payment="";
                      while(rss.next()){
                    	  payment = rss.getString(1);
                      HttpSession s = request.getSession(false);
                      s.setAttribute("payment",payment);
                     
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
                     
                      String strQuery = "select sum(paymentDue) from trips where monthh='"+f_date+"' and OilCompany='"+t_date+"'";
                      ResultSet resu = st.executeQuery(strQuery);
                      String amountreceive="";
                      while(resu.next()){
                    	  amountreceive = resu.getString(1);
                      HttpSession s = request.getSession(false);
                      s.setAttribute("amountreceive",amountreceive);
                      
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

                      String strQuery = "select sum(AmountReceivable) from trips where monthh='"+f_date+"' and OilCompany='"+t_date+"'";
                      ResultSet resul = st.executeQuery(strQuery);
                      String paymentdue1="";
                      while(resul.next()){
                    	  paymentdue1 = resul.getString(1);
                      HttpSession s = request.getSession(false);
                      s.setAttribute("paymentdue",paymentdue1);
                     
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
                      String strQuery = "select sum(cashPaid) from trips where monthh='"+f_date+"' and OilCompany='"+t_date+"'";
                      ResultSet result = st.executeQuery(strQuery);
                      String cashpaid="";
                      while(result.next()){
                    	  cashpaid = result.getString(1);
                      HttpSession s = request.getSession(false);
                      s.setAttribute("cashpaid",cashpaid);
                      
                      }
                      }
                      catch (Exception e){
                      e.printStackTrace();
                      }

                      %>
				

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
					src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>


				<script>
function print_font() {
    var pdf = new jsPDF({
    	orientation: 'landscape', 
    	unit: "mm",
    	format: [700, 1220]
        
    });
    pdf.setFontSize(18);
    
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $('#printMe')[0];

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