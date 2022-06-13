<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="tripError.jsp"%>
<%@page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%@page import="java.sql.*"%>



								<%
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
                                 
								if(request.getParameter("shortage") != null){
									
									Document document = new Document(PageSize.A4.rotate());

								    response.setContentType("test/pdf");
									response.setHeader("Content-Disposition","Inline; filename=\"document.pdf\"");
							        
							    PdfWriter.getInstance(document,response.getOutputStream());
							    document.open();
						       

								    
								   
								    Font font1 = FontFactory.getFont(FontFactory.HELVETICA_BOLD,7, BaseColor.BLACK);
								    Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD,6, BaseColor.BLACK);
								    float[] columnWidths = {1, 10, 5,5,5,5,5,5,5,5,5,3,5,5,5,5,5,5};
								    float[] columnWidths1 = {5, 10, 5,5,5,5,5,5,5,5,5,3,5,5,5,5,5,5};
								    
									PdfPTable tab = new PdfPTable(1);
									tab.addCell(new PdfPCell(new Phrase("                                                                                           "+cop +" "+months)));
									tab.setWidthPercentage(108);
								    
									
									
									 PdfPTable table = new PdfPTable(columnWidths);
									    table.setWidthPercentage(108);
								    
									    PdfPCell c1 = new PdfPCell(new Phrase("#",font));
									    c1.setFixedHeight(10);
									    c1.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c1);
									    PdfPCell c2 = new PdfPCell(new Phrase("NAME",font));
									    c2.setPaddingTop(7);
									    c2.setPaddingBottom(7);
									    c2.setBackgroundColor(BaseColor.CYAN);
									    c2.setPaddingTop(7);
									    c2.setPaddingLeft(35);
									    c2.setFixedHeight(10);
									    table.addCell(c2);
									    PdfPCell c3 = new PdfPCell(new Phrase("LOADING DATE",font));
									    c3.setPaddingTop(7);
									    c3.setPaddingBottom(7);
									    c3.setBackgroundColor(BaseColor.CYAN);
									    c3.setFixedHeight(10);
									    table.addCell(c3);

									    PdfPCell d6 = new PdfPCell(new Phrase("PRODUCT TYPE",font));
									    d6.setPaddingTop(7);
									    d6.setPaddingBottom(7);
									    d6.setBackgroundColor(BaseColor.CYAN);
									    d6.setFixedHeight(10);

									    table.addCell(d6);

									    PdfPCell c4 = new PdfPCell(new Phrase("DISCHARGING DATE",font));
									    c4.setPaddingTop(7);
									    c4.setPaddingBottom(7);
									    c4.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c4);
									    PdfPCell c5 = new PdfPCell(new Phrase("WAYBILL No.",font));
									    c5.setPaddingTop(7);
									    c5.setPaddingBottom(7);
									    c5.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c5);
									    PdfPCell c6 = new PdfPCell(new Phrase("VEHICLE No.",font));
									    c6.setPaddingTop(7);
									    c6.setPaddingBottom(7);
									    c6.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c6);
									    PdfPCell c7 = new PdfPCell(new Phrase("DISCHARGING POINT",font));
									    c7.setPaddingTop(7);
									    c7.setPaddingBottom(7);
									    c7.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c7);
									    PdfPCell c8 = new PdfPCell(new Phrase("PRODUCT  LOSS  LITRES",font));
									    c8.setPaddingTop(7);
									    c8.setPaddingBottom(7);
									    c8.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c8);

									    PdfPCell v8 = new PdfPCell(new Phrase("ALLOWABLE  LOSS  LITRES",font));
									    v8.setPaddingTop(7);
									    v8.setPaddingBottom(7);
									    v8.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(v8);

									    PdfPCell f8 = new PdfPCell(new Phrase("ACTUAL  LOSS  LITRES",font));
									    f8.setPaddingTop(7);
									    f8.setPaddingBottom(7);
									    f8.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(f8);

									    PdfPCell c9 = new PdfPCell(new Phrase("COST PER LITRES",font));
									    c9.setPaddingTop(7);
									    c9.setPaddingBottom(7);
									    c9.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c9);
									    PdfPCell c10 = new PdfPCell(new Phrase("SHORTAGE  VALUE  GH",font));
									    c10.setPaddingTop(7);
									    c10.setPaddingBottom(7);
									    c10.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c10);
									    PdfPCell c11 = new PdfPCell(new Phrase("OVERNIGHT  ALLOWANCE",font));
									    c11.setPaddingTop(7);
									    c11.setPaddingBottom(7);
									    c11.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c11);
									    PdfPCell c12 = new PdfPCell(new Phrase("DEDUCTION AT  SOURCE",font));
									    c12.setPaddingTop(7);
									    c12.setPaddingBottom(7);
									    c12.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c12);
									    PdfPCell c13 = new PdfPCell(new Phrase("PAYMENT  DUE  BVO",font));
									    c13.setPaddingTop(7);
									    c13.setPaddingBottom(7);
									    c13.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c13);
									    PdfPCell c14 = new PdfPCell(new Phrase("AMOUNT  RECIEVABLE",font));
									    c14.setPaddingTop(7);
									    c14.setPaddingBottom(7);
									    c14.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c14);


									    PdfPCell c16 = new PdfPCell(new Phrase("COMPANY",font));
									    c16.setPaddingTop(7);
									    c16.setPaddingBottom(7);
									    c16.setBackgroundColor(BaseColor.CYAN);
									    table.addCell(c16);



						
							    table.setHeaderRows(1);
							    
							    
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
                                
                               
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");
                                
                               
                                String query = "select * from trips where productLossLit >0 and monthh='"+months+"' and OilCompany='"+cop+"'";
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
			                    
                                      
                                    	PdfPCell c150 = new PdfPCell(new Phrase(rs.getString("id"),font1));
        							    table.addCell(c150);
        							    PdfPCell c151 = new PdfPCell(new Phrase(rs.getString("Name"),font1));
        							    table.addCell(c151);
        							    PdfPCell load = new PdfPCell(new Phrase(rs.getString("loadingDate"),font1));
        							    table.addCell(load);
        							    
        							    PdfPCell type = new PdfPCell(new Phrase(rs.getString("type"),font1));
        							    table.addCell(type);
        							    
        							    PdfPCell dis = new PdfPCell(new Phrase(rs.getString("dischargingDate"),font1));
        							    table.addCell(dis);
        							    PdfPCell way = new PdfPCell(new Phrase(rs.getString("waybillNumber"),font1));
        							    table.addCell(way);
        							    PdfPCell vehi = new PdfPCell(new Phrase(rs.getString("vehicleNumber"),font1));
        							    table.addCell(vehi);
        							    PdfPCell charge = new PdfPCell(new Phrase(rs.getString("dischargingPoint"),font1));
        							    table.addCell(charge);
        							    PdfPCell pro = new PdfPCell(new Phrase(rs.getString("rloss"),font1));
        							    table.addCell(pro);
        							    
        							    PdfPCell allow = new PdfPCell(new Phrase(rs.getString("aloss"),font1));
        							    table.addCell(allow);
        							    
        							    PdfPCell actual = new PdfPCell(new Phrase(rs.getString("productLossLit"),font1));
        							    table.addCell(actual);
        							    
        							    PdfPCell cost = new PdfPCell(new Phrase(rs.getString("costPerlit"),font1));
        							    table.addCell(cost);
        							    PdfPCell d2 = new PdfPCell(new Phrase(al,font1));
        							    table.addCell(d2);
        							    PdfPCell d3 = new PdfPCell(new Phrase(rs.getString("overNightAllowance"),font1));
        							    table.addCell(d3);
        							    PdfPCell d4 = new PdfPCell(new Phrase(to,font1));
        							    table.addCell(d4);
        							    PdfPCell d5 = new PdfPCell(new Phrase(te,font1));
        							    table.addCell(d5);
        							    PdfPCell com = new PdfPCell(new Phrase(alo,font1));
        							    table.addCell(com);
        							    
        							    PdfPCell c20 = new PdfPCell(new Phrase(rs.getString("company"),font1));
        							    table.addCell(c20);
        							    
        							   
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

                                    PdfPCell total0 = new PdfPCell(new Phrase("        "+actualloss,font1));
                                    total0.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total0.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total0);

                                    PdfPCell total13 = new PdfPCell(new Phrase("",font1));
                                    total13.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total13.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total13);

                                    PdfPCell total14 = new PdfPCell(new Phrase("  "+valuegh,font1));
                                    total14.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total14.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total14);

                                    PdfPCell total15 = new PdfPCell(new Phrase("  "+night,font1));
                                    total15.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total15.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total15);

                                    PdfPCell total16 = new PdfPCell(new Phrase("  "+atsource,font1));
                                    total16.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total16.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total16);

                                    PdfPCell total22 = new PdfPCell(new Phrase("  "+paymentdue,font1));
                                    total22.setVerticalAlignment(Element.ALIGN_MIDDLE);
                                    total22.setBorder(Rectangle.NO_BORDER);
                                    t.addCell(total22);

                                    PdfPCell total21 = new PdfPCell(new Phrase("  "+amountrecieve,font1));
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

	<!-- /////////////////////////////////////////////Reset password modal  //////////////////////////////////////////////////////////// -->
                

	<div class="col-sm-12 col-xs-12 content pt-3 pl-0">


		<div class="mt-4 mb-4 p-3 lh-sm"
			>
			<h5 class="mb-3" align="center">
				<strong> Trip Report for Shortages</strong>
			</h5>
			<div class="mt-1 mb-4 p-3 button-container">
				<h6 class="mb-2" align="center">
					<%
                     String comp = request.getParameter("oil");
                     String month = request.getParameter("month");
                     HttpSession sess = request.getSession(false);
                     sess.setAttribute("month", month);
                     sess.setAttribute("comp", comp);
                     out.println(comp +" - "+ month);
                     %>
				</h6>
				<div class="scrollable">
					<table class="table table-bordered table-hover table-fixed" id="testData">
						<thead class="thead-light">

								<tr class="text-center">
										<th scope="col">No.</th>
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
						    String f_date = (String)session.getAttribute("month");
                            String t_date = (String)session.getAttribute("comp");
							
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");
                               
                                  String query = "select * from trips where productLossLit >0 and monthh='"+f_date+"' and OilCompany='"+t_date+"'";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
										<tr >
										<td class="align-middle text-center"><%=rs.getString("id") %></td>
										<td class="align-middle text-center"><%=rs.getString("name") %></td>
										<td class="align-middle text-center"><%=rs.getString("monthh") %></td>
										<td class="align-middle text-center"><%=rs.getString("OilCompany") %></td>
										<td class="align-middle text-center"><%=rs.getString("type") %></td>
										<td class="align-middle text-center"><%=rs.getString("loadingDate") %></td>
										<td class="align-middle text-center"><%=rs.getString("dischargingDate") %></td>
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
                      
                      String strQuery = "select sum(productLossLit) from trips where productLossLit >0 and monthh='"+f_date+"' and OilCompany='"+t_date+"'";
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

                      String strQuery = "select sum(shortageValueGh) from trips where productLossLit >0 and monthh='"+f_date+"' and OilCompany='"+t_date+"'";
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

                      String strQuery = "select sum(overNightAllowance) from trips where productLossLit >0 and monthh='"+f_date+"' and OilCompany='"+t_date+"'";
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

                      String strQuery = "select sum(diductionAtSource) from trips where productLossLit >0 and monthh='"+f_date+"' and OilCompany='"+t_date+"'";
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
                     
                      String strQuery = "select sum(paymentDue) from trips where productLossLit >0 and monthh='"+f_date+"' and OilCompany='"+t_date+"'";
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

                      String strQuery = "select sum(AmountReceivable) from trips where productLossLit >0 and monthh='"+f_date+"' and OilCompany='"+t_date+"'";
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
                      String strQuery = "select sum(cashPaid) from trips where productLossLit >0 and monthh='"+f_date+"' and OilCompany='"+t_date+"'";
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