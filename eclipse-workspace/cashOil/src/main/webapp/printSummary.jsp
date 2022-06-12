<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>

<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>
<%@page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>    
    
   
    
<%




String print = request.getParameter("print");
String month = (String)session.getAttribute("month");
String date1 = (String)session.getAttribute("date1");
String date2 = (String)session.getAttribute("date2");


double cum = (Double)session.getAttribute("cum");
double maintenance = (Double)session.getAttribute("maintenance");
double statutory = (Double)session.getAttribute("statutory");
double property = (Double)session.getAttribute("property");
double epa = (Double)session.getAttribute("epa");
double gsa = (Double)session.getAttribute("gsa");
double npa = (Double)session.getAttribute("npa");
double payR = (Double)session.getAttribute("payR");
double water = (Double)session.getAttribute("water");
double gen = (Double)session.getAttribute("gen");
double elec = (Double)session.getAttribute("elec");
double debtRecov = (Double)session.getAttribute("debtRecov");
double debtReceived = (Double)session.getAttribute("debtReceived");
double washingBay = (Double)session.getAttribute("washingBay");
double lube = (Double)session.getAttribute("lube");
double shortf = (Double)session.getAttribute("shortf");
double win = (Double)session.getAttribute("win");
double productSupplid = (Double)session.getAttribute("productSupplid");
double closingStock = (Double)session.getAttribute("closingStock");
double openStock = (Double)session.getAttribute("openStock");

String period ="";
if(month != null){
   // System.out.println("you came here with month");
    period="Summary for "+ month;
}

if(date1 != null){
	//System.out.println("you came here with date");
	period ="Summary between "+ date1+" "+ date2;
}



if(print != null){

Document document = new Document(PageSize.A3.rotate());



Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD,6, BaseColor.BLACK);

float[] columnWidths = {2, 4, 5,3,4,4,4,5,4,4,5,5,4,5,4,5,4,4,4,4,5,5,5};
//float[] columnWidths1 = {5, 10, 5,5,5,5,5,5,5,5,5,3,5,5,5,5,5,5};

   response.setContentType("test/pdf");
	response.setHeader("Content-Disposition","Inline; filename=\"document.pdf\"");
  
PdfWriter.getInstance(document,response.getOutputStream());
document.open();

PdfPTable tab = new PdfPTable(1);
tab.addCell(new PdfPCell(new Phrase("                                                                                                                                              "+ period)));
tab.setWidthPercentage(108);



PdfPTable table = new PdfPTable(columnWidths);
table.setWidthPercentage(100);


Font font1 = FontFactory.getFont(FontFactory.HELVETICA_BOLD,7, BaseColor.BLACK);

PdfPCell c1 = new PdfPCell(new Phrase("#",font));
c1.setPaddingTop(7);
c1.setPaddingBottom(7);

c1.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c1);
PdfPCell c2 = new PdfPCell(new Phrase("OpenStock",font));
c2.setBackgroundColor(new BaseColor(233, 246, 249));
//c2.setPaddingTop(7);
//c2.setPaddingLeft(35);
c2.setFixedHeight(10);
table.addCell(c2);
PdfPCell c3 = new PdfPCell(new Phrase("Bank Lodgements",font));
c3.setBackgroundColor(new BaseColor(233, 246, 249));
c3.setFixedHeight(10);
table.addCell(c3);

PdfPCell d6 = new PdfPCell(new Phrase("Closing Stock",font));
d6.setBackgroundColor(new BaseColor(233, 246, 249));
d6.setFixedHeight(10);

table.addCell(d6);

PdfPCell c4 = new PdfPCell(new Phrase("Total Product",font));
c4.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c4);
PdfPCell c5 = new PdfPCell(new Phrase("Win Fall",font));
c5.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c5);
PdfPCell c6 = new PdfPCell(new Phrase("Short Fall",font));
c6.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c6);
PdfPCell c7 = new PdfPCell(new Phrase("Cummulative Gain",font));
c7.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c7);
PdfPCell c8 = new PdfPCell(new Phrase("Lube Bay",font));
c8.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c8);

PdfPCell v8 = new PdfPCell(new Phrase("Washing Bay",font));
v8.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(v8);

PdfPCell f8 = new PdfPCell(new Phrase("Debts Receivable",font));
f8.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(f8);

PdfPCell c9 = new PdfPCell(new Phrase("Debt Recovery",font));
c9.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c9);
PdfPCell c10 = new PdfPCell(new Phrase("Electricity",font));
c10.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c10);

PdfPCell c15 = new PdfPCell(new Phrase("Gen-Set",font));
c15.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c15);


PdfPCell c11 = new PdfPCell(new Phrase("Water",font));
c11.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c11);
PdfPCell c12 = new PdfPCell(new Phrase("Pay Roll",font));
c12.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c12);
PdfPCell c13 = new PdfPCell(new Phrase("T&T",font));
c13.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c13);
PdfPCell c14 = new PdfPCell(new Phrase("NPA",font));
c14.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c14);


PdfPCell c16 = new PdfPCell(new Phrase("GSA",font));
c16.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c16);

PdfPCell c17 = new PdfPCell(new Phrase("EPA",font));
c17.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c17);

PdfPCell c18 = new PdfPCell(new Phrase("Property Rate",font));
c18.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c18);

PdfPCell c19 = new PdfPCell(new Phrase("Statutory",font));
c19.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c19);

PdfPCell c20 = new PdfPCell(new Phrase("Maintenance",font));
c20.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c20);

table.setHeaderRows(1);

PdfPCell c150 = new PdfPCell(new Phrase("1",font1));
c150.setBackgroundColor(new BaseColor(216, 241, 249));
c150.setPaddingTop(7);
c150.setPaddingBottom(7);
table.addCell(c150);

PdfPCell c151 = new PdfPCell(new Phrase(""+openStock,font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
c151.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c151);

PdfPCell c1511 = new PdfPCell(new Phrase("",font1));
c1511.setPaddingTop(7);
c1511.setPaddingBottom(7);
table.addCell(c1511);

PdfPCell c1521 = new PdfPCell(new Phrase("",font1));
c1521.setPaddingTop(7);
c1521.setPaddingBottom(7);
table.addCell(c1521);

PdfPCell c1531 = new PdfPCell(new Phrase("",font1));
c1531.setPaddingTop(7);
c1531.setPaddingBottom(7);
table.addCell(c1531);

PdfPCell c1541 = new PdfPCell(new Phrase("",font1));
c1541.setPaddingTop(7);
c1541.setPaddingBottom(7);
table.addCell(c1541);

PdfPCell c1551 = new PdfPCell(new Phrase("",font1));
c1551.setPaddingTop(7);
c1551.setPaddingBottom(7);
table.addCell(c1551);

PdfPCell c1561 = new PdfPCell(new Phrase("",font1));
c1561.setPaddingTop(7);
c1561.setPaddingBottom(7);
table.addCell(c1561);

PdfPCell c1571 = new PdfPCell(new Phrase("",font1));
c1571.setPaddingTop(7);
c1571.setPaddingBottom(7);
table.addCell(c1571);

PdfPCell c1581 = new PdfPCell(new Phrase("",font1));
c1581.setPaddingTop(7);
c1581.setPaddingBottom(7);
table.addCell(c1581);

PdfPCell c1591 = new PdfPCell(new Phrase("",font1));
c1591.setPaddingTop(7);
c1591.setPaddingBottom(7);
table.addCell(c1591);

PdfPCell c15101 = new PdfPCell(new Phrase("",font1));
c15101.setPaddingTop(7);
c15101.setPaddingBottom(7);
table.addCell(c15101);

PdfPCell c15111 = new PdfPCell(new Phrase("",font1));
c15111.setPaddingTop(7);
c15111.setPaddingBottom(7);
table.addCell(c15111);

PdfPCell c15121 = new PdfPCell(new Phrase("",font1));
c15121.setPaddingTop(7);
c15121.setPaddingBottom(7);
table.addCell(c15121);

PdfPCell c15131 = new PdfPCell(new Phrase("",font1));
c15131.setPaddingTop(7);
c15131.setPaddingBottom(7);
table.addCell(c15131);

PdfPCell c15141 = new PdfPCell(new Phrase("",font1));
c15141.setPaddingTop(7);
c15141.setPaddingBottom(7);
table.addCell(c15141);

PdfPCell c15151 = new PdfPCell(new Phrase("",font1));
c15151.setPaddingTop(7);
c15151.setPaddingBottom(7);
table.addCell(c15151);

PdfPCell c15161 = new PdfPCell(new Phrase("",font1));
c15161.setPaddingTop(7);
c15161.setPaddingBottom(7);
table.addCell(c15161);

PdfPCell c15171 = new PdfPCell(new Phrase("",font1));
c15171.setPaddingTop(7);
c15171.setPaddingBottom(7);
table.addCell(c15171);

PdfPCell c15181 = new PdfPCell(new Phrase("",font1));
c15181.setPaddingTop(7);
c15181.setPaddingBottom(7);
table.addCell(c15181);

PdfPCell c15191 = new PdfPCell(new Phrase("",font1));
c15191.setPaddingTop(7);
c15191.setPaddingBottom(7);
table.addCell(c15191);

PdfPCell c15201 = new PdfPCell(new Phrase("",font1));
c15201.setPaddingTop(7);
c15201.setPaddingBottom(7);
table.addCell(c15201);

PdfPCell c15211 = new PdfPCell(new Phrase("",font1));
c15211.setPaddingTop(7);
c15211.setPaddingBottom(7);
table.addCell(c15211);

PdfPCell c15221 = new PdfPCell(new Phrase("2",font1));
c15221.setBackgroundColor(new BaseColor(216, 241, 249));
c15221.setPaddingTop(7);
c15221.setPaddingBottom(7);
table.addCell(c15221);


PdfPCell c = new PdfPCell(new Phrase("",font1));

table.addCell(c);

PdfPCell d = new PdfPCell(new Phrase(""+session.getAttribute("lodgement"),font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
d.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(d);

PdfPCell d1 = new PdfPCell(new Phrase("",font1));
d1.setPaddingTop(7);
d1.setPaddingBottom(7);
table.addCell(d1);

PdfPCell d2 = new PdfPCell(new Phrase("",font1));
d2.setPaddingTop(7);
d2.setPaddingBottom(7);
table.addCell(d2);

PdfPCell d3 = new PdfPCell(new Phrase("",font1));
d3.setPaddingTop(7);
d3.setPaddingBottom(7);
table.addCell(d3);

PdfPCell d4 = new PdfPCell(new Phrase("",font1));
d4.setPaddingTop(7);
d4.setPaddingBottom(7);
table.addCell(d4);

PdfPCell d5 = new PdfPCell(new Phrase("",font1));
d5.setPaddingTop(7);
d5.setPaddingBottom(7);
table.addCell(c1551);

PdfPCell e = new PdfPCell(new Phrase("",font1));
e.setPaddingTop(7);
e.setPaddingBottom(7);
table.addCell(e);

PdfPCell e1 = new PdfPCell(new Phrase("",font1));
e1.setPaddingTop(7);
e1.setPaddingBottom(7);
table.addCell(e1);

PdfPCell e2 = new PdfPCell(new Phrase("",font1));
e2.setPaddingTop(7);
e2.setPaddingBottom(7);
table.addCell(e2);

PdfPCell e3 = new PdfPCell(new Phrase("",font1));
e3.setPaddingTop(7);
e3.setPaddingBottom(7);
table.addCell(e3);

PdfPCell e4 = new PdfPCell(new Phrase("",font1));
e4.setPaddingTop(7);
e4.setPaddingBottom(7);
table.addCell(e4);

PdfPCell e5 = new PdfPCell(new Phrase("",font1));
e5.setPaddingTop(7);
e5.setPaddingBottom(7);
table.addCell(e5);

PdfPCell e6 = new PdfPCell(new Phrase("",font1));
e6.setPaddingTop(7);
e6.setPaddingBottom(7);
table.addCell(e6);

PdfPCell e7 = new PdfPCell(new Phrase("",font1));
e7.setPaddingTop(7);
e7.setPaddingBottom(7);
table.addCell(e7);

PdfPCell e8 = new PdfPCell(new Phrase("",font1));
e8.setPaddingTop(7);
e8.setPaddingBottom(7);
table.addCell(e8);

PdfPCell e9 = new PdfPCell(new Phrase("",font1));
e9.setPaddingTop(7);
e9.setPaddingBottom(7);
table.addCell(e9);

PdfPCell e10 = new PdfPCell(new Phrase("",font1));
e10.setPaddingTop(7);
e10.setPaddingBottom(7);
table.addCell(e10);

PdfPCell e11 = new PdfPCell(new Phrase("",font1));
e11.setPaddingTop(7);
e11.setPaddingBottom(7);
table.addCell(e11);

PdfPCell e12 = new PdfPCell(new Phrase("",font1));
e12.setPaddingTop(7);
e12.setPaddingBottom(7);
table.addCell(e12);

PdfPCell e13 = new PdfPCell(new Phrase("",font1));
e13.setPaddingTop(7);
e13.setPaddingBottom(7);
table.addCell(e13);

PdfPCell e14 = new PdfPCell(new Phrase("",font1));
e14.setPaddingTop(7);
e14.setPaddingBottom(7);
table.addCell(e14);

PdfPCell e15 = new PdfPCell(new Phrase("3",font1));
e15.setBackgroundColor(new BaseColor(216, 241, 249));
e15.setPaddingTop(7);
e15.setPaddingBottom(7);
table.addCell(e15);

PdfPCell e16 = new PdfPCell(new Phrase("",font1));
e16.setPaddingTop(7);
e16.setPaddingBottom(7);
table.addCell(e16);



PdfPCell c31 = new PdfPCell(new Phrase("",font1));

c31.setPaddingTop(7);
c31.setPaddingBottom(7);
table.addCell(c31);


PdfPCell c32 = new PdfPCell(new Phrase(""+closingStock,font1));
c32.setBackgroundColor(new BaseColor(233, 246, 249));
table.addCell(c32);

PdfPCell d11 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11);

PdfPCell d12 = new PdfPCell(new Phrase("",font1));
d12.setPaddingTop(7);
d12.setPaddingBottom(7);
table.addCell(d12);

PdfPCell d21 = new PdfPCell(new Phrase("",font1));
d21.setPaddingTop(7);
d21.setPaddingBottom(7);
table.addCell(d21);

PdfPCell d31 = new PdfPCell(new Phrase("",font1));
d31.setPaddingTop(7);
d31.setPaddingBottom(7);
table.addCell(d31);

PdfPCell d41 = new PdfPCell(new Phrase("",font1));
d41.setPaddingTop(7);
d41.setPaddingBottom(7);
table.addCell(d41);

PdfPCell d51 = new PdfPCell(new Phrase("",font1));
d51.setPaddingTop(7);
d51.setPaddingBottom(7);
table.addCell(d51);

PdfPCell ec11 = new PdfPCell(new Phrase("",font1));
ec11.setPaddingTop(7);
ec11.setPaddingBottom(7);
table.addCell(ec11);

PdfPCell e1c = new PdfPCell(new Phrase("",font1));
e1c.setPaddingTop(7);
e1c.setPaddingBottom(7);
table.addCell(e1c);

PdfPCell e2c = new PdfPCell(new Phrase("",font1));
e2c.setPaddingTop(7);
e2c.setPaddingBottom(7);
table.addCell(e2c);

PdfPCell e3c = new PdfPCell(new Phrase("",font1));
e3c.setPaddingTop(7);
e3c.setPaddingBottom(7);
table.addCell(e3c);

PdfPCell e4e = new PdfPCell(new Phrase("",font1));
e4e.setPaddingTop(7);
e4e.setPaddingBottom(7);
table.addCell(e4e);

PdfPCell e5e = new PdfPCell(new Phrase("",font1));
e5e.setPaddingTop(7);
e5e.setPaddingBottom(7);
table.addCell(e5e);

PdfPCell e6e = new PdfPCell(new Phrase("",font1));
e6e.setPaddingTop(7);
e6e.setPaddingBottom(7);
table.addCell(e6e);

PdfPCell e7e = new PdfPCell(new Phrase("",font1));
e7e.setPaddingTop(7);
e7e.setPaddingBottom(7);
table.addCell(e7e);

PdfPCell e8e = new PdfPCell(new Phrase("",font1));
e8e.setPaddingTop(7);
e8e.setPaddingBottom(7);
table.addCell(e8e);

PdfPCell e9e = new PdfPCell(new Phrase("",font1));
e9e.setPaddingTop(7);
e9e.setPaddingBottom(7);
table.addCell(e9e);

PdfPCell e10e = new PdfPCell(new Phrase("",font1));
e10e.setPaddingTop(7);
e10e.setPaddingBottom(7);
table.addCell(e10e);

PdfPCell e11e = new PdfPCell(new Phrase("",font1));
e11e.setPaddingTop(7);
e11e.setPaddingBottom(7);
table.addCell(e11e);

PdfPCell e12e = new PdfPCell(new Phrase("",font1));
e12e.setPaddingTop(7);
e12e.setPaddingBottom(7);
table.addCell(e12e);

PdfPCell e13e = new PdfPCell(new Phrase("4",font1));
e13e.setBackgroundColor(new BaseColor(216, 241, 249));
e13e.setPaddingTop(7);
e13e.setPaddingBottom(7);
table.addCell(e13e);

PdfPCell e14e= new PdfPCell(new Phrase("",font1));
e14e.setPaddingTop(7);
e14e.setPaddingBottom(7);
table.addCell(e14e);

PdfPCell e15e = new PdfPCell(new Phrase("",font1));
e15e.setPaddingTop(7);
e15e.setPaddingBottom(7);
table.addCell(e15e);

PdfPCell e16e = new PdfPCell(new Phrase("",font1));
e16e.setPaddingTop(7);
e16e.setPaddingBottom(7);
table.addCell(e16e);


PdfPCell e15ee = new PdfPCell(new Phrase(""+productSupplid,font1));
e15ee.setBackgroundColor(new BaseColor(233, 246, 249));
e15ee.setPaddingTop(7);
e15ee.setPaddingBottom(7);
table.addCell(e15ee);

PdfPCell e16ee = new PdfPCell(new Phrase("",font1));
e16ee.setPaddingTop(7);
e16ee.setPaddingBottom(7);
table.addCell(e16ee);



PdfPCell c31e = new PdfPCell(new Phrase("",font1));

c31e.setPaddingTop(7);
c31e.setPaddingBottom(7);
table.addCell(c31e);


PdfPCell c32e = new PdfPCell(new Phrase("",font1));

table.addCell(c32e);

PdfPCell d11e = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11e);

PdfPCell d12e = new PdfPCell(new Phrase("",font1));
d12e.setPaddingTop(7);
d12e.setPaddingBottom(7);
table.addCell(d12e);

PdfPCell d21e = new PdfPCell(new Phrase("",font1));
d21e.setPaddingTop(7);
d21e.setPaddingBottom(7);
table.addCell(d21e);

PdfPCell d31e = new PdfPCell(new Phrase("",font1));
d31e.setPaddingTop(7);
d31e.setPaddingBottom(7);
table.addCell(d31e);

PdfPCell d41e = new PdfPCell(new Phrase("",font1));
d41e.setPaddingTop(7);
d41e.setPaddingBottom(7);
table.addCell(d41e);

PdfPCell d51e = new PdfPCell(new Phrase("",font1));
d51e.setPaddingTop(7);
d51e.setPaddingBottom(7);
table.addCell(d51e);

PdfPCell ec11e = new PdfPCell(new Phrase("",font1));
ec11e.setPaddingTop(7);
ec11e.setPaddingBottom(7);
table.addCell(ec11e);

PdfPCell e1ce = new PdfPCell(new Phrase("",font1));
e1ce.setPaddingTop(7);
e1ce.setPaddingBottom(7);
table.addCell(e1ce);

PdfPCell e2ce = new PdfPCell(new Phrase("",font1));
e2ce.setPaddingTop(7);
e2ce.setPaddingBottom(7);
table.addCell(e2ce);

PdfPCell e3ce = new PdfPCell(new Phrase("",font1));
e3ce.setPaddingTop(7);
e3ce.setPaddingBottom(7);
table.addCell(e3ce);

PdfPCell e4ee = new PdfPCell(new Phrase("",font1));
e4ee.setPaddingTop(7);
e4ee.setPaddingBottom(7);
table.addCell(e4ee);

PdfPCell e5ee = new PdfPCell(new Phrase("",font1));
e5ee.setPaddingTop(7);
e5ee.setPaddingBottom(7);
table.addCell(e5ee);

PdfPCell e6ee = new PdfPCell(new Phrase("",font1));
e6ee.setPaddingTop(7);
e6ee.setPaddingBottom(7);
table.addCell(e6ee);

PdfPCell e7ee = new PdfPCell(new Phrase("",font1));
e7ee.setPaddingTop(7);
e7ee.setPaddingBottom(7);
table.addCell(e7ee);

PdfPCell e8ee = new PdfPCell(new Phrase("",font1));
e8ee.setPaddingTop(7);
e8ee.setPaddingBottom(7);
table.addCell(e8ee);

PdfPCell e9ee = new PdfPCell(new Phrase("5",font1));
e9ee.setBackgroundColor(new BaseColor(216, 241, 249));
e9ee.setPaddingTop(7);
e9ee.setPaddingBottom(7);
table.addCell(e9ee);

PdfPCell e10ee = new PdfPCell(new Phrase("",font1));
e10ee.setPaddingTop(7);
e10ee.setPaddingBottom(7);
table.addCell(e10ee);

PdfPCell e11ee = new PdfPCell(new Phrase("",font1));
e11ee.setPaddingTop(7);
e11ee.setPaddingBottom(7);
table.addCell(e11ee);

PdfPCell e12ee = new PdfPCell(new Phrase("",font1));
e12ee.setPaddingTop(7);
e12ee.setPaddingBottom(7);
table.addCell(e12ee);

PdfPCell e13ee = new PdfPCell(new Phrase("",font1));
e13ee.setPaddingTop(7);
e13ee.setPaddingBottom(7);
table.addCell(e13ee);

PdfPCell e14ee= new PdfPCell(new Phrase(""+win,font1));
e14ee.setBackgroundColor(new BaseColor(233, 246, 249));
e14ee.setPaddingTop(7);
e14ee.setPaddingBottom(7);
table.addCell(e14ee);

PdfPCell e15ee1 = new PdfPCell(new Phrase("",font1));
e15ee1.setPaddingTop(7);
e15ee1.setPaddingBottom(7);
table.addCell(e15ee1);

PdfPCell e16ee1= new PdfPCell(new Phrase("",font1));
e16ee1.setPaddingTop(7);
e16ee1.setPaddingBottom(7);
table.addCell(e16ee1);




PdfPCell e15e1 = new PdfPCell(new Phrase("",font1));
//e15e1.setBackgroundColor(BaseColor.CYAN);
e15e1.setPaddingTop(7);
e15e1.setPaddingBottom(7);
table.addCell(e15e1);

PdfPCell e16e1 = new PdfPCell(new Phrase("",font1));
e16e1.setPaddingTop(7);
e16e1.setPaddingBottom(7);
table.addCell(e16e1);



PdfPCell c31e1 = new PdfPCell(new Phrase("",font1));

c31e1.setPaddingTop(7);
c31e1.setPaddingBottom(7);
table.addCell(c31e1);


PdfPCell c32e1 = new PdfPCell(new Phrase("",font1));

table.addCell(c32e1);

PdfPCell d11e1 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11e1);

PdfPCell d12e1 = new PdfPCell(new Phrase("",font1));
d12e1.setPaddingTop(7);
d12e1.setPaddingBottom(7);
table.addCell(d12e1);

PdfPCell d21e1 = new PdfPCell(new Phrase("",font1));
d21e1.setPaddingTop(7);
d21e1.setPaddingBottom(7);
table.addCell(d21e1);

PdfPCell d31e1 = new PdfPCell(new Phrase("",font1));
d31e1.setPaddingTop(7);
d31e1.setPaddingBottom(7);
table.addCell(d31e1);

PdfPCell d41e1 = new PdfPCell(new Phrase("",font1));
d41e1.setPaddingTop(7);
d41e1.setPaddingBottom(7);
table.addCell(d41e1);

PdfPCell d51e1 = new PdfPCell(new Phrase("",font1));
d51e1.setPaddingTop(7);
d51e1.setPaddingBottom(7);
table.addCell(d51e1);

PdfPCell ec11e1 = new PdfPCell(new Phrase("",font1));
ec11e1.setPaddingTop(7);
ec11e1.setPaddingBottom(7);
table.addCell(ec11e1);

PdfPCell e1ce1 = new PdfPCell(new Phrase("",font1));
e1ce1.setPaddingTop(7);
e1ce1.setPaddingBottom(7);
table.addCell(e1ce1);

PdfPCell e2ce1 = new PdfPCell(new Phrase("",font1));
e2ce1.setPaddingTop(7);
e2ce1.setPaddingBottom(7);
table.addCell(e2ce1);

PdfPCell e3ce1 = new PdfPCell(new Phrase("",font1));
e3ce1.setPaddingTop(7);
e3ce1.setPaddingBottom(7);
table.addCell(e3ce1);

PdfPCell e4ee1 = new PdfPCell(new Phrase("",font1));
e4ee1.setPaddingTop(7);
e4ee1.setPaddingBottom(7);
table.addCell(e4ee1);

PdfPCell e5ee1 = new PdfPCell(new Phrase("6",font1));
e5ee1.setBackgroundColor(new BaseColor(216, 241, 249));
e5ee1.setPaddingTop(7);
e5ee1.setPaddingBottom(7);
table.addCell(e5ee1);

PdfPCell e6ee1 = new PdfPCell(new Phrase("",font1));
e6ee1.setPaddingTop(7);
e6ee1.setPaddingBottom(7);
table.addCell(e6ee1);

PdfPCell e7ee1 = new PdfPCell(new Phrase("",font1));
e7ee1.setPaddingTop(7);
e7ee1.setPaddingBottom(7);
table.addCell(e7ee1);

PdfPCell e8ee1 = new PdfPCell(new Phrase("",font1));
e8ee1.setPaddingTop(7);
e8ee1.setPaddingBottom(7);
table.addCell(e8ee1);

PdfPCell e9ee1 = new PdfPCell(new Phrase("",font1));
e9ee1.setPaddingTop(7);
e9ee1.setPaddingBottom(7);
table.addCell(e9ee1);

PdfPCell e10ee1 = new PdfPCell(new Phrase("",font1));
e10ee1.setPaddingTop(7);
e10ee1.setPaddingBottom(7);
table.addCell(e10ee1);

PdfPCell e11ee1 = new PdfPCell(new Phrase(""+shortf,font1));
e11ee1.setBackgroundColor(new BaseColor(233, 246, 249));
e11ee1.setPaddingTop(7);
e11ee1.setPaddingBottom(7);
table.addCell(e11ee1);

PdfPCell e12ee1 = new PdfPCell(new Phrase("",font1));
e12ee1.setPaddingTop(7);
e12ee1.setPaddingBottom(7);
table.addCell(e12ee1);

PdfPCell e13e1 = new PdfPCell(new Phrase("",font1));
e13e1.setPaddingTop(7);
e13e1.setPaddingBottom(7);
table.addCell(e13e1);

PdfPCell e14e1= new PdfPCell(new Phrase("",font1));
e14e1.setPaddingTop(7);
e14e1.setPaddingBottom(7);
table.addCell(e14e1);

PdfPCell e15e2 = new PdfPCell(new Phrase("",font1));
e15e2.setPaddingTop(7);
e15e2.setPaddingBottom(7);
table.addCell(e15e2);

PdfPCell e16e12 = new PdfPCell(new Phrase("",font1));
e16e12.setPaddingTop(7);
e16e12.setPaddingBottom(7);
table.addCell(e16e12);




PdfPCell e152 = new PdfPCell(new Phrase("",font1));
//e152.setBackgroundColor(BaseColor.CYAN);
e152.setPaddingTop(7);
e152.setPaddingBottom(7);
table.addCell(e152);

PdfPCell e162 = new PdfPCell(new Phrase("",font1));
e162.setPaddingTop(7);
e162.setPaddingBottom(7);
table.addCell(e162);



PdfPCell c312 = new PdfPCell(new Phrase("",font1));

c312.setPaddingTop(7);
c312.setPaddingBottom(7);
table.addCell(c312);


PdfPCell c322 = new PdfPCell(new Phrase("",font1));

table.addCell(c322);

PdfPCell d112 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d112);

PdfPCell d122 = new PdfPCell(new Phrase("",font1));
d122.setPaddingTop(7);
d122.setPaddingBottom(7);
table.addCell(d122);

PdfPCell d212 = new PdfPCell(new Phrase("",font1));
d212.setPaddingTop(7);
d212.setPaddingBottom(7);
table.addCell(d212);

PdfPCell d312 = new PdfPCell(new Phrase("",font1));
d312.setPaddingTop(7);
d312.setPaddingBottom(7);
table.addCell(d312);

PdfPCell d412 = new PdfPCell(new Phrase("",font1));
d412.setPaddingTop(7);
d412.setPaddingBottom(7);
table.addCell(d412);

PdfPCell d512 = new PdfPCell(new Phrase("",font1));
d512.setPaddingTop(7);
d512.setPaddingBottom(7);
table.addCell(d512);

PdfPCell ec112 = new PdfPCell(new Phrase("",font1));
ec112.setPaddingTop(7);
ec112.setPaddingBottom(7);
table.addCell(ec112);

PdfPCell e1c2 = new PdfPCell(new Phrase("7",font1));
e1c2.setBackgroundColor(new BaseColor(216, 241, 249));
e1c2.setPaddingTop(7);
e1c2.setPaddingBottom(7);
table.addCell(e1c2);

PdfPCell e2c2 = new PdfPCell(new Phrase("",font1));
e2c2.setPaddingTop(7);
e2c2.setPaddingBottom(7);
table.addCell(e2c2);

PdfPCell e3c2 = new PdfPCell(new Phrase("",font1));
e3c2.setPaddingTop(7);
e3c2.setPaddingBottom(7);
table.addCell(e3c2);

PdfPCell e4e2 = new PdfPCell(new Phrase("",font1));
e4e2.setPaddingTop(7);
e4e2.setPaddingBottom(7);
table.addCell(e4e2);

PdfPCell e5e2 = new PdfPCell(new Phrase("",font1));
e5e2.setPaddingTop(7);
e5e2.setPaddingBottom(7);
table.addCell(e5e2);

PdfPCell e6e2 = new PdfPCell(new Phrase("",font1));
e6e2.setPaddingTop(7);
e6e2.setPaddingBottom(7);
table.addCell(e6e2);

PdfPCell e7e2 = new PdfPCell(new Phrase("",font1));
e7e2.setPaddingTop(7);
e7e2.setPaddingBottom(7);
table.addCell(e7e2);

PdfPCell e8e2 = new PdfPCell(new Phrase(""+cum,font1));
e8e2.setBackgroundColor(new BaseColor(233, 246, 249));
e8e2.setPaddingTop(7);
e8e2.setPaddingBottom(7);
table.addCell(e8e2);

PdfPCell e9e2 = new PdfPCell(new Phrase("",font1));
e9e2.setPaddingTop(7);
e9e2.setPaddingBottom(7);
table.addCell(e9e2);

PdfPCell e10e2 = new PdfPCell(new Phrase("",font1));
e10e2.setPaddingTop(7);
e10e2.setPaddingBottom(7);
table.addCell(e10e2);

PdfPCell e11e2 = new PdfPCell(new Phrase("",font1));
e11e2.setPaddingTop(7);
e11e2.setPaddingBottom(7);
table.addCell(e11e2);

PdfPCell e12e2 = new PdfPCell(new Phrase("",font1));
e12e2.setPaddingTop(7);
e12e2.setPaddingBottom(7);
table.addCell(e12e2);

PdfPCell e13e2 = new PdfPCell(new Phrase("",font1));
e13e2.setPaddingTop(7);
e13e2.setPaddingBottom(7);
table.addCell(e13e2);

PdfPCell e14e2= new PdfPCell(new Phrase("",font1));
e14e2.setPaddingTop(7);
e14e2.setPaddingBottom(7);
table.addCell(e14e2);

PdfPCell e15e22 = new PdfPCell(new Phrase("",font1));
e15e22.setPaddingTop(7);
e15e22.setPaddingBottom(7);
table.addCell(e15e22);

PdfPCell e16e3 = new PdfPCell(new Phrase("",font1));
e16e3.setPaddingTop(7);
e16e3.setPaddingBottom(7);
table.addCell(e16e3);





PdfPCell e15c1 = new PdfPCell(new Phrase("",font1));
//e15c1.setBackgroundColor(BaseColor.CYAN);
e15c1.setPaddingTop(7);
e15c1.setPaddingBottom(7);
table.addCell(e15c1);

PdfPCell e16c1 = new PdfPCell(new Phrase("",font1));
e16c1.setPaddingTop(7);
e16c1.setPaddingBottom(7);
table.addCell(e16c1);



PdfPCell c31c1 = new PdfPCell(new Phrase("",font1));

c31c1.setPaddingTop(7);
c31c1.setPaddingBottom(7);
table.addCell(c31c1);


PdfPCell c32c1 = new PdfPCell(new Phrase("",font1));

table.addCell(c32c1);

PdfPCell d11c1 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11c1);

PdfPCell d12c1 = new PdfPCell(new Phrase("",font1));
d12c1.setPaddingTop(7);
d12c1.setPaddingBottom(7);
table.addCell(d12c1);

PdfPCell d21c1 = new PdfPCell(new Phrase("",font1));
d21c1.setPaddingTop(7);
d21c1.setPaddingBottom(7);
table.addCell(d21c1);

PdfPCell d31c1 = new PdfPCell(new Phrase("8",font1));
d31c1.setBackgroundColor(new BaseColor(216, 241, 249));
d31c1.setPaddingTop(7);
d31c1.setPaddingBottom(7);
table.addCell(d31c1);

PdfPCell d41c1 = new PdfPCell(new Phrase("",font1));
d41c1.setPaddingTop(7);
d41c1.setPaddingBottom(7);
table.addCell(d41c1);

PdfPCell d51d1 = new PdfPCell(new Phrase("",font1));
d51d1.setPaddingTop(7);
d51d1.setPaddingBottom(7);
table.addCell(d51d1);

PdfPCell ec11d1 = new PdfPCell(new Phrase("",font1));
ec11d1.setPaddingTop(7);
ec11d1.setPaddingBottom(7);
table.addCell(ec11d1);

PdfPCell e1cd1 = new PdfPCell(new Phrase("",font1));
e1cd1.setPaddingTop(7);
e1cd1.setPaddingBottom(7);
table.addCell(e1cd1);

PdfPCell e2cd1 = new PdfPCell(new Phrase("",font1));
e2cd1.setPaddingTop(7);
e2cd1.setPaddingBottom(7);
table.addCell(e2cd1);

PdfPCell e3cd1 = new PdfPCell(new Phrase("",font1));
e3cd1.setPaddingTop(7);
e3cd1.setPaddingBottom(7);
table.addCell(e3cd1);

PdfPCell e4ed1 = new PdfPCell(new Phrase("",font1));
e4ed1.setPaddingTop(7);
e4ed1.setPaddingBottom(7);
table.addCell(e4ed1);

PdfPCell e5ed1 = new PdfPCell(new Phrase(""+lube,font1));
e5ed1.setBackgroundColor(new BaseColor(233, 246, 249));
e5ed1.setPaddingTop(7);
e5ed1.setPaddingBottom(7);
table.addCell(e5ed1);

PdfPCell e6ed1 = new PdfPCell(new Phrase("",font1));
e6ed1.setPaddingTop(7);
e6ed1.setPaddingBottom(7);
table.addCell(e6ed1);

PdfPCell e7ed1 = new PdfPCell(new Phrase("",font1));
e7ed1.setPaddingTop(7);
e7ed1.setPaddingBottom(7);
table.addCell(e7ed1);

PdfPCell e8ed1 = new PdfPCell(new Phrase("",font1));
e8ed1.setPaddingTop(7);
e8ed1.setPaddingBottom(7);
table.addCell(e8ed1);

PdfPCell e9ed1 = new PdfPCell(new Phrase("",font1));
e9ed1.setPaddingTop(7);
e9ed1.setPaddingBottom(7);
table.addCell(e9ed1);

PdfPCell e10ed1 = new PdfPCell(new Phrase("",font1));
e10ed1.setPaddingTop(7);
e10ed1.setPaddingBottom(7);
table.addCell(e10ed1);

PdfPCell e11ed1 = new PdfPCell(new Phrase("",font1));
e11ed1.setPaddingTop(7);
e11ed1.setPaddingBottom(7);
table.addCell(e11ed1);

PdfPCell e12ed1 = new PdfPCell(new Phrase("",font1));
e12ed1.setPaddingTop(7);
e12ed1.setPaddingBottom(7);
table.addCell(e12ed1);

PdfPCell e13ed1 = new PdfPCell(new Phrase("",font1));
e13ed1.setPaddingTop(7);
e13ed1.setPaddingBottom(7);
table.addCell(e13ed1);

PdfPCell e14ed1= new PdfPCell(new Phrase("",font1));
e14ed1.setPaddingTop(7);
e14ed1.setPaddingBottom(7);
table.addCell(e14ed1);

PdfPCell e15ed1 = new PdfPCell(new Phrase("",font1));
e15ed1.setPaddingTop(7);
e15ed1.setPaddingBottom(7);
table.addCell(e15ed1);

PdfPCell e16ed1 = new PdfPCell(new Phrase("",font1));
e16ed1.setPaddingTop(7);
e16ed1.setPaddingBottom(7);
table.addCell(e16ed1);







PdfPCell e15f1 = new PdfPCell(new Phrase("",font1));
//e15f1.setBackgroundColor(BaseColor.CYAN);
e15f1.setPaddingTop(7);
e15f1.setPaddingBottom(7);
table.addCell(e15f1);

PdfPCell e16f1 = new PdfPCell(new Phrase("",font1));
e16f1.setPaddingTop(7);
e16f1.setPaddingBottom(7);
table.addCell(e16f1);



PdfPCell c31f1 = new PdfPCell(new Phrase("",font1));

c31f1.setPaddingTop(7);
c31f1.setPaddingBottom(7);
table.addCell(c31f1);


PdfPCell c32f1 = new PdfPCell(new Phrase("",font1));

table.addCell(c32f1);

PdfPCell d11f1 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11f1);

PdfPCell d12f1 = new PdfPCell(new Phrase("",font1));
d12f1.setPaddingTop(7);
d12f1.setPaddingBottom(7);
table.addCell(d12f1);

PdfPCell d21f1 = new PdfPCell(new Phrase("",font1));
d21f1.setPaddingTop(7);
d21f1.setPaddingBottom(7);
table.addCell(d21f1);

PdfPCell d31f1 = new PdfPCell(new Phrase("",font1));
d31f1.setPaddingTop(7);
d31f1.setPaddingBottom(7);
table.addCell(d31f1);

PdfPCell d41f1 = new PdfPCell(new Phrase("",font1));
d41f1.setPaddingTop(7);
d41f1.setPaddingBottom(7);
table.addCell(d41f1);

PdfPCell d51f1 = new PdfPCell(new Phrase("",font1));
d51f1.setPaddingTop(7);
d51f1.setPaddingBottom(7);
table.addCell(d51f1);

PdfPCell ec11f1 = new PdfPCell(new Phrase("",font1));
ec11f1.setPaddingTop(7);
ec11f1.setPaddingBottom(7);
table.addCell(ec11f1);

PdfPCell e1cf1 = new PdfPCell(new Phrase("",font1));
e1cf1.setPaddingTop(7);
e1cf1.setPaddingBottom(7);
table.addCell(e1cf1);

PdfPCell e2cf1 = new PdfPCell(new Phrase("",font1));
e2cf1.setPaddingTop(7);
e2cf1.setPaddingBottom(7);
table.addCell(e2cf1);

PdfPCell e3cf1 = new PdfPCell(new Phrase("",font1));
e3cf1.setPaddingTop(7);
e3cf1.setPaddingBottom(7);
table.addCell(e3cf1);

PdfPCell e4ef1 = new PdfPCell(new Phrase("",font1));
e4ef1.setPaddingTop(7);
e4ef1.setPaddingBottom(7);
table.addCell(e4ef1);

PdfPCell e5ef1 = new PdfPCell(new Phrase("",font1));
e5ef1.setPaddingTop(7);
e5ef1.setPaddingBottom(7);
table.addCell(e5ef1);

PdfPCell e6ef1 = new PdfPCell(new Phrase("",font1));
e6ef1.setPaddingTop(7);
e6ef1.setPaddingBottom(7);
table.addCell(e6ef1);

PdfPCell e7ef1 = new PdfPCell(new Phrase("",font1));
e7ef1.setPaddingTop(7);
e7ef1.setPaddingBottom(7);
table.addCell(e7ef1);

PdfPCell e8ef1 = new PdfPCell(new Phrase("",font1));
e8ef1.setPaddingTop(7);
e8ef1.setPaddingBottom(7);
table.addCell(e8ef1);

PdfPCell e9ef1 = new PdfPCell(new Phrase("",font1));
e9ef1.setPaddingTop(7);
e9ef1.setPaddingBottom(7);
table.addCell(e9ef1);

PdfPCell e10ef1 = new PdfPCell(new Phrase("",font1));
e10ef1.setPaddingTop(7);
e10ef1.setPaddingBottom(7);
table.addCell(e10ef1);

PdfPCell e11ef1 = new PdfPCell(new Phrase("",font1));
e11ef1.setPaddingTop(7);
e11ef1.setPaddingBottom(7);
table.addCell(e11e);

PdfPCell e12ef1 = new PdfPCell(new Phrase("",font1));
e12ef1.setPaddingTop(7);
e12ef1.setPaddingBottom(7);
table.addCell(e12ef1);

PdfPCell e13ef1 = new PdfPCell(new Phrase("",font1));
e13ef1.setPaddingTop(7);
e13ef1.setPaddingBottom(7);
table.addCell(e13ef1);

PdfPCell e14ef1= new PdfPCell(new Phrase("",font1));
e14ef1.setPaddingTop(7);
e14ef1.setPaddingBottom(7);
table.addCell(e14ef1);

PdfPCell e15ef1 = new PdfPCell(new Phrase("",font1));
e15ef1.setPaddingTop(7);
e15ef1.setPaddingBottom(7);
table.addCell(e15ef1);

PdfPCell e16ef1 = new PdfPCell(new Phrase("9",font1));
e16ef1.setBackgroundColor(new BaseColor(216, 241, 249));
e16ef1.setPaddingTop(7);
e16ef1.setPaddingBottom(7);
table.addCell(e16ef1);





PdfPCell e15f2 = new PdfPCell(new Phrase("",font1));
//e15f2.setBackgroundColor(BaseColor.CYAN);
e15f2.setPaddingTop(7);
e15f2.setPaddingBottom(7);
table.addCell(e15f2);

PdfPCell e16f2 = new PdfPCell(new Phrase("",font1));
e16f2.setPaddingTop(7);
e16f2.setPaddingBottom(7);
table.addCell(e16f2);



PdfPCell c31f2 = new PdfPCell(new Phrase("",font1));

c31f2.setPaddingTop(7);
c31f2.setPaddingBottom(7);
table.addCell(c31f2);


PdfPCell c32f2 = new PdfPCell(new Phrase("",font1));

table.addCell(c32f2);

PdfPCell d11f2 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11f2);

PdfPCell d12f2 = new PdfPCell(new Phrase("",font1));
d12f2.setPaddingTop(7);
d12f2.setPaddingBottom(7);
table.addCell(d12f2);

PdfPCell d21f2 = new PdfPCell(new Phrase("",font1));
d21f2.setPaddingTop(7);
d21f2.setPaddingBottom(7);
table.addCell(d21f2);

PdfPCell d31f2 = new PdfPCell(new Phrase("",font1));
d31f2.setPaddingTop(7);
d31f2.setPaddingBottom(7);
table.addCell(d31f2);

PdfPCell d41f2 = new PdfPCell(new Phrase(""+washingBay,font1));
d41f2.setBackgroundColor(new BaseColor(233, 246, 249));
d41f2.setPaddingTop(7);
d41f2.setPaddingBottom(7);
table.addCell(d41f2);

PdfPCell d51f2 = new PdfPCell(new Phrase("",font1));
d51f2.setPaddingTop(7);
d51f2.setPaddingBottom(7);
table.addCell(d51f2);

PdfPCell ec11f2 = new PdfPCell(new Phrase("",font1));
ec11f2.setPaddingTop(7);
ec11f2.setPaddingBottom(7);
table.addCell(ec11f2);

PdfPCell e1cf2 = new PdfPCell(new Phrase("",font1));
e1cf2.setPaddingTop(7);
e1cf2.setPaddingBottom(7);
table.addCell(e1cf2);

PdfPCell e2cf2 = new PdfPCell(new Phrase("",font1));
e2cf2.setPaddingTop(7);
e2cf2.setPaddingBottom(7);
table.addCell(e2cf2);

PdfPCell e3cf2 = new PdfPCell(new Phrase("",font1));
e3cf2.setPaddingTop(7);
e3cf2.setPaddingBottom(7);
table.addCell(e3cf2);

PdfPCell e4ef2 = new PdfPCell(new Phrase("",font1));
e4ef2.setPaddingTop(7);
e4ef2.setPaddingBottom(7);
table.addCell(e4ef2);

PdfPCell e5ef2 = new PdfPCell(new Phrase("",font1));
e5ef2.setPaddingTop(7);
e5ef2.setPaddingBottom(7);
table.addCell(e5ef2);

PdfPCell e6ef2 = new PdfPCell(new Phrase("",font1));
e6ef2.setPaddingTop(7);
e6ef2.setPaddingBottom(7);
table.addCell(e6ef2);

PdfPCell e7ef2 = new PdfPCell(new Phrase("",font1));
e7ef2.setPaddingTop(7);
e7ef2.setPaddingBottom(7);
table.addCell(e7ef2);

PdfPCell e8ef2 = new PdfPCell(new Phrase("",font1));
e8ef2.setPaddingTop(7);
e8ef2.setPaddingBottom(7);
table.addCell(e8ef2);

PdfPCell e9ef2 = new PdfPCell(new Phrase("",font1));
e9ef2.setPaddingTop(7);
e9ef2.setPaddingBottom(7);
table.addCell(e9ef2);

PdfPCell e10ef2 = new PdfPCell(new Phrase("",font1));
e10ef2.setPaddingTop(7);
e10ef2.setPaddingBottom(7);
table.addCell(e10ef2);

PdfPCell e11ef2 = new PdfPCell(new Phrase("",font1));
e11ef2.setPaddingTop(7);
e11ef2.setPaddingBottom(7);
table.addCell(e11ef2);

PdfPCell e12ef2 = new PdfPCell(new Phrase("10",font1));
e12ef2.setBackgroundColor(new BaseColor(216, 241, 249));
e12ef2.setPaddingTop(7);
e12ef2.setPaddingBottom(7);
table.addCell(e12ef2);

PdfPCell e13ef2 = new PdfPCell(new Phrase("",font1));
e13ef2.setPaddingTop(7);
e13ef2.setPaddingBottom(7);
table.addCell(e13ef2);

PdfPCell e14ef2= new PdfPCell(new Phrase("",font1));
e14ef2.setPaddingTop(7);
e14ef2.setPaddingBottom(7);
table.addCell(e14ef2);

PdfPCell e15ef2 = new PdfPCell(new Phrase("",font1));
e15ef2.setPaddingTop(7);
e15ef2.setPaddingBottom(7);
table.addCell(e15ef2);

PdfPCell e16ef2 = new PdfPCell(new Phrase("",font1));
e16ef2.setPaddingTop(7);
e16ef2.setPaddingBottom(7);
table.addCell(e16ef2);








PdfPCell e15f3 = new PdfPCell(new Phrase("",font1));
//e15f3.setBackgroundColor(BaseColor.CYAN);
e15f3.setPaddingTop(7);
e15f3.setPaddingBottom(7);
table.addCell(e15f2);

PdfPCell e16f3 = new PdfPCell(new Phrase("",font1));
e16f3.setPaddingTop(7);
e16f3.setPaddingBottom(7);
table.addCell(e16f3);



PdfPCell c31f3 = new PdfPCell(new Phrase("",font1));

c31f3.setPaddingTop(7);
c31f3.setPaddingBottom(7);
table.addCell(c31f3);


PdfPCell c32f3 = new PdfPCell(new Phrase("",font1));

table.addCell(c32f3);

PdfPCell d11f3 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11f3);

PdfPCell d12f3 = new PdfPCell(new Phrase(""+debtReceived,font1));
d12f3.setBackgroundColor(new BaseColor(233, 246, 249));
d12f3.setPaddingTop(7);
d12f3.setPaddingBottom(7);
table.addCell(d12f3);

PdfPCell d21f3 = new PdfPCell(new Phrase("",font1));
d21f3.setPaddingTop(7);
d21f3.setPaddingBottom(7);
table.addCell(d21f3);

PdfPCell d31f3 = new PdfPCell(new Phrase("",font1));
d31f3.setPaddingTop(7);
d31f3.setPaddingBottom(7);
table.addCell(d31f3);

PdfPCell d41f3 = new PdfPCell(new Phrase("",font1));
d41f3.setPaddingTop(7);
d41f3.setPaddingBottom(7);
table.addCell(d41f3);

PdfPCell d51f3 = new PdfPCell(new Phrase("",font1));
d51f3.setPaddingTop(7);
d51f3.setPaddingBottom(7);
table.addCell(d51f3);

PdfPCell ec11f3 = new PdfPCell(new Phrase("",font1));
ec11f3.setPaddingTop(7);
ec11f3.setPaddingBottom(7);
table.addCell(ec11f3);

PdfPCell e1cf3 = new PdfPCell(new Phrase("",font1));
e1cf3.setPaddingTop(7);
e1cf3.setPaddingBottom(7);
table.addCell(e1cf3);

PdfPCell e2cf3 = new PdfPCell(new Phrase("",font1));
e2cf3.setPaddingTop(7);
e2cf3.setPaddingBottom(7);
table.addCell(e2cf3);

PdfPCell e3cf3 = new PdfPCell(new Phrase("",font1));
e3cf3.setPaddingTop(7);
e3cf3.setPaddingBottom(7);
table.addCell(e3cf3);

PdfPCell e4ef3 = new PdfPCell(new Phrase("",font1));
e4ef3.setPaddingTop(7);
e4ef3.setPaddingBottom(7);
table.addCell(e4ef3);

PdfPCell e5ef3 = new PdfPCell(new Phrase("",font1));
e5ef3.setPaddingTop(7);
e5ef3.setPaddingBottom(7);
table.addCell(e5ef3);

PdfPCell e6ef3 = new PdfPCell(new Phrase("",font1));
e6ef3.setPaddingTop(7);
e6ef3.setPaddingBottom(7);
table.addCell(e6ef3);

PdfPCell e7ef3 = new PdfPCell(new Phrase("",font1));
e7ef3.setPaddingTop(7);
e7ef3.setPaddingBottom(7);
table.addCell(e7ef3);

PdfPCell e8ef3 = new PdfPCell(new Phrase("11",font1));
e8ef3.setBackgroundColor(new BaseColor(216, 241, 249));
e8ef3.setPaddingTop(7);
e8ef3.setPaddingBottom(7);
table.addCell(e8ef3);

PdfPCell e9ef3 = new PdfPCell(new Phrase("",font1));
e9ef3.setPaddingTop(7);
e9ef3.setPaddingBottom(7);
table.addCell(e9ef3);

PdfPCell e10ef3 = new PdfPCell(new Phrase("",font1));
e10ef3.setPaddingTop(7);
e10ef3.setPaddingBottom(7);
table.addCell(e10ef3);

PdfPCell e11ef3 = new PdfPCell(new Phrase("",font1));
e11ef3.setPaddingTop(7);
e11ef3.setPaddingBottom(7);
table.addCell(e11ef3);

PdfPCell e12ef3 = new PdfPCell(new Phrase("",font1));
e12ef3.setPaddingTop(7);
e12ef3.setPaddingBottom(7);
table.addCell(e12ef3);

PdfPCell e13ef3 = new PdfPCell(new Phrase("",font1));
e13ef3.setPaddingTop(7);
e13ef3.setPaddingBottom(7);
table.addCell(e13ef3);

PdfPCell e14ef3= new PdfPCell(new Phrase("",font1));
e14ef3.setPaddingTop(7);
e14ef3.setPaddingBottom(7);
table.addCell(e14ef3);

PdfPCell e15ef3 = new PdfPCell(new Phrase("",font1));
e15ef3.setPaddingTop(7);
e15ef3.setPaddingBottom(7);
table.addCell(e15ef3);

PdfPCell e16ef3 = new PdfPCell(new Phrase("",font1));
e16ef3.setPaddingTop(7);
e16ef3.setPaddingBottom(7);
table.addCell(e16ef3);









PdfPCell e15f4 = new PdfPCell(new Phrase("",font1));
//e15f4.setBackgroundColor(BaseColor.CYAN);
e15f4.setPaddingTop(7);
e15f4.setPaddingBottom(7);
table.addCell(e15f4);

PdfPCell e16f4 = new PdfPCell(new Phrase("",font1));
e16f4.setPaddingTop(7);
e16f4.setPaddingBottom(7);
table.addCell(e16f4);



PdfPCell c31f4 = new PdfPCell(new Phrase(""+debtRecov,font1));
c31f4.setBackgroundColor(new BaseColor(233, 246, 249));
c31f4.setPaddingTop(7);
c31f4.setPaddingBottom(7);
table.addCell(c31f4);


PdfPCell c32f4 = new PdfPCell(new Phrase("",font1));

table.addCell(c32f4);

PdfPCell d11f4 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11f4);

PdfPCell d12f4 = new PdfPCell(new Phrase("",font1));
d12f4.setPaddingTop(7);
d12f4.setPaddingBottom(7);
table.addCell(d12f4);

PdfPCell d21f4 = new PdfPCell(new Phrase("",font1));
d21f4.setPaddingTop(7);
d21f4.setPaddingBottom(7);
table.addCell(d21f4);

PdfPCell d31f4 = new PdfPCell(new Phrase("",font1));
d31f4.setPaddingTop(7);
d31f4.setPaddingBottom(7);
table.addCell(d31f4);

PdfPCell d41f4 = new PdfPCell(new Phrase("",font1));
d41f4.setPaddingTop(7);
d41f4.setPaddingBottom(7);
table.addCell(d41f4);

PdfPCell d51f4 = new PdfPCell(new Phrase("",font1));
d51f4.setPaddingTop(7);
d51f4.setPaddingBottom(7);
table.addCell(d51f4);

PdfPCell ec11f4 = new PdfPCell(new Phrase("",font1));
ec11f4.setPaddingTop(7);
ec11f4.setPaddingBottom(7);
table.addCell(ec11f4);

PdfPCell e1cf4 = new PdfPCell(new Phrase("",font1));
e1cf4.setPaddingTop(7);
e1cf4.setPaddingBottom(7);
table.addCell(e1cf4);

PdfPCell e2cf4 = new PdfPCell(new Phrase("",font1));
e2cf4.setPaddingTop(7);
e2cf4.setPaddingBottom(7);
table.addCell(e2cf4);

PdfPCell e3cf4 = new PdfPCell(new Phrase("",font1));
e3cf4.setPaddingTop(7);
e3cf4.setPaddingBottom(7);
table.addCell(e3cf4);

PdfPCell e4ef4 = new PdfPCell(new Phrase("12",font1));
e4ef4.setBackgroundColor(new BaseColor(216, 241, 249));
e4ef4.setPaddingTop(7);
e4ef4.setPaddingBottom(7);
table.addCell(e4ef4);

PdfPCell e5ef4 = new PdfPCell(new Phrase("",font1));
e5ef4.setPaddingTop(7);
e5ef4.setPaddingBottom(7);
table.addCell(e5ef4);

PdfPCell e6ef4 = new PdfPCell(new Phrase("",font1));
e6ef4.setPaddingTop(7);
e6ef4.setPaddingBottom(7);
table.addCell(e6ef4);

PdfPCell e7ef4 = new PdfPCell(new Phrase("",font1));
e7ef4.setPaddingTop(7);
e7ef4.setPaddingBottom(7);
table.addCell(e7ef4);

PdfPCell e8ef4 = new PdfPCell(new Phrase("",font1));
e8ef4.setPaddingTop(7);
e8ef4.setPaddingBottom(7);
table.addCell(e8ef4);

PdfPCell e9ef4 = new PdfPCell(new Phrase("",font1));
e9ef4.setPaddingTop(7);
e9ef4.setPaddingBottom(7);
table.addCell(e9ef4);

PdfPCell e10ef4 = new PdfPCell(new Phrase("",font1));
e10ef4.setPaddingTop(7);
e10ef4.setPaddingBottom(7);
table.addCell(e10ef4);

PdfPCell e11ef4 = new PdfPCell(new Phrase("",font1));
e11ef4.setPaddingTop(7);
e11ef4.setPaddingBottom(7);
table.addCell(e11ef4);

PdfPCell e12ef4 = new PdfPCell(new Phrase("",font1));
e12ef4.setPaddingTop(7);
e12ef4.setPaddingBottom(7);
table.addCell(e12ef4);

PdfPCell e13ef4 = new PdfPCell(new Phrase("",font1));
e13ef4.setPaddingTop(7);
e13ef4.setPaddingBottom(7);
table.addCell(e13ef4);

PdfPCell e14ef4= new PdfPCell(new Phrase("",font1));
e14ef4.setPaddingTop(7);
e14ef4.setPaddingBottom(7);
table.addCell(e14ef4);

PdfPCell e15ef4 = new PdfPCell(new Phrase("",font1));
e15ef4.setPaddingTop(7);
e15ef4.setPaddingBottom(7);
table.addCell(e15ef4);

PdfPCell e16ef4 = new PdfPCell(new Phrase(""+elec,font1));
e16ef4.setBackgroundColor(new BaseColor(233, 246, 249));
e16ef4.setPaddingTop(7);
e16ef4.setPaddingBottom(7);
table.addCell(e16ef4);









PdfPCell e15f5 = new PdfPCell(new Phrase("",font1));
//e15f5.setBackgroundColor(BaseColor.CYAN);
e15f5.setPaddingTop(7);
e15f5.setPaddingBottom(7);
table.addCell(e15f5);

PdfPCell e16f5 = new PdfPCell(new Phrase("",font1));
e16f5.setPaddingTop(7);
e16f5.setPaddingBottom(7);
table.addCell(e16f5);



PdfPCell c31f5 = new PdfPCell(new Phrase("",font1));

c31f5.setPaddingTop(7);
c31f5.setPaddingBottom(7);
table.addCell(c31f5);


PdfPCell c32f5 = new PdfPCell(new Phrase("",font1));

table.addCell(c32f5);

PdfPCell d11f5 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11f5);

PdfPCell d12f5 = new PdfPCell(new Phrase("",font1));
d12f5.setPaddingTop(7);
d12f5.setPaddingBottom(7);
table.addCell(d12f5);

PdfPCell d21f5 = new PdfPCell(new Phrase("",font1));
d21f5.setPaddingTop(7);
d21f5.setPaddingBottom(7);
table.addCell(d21f5);

PdfPCell d31f5 = new PdfPCell(new Phrase("",font1));
d31f5.setPaddingTop(7);
d31f5.setPaddingBottom(7);
table.addCell(d31f5);

PdfPCell d41f5 = new PdfPCell(new Phrase("",font1));
d41f5.setPaddingTop(7);
d41f5.setPaddingBottom(7);
table.addCell(d41f5);

PdfPCell d51f5 = new PdfPCell(new Phrase("",font1));
d51f5.setPaddingTop(7);
d51f5.setPaddingBottom(7);
table.addCell(d51f5);

PdfPCell ec11f5 = new PdfPCell(new Phrase("13",font1));
ec11f5.setBackgroundColor(new BaseColor(216, 241, 249));
ec11f5.setPaddingTop(7);
ec11f5.setPaddingBottom(7);
table.addCell(ec11f5);

PdfPCell e1cf5 = new PdfPCell(new Phrase("",font1));
e1cf5.setPaddingTop(7);
e1cf5.setPaddingBottom(7);
table.addCell(e1cf5);

PdfPCell e2cf5 = new PdfPCell(new Phrase("",font1));
e2cf5.setPaddingTop(7);
e2cf5.setPaddingBottom(7);
table.addCell(e2cf5);

PdfPCell e3cf5 = new PdfPCell(new Phrase("",font1));
e3cf5.setPaddingTop(7);
e3cf5.setPaddingBottom(7);
table.addCell(e3cf5);

PdfPCell e4ef5 = new PdfPCell(new Phrase("",font1));
e4ef5.setPaddingTop(7);
e4ef5.setPaddingBottom(7);
table.addCell(e4ef5);

PdfPCell e5ef5 = new PdfPCell(new Phrase("",font1));
e5ef5.setPaddingTop(7);
e5ef5.setPaddingBottom(7);
table.addCell(e5ef5);

PdfPCell e6ef5 = new PdfPCell(new Phrase("",font1));
e6ef5.setPaddingTop(7);
e6ef5.setPaddingBottom(7);
table.addCell(e6ef5);

PdfPCell e7ef5 = new PdfPCell(new Phrase("",font1));
e7ef5.setPaddingTop(7);
e7ef5.setPaddingBottom(7);
table.addCell(e7ef5);

PdfPCell e8ef5 = new PdfPCell(new Phrase("",font1));
e8ef5.setPaddingTop(7);
e8ef5.setPaddingBottom(7);
table.addCell(e8ef5);

PdfPCell e9ef5 = new PdfPCell(new Phrase("",font1));
e9ef5.setPaddingTop(7);
e9ef5.setPaddingBottom(7);
table.addCell(e9ef5);

PdfPCell e10ef5 = new PdfPCell(new Phrase("",font1));
e10ef5.setPaddingTop(7);
e10ef5.setPaddingBottom(7);
table.addCell(e10ef5);

PdfPCell e11ef5 = new PdfPCell(new Phrase("",font1));
e11ef5.setPaddingTop(7);
e11ef5.setPaddingBottom(7);
table.addCell(e11ef5);

PdfPCell e12ef5 = new PdfPCell(new Phrase("",font1));
e12ef5.setPaddingTop(7);
e12ef5.setPaddingBottom(7);
table.addCell(e12ef5);

PdfPCell e13ef5 = new PdfPCell(new Phrase(""+gen,font1));
e13ef5.setBackgroundColor(new BaseColor(233, 246, 249));
e13ef5.setPaddingTop(7);
e13ef5.setPaddingBottom(7);
table.addCell(e13ef5);

PdfPCell e14ef5= new PdfPCell(new Phrase("",font1));
e14ef5.setPaddingTop(7);
e14ef5.setPaddingBottom(7);
table.addCell(e14ef5);

PdfPCell e15ef5 = new PdfPCell(new Phrase("",font1));
e15ef5.setPaddingTop(7);
e15ef5.setPaddingBottom(7);
table.addCell(e15ef5);

PdfPCell e16ef5 = new PdfPCell(new Phrase("",font1));
e16ef5.setPaddingTop(7);
e16ef5.setPaddingBottom(7);
table.addCell(e16ef5);











PdfPCell e15f6 = new PdfPCell(new Phrase("",font1));
//e15f6.setBackgroundColor(BaseColor.CYAN);
e15f6.setPaddingTop(7);
e15f6.setPaddingBottom(7);
table.addCell(e15f6);

PdfPCell e16f6 = new PdfPCell(new Phrase("",font1));
e16f6.setPaddingTop(7);
e16f6.setPaddingBottom(7);
table.addCell(e16f6);



PdfPCell c31f6 = new PdfPCell(new Phrase("",font1));

c31f6.setPaddingTop(7);
c31f6.setPaddingBottom(7);
table.addCell(c31f6);


PdfPCell c32f6 = new PdfPCell(new Phrase("",font1));

table.addCell(c32f6);

PdfPCell d11f7 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11f7);

PdfPCell d12f6 = new PdfPCell(new Phrase("",font1));
d12f6.setPaddingTop(7);
d12f6.setPaddingBottom(7);
table.addCell(d12f6);

PdfPCell d21f6 = new PdfPCell(new Phrase("14",font1));
d21f6.setBackgroundColor(new BaseColor(216, 241, 249));
d21f6.setPaddingTop(7);
d21f6.setPaddingBottom(7);
table.addCell(d21f6);

PdfPCell d31f6 = new PdfPCell(new Phrase("",font1));
d31f6.setPaddingTop(7);
d31f6.setPaddingBottom(7);
table.addCell(d31f6);

PdfPCell d41f6 = new PdfPCell(new Phrase("",font1));
d41f6.setPaddingTop(7);
d41f6.setPaddingBottom(7);
table.addCell(d41f6);

PdfPCell d51f6 = new PdfPCell(new Phrase("",font1));
d51f6.setPaddingTop(7);
d51f6.setPaddingBottom(7);
table.addCell(d51f6);

PdfPCell ec11f6 = new PdfPCell(new Phrase("",font1));
ec11f6.setPaddingTop(7);
ec11f6.setPaddingBottom(7);
table.addCell(ec11f6);

PdfPCell e1cf6 = new PdfPCell(new Phrase("",font1));
e1cf6.setPaddingTop(7);
e1cf6.setPaddingBottom(7);
table.addCell(e1cf6);

PdfPCell e2c6 = new PdfPCell(new Phrase("",font1));
e2c6.setPaddingTop(7);
e2c6.setPaddingBottom(7);
table.addCell(e2c6);

PdfPCell e3c6 = new PdfPCell(new Phrase("",font1));
e3c6.setPaddingTop(7);
e3c6.setPaddingBottom(7);
table.addCell(e3c6);

PdfPCell e4e6 = new PdfPCell(new Phrase("",font1));
e4e6.setPaddingTop(7);
e4e6.setPaddingBottom(7);
table.addCell(e4e6);

PdfPCell e5e6 = new PdfPCell(new Phrase("",font1));
e5e6.setPaddingTop(7);
e5e6.setPaddingBottom(7);
table.addCell(e5e6);

PdfPCell e6e6 = new PdfPCell(new Phrase("",font1));
e6e6.setPaddingTop(7);
e6e6.setPaddingBottom(7);
table.addCell(e6e6);

PdfPCell e7e6 = new PdfPCell(new Phrase("",font1));
e7e6.setPaddingTop(7);
e7e6.setPaddingBottom(7);
table.addCell(e7e6);

PdfPCell e8e6= new PdfPCell(new Phrase("",font1));
e8e6.setPaddingTop(7);
e8e6.setPaddingBottom(7);
table.addCell(e8e6);

PdfPCell e9e6 = new PdfPCell(new Phrase("",font1));
e9e6.setPaddingTop(7);
e9e6.setPaddingBottom(7);
table.addCell(e9e6);

PdfPCell e10e6 = new PdfPCell(new Phrase(""+water,font1));
e10e6.setBackgroundColor(new BaseColor(233, 246, 249));
e10e6.setPaddingTop(7);
e10e6.setPaddingBottom(7);
table.addCell(e10e6);

PdfPCell e11e6 = new PdfPCell(new Phrase("",font1));
e11e6.setPaddingTop(7);
e11e6.setPaddingBottom(7);
table.addCell(e11e6);

PdfPCell e12e6 = new PdfPCell(new Phrase("",font1));
e12e6.setPaddingTop(7);
e12e6.setPaddingBottom(7);
table.addCell(e12e6);

PdfPCell e13e6 = new PdfPCell(new Phrase("",font1));
e13e6.setPaddingTop(7);
e13e6.setPaddingBottom(7);
table.addCell(e13e6);

PdfPCell e14e6= new PdfPCell(new Phrase("",font1));
e14e6.setPaddingTop(7);
e14e6.setPaddingBottom(7);
table.addCell(e14e6);

PdfPCell e15e6 = new PdfPCell(new Phrase("",font1));
e15e6.setPaddingTop(7);
e15e6.setPaddingBottom(7);
table.addCell(e15e6);

PdfPCell e16e6 = new PdfPCell(new Phrase("",font1));
e16e6.setPaddingTop(7);
e16e6.setPaddingBottom(7);
table.addCell(e16e6);










PdfPCell e156 = new PdfPCell(new Phrase("",font1));
//e156.setBackgroundColor(BaseColor.CYAN);
e156.setPaddingTop(7);
e156.setPaddingBottom(7);
table.addCell(e156);

PdfPCell e166 = new PdfPCell(new Phrase("",font1));
e166.setPaddingTop(7);
e16.setPaddingBottom(7);
table.addCell(e166);



PdfPCell c316 = new PdfPCell(new Phrase("",font1));

c316.setPaddingTop(7);
c316.setPaddingBottom(7);
table.addCell(c316);


PdfPCell c326 = new PdfPCell(new Phrase("",font1));

table.addCell(c326);

PdfPCell d116 = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d116);

PdfPCell d126 = new PdfPCell(new Phrase("",font1));
d126.setPaddingTop(7);
d126.setPaddingBottom(7);
table.addCell(d126);

PdfPCell d216 = new PdfPCell(new Phrase("",font1));
d216.setPaddingTop(7);
d216.setPaddingBottom(7);
table.addCell(d216);

PdfPCell d316 = new PdfPCell(new Phrase("",font1));
d316.setPaddingTop(7);
d316.setPaddingBottom(7);
table.addCell(d316);

PdfPCell d416 = new PdfPCell(new Phrase("",font1));
d416.setPaddingTop(7);
d416.setPaddingBottom(7);
table.addCell(d416);

PdfPCell d516 = new PdfPCell(new Phrase("",font1));
d516.setPaddingTop(7);
d516.setPaddingBottom(7);
table.addCell(d516);

PdfPCell ec116 = new PdfPCell(new Phrase("",font1));
ec116.setPaddingTop(7);
ec116.setPaddingBottom(7);
table.addCell(ec116);

PdfPCell e1c6 = new PdfPCell(new Phrase("",font1));
e1c6.setPaddingTop(7);
e1c6.setPaddingBottom(7);
table.addCell(e1c6);

PdfPCell e2cfe = new PdfPCell(new Phrase("",font1));
e2cfe.setPaddingTop(7);
e2cfe.setPaddingBottom(7);
table.addCell(e2cfe);

PdfPCell e3cfe = new PdfPCell(new Phrase("",font1));
e3cfe.setPaddingTop(7);
e3cfe.setPaddingBottom(7);
table.addCell(e3cfe);

PdfPCell e4efe = new PdfPCell(new Phrase("",font1));
e4efe.setPaddingTop(7);
e4efe.setPaddingBottom(7);
table.addCell(e4efe);

PdfPCell e5efe = new PdfPCell(new Phrase("",font1));
e5efe.setPaddingTop(7);
e5efe.setPaddingBottom(7);
table.addCell(e5efe);

PdfPCell e6efe = new PdfPCell(new Phrase("",font1));
e6efe.setPaddingTop(7);
e6efe.setPaddingBottom(7);
table.addCell(e6efe);

PdfPCell e7efe = new PdfPCell(new Phrase("",font1));
e7efe.setPaddingTop(7);
e7efe.setPaddingBottom(7);
table.addCell(e7efe);

PdfPCell e8efe = new PdfPCell(new Phrase("",font1));
e8efe.setPaddingTop(7);
e8efe.setPaddingBottom(7);
table.addCell(e8efe);

PdfPCell e9efe = new PdfPCell(new Phrase("",font1));
e9efe.setPaddingTop(7);
e9efe.setPaddingBottom(7);
table.addCell(e9efe);

PdfPCell e10efe = new PdfPCell(new Phrase("",font1));
e10efe.setPaddingTop(7);
e10efe.setPaddingBottom(7);
table.addCell(e10efe);

PdfPCell e11efe = new PdfPCell(new Phrase("",font1));
e11efe.setPaddingTop(7);
e11efe.setPaddingBottom(7);
table.addCell(e11efe);

PdfPCell e12efe = new PdfPCell(new Phrase("",font1));
e12efe.setPaddingTop(7);
e12efe.setPaddingBottom(7);
table.addCell(e12efe);

PdfPCell e13efe = new PdfPCell(new Phrase("",font1));
e13efe.setPaddingTop(7);
e13efe.setPaddingBottom(7);
table.addCell(e13efe);

PdfPCell e14efe= new PdfPCell(new Phrase("",font1));
e14efe.setPaddingTop(7);
e14efe.setPaddingBottom(7);
table.addCell(e14efe);

PdfPCell e15efe = new PdfPCell(new Phrase("15",font1));
e15efe.setBackgroundColor(new BaseColor(216, 241, 249));
e15efe.setPaddingTop(7);
e15efe.setPaddingBottom(7);
table.addCell(e15efe);

PdfPCell e16efe = new PdfPCell(new Phrase("",font1));
e16efe.setPaddingTop(7);
e16efe.setPaddingBottom(7);
table.addCell(e16efe);











PdfPCell e15fe = new PdfPCell(new Phrase("",font1));
//e15fe.setBackgroundColor(BaseColor.CYAN);
e15fe.setPaddingTop(7);
e15fe.setPaddingBottom(7);
table.addCell(e15fe);

PdfPCell e16fe = new PdfPCell(new Phrase("",font1));
e16fe.setPaddingTop(7);
e16fe.setPaddingBottom(7);
table.addCell(e16fe);



PdfPCell c31fe = new PdfPCell(new Phrase("",font1));

c31fe.setPaddingTop(7);
c31fe.setPaddingBottom(7);
table.addCell(c31fe);


PdfPCell c32fe = new PdfPCell(new Phrase("",font1));

table.addCell(c32fe);

PdfPCell d11fe = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11fe);

PdfPCell d12fe = new PdfPCell(new Phrase("",font1));
d12fe.setPaddingTop(7);
d12fe.setPaddingBottom(7);
table.addCell(d12fe);

PdfPCell d21fe = new PdfPCell(new Phrase("",font1));
d21fe.setPaddingTop(7);
d21fe.setPaddingBottom(7);
table.addCell(d21fe);

PdfPCell d31fe = new PdfPCell(new Phrase("",font1));
d31fe.setPaddingTop(7);
d31fe.setPaddingBottom(7);
table.addCell(d31fe);

PdfPCell d41fe = new PdfPCell(new Phrase("",font1));
d41fe.setPaddingTop(7);
d41fe.setPaddingBottom(7);
table.addCell(d41fe);

PdfPCell d51fe = new PdfPCell(new Phrase("",font1));
d51fe.setPaddingTop(7);
d51fe.setPaddingBottom(7);
table.addCell(d51fe);

PdfPCell ec11fe = new PdfPCell(new Phrase("",font1));
ec11fe.setPaddingTop(7);
ec11fe.setPaddingBottom(7);
table.addCell(ec11fe);

PdfPCell e1cfe = new PdfPCell(new Phrase("",font1));
e1cfe.setPaddingTop(7);
e1cfe.setPaddingBottom(7);
table.addCell(e1cfe);

PdfPCell e2cfee = new PdfPCell(new Phrase("",font1));
e2cfee.setPaddingTop(7);
e2cfee.setPaddingBottom(7);
table.addCell(e2cfee);

PdfPCell e3cfee = new PdfPCell(new Phrase(""+payR,font1));
e3cfee.setBackgroundColor(new BaseColor(233, 246, 249));
e3cfee.setPaddingTop(7);
e3cfee.setPaddingBottom(7);
table.addCell(e3cfee);

PdfPCell e4efee = new PdfPCell(new Phrase("",font1));
e4efee.setPaddingTop(7);
e4efee.setPaddingBottom(7);
table.addCell(e4efee);

PdfPCell e5efee = new PdfPCell(new Phrase("",font1));
e5efee.setPaddingTop(7);
e5efee.setPaddingBottom(7);
table.addCell(e5efee);

PdfPCell e6ea = new PdfPCell(new Phrase("",font1));
e6ea.setPaddingTop(7);
e6ea.setPaddingBottom(7);
table.addCell(e6ea);

PdfPCell e7eea = new PdfPCell(new Phrase("",font1));
e7eea.setPaddingTop(7);
e7eea.setPaddingBottom(7);
table.addCell(e7eea);

PdfPCell e8eea = new PdfPCell(new Phrase("",font1));
e8eea.setPaddingTop(7);
e8eea.setPaddingBottom(7);
table.addCell(e8eea);

PdfPCell e9eea = new PdfPCell(new Phrase("",font1));
e9eea.setPaddingTop(7);
e9eea.setPaddingBottom(7);
table.addCell(e9eea);

PdfPCell e10eea = new PdfPCell(new Phrase("",font1));
e10eea.setPaddingTop(7);
e10eea.setPaddingBottom(7);
table.addCell(e10eea);

PdfPCell e11ea = new PdfPCell(new Phrase("16",font1));
e11ea.setBackgroundColor(new BaseColor(216, 241, 249));
e11ea.setPaddingTop(7);
e11ea.setPaddingBottom(7);
table.addCell(e11ea);

PdfPCell e12ea = new PdfPCell(new Phrase("",font1));
e12ea.setPaddingTop(7);
e12ea.setPaddingBottom(7);
table.addCell(e12ea);

PdfPCell e13ea = new PdfPCell(new Phrase("",font1));
e13ea.setPaddingTop(7);
e13ea.setPaddingBottom(7);
table.addCell(e13ea);

PdfPCell e14ea= new PdfPCell(new Phrase("",font1));
e14ea.setPaddingTop(7);
e14ea.setPaddingBottom(7);
table.addCell(e14ea);

PdfPCell e15ea = new PdfPCell(new Phrase("",font1));
e15ea.setPaddingTop(7);
e15ea.setPaddingBottom(7);
table.addCell(e15ea);

PdfPCell e16ea = new PdfPCell(new Phrase("",font1));
e16ea.setPaddingTop(7);
e16ea.setPaddingBottom(7);
table.addCell(e16ea);





PdfPCell e15a = new PdfPCell(new Phrase("",font1));
//e15a.setBackgroundColor(BaseColor.CYAN);
e15a.setPaddingTop(7);
e15a.setPaddingBottom(7);
table.addCell(e15a);

PdfPCell e16a = new PdfPCell(new Phrase("",font1));
e16a.setPaddingTop(7);
e16a.setPaddingBottom(7);
table.addCell(e16a);



PdfPCell c31a = new PdfPCell(new Phrase("",font1));

c31a.setPaddingTop(7);
c31a.setPaddingBottom(7);
table.addCell(c31a);


PdfPCell c32a = new PdfPCell(new Phrase("",font1));

table.addCell(c32a);

PdfPCell d11a = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11a);

PdfPCell d12a = new PdfPCell(new Phrase("",font1));
d12a.setPaddingTop(7);
d12a.setPaddingBottom(7);
table.addCell(d12a);

PdfPCell d21a = new PdfPCell(new Phrase("",font1));
d21a.setPaddingTop(7);
d21a.setPaddingBottom(7);
table.addCell(d21a);

PdfPCell d31a = new PdfPCell(new Phrase("",font1));
d31a.setPaddingTop(7);
d31a.setPaddingBottom(7);
table.addCell(d31a);

PdfPCell d41a = new PdfPCell(new Phrase("",font1));
d41a.setPaddingTop(7);
d41a.setPaddingBottom(7);
table.addCell(d41a);

PdfPCell d51a = new PdfPCell(new Phrase("",font1));
d51a.setPaddingTop(7);
d51a.setPaddingBottom(7);
table.addCell(d51a);

PdfPCell ec11a = new PdfPCell(new Phrase("T&T 500",font1));
ec11a.setBackgroundColor(new BaseColor(233, 246, 249));
ec11a.setPaddingTop(7);
ec11a.setPaddingBottom(7);
table.addCell(ec11a);

PdfPCell e1cs = new PdfPCell(new Phrase("",font1));
e1cs.setPaddingTop(7);
e1cs.setPaddingBottom(7);
table.addCell(e1cs);

PdfPCell e2cs = new PdfPCell(new Phrase("",font1));
e2cs.setPaddingTop(7);
e2cs.setPaddingBottom(7);
table.addCell(e2cs);

PdfPCell e3cs = new PdfPCell(new Phrase("",font1));
e3cs.setPaddingTop(7);
e3cs.setPaddingBottom(7);
table.addCell(e3cs);

PdfPCell e4es = new PdfPCell(new Phrase("",font1));
e4es.setPaddingTop(7);
e4es.setPaddingBottom(7);
table.addCell(e4es);

PdfPCell e5es = new PdfPCell(new Phrase("",font1));
e5es.setPaddingTop(7);
e5es.setPaddingBottom(7);
table.addCell(e5es);

PdfPCell e6es = new PdfPCell(new Phrase("",font1));
e6es.setPaddingTop(7);
e6es.setPaddingBottom(7);
table.addCell(e6es);

PdfPCell e7es = new PdfPCell(new Phrase("17",font1));
e7es.setBackgroundColor(new BaseColor(216, 241, 249));
e7es.setPaddingTop(7);
e7es.setPaddingBottom(7);
table.addCell(e7es);

PdfPCell e8es = new PdfPCell(new Phrase("",font1));
e8es.setPaddingTop(7);
e8es.setPaddingBottom(7);
table.addCell(e8es);

PdfPCell e9es = new PdfPCell(new Phrase("",font1));
e9es.setPaddingTop(7);
e9es.setPaddingBottom(7);
table.addCell(e9es);

PdfPCell e10es = new PdfPCell(new Phrase("",font1));
e10es.setPaddingTop(7);
e10es.setPaddingBottom(7);
table.addCell(e10es);

PdfPCell e11es= new PdfPCell(new Phrase("",font1));
e11es.setPaddingTop(7);
e11es.setPaddingBottom(7);
table.addCell(e11es);

PdfPCell e12es = new PdfPCell(new Phrase("",font1));
e12es.setPaddingTop(7);
e12es.setPaddingBottom(7);
table.addCell(e12es);

PdfPCell e13es = new PdfPCell(new Phrase("",font1));
e13es.setPaddingTop(7);
e13es.setPaddingBottom(7);
table.addCell(e13es);

PdfPCell e14es= new PdfPCell(new Phrase("",font1));
e14es.setPaddingTop(7);
e14es.setPaddingBottom(7);
table.addCell(e14es);

PdfPCell e15es = new PdfPCell(new Phrase("",font1));
e15es.setPaddingTop(7);
e15es.setPaddingBottom(7);
table.addCell(e15es);

PdfPCell e16es = new PdfPCell(new Phrase("",font1));
e16es.setPaddingTop(7);
e16es.setPaddingBottom(7);
table.addCell(e16es);








PdfPCell e15as = new PdfPCell(new Phrase("",font1));
//e15as.setBackgroundColor(BaseColor.CYAN);
e15as.setPaddingTop(7);
e15as.setPaddingBottom(7);
table.addCell(e15as);

PdfPCell e16as = new PdfPCell(new Phrase("",font1));
e16as.setPaddingTop(7);
e16as.setPaddingBottom(7);
table.addCell(e16as);



PdfPCell c31as = new PdfPCell(new Phrase("",font1));

c31as.setPaddingTop(7);
c31as.setPaddingBottom(7);
table.addCell(c31as);


PdfPCell c32as = new PdfPCell(new Phrase("",font1));

table.addCell(c32as);

PdfPCell d11as = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11as);

PdfPCell d12as = new PdfPCell(new Phrase("",font1));
d12as.setPaddingTop(7);
d12as.setPaddingBottom(7);
table.addCell(d12as);

PdfPCell d21as = new PdfPCell(new Phrase("",font1));
d21as.setPaddingTop(7);
d21as.setPaddingBottom(7);
table.addCell(d21as);

PdfPCell d31as = new PdfPCell(new Phrase(""+npa,font1));
d31as.setBackgroundColor(new BaseColor(233, 246, 249));
d31as.setPaddingTop(7);
d31as.setPaddingBottom(7);
table.addCell(d31as);

PdfPCell d41z = new PdfPCell(new Phrase("",font1));
d41z.setPaddingTop(7);
d41z.setPaddingBottom(7);
table.addCell(d41z);

PdfPCell d51z = new PdfPCell(new Phrase("",font1));
d51z.setPaddingTop(7);
d51z.setPaddingBottom(7);
table.addCell(d51z);

PdfPCell ec11z = new PdfPCell(new Phrase("",font1));
ec11z.setPaddingTop(7);
ec11z.setPaddingBottom(7);
table.addCell(ec11z);

PdfPCell e1cz = new PdfPCell(new Phrase("",font1));
e1cz.setPaddingTop(7);
e1cz.setPaddingBottom(7);
table.addCell(e1cz);

PdfPCell e2cz = new PdfPCell(new Phrase("",font1));
e2cz.setPaddingTop(7);
e2cz.setPaddingBottom(7);
table.addCell(e2cz);

PdfPCell e3cz = new PdfPCell(new Phrase("18",font1));
e3cz.setBackgroundColor(new BaseColor(216, 241, 249));
e3cz.setPaddingTop(7);
e3cz.setPaddingBottom(7);
table.addCell(e3cz);

PdfPCell e4ez = new PdfPCell(new Phrase("",font1));
e4ez.setPaddingTop(7);
e4ez.setPaddingBottom(7);
table.addCell(e4ez);

PdfPCell e5ez = new PdfPCell(new Phrase("",font1));
e5ez.setPaddingTop(7);
e5ez.setPaddingBottom(7);
table.addCell(e5ez);

PdfPCell e6ez = new PdfPCell(new Phrase("",font1));
e6ez.setPaddingTop(7);
e6ez.setPaddingBottom(7);
table.addCell(e6ez);

PdfPCell e7ez = new PdfPCell(new Phrase("",font1));
e7ez.setPaddingTop(7);
e7ez.setPaddingBottom(7);
table.addCell(e7ez);

PdfPCell e8ez = new PdfPCell(new Phrase("",font1));
e8ez.setPaddingTop(7);
e8ez.setPaddingBottom(7);
table.addCell(e8ez);

PdfPCell e9ez = new PdfPCell(new Phrase("",font1));
e9ez.setPaddingTop(7);
e9ez.setPaddingBottom(7);
table.addCell(e9ez);

PdfPCell e10ez = new PdfPCell(new Phrase("",font1));
e10ez.setPaddingTop(7);
e10ez.setPaddingBottom(7);
table.addCell(e10ez);

PdfPCell e11ez = new PdfPCell(new Phrase("",font1));
e11ez.setPaddingTop(7);
e11ez.setPaddingBottom(7);
table.addCell(e11ez);

PdfPCell e12ez = new PdfPCell(new Phrase("",font1));
e12ez.setPaddingTop(7);
e12ez.setPaddingBottom(7);
table.addCell(e12ez);

PdfPCell e13ez = new PdfPCell(new Phrase("",font1));
e13ez.setPaddingTop(7);
e13ez.setPaddingBottom(7);
table.addCell(e13ez);

PdfPCell e14ez= new PdfPCell(new Phrase("",font1));
e14ez.setPaddingTop(7);
e14ez.setPaddingBottom(7);
table.addCell(e14ez);

PdfPCell e15ez = new PdfPCell(new Phrase("",font1));
e15ez.setPaddingTop(7);
e15ez.setPaddingBottom(7);
table.addCell(e15ez);

PdfPCell e16ez = new PdfPCell(new Phrase("",font1));
e16ez.setPaddingTop(7);
e16ez.setPaddingBottom(7);
table.addCell(e16ez);










PdfPCell e15za = new PdfPCell(new Phrase("",font1));
//e15za.setBackgroundColor(BaseColor.CYAN);
e15za.setPaddingTop(7);
e15za.setPaddingBottom(7);
table.addCell(e15za);

PdfPCell e16za = new PdfPCell(new Phrase("",font1));
e16za.setPaddingTop(7);
e16za.setPaddingBottom(7);
table.addCell(e16za);



PdfPCell c31za = new PdfPCell(new Phrase("",font1));

c31za.setPaddingTop(7);
c31za.setPaddingBottom(7);
table.addCell(c31za);


PdfPCell c32za = new PdfPCell(new Phrase("",font1));

table.addCell(c32za);

PdfPCell d11za = new PdfPCell(new Phrase(""+gsa,font1));//(String)session.getAttribute("openStock")
d11za.setBackgroundColor(new BaseColor(233, 246, 249));
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11za);

PdfPCell d12za = new PdfPCell(new Phrase("",font1));
d12za.setPaddingTop(7);
d12za.setPaddingBottom(7);
table.addCell(d12za);

PdfPCell d21za = new PdfPCell(new Phrase("",font1));
d21za.setPaddingTop(7);
d21za.setPaddingBottom(7);
table.addCell(d21za);

PdfPCell d31za = new PdfPCell(new Phrase("",font1));
d31za.setPaddingTop(7);
d31za.setPaddingBottom(7);
table.addCell(d31za);

PdfPCell d41za = new PdfPCell(new Phrase("",font1));
d41za.setPaddingTop(7);
d41za.setPaddingBottom(7);
table.addCell(d41za);

PdfPCell d51za = new PdfPCell(new Phrase("19",font1));
d51za.setBackgroundColor(new BaseColor(216, 241, 249));
d51za.setPaddingTop(7);
d51za.setPaddingBottom(7);
table.addCell(d51za);

PdfPCell ec11za = new PdfPCell(new Phrase("",font1));
ec11za.setPaddingTop(7);
ec11za.setPaddingBottom(7);
table.addCell(ec11za);

PdfPCell e1cza = new PdfPCell(new Phrase("",font1));
e1cza.setPaddingTop(7);
e1cza.setPaddingBottom(7);
table.addCell(e1cza);

PdfPCell e2cza = new PdfPCell(new Phrase("",font1));
e2cza.setPaddingTop(7);
e2cza.setPaddingBottom(7);
table.addCell(e2cza);

PdfPCell e3cza = new PdfPCell(new Phrase("",font1));
e3cza.setPaddingTop(7);
e3cza.setPaddingBottom(7);
table.addCell(e3cza);

PdfPCell e4eza = new PdfPCell(new Phrase("",font1));
e4eza.setPaddingTop(7);
e4eza.setPaddingBottom(7);
table.addCell(e4eza);

PdfPCell e5eza = new PdfPCell(new Phrase("",font1));
e5eza.setPaddingTop(7);
e5eza.setPaddingBottom(7);
table.addCell(e5eza);

PdfPCell e6eza = new PdfPCell(new Phrase("",font1));
e6eza.setPaddingTop(7);
e6eza.setPaddingBottom(7);
table.addCell(e6eza);

PdfPCell e7eza = new PdfPCell(new Phrase("",font1));
e7eza.setPaddingTop(7);
e7eza.setPaddingBottom(7);
table.addCell(e7eza);

PdfPCell e8eza = new PdfPCell(new Phrase("",font1));
e8eza.setPaddingTop(7);
e8eza.setPaddingBottom(7);
table.addCell(e8eza);

PdfPCell e9eza = new PdfPCell(new Phrase("",font1));
e9eza.setPaddingTop(7);
e9eza.setPaddingBottom(7);
table.addCell(e9eza);

PdfPCell e10eza = new PdfPCell(new Phrase("",font1));
e10eza.setPaddingTop(7);
e10eza.setPaddingBottom(7);
table.addCell(e10eza);

PdfPCell e11eza = new PdfPCell(new Phrase("",font1));
e11eza.setPaddingTop(7);
e11eza.setPaddingBottom(7);
table.addCell(e11eza);

PdfPCell e12eza = new PdfPCell(new Phrase("",font1));
e12eza.setPaddingTop(7);
e12eza.setPaddingBottom(7);
table.addCell(e12eza);

PdfPCell e13eza = new PdfPCell(new Phrase("",font1));
e13eza.setPaddingTop(7);
e13eza.setPaddingBottom(7);
table.addCell(e13eza);

PdfPCell e14eza= new PdfPCell(new Phrase("",font1));
e14eza.setPaddingTop(7);
e14eza.setPaddingBottom(7);
table.addCell(e14eza);

PdfPCell e15eza = new PdfPCell(new Phrase("",font1));
e15eza.setPaddingTop(7);
e15eza.setPaddingBottom(7);
table.addCell(e15eza);

PdfPCell e16eza = new PdfPCell(new Phrase("",font1));
e16eza.setPaddingTop(7);
e16eza.setPaddingBottom(7);
table.addCell(e16eza);







PdfPCell e15zz = new PdfPCell(new Phrase("",font1));
//e15zz.setBackgroundColor(BaseColor.CYAN);
e15zz.setPaddingTop(7);
e15zz.setPaddingBottom(7);
table.addCell(e15zz);

PdfPCell e16zz = new PdfPCell(new Phrase(""+epa,font1));
e16zz.setBackgroundColor(new BaseColor(233, 246, 249));
e16zz.setPaddingTop(7);
e16zz.setPaddingBottom(7);
table.addCell(e16zz);



PdfPCell c31zz = new PdfPCell(new Phrase("",font1));

c31zz.setPaddingTop(7);
c31zz.setPaddingBottom(7);
table.addCell(c31zz);


PdfPCell c32zz = new PdfPCell(new Phrase("",font1));

table.addCell(c32zz);

PdfPCell d11zz = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11zz);

PdfPCell d12zz = new PdfPCell(new Phrase("20",font1));
d12zz.setBackgroundColor(new BaseColor(216, 241, 249));
d12zz.setPaddingTop(7);
d12zz.setPaddingBottom(7);
table.addCell(d12zz);

PdfPCell d21zz = new PdfPCell(new Phrase("",font1));
d21zz.setPaddingTop(7);
d21zz.setPaddingBottom(7);
table.addCell(d21zz);

PdfPCell d31zz = new PdfPCell(new Phrase("",font1));
d31zz.setPaddingTop(7);
d31zz.setPaddingBottom(7);
table.addCell(d31zz);

PdfPCell d41zz = new PdfPCell(new Phrase("",font1));
d41zz.setPaddingTop(7);
d41zz.setPaddingBottom(7);
table.addCell(d41zz);

PdfPCell d51zz = new PdfPCell(new Phrase("",font1));
d51zz.setPaddingTop(7);
d51zz.setPaddingBottom(7);
table.addCell(d51zz);

PdfPCell ec11zz = new PdfPCell(new Phrase("",font1));
ec11zz.setPaddingTop(7);
ec11zz.setPaddingBottom(7);
table.addCell(ec11zz);

PdfPCell e1czz = new PdfPCell(new Phrase("",font1));
e1czz.setPaddingTop(7);
e1czz.setPaddingBottom(7);
table.addCell(e1czz);

PdfPCell e2czz = new PdfPCell(new Phrase("",font1));
e2czz.setPaddingTop(7);
e2czz.setPaddingBottom(7);
table.addCell(e2czz);

PdfPCell e3czz = new PdfPCell(new Phrase("",font1));
e3czz.setPaddingTop(7);
e3czz.setPaddingBottom(7);
table.addCell(e3czz);

PdfPCell e4ezz = new PdfPCell(new Phrase("",font1));
e4ezz.setPaddingTop(7);
e4ezz.setPaddingBottom(7);
table.addCell(e4ezz);

PdfPCell e5ezz = new PdfPCell(new Phrase("",font1));
e5ezz.setPaddingTop(7);
e5ezz.setPaddingBottom(7);
table.addCell(e5ezz);

PdfPCell e6ezz = new PdfPCell(new Phrase("",font1));
e6ezz.setPaddingTop(7);
e6ezz.setPaddingBottom(7);
table.addCell(e6ezz);

PdfPCell e7ezz = new PdfPCell(new Phrase("",font1));
e7ezz.setPaddingTop(7);
e7ezz.setPaddingBottom(7);
table.addCell(e7ezz);

PdfPCell e8ezz = new PdfPCell(new Phrase("",font1));
e8ezz.setPaddingTop(7);
e8ezz.setPaddingBottom(7);
table.addCell(e8ezz);

PdfPCell e9ezz = new PdfPCell(new Phrase("",font1));
e9ezz.setPaddingTop(7);
e9ezz.setPaddingBottom(7);
table.addCell(e9ezz);

PdfPCell e10ezz = new PdfPCell(new Phrase("",font1));
e10ezz.setPaddingTop(7);
e10ezz.setPaddingBottom(7);
table.addCell(e10ezz);

PdfPCell e11ezz = new PdfPCell(new Phrase("",font1));
e11ezz.setPaddingTop(7);
e11ezz.setPaddingBottom(7);
table.addCell(e11ezz);

PdfPCell e12ezz = new PdfPCell(new Phrase("",font1));
e12ezz.setPaddingTop(7);
e12ezz.setPaddingBottom(7);
table.addCell(e12ezz);

PdfPCell e13ezz = new PdfPCell(new Phrase("",font1));
e13ezz.setPaddingTop(7);
e13ezz.setPaddingBottom(7);
table.addCell(e13ezz);

PdfPCell e14ezz= new PdfPCell(new Phrase("",font1));
e14ezz.setPaddingTop(7);
e14ezz.setPaddingBottom(7);
table.addCell(e14ezz);

PdfPCell e15ezz = new PdfPCell(new Phrase(""+property,font1));
e15ezz.setBackgroundColor(new BaseColor(233, 246, 249));
e15ezz.setPaddingTop(7);
e15ezz.setPaddingBottom(7);
table.addCell(e15ezz);

PdfPCell e16ezz = new PdfPCell(new Phrase("",font1));
e16ezz.setPaddingTop(7);
e16ezz.setPaddingBottom(7);
table.addCell(e16ezz);









PdfPCell e15ma = new PdfPCell(new Phrase("",font1));
//e15ma.setBackgroundColor(BaseColor.CYAN);
e15ma.setPaddingTop(7);
e15ma.setPaddingBottom(7);
table.addCell(e15ma);

PdfPCell e16ma = new PdfPCell(new Phrase("21",font1));
e16ma.setBackgroundColor(new BaseColor(216, 241, 249));
e16ma.setPaddingTop(7);
e16ma.setPaddingBottom(7);
table.addCell(e16ma);



PdfPCell c31ma = new PdfPCell(new Phrase("",font1));

c31ma.setPaddingTop(7);
c31ma.setPaddingBottom(7);
table.addCell(c31ma);


PdfPCell c32ma = new PdfPCell(new Phrase("",font1));

table.addCell(c32ma);

PdfPCell d11ma = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11ma);

PdfPCell d12ma = new PdfPCell(new Phrase("",font1));
d12ma.setPaddingTop(7);
d12ma.setPaddingBottom(7);
table.addCell(d12ma);

PdfPCell d21ma = new PdfPCell(new Phrase("",font1));
d21ma.setPaddingTop(7);
d21ma.setPaddingBottom(7);
table.addCell(d21ma);

PdfPCell d31ma = new PdfPCell(new Phrase("",font1));
d31ma.setPaddingTop(7);
d31ma.setPaddingBottom(7);
table.addCell(d31ma);

PdfPCell d41ma = new PdfPCell(new Phrase("",font1));
d41ma.setPaddingTop(7);
d41ma.setPaddingBottom(7);
table.addCell(d41ma);

PdfPCell d51ma = new PdfPCell(new Phrase("",font1));
d51ma.setPaddingTop(7);
d51ma.setPaddingBottom(7);
table.addCell(d51ma);

PdfPCell ec11ma = new PdfPCell(new Phrase("",font1));
ec11ma.setPaddingTop(7);
ec11ma.setPaddingBottom(7);
table.addCell(ec11ma);

PdfPCell e1cma = new PdfPCell(new Phrase("",font1));
e1cma.setPaddingTop(7);
e1cma.setPaddingBottom(7);
table.addCell(e1cma);

PdfPCell e2cma = new PdfPCell(new Phrase("",font1));
e2cma.setPaddingTop(7);
e2cma.setPaddingBottom(7);
table.addCell(e2cma);

PdfPCell e3cma = new PdfPCell(new Phrase("",font1));
e3cma.setPaddingTop(7);
e3cma.setPaddingBottom(7);
table.addCell(e3cma);

PdfPCell e4ema = new PdfPCell(new Phrase("",font1));
e4ema.setPaddingTop(7);
e4ema.setPaddingBottom(7);
table.addCell(e4ema);

PdfPCell e5ema = new PdfPCell(new Phrase("",font1));
e5ema.setPaddingTop(7);
e5ema.setPaddingBottom(7);
table.addCell(e5ema);

PdfPCell e6ema = new PdfPCell(new Phrase("",font1));
e6ema.setPaddingTop(7);
e6ema.setPaddingBottom(7);
table.addCell(e6ema);

PdfPCell e7ema = new PdfPCell(new Phrase("",font1));
e7ema.setPaddingTop(7);
e7ema.setPaddingBottom(7);
table.addCell(e7ema);

PdfPCell e8ema = new PdfPCell(new Phrase("",font1));
e8ema.setPaddingTop(7);
e8ema.setPaddingBottom(7);
table.addCell(e8ema);

PdfPCell e9ema = new PdfPCell(new Phrase("",font1));
e9ema.setPaddingTop(7);
e9ema.setPaddingBottom(7);
table.addCell(e9ema);

PdfPCell e10ema = new PdfPCell(new Phrase("",font1));
e10ema.setPaddingTop(7);
e10ema.setPaddingBottom(7);
table.addCell(e10ema);

PdfPCell e11ema = new PdfPCell(new Phrase("",font1));
e11ema.setPaddingTop(7);
e11ema.setPaddingBottom(7);
table.addCell(e11ema);

PdfPCell e12ema = new PdfPCell(new Phrase(""+statutory,font1));
e12ema.setBackgroundColor(new BaseColor(233, 246, 249));
e12ema.setPaddingTop(7);
e12ema.setPaddingBottom(7);
table.addCell(e12ema);

PdfPCell e13ema = new PdfPCell(new Phrase("",font1));
e13ema.setPaddingTop(7);
e13ema.setPaddingBottom(7);
table.addCell(e13ema);

PdfPCell e14ema= new PdfPCell(new Phrase("22",font1));
e14ema.setBackgroundColor(new BaseColor(233, 246, 249));
e14ema.setPaddingTop(7);
e14ema.setPaddingBottom(7);
table.addCell(e14ema);

PdfPCell e15ema = new PdfPCell(new Phrase("",font1));
e15ema.setPaddingTop(7);
e15ema.setPaddingBottom(7);
table.addCell(e15ema);

PdfPCell e16ema = new PdfPCell(new Phrase("",font1));
e16ema.setPaddingTop(7);
e16ema.setPaddingBottom(7);
table.addCell(e16ema);











PdfPCell e15mz = new PdfPCell(new Phrase("",font1));

e15mz.setPaddingTop(7);
e15mz.setPaddingBottom(7);
table.addCell(e15mz);

PdfPCell e16mz = new PdfPCell(new Phrase("",font1));
e16mz.setPaddingTop(7);
e16mz.setPaddingBottom(7);
table.addCell(e16mz);



PdfPCell c31mz = new PdfPCell(new Phrase("",font1));

c31mz.setPaddingTop(7);
c31mz.setPaddingBottom(7);
table.addCell(c31mz);


PdfPCell c32mz = new PdfPCell(new Phrase("",font1));

table.addCell(c32mz);

PdfPCell d11mz = new PdfPCell(new Phrase("",font1));//(String)session.getAttribute("openStock")
//c151.setPaddingTop(7);
//c151.setPaddingBottom(7);
table.addCell(d11mz);

PdfPCell d12mz = new PdfPCell(new Phrase("",font1));
d12mz.setPaddingTop(7);
d12mz.setPaddingBottom(7);
table.addCell(d12mz);

PdfPCell d21mz = new PdfPCell(new Phrase("",font1));
d21mz.setPaddingTop(7);
d21mz.setPaddingBottom(7);
table.addCell(d21mz);

PdfPCell d31mz = new PdfPCell(new Phrase("",font1));
d31mz.setPaddingTop(7);
d31mz.setPaddingBottom(7);
table.addCell(d31mz);

PdfPCell d41mz = new PdfPCell(new Phrase("",font1));
d41mz.setPaddingTop(7);
d41mz.setPaddingBottom(7);
table.addCell(d41mz);

PdfPCell d51mz = new PdfPCell(new Phrase("",font1));
d51mz.setPaddingTop(7);
d51mz.setPaddingBottom(7);
table.addCell(d51mz);

PdfPCell ec11mz = new PdfPCell(new Phrase("",font1));
ec11mz.setPaddingTop(7);
ec11mz.setPaddingBottom(7);
table.addCell(ec11mz);

PdfPCell e1cmz = new PdfPCell(new Phrase("",font1));
e1cmz.setPaddingTop(7);
e1cmz.setPaddingBottom(7);
table.addCell(e1cmz);

PdfPCell e2cmz = new PdfPCell(new Phrase("",font1));
e2cmz.setPaddingTop(7);
e2cmz.setPaddingBottom(7);
table.addCell(e2cmz);

PdfPCell e3cmz = new PdfPCell(new Phrase("",font1));
e3cmz.setPaddingTop(7);
e3cmz.setPaddingBottom(7);
table.addCell(e3cmz);

PdfPCell e4emz = new PdfPCell(new Phrase("",font1));
e4emz.setPaddingTop(7);
e4emz.setPaddingBottom(7);
table.addCell(e4emz);

PdfPCell e5emz = new PdfPCell(new Phrase("",font1));
e5emz.setPaddingTop(7);
e5emz.setPaddingBottom(7);
table.addCell(e5emz);

PdfPCell e6emz = new PdfPCell(new Phrase("",font1));
e6emz.setPaddingTop(7);
e6emz.setPaddingBottom(7);
table.addCell(e6emz);

PdfPCell e7emz = new PdfPCell(new Phrase("",font1));
e7emz.setPaddingTop(7);
e7emz.setPaddingBottom(7);
table.addCell(e7emz);

PdfPCell e8emz = new PdfPCell(new Phrase("",font1));
e8emz.setPaddingTop(7);
e8emz.setPaddingBottom(7);
table.addCell(e8emz);

PdfPCell e9emz = new PdfPCell(new Phrase(""+maintenance,font1));
e9emz.setBackgroundColor(new BaseColor(233, 246, 249));
e9emz.setPaddingTop(7);
e9emz.setPaddingBottom(7);
table.addCell(e9emz);

PdfPCell e10emz9 = new PdfPCell(new Phrase("",font1));
e10emz9.setPaddingTop(7);
e10emz9.setPaddingBottom(7);
table.addCell(e10emz9);

PdfPCell e11emz = new PdfPCell(new Phrase("",font1));
e11emz.setPaddingTop(7);
e11emz.setPaddingBottom(7);
table.addCell(e11emz);

PdfPCell e12emz = new PdfPCell(new Phrase("",font1));
e12emz.setPaddingTop(7);
e12emz.setPaddingBottom(7);
table.addCell(e12emz);

PdfPCell e13emz = new PdfPCell(new Phrase("",font1));
e13emz.setPaddingTop(7);
e13emz.setPaddingBottom(7);
table.addCell(e13emz);

PdfPCell e14emz= new PdfPCell(new Phrase("",font1));
e14emz.setPaddingTop(7);
e14emz.setPaddingBottom(7);
table.addCell(e14emz);

PdfPCell e15emz = new PdfPCell(new Phrase("",font1));
e15emz.setPaddingTop(7);
e15emz.setPaddingBottom(7);
table.addCell(e15emz);

PdfPCell e16emz = new PdfPCell(new Phrase("",font1));

e16emz.setPaddingTop(7);
e16emz.setPaddingBottom(7);
table.addCell(e16emz);




document.add(tab);
document.add(table);
//document.add(t);

document.close();



}

JSONArray list =new JSONArray();
JSONObject obj = new JSONObject();
obj.put("print", print);

list.add(obj);

out.println(list.toJSONString());
out.flush();


%>