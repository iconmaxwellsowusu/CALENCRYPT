<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>

<%@page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%@page import="java.sql.*"%>
<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>

 <%
 String branch1 = (String)session.getAttribute("branch");
 Calendar cal = Calendar.getInstance();
	Calendar cal1 = Calendar.getInstance();
	//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
	
	String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());


 %>

<%
    if(request.getParameter("printer")!=null){
    	
        int ii = 0;
        double supply=0;
        double credit=0;
        double advance=0;
        double shortage=0;
        double expCash=0;
        
        String date11 = (String)session.getAttribute("date1");
        String date21 = (String)session.getAttribute("date2");
        String month1 = (String)session.getAttribute("month");
 
        String period="";
        
        
        String query = "";//"select * from trips where monthh='"+months+"' and OilCompany='"+cop+"'";
        if(month1 != null ){
       	 query = "select * from closingstock where month ='"+month1+"' and branch='"+branch1+"'";
       	 period=month1;
        }
        
        
        else if(date11 != null){
       	 query = "select * from closingstock where date between '"+date11+"' and '"+date21+"' and branch='"+branch1+"'";
       	 period = date11 +" and " + date21;
        }
        
       
        
		if(request.getParameter("printer")!= null){
		//	System.out.println("printing ..........");
			
			
				//System.out.println(type1 +" is lube stock ------ and query is "+query);
				
				Document document = new Document(PageSize.A3.rotate());

			    response.setContentType("test/pdf");
				response.setHeader("Content-Disposition","Inline; filename=\"doc.pdf\"");
		        
		    PdfWriter.getInstance(document,response.getOutputStream());
		    document.open();

			
			    
			   
			    Font font1 = FontFactory.getFont(FontFactory.HELVETICA_BOLD,7, BaseColor.BLACK);
			    Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD,6, BaseColor.BLACK);
			    float[] columnWidths = {2, 4, 3,4,3,4,4,4,4,3,3,4,4,4,4,4,4,4,4,4,4,4,3,4,4,4,4};
			    float[] columnWidths1= {2, 4, 3,4,3,4,4,4,4,3,3,4,4,4,4,4,4,4,4,4,4,4,3,4,4,4,4};
			    
			    PdfPTable tab = new PdfPTable(1);
				tab.addCell(new PdfPCell(new Phrase("                                                                                                                                                 Sales Report For"+period)));
				tab.setWidthPercentage(104);
				
				 PdfPTable table = new PdfPTable(columnWidths);
				    table.setWidthPercentage(104);
			    
				    PdfPCell c1 = new PdfPCell(new Phrase("#",font));
				    c1.setFixedHeight(10);
				    c1.setBackgroundColor(BaseColor.CYAN);
				    table.addCell(c1);
				    PdfPCell c2 = new PdfPCell(new Phrase("Date",font));
				    c2.setBackgroundColor(BaseColor.CYAN);
				   
				    c2.setFixedHeight(10);
				    table.addCell(c2);
				    PdfPCell c3 = new PdfPCell(new Phrase("Product",font));
				    c3.setBackgroundColor(BaseColor.CYAN);
				    c3.setFixedHeight(10);
				    table.addCell(c3);

				    PdfPCell d6 = new PdfPCell(new Phrase("Open Stock",font));
				    d6.setBackgroundColor(BaseColor.CYAN);
				    d6.setFixedHeight(10);
				    table.addCell(d6);
				    
				    PdfPCell d7 = new PdfPCell(new Phrase("Load",font));
				    d7.setBackgroundColor(BaseColor.CYAN);
				    d7.setFixedHeight(10);
				    table.addCell(d7);
				    
				    PdfPCell d8 = new PdfPCell(new Phrase("Overage/Shortage",font));
				    d8.setBackgroundColor(BaseColor.CYAN);
				    d8.setFixedHeight(10);
				    table.addCell(d8);
				    PdfPCell d9 = new PdfPCell(new Phrase("Available",font));
				    d9.setBackgroundColor(BaseColor.CYAN);
				    d9.setFixedHeight(10);
				    table.addCell(d9);
				    PdfPCell d10 = new PdfPCell(new Phrase("Sales(Check)",font));
				    d10.setBackgroundColor(BaseColor.CYAN);
				    d10.setFixedHeight(10);
				    table.addCell(d10);
				    PdfPCell d11 = new PdfPCell(new Phrase("ClosingStock",font));
				    d11.setBackgroundColor(BaseColor.CYAN);
				    d11.setFixedHeight(10);
				    table.addCell(d11);
				    PdfPCell d12 = new PdfPCell(new Phrase("Deffirence",font));
				    d12.setBackgroundColor(BaseColor.CYAN);
				    d12.setFixedHeight(10);
				    table.addCell(d12);
				    PdfPCell d13 = new PdfPCell(new Phrase("OpenStock Reading",font));
				    d13.setBackgroundColor(BaseColor.CYAN);
				    d13.setFixedHeight(10);
				    table.addCell(d13);
				    PdfPCell d14 = new PdfPCell(new Phrase("ClosingStock Reading",font));
				    d14.setBackgroundColor(BaseColor.CYAN);
				    d14.setFixedHeight(10);
				    table.addCell(d14);
				    PdfPCell d15 = new PdfPCell(new Phrase("Return To Tank",font));
				    d15.setBackgroundColor(BaseColor.CYAN);
				    d15.setFixedHeight(10);
				    table.addCell(d15);
				    PdfPCell d16 = new PdfPCell(new Phrase("Sales Ltr",font));
				    d16.setBackgroundColor(BaseColor.CYAN);
				    d16.setFixedHeight(10);
				    table.addCell(d16);
				    PdfPCell d17 = new PdfPCell(new Phrase("Rate(Ghs)",font));
				    d17.setBackgroundColor(BaseColor.CYAN);
				    d17.setFixedHeight(10);
				    table.addCell(d17);
				    PdfPCell d18 = new PdfPCell(new Phrase("Value(Ghs)",font));
				    d18.setBackgroundColor(BaseColor.CYAN);
				    d18.setFixedHeight(10);
				    table.addCell(d18);
				    PdfPCell d19 = new PdfPCell(new Phrase("CashSale(Ghs)",font));
				    d19.setBackgroundColor(BaseColor.CYAN);
				    d19.setFixedHeight(10);
				    table.addCell(d19);
				    PdfPCell d20 = new PdfPCell(new Phrase("CreditSale(Ghs)",font));
				    d20.setBackgroundColor(BaseColor.CYAN);
				    d20.setFixedHeight(10);
				    table.addCell(d20);
				    PdfPCell d21 = new PdfPCell(new Phrase("Advances(Ghs)",font));
				    d21.setBackgroundColor(BaseColor.CYAN);
				    d21.setFixedHeight(10);
				    table.addCell(d21);
				    PdfPCell d22 = new PdfPCell(new Phrase("Shortages(Ghs)",font));
				    d22.setBackgroundColor(BaseColor.CYAN);
				    d22.setFixedHeight(10);
				    table.addCell(d22);
				    PdfPCell d23 = new PdfPCell(new Phrase("Balance b/f",font));
				    d23.setBackgroundColor(BaseColor.CYAN);
				    d23.setFixedHeight(10);
				    table.addCell(d23);
				    PdfPCell d24 = new PdfPCell(new Phrase("Cash From sale",font));
				    d24.setBackgroundColor(BaseColor.CYAN);
				    d24.setFixedHeight(10);
				    table.addCell(d24);
				    PdfPCell d25 = new PdfPCell(new Phrase("Shortage Repayment",font));
				    d25.setBackgroundColor(BaseColor.CYAN);
				    d25.setFixedHeight(10);
				    table.addCell(d25);
				    PdfPCell d26 = new PdfPCell(new Phrase("Repayment of Advances",font));
				    d26.setBackgroundColor(BaseColor.CYAN);
				    d26.setFixedHeight(10);
				    table.addCell(d26);
				    PdfPCell d27 = new PdfPCell(new Phrase("Received From Debtors",font));
				    d27.setBackgroundColor(BaseColor.CYAN);
				    d27.setFixedHeight(10);
				    table.addCell(d27);
				    PdfPCell d28 = new PdfPCell(new Phrase("Expected Cash Deposit",font));
				    d28.setBackgroundColor(BaseColor.CYAN);
				    d28.setFixedHeight(10);
				    table.addCell(d28);
				    
				    PdfPCell d29 = new PdfPCell(new Phrase("Bank Lodgements",font));
				    d29.setBackgroundColor(BaseColor.CYAN);
				    d29.setFixedHeight(10);
				    table.addCell(d29);
				    
				    
				  
				    
				    
	
		    table.setHeaderRows(1);
		    
		    
           Connection con;
           PreparedStatement pst;
           ResultSet rs;
           
          
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
           
           
             Statement st = con.createStatement();
             
             double amountTotal=0;
           
               rs =  st.executeQuery(query);
               
               while(rs.next())
               {
             
          
                 ii+=1;
               	PdfPCell c150 = new PdfPCell(new Phrase(""+ ii,font1));
				    table.addCell(c150);
				    PdfPCell c151 = new PdfPCell(new Phrase(rs.getString("date"),font1));
				    c151.setPaddingTop(7);
				    c151.setPaddingBottom(7);
				    table.addCell(c151);
				    PdfPCell load = new PdfPCell(new Phrase(rs.getString("product"),font1));
				    table.addCell(load);
				    
				    
				    PdfPCell type = new PdfPCell(new Phrase(rs.getString("opens"),font1));
				    table.addCell(type);
				    
				    PdfPCell type1 = new PdfPCell(new Phrase(rs.getString("loads"),font1));
				    table.addCell(type1);
				    
				    PdfPCell type2 = new PdfPCell(new Phrase(rs.getString("shortageOverage"),font1));
				    table.addCell(type2);
				    
				    PdfPCell type3 = new PdfPCell(new Phrase(rs.getString("available"),font1));
				    table.addCell(type3);
				    
				    PdfPCell type4 = new PdfPCell(new Phrase(rs.getString("salesCheck"),font1));
				    table.addCell(type4);
				    
				    PdfPCell type5 = new PdfPCell(new Phrase(rs.getString("closingStockvalue"),font1));
				    table.addCell(type5);
				    
				    PdfPCell type6 = new PdfPCell(new Phrase(rs.getString("difference"),font1));
				    table.addCell(type6);
				    
				    PdfPCell type7 = new PdfPCell(new Phrase(rs.getString("openStockR"),font1));
				    table.addCell(type7);
				    
				    PdfPCell type8 = new PdfPCell(new Phrase(rs.getString("closeReading"),font1));
				    table.addCell(type8);
				    
				    PdfPCell type9 = new PdfPCell(new Phrase(rs.getString("returnTotank"),font1));
				    table.addCell(type9);
				    
				    PdfPCell type10 = new PdfPCell(new Phrase(rs.getString("salesltr"),font1));
				    table.addCell(type10);
				    
				    PdfPCell type11 = new PdfPCell(new Phrase(rs.getString("rate"),font1));
				    table.addCell(type11);
				    
				    PdfPCell type12 = new PdfPCell(new Phrase(rs.getString("value_"),font1));
				    table.addCell(type12);
				    
				    PdfPCell type13 = new PdfPCell(new Phrase(rs.getString("cashSale"),font1));
				    table.addCell(type13);
				    
				    PdfPCell type14 = new PdfPCell(new Phrase(rs.getString("creditSale"),font1));
				    table.addCell(type14);
				    
				    PdfPCell type15 = new PdfPCell(new Phrase(rs.getString("advances"),font1));
				    table.addCell(type15);
				    
				    PdfPCell type16 = new PdfPCell(new Phrase(rs.getString("shortage"),font1));
				    table.addCell(type16);
				    
				    PdfPCell type17 = new PdfPCell(new Phrase(rs.getString("balance"),font1));
				    table.addCell(type17);
				    
				    PdfPCell type18 = new PdfPCell(new Phrase(rs.getString("cashAvailable"),font1));
				    table.addCell(type18);
				    
				    PdfPCell type19 = new PdfPCell(new Phrase(rs.getString("shortageRepayment"),font1));
				    table.addCell(type19);
				    
				    PdfPCell type20 = new PdfPCell(new Phrase(rs.getString("advanceRepayment"),font1));
				    table.addCell(type20);
				    
				    PdfPCell type21 = new PdfPCell(new Phrase(rs.getString("receivedFromDebtors"),font1));
				    table.addCell(type21);
				    
				    PdfPCell type22 = new PdfPCell(new Phrase(rs.getString("expected"),font1));
				    table.addCell(type22);
				    
				    PdfPCell type23 = new PdfPCell(new Phrase(rs.getString("bankLodgement"),font1));
				    table.addCell(type23);
			
				    double sup = rs.getDouble("loads");
				    double cre = rs.getDouble("creditSale");
				    double adv = rs.getDouble("advances");
				    double shrt = rs.getDouble("shortage");
				    double exp = rs.getDouble("expected");
				 
				   
				    supply +=sup;
				    credit +=cre;
				    advance +=adv;
				    shortage +=shrt;
				    expCash +=exp;
				    
				    
				    
				    
               }

               

               PdfPTable t = new PdfPTable(columnWidths1);
               PdfPCell total = new PdfPCell(new Phrase("Total",font1));
               total.setBorder(Rectangle.NO_BORDER);
               t.addCell(total);

               PdfPCell total1 = new PdfPCell(new Phrase("",font1));
               total1.setBorder(Rectangle.NO_BORDER);
               total1.setVerticalAlignment(Element.ALIGN_MIDDLE);
               t.addCell(total1);

             

               PdfPCell total3 = new PdfPCell(new Phrase("",font1));
               total3.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total3.setBorder(Rectangle.NO_BORDER);
               t.addCell(total3);
               
               PdfPCell total31 = new PdfPCell(new Phrase("",font1));
               total31.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total31.setBorder(Rectangle.NO_BORDER);
               t.addCell(total31);
              

               PdfPCell total337 = new PdfPCell(new Phrase("",font1));
               total337.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total337.setBorder(Rectangle.NO_BORDER);
               t.addCell(total337);
               
               PdfPCell total33 = new PdfPCell(new Phrase("",font1));
               total33.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total33.setBorder(Rectangle.NO_BORDER);
               t.addCell(total33);
               
               PdfPCell total331= new PdfPCell(new Phrase("",font1));
               total331.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total331.setBorder(Rectangle.NO_BORDER);
               t.addCell(total331);
               
               PdfPCell total332 = new PdfPCell(new Phrase("",font1));
               total332.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total332.setBorder(Rectangle.NO_BORDER);
               t.addCell(total332);
               
               PdfPCell total333 = new PdfPCell(new Phrase("",font1));
               total333.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total333.setBorder(Rectangle.NO_BORDER);
               t.addCell(total333);
               
               PdfPCell total334 = new PdfPCell(new Phrase("",font1));
               total334.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total334.setBorder(Rectangle.NO_BORDER);
               t.addCell(total334);
               
               PdfPCell total335 = new PdfPCell(new Phrase("",font1));
               total335.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total335.setBorder(Rectangle.NO_BORDER);
               t.addCell(total335);
               
               PdfPCell total336 = new PdfPCell(new Phrase("",font1));
               total336.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total336.setBorder(Rectangle.NO_BORDER);
               t.addCell(total336);
               
               PdfPCell total338 = new PdfPCell(new Phrase("",font1));
               total338.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total338.setBorder(Rectangle.NO_BORDER);
               t.addCell(total338);
               
               PdfPCell total339 = new PdfPCell(new Phrase("",font1));
               total339.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total339.setBorder(Rectangle.NO_BORDER);
               t.addCell(total339);
               
               PdfPCell total22 = new PdfPCell(new Phrase("",font1));
               total22.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total22.setBorder(Rectangle.NO_BORDER);
               t.addCell(total22);
               
               PdfPCell total23 = new PdfPCell(new Phrase("",font1));
               total23.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total23.setBorder(Rectangle.NO_BORDER);
               t.addCell(total23);
               
               PdfPCell total24 = new PdfPCell(new Phrase("",font1));
               total24.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total24.setBorder(Rectangle.NO_BORDER);
               t.addCell(total24);
               
               PdfPCell total25 = new PdfPCell(new Phrase("",font1));
               total25.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total25.setBorder(Rectangle.NO_BORDER);
               t.addCell(total25);
               
               PdfPCell total26 = new PdfPCell(new Phrase("",font1));
               total26.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total26.setBorder(Rectangle.NO_BORDER);
               t.addCell(total26);
               
               PdfPCell total27 = new PdfPCell(new Phrase("",font1));
               total27.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total27.setBorder(Rectangle.NO_BORDER);
               t.addCell(total27);
               
               PdfPCell total28 = new PdfPCell(new Phrase("",font1));
               total28.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total28.setBorder(Rectangle.NO_BORDER);
               t.addCell(total28);
               
               PdfPCell total29 = new PdfPCell(new Phrase("",font1));
               total29.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total29.setBorder(Rectangle.NO_BORDER);
               t.addCell(total29);
               
               PdfPCell total30 = new PdfPCell(new Phrase("",font1));
               total30.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total30.setBorder(Rectangle.NO_BORDER);
               t.addCell(total30);
               
               PdfPCell total15 = new PdfPCell(new Phrase("",font1));
               total15.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total15.setBorder(Rectangle.NO_BORDER);
               t.addCell(total15);
               
               PdfPCell total16 = new PdfPCell(new Phrase("",font1));
               total16.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total16.setBorder(Rectangle.NO_BORDER);
               t.addCell(total16);
               
               PdfPCell total17 = new PdfPCell(new Phrase("",font1));
               total17.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total17.setBorder(Rectangle.NO_BORDER);
               t.addCell(total17);
               
               
               PdfPCell total18 = new PdfPCell(new Phrase("",font1));
               total18.setVerticalAlignment(Element.ALIGN_MIDDLE);
               total18.setBorder(Rectangle.NO_BORDER);
               t.addCell(total18);
               
               
               
               t.setWidthPercentage(104);
					
                   document.add(tab);
                   document.add(table);
                   document.add(t);
				    
		    document.close();
				
				
				
				
				
				
			}
    	
    }
 
 %>







<!DOCTYPE html>
<html lang="en">

<head>
      <title>Cash Oil</title>

  <!-- Favicons -->
  <link href="assets/images/cash.jpg" rel="icon">
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
    <meta name="keywords" content="flat ui, admin Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="codedthemes" />
    <!-- Favicon icon -->
   
    <!-- Google font-->     <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
    
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  
   <!-- month css cdn  -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />  
      
       <!-- /////////////////////        Data Table css /////////////////////    -->  
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css"/>
    
</head>

<body>

<%
  	try{
	Class.forName("com.mysql.jdbc.Driver"); 

	String b=null;
	String p=null;
	
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
	    String branch = (String)session.getAttribute("branch");
	    String pass = (String)session.getAttribute("pass");
	
        Connection con;
     
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        Statement statement = con.createStatement();
	ResultSet resultSet = statement.executeQuery("select * from login where branch='"+branch+"' and '"+pass+"'");
	
	while(resultSet.next()){
		b=resultSet.getString("branch");
		p=resultSet.getString("password");
	}
	
         
        if(!pass.equals(p) || !branch.equals(b) || pass.equals(null) || pass.equals("")){
              response.sendRedirect("index.jsp");   
        }
  	}catch(Exception e){
  		 response.sendRedirect("index.jsp"); 
  		 
  	}
        %>

<!-- Pre-loader start -->
<div class="theme-loader">
    <div class="loader-track">
        <div class="preloader-wrapper">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            
            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            
            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Pre-loader end -->
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
          <nav class="navbar header-navbar pcoded-header">
              <div class="navbar-wrapper">
                  <div class="navbar-logo">
                      <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                          <i class="ti-menu"></i>
                      </a>
                      <div class="mobile-search waves-effect waves-light">
                          <div class="header-search">
                              <div class="main-search morphsearch-search">
                                  <div class="input-group">
                                      <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                      <input type="text" class="form-control" placeholder="Enter Keyword">
                                      <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                  </div>
                              </div>
                          </div>
                      </div>
                     
                  </div>
                
                  <div class="navbar-container container-fluid">
                      <ul class="nav-left">
                          <li>
                              <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                          </li>
                          <li class="header-search">
                              <div class="main-search morphsearch-search">
                                  <div class="input-group">
                                      <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                      <input type="text" class="form-control">
                                      <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                  </div>
                              </div>
                          </li>
                          <li>
                              <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                  <i class="ti-fullscreen"></i>
                              </a>
                          </li>
                      </ul>
                      <ul class="nav-right">
                          <li class="header-notification">
                              <a href="#!" class="waves-effect waves-light">
                                  <i class="ti-bell"></i>
                                  <span class="badge bg-c-red"></span>
                              </a>
                              <ul class="show-notification">
                                  <li>
                                      <h6>Notifications</h6>
                                      <label class="label label-danger">New</label>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-2.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">John Doe</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">Joseph William</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-3.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">Sara Soudein</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                              </ul>
                          </li>
                          <li class="user-profile header-notification">
                              <a href="#!" class="waves-effect waves-light">
                                  <i class="fa-solid fa-user-tie" style="font-size:18px;"></i>
                                  <span style="font-size:12px;">Welcome <% String name = (String)session.getAttribute("name"); out.println(name);%></span>
                                  <i class="ti-angle-down"></i>
                              </a>
                            <ul class="show-notification profile-notification">
                                  <li class="waves-effect waves-light">
                                      <a href="javascript:void(0)">
                                          <i class="ti-settings"></i> Settings
                                      </a>
                                  </li>
                                  
                                  <li class="waves-effect waves-light">
                                      <a href="posts.jsp">
                                          <i class="ti-email"></i>Posts From Head Office
                                      </a>
                                  </li>
                                  <!-- ///////////   ---------------   ////////////////-->
                                  <li class="waves-effect waves-light">
                                      <a data-toggle="modal" data-target="#resetModal">
                                          <i class="ti-reload"></i> Reset Account
                                      </a>
                                  </li>
                                 <li class="waves-effect waves-light">
                                      <a href="logOut">
                                          <i class="ti-share-alt"></i> Logout
                                      </a>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>
    
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                 <nav class="pcoded-navbar">
                      <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                      <div class="pcoded-inner-navbar main-menu">
                          <div class="">
                              <div class="main-menu-header">
                                  <img class="img-80 img-radius" src="assets/images/cash.jpg" alt="User-Profile-Image">
                                  <div class="user-details">
                                      <span id="more-details">CASH OIL<i class="fa fa-caret-down"></i></span>
                                  </div>
                              </div>
        
                              <div class="main-menu-content">
                                  <ul>
                                      <li class="more-details">
                                          <a href="superAdmin.jsp"><i class="ti-user"></i>Admin Page</a>
                                          
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          <div class="p-15 p-b-0">
                              
                          </div>
                          
                          
                          
                          
                          <div class="pcoded-navigation-label" data-i18n="nav.category.navigation"></div>
                          <ul class="pcoded-item pcoded-left-item">
                              <li class="active">
                                  <a href="dashBoard1.jsp" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-ruler-vertical"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Dippings</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="supply.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Product Supply</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                    <li class=" ">
                                          <a href="OpenStock.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">invoices</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="pump.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Pump Readings</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="ClosingStock.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Closing Stock</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                   

                
                                  </ul>
                              </li>
                          </ul>
                          <div class="pcoded-navigation-label" data-i18n="nav.category.forms"></div>
                          <ul class="pcoded-item pcoded-left-item">
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-oil-can"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Lube Bay</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="lubeStock.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Stock</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="lubeSale.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Add Sale</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="lubeBay.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                   
                
                                  </ul>
                              </li>
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-car-crash"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Washing Bay</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="washingBay.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Data</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="washingBankAnalysis.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Bank Deposit Analysis</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="washingBayIncomeAnalysis.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Income Analysis</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="washingBayReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  
                                     
                                 
                
                                  </ul>
                              </li>
        
                          </ul>
        
                          <div class="pcoded-navigation-label" data-i18n="nav.category.forms"></div>
                          <ul class="pcoded-item pcoded-left-item">
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa fa-tasks"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Credits</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="credit.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Credit</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                         <li class=" ">
                                          <a href="creditRepayment.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Credit Repayments</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                      <li class=" ">
                                          <a href="creditReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                    
                                   
                                  </ul>
                              </li>
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa  fa-sort-amount-asc"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Utility</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="utility.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Utility</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="UtilityReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                               
                                    
                
                                  </ul>
                              </li>
                                 <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-screwdriver-wrench"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Maintenance</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="maintenance.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Data</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="maintenaceReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     
                                
                
                                  </ul>
                              </li>
        
                          </ul>
        
                          <div class="pcoded-navigation-label" data-i18n="nav.category.other"></div>
                          <ul class="pcoded-item pcoded-left-item">
                                                          <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class=" fa fa-bar-chart-o"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Statutory</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="statutory.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Statutory</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="statutoryReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                   
                
                                  </ul>
                              </li>
                              
                              
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-money-bill-1"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Master Load</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="masterLoad.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Master Load Allowance</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="masterLoadReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     
                                    
                                     
                
                                  </ul>
                              </li>
                              
                              
                             <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa fa-book"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Daily Sales</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="sales.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Daily Sales</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     
                                      <li class=" ">
                                          <a href="fall.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Win Fall/Short Fall</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="gains.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Cumulative Gain/Loss</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="Reco.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Reconciliation Of Cash Deposit</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="rChanges.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Closing Stock As at Rate Change</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                              </li>
                              
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-money-check-dollar"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Payroll</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="employee.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Employee</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="payRoll.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Add Payroll</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                      <li class=" ">
                                          <a href="payReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Payroll Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                   
                                   
                
                                  </ul>
                              </li>
                              
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa fa-file"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Summary</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="summary.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">View Summary</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                    
                                     
                                 
                
                                  </ul>
                              </li>
                              
                                <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-dollar-sign"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Employee Allowance</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="addAllowance.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Allowance</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="allowanceReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Allowance Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                
                                  </ul>
                              </li>
                                <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-hand-open"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Requests</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="request.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Make Request</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                              </li>
                              
                                                            <li class="pcoded-hasmenu">
                                      <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-server"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Bank Lodgements</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="bankLogement.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">View Bank Lodgement</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>

                                  </ul>
                              </li>
                              
                               
                          </ul>
                      </div>
                  </nav>
                <div class="pcoded-content">
                    <!-- Page-header start -->
              
                    <!-- Page-header end -->
                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <div class="page-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>PRODUCT SUPPLY DATA</h5>
                                                     <% String disable = "true"; %>
                                                      <div class="btn-group " role="group" data-toggle="tooltip" data-placement="top">
								                        <input type="button" class="btn btn-primary btn-sm waves-effect waves-light" title="select month" value="Month" id="month" onclick="manage(this)">
								                        <input type="button" class="btn btn-primary btn-sm waves-effect waves-light" title="select period" value="Period" id="period" onclick="manage1(this)">
								                        <input type="button" class="btn btn-primary btn-sm waves-effect waves-light" title="select branch" value="Branch" id="branch" onclick="manage2(this)">
								                    </div>
								                    
								                    <script type="text/javascript">
								                	function manage(txt) {
								                        var bt = document.getElementById('month');
								                        var txt = '<%= disable%>'
								                        if (txt == 'true') {
								                            bt.disabled = false;
								                            $('#monthlyModal').modal('show');
								                        }
								                        else {
								                            bt.disabled = true;
								                            alert("You are not the admin");
								                            
								                        }
								                    }   
								                	
								                	function manage1(txt) {
								                        var bt = document.getElementById('period');
								                        var txt = '<%= disable%>'
								                        if (txt == 'true') {
								                            bt.disabled = false;
								                            $('#periodModal').modal('show');
								                        }
								                        else {
								                            bt.disabled = true;
								                            alert("You are not the admin");
								                            
								                        }
								                    }  
								                	
								                	
								                	function manage2(txt) {
								                        var bt = document.getElementById('branch');
								                        var txt = '<%= disable%>'
								                        if (txt == 'true') {
								                            bt.disabled = false;
								                            $('#branchModal').modal('show');
								                        }
								                        else {
								                            bt.disabled = true;
								                            alert("You are not the admin");
								                            
								                        }
								                    }  
								                    </script>
								                              <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="monthlyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Month and Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-6">
                                                                              <label>Select Month</label>
                                                                                <input type="Month" class="form-control" required>
                                                                            </div>
                                                                            
                                                                            <div class="col-sm-6">
                                                                              <label>Select Branch</label>
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select One Value Only</option>
                                                                            <option value="opt2">Type 2</option>
                                                                            <option value="opt3">Type 3</option>
                                                                            <option value="opt4">Type 4</option>
                                                                            <option value="opt5">Type 5</option>
                                                                            <option value="opt6">Type 6</option>
                                                                            <option value="opt7">Type 7</option>
                                                                            <option value="opt8">Type 8</option>
                                                                        </select>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>   
													
													  <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
																										 <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="resetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Account Reset Form</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="resetPass" method="post">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-6">
                                                                              <label>Enter User Name</label>
                                                                                <input type="text" class="form-control" name="uName" required>
                                                                            </div>
                                                                            
                                                                          
                                                                            
                                                                              <div class="col-sm-6">
                                                                              <label>Enter Old Password</label>
                                                                                <input type="text" class="form-control" name="oldPass" required>
                                                                            </div>
                                                                            
                                                                              <div class="col-sm-6">
                                                                              <label>Enter New Password</label>
                                                                                <input type="text" class="form-control" name="newPass" required>
                                                                            </div>
                                                                            
                                                                              <div class="col-sm-6">
                                                                              <label>Repeat Password</label>
                                                                                <input type="text" class="form-control" name="repeatPass" required>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
													
													 <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->
													
													<!-- Modal -->
													<div class="modal fade" id="periodModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Dates and Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-6">
                                                                              <label>Select Date From</label>
                                                                                <input type="date" class="form-control" required>
                                                                            </div>
                                                                            
                                                                            <div class="col-sm-6">
                                                                              <label>Select Date To</label>
                                                                                <input type="date" class="form-control" required>
                                                                            </div>
                                                                        </div>
                                                                        
                                                                         <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-8">
                                                                            
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select One Value Only</option>
                                                                            <option value="opt2">Type 2</option>
                                                                            <option value="opt3">Type 3</option>
                                                                            <option value="opt4">Type 4</option>
                                                                            <option value="opt5">Type 5</option>
                                                                            <option value="opt6">Type 6</option>
                                                                            <option value="opt7">Type 7</option>
                                                                            <option value="opt8">Type 8</option>
                                                                        </select>
                                                                            </div>
                                                                            
                                                                            
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div> 
													
													  <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="branchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-8">
                                                                            <label>Select Branch</label>
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select One Value Only</option>
                                                                            <option value="opt2">Type 2</option>
                                                                            <option value="opt3">Type 3</option>
                                                                            <option value="opt4">Type 4</option>
                                                                            <option value="opt5">Type 5</option>
                                                                            <option value="opt6">Type 6</option>
                                                                            <option value="opt7">Type 7</option>
                                                                            <option value="opt8">Type 8</option>
                                                                        </select>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div> 
                                                    <span>  </span>
                                                    <div class="card-header-right">
                                                        <ul class="list-unstyled card-option">
                                                            <li><i class="fa fa-chevron-left"></i></li>
                                                            <li><i class="fa fa-window-maximize full-card"></i></li>
                                                            <li><i class="fa fa-minus minimize-card"></i></li>
                                                            <li><i class="fa fa-refresh reload-card"></i></li>
                                                            <li><i class="fa fa-times close-card"></i></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="card-block">
                                                    
                                                    
                                                   <div align="center">
                                                    <br>
                                                    <button class="btn waves-effect waves-light btn-inverse btn-outline-inverse" data-toggle="modal" data-target="#monthlyModal1"><i class="fa-solid fa-calendar-days"></i>Generate Monthly Report</button>
                                                    <button class="btn waves-effect waves-light btn-info btn-outline-info" data-toggle="modal" data-target="#dateModal1"><i class="ti-timer"></i>Generate period Based Report</button>
                                                   
                                                     <form action="#"> <br>
                                                     <button class="btn waves-effect waves-light btn-success btn-outline-success" name="printer"><i class="fa-solid fa-print"></i>Print/Download<i class="fa-solid fa-cloud-arrow-down"></i></button>
                                                      </form>
                                                    </div>
                                                    
                                                    
                                                        <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="monthlyModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Month</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													         <form action="#" method="post">
													        
													           <!-- /////////////////////////   month and year selector ///////////////////////////////-->                         
                                
									                                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
									                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
									                                <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
									
																
																<div class="form-group row  container justify-content-center" >
																<div class="col-md-6 mb-3">
																<label >Select month</label>	                                 
																	<div class='input-group date datepicker' id='table'>						
																	  <input type="text" name="month" class="form-control" required/>
																	  <span class="input-group-addon">
																	    <i class="ti-arrow-circle-down"></i>
																	  </span>
																	</div>
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
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Generate Report</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
                                               <!-- //////////////////////////////////////////////////   Date  Modals      ////////////////////////////--> 
                                               
                                               
                                                <!-- //////////////////////////////////////////////////   Date  Modals      ////////////////////////////-->    
                                               
                                               
                                               	<!-- Modal -->
													<div class="modal fade" id="dateModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Dates</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													          <div class="form-group row  container justify-content-center" >
                                                                            <div class="col-sm-6">
                                                                               <label>Date from</label>
                                                                                <input type="Date" class="form-control">
                                                                            </div>
                                                                            <div class="col-sm-6">
                                                                              <label>Date to</label>
                                                                                <input type="Date" class="form-control"
                                                                               required >
                                                                            </div>
                                                                            
                                                                          </div> 
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary" >Generate Report</button>
													        <button type="reset" class="btn btn-secondary" >Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
   
                                               <!-- //////////////////////////////////////////////////    file Modals     ////////////////////////////--> 
                                                    
                                                    <br>
                                                    
                                                     <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                        <table class="table table-hover table table-sm" id="testData">
                                                       
                                                        
                                                         <%
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                        Statement st = con.createStatement();
                                                        
                                                        String type = request.getParameter("type");
                                                        
                                                        
                                                        String month=request.getParameter("month");
                                                        session.setAttribute("month", month);
                                                        String date1=request.getParameter("date1");
                                                        session.setAttribute("date1", date1);
                                                        String date2=request.getParameter("date2");
                                                        session.setAttribute("date2", date2);
                                                        String sql="";
                                                       
                                                        int i=0;
                                                        if(month == null && date1 == null){
                                                        
                                                        	sql = "select * from closingStock where branch='"+branch1+"'";
                                                        	
                                                        	
                                                        	%>
                                                        	
                                                        	 <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Date</th>
                                                                <th>Product</th>
                                                                <th>Open Stock</th>
                                                                <th>Load</th>
                                                                <th>Overage/Shortage</th>
                                                                <th>Available</th>
                                                                <th>Sales(Check)</th>
                                                                <th>Closing Stock</th>
                                                                <th>Deffirence</th>
                                                                <th>OpenStock Reading</th>
                                                                <th>ClosingStock Reading</th>
                                                                <th>Return To Tank</th>
                                                                <th>Sales Ltr</th>
                                                                 <th>Rate(Ghs)</th>
                                                                <th>Value(Ghs)</th>
                                                                <th>CashSale(Ghs)</th>
                                                                <th>CreditSale(Ghs)</th>
                                                                <th>Advances(Ghs)</th>
                                                                <th>Shortages(Ghs)</th>
                                                                <th>Balance b/f</th>
                                                                <th>Cash Avalable From sale</th>
                                                                <th>Shortage Repayment</th>
                                                                <th>Repayment of Advances</th>
                                                                <th>Received From Debtors</th>
                                                                <th>Expected Cash Deposit</th>
                                                                <th>Actions</th>
                                                               
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <% 
                                                        
                                                        ResultSet rs1 = st.executeQuery(sql);
                                                        while(rs1.next()){
                                                        	
                                                        
                                                        
                                                        %> 
                                                        
                                                             <tr>
                                                                <th scope="row"><%out.println(i+=1); %></th>
                                                                <td><%out.println(rs1.getString("date")); %></td>
                                                                <td><%out.println(rs1.getString("product")); %></td>
                                                                <td><%out.println(rs1.getString("opens")); %></td>
                                                                <td><%out.println(rs1.getString("loads")); %></td>
                                                                <td><%out.println(rs1.getString("shortageOverage")); %></td>
                                                                <td><%out.println(rs1.getString("available")); %></td>
                                                                <td><%out.println(rs1.getString("salesCheck")); %></td>
                                                                <td><%out.println(rs1.getString("closingStockvalue")); %></td>
                                                                 <td><%out.println(rs1.getString("difference")); %></td>
                                                                <td><%out.println(rs1.getString("openStockR")); %></td>
                                                                <td><%out.println(rs1.getString("closeReading")); %></td>
                                                                <td><%out.println(rs1.getString("returnTotank")); %></td>
                                                                <td><%out.println(rs1.getString("salesltr")); %></td>
                                                                <td><%out.println(rs1.getString("rate")); %></td>
                                                                <td><%out.println(rs1.getString("value_")); %></td>
                                                                <td><%out.println(rs1.getString("cashSale")); %></td>
                                                                <td><%out.println(rs1.getString("creditSale")); %></td>
                                                                <td><%out.println(rs1.getString("advances")); %></td>
                                                                <td><%out.println(rs1.getString("shortage")); %></td>
                                                                <td><%out.println(rs1.getString("balance")); %></td>
                                                                <td><%out.println(rs1.getString("cashAvailable")); %></td>
                                                                 <td><%out.println(rs1.getString("shortageRepayment")); %></td>
                                                                <td><%out.println(rs1.getString("advanceRepayment")); %></td>
                                                                <td><%out.println(rs1.getString("receivedFromDebtors")); %></td>
                                                                <td><%out.println(rs1.getString("expected")); %></td>
                                                                
                                                                 <td>
                                                                <a href="supply.jsp" title="Update"><i class="ti-pencil-alt" style="color:orange; padding:5px;"></i></a>
											                    <a href="supply.jsp" title="Delete"><i class="ti-trash" style="color:red"></i></a>
                                                                </td>
                                                            </tr>
                                                          <%} 
                                                        }
                                                        
                                                        else if(month != null){
                                                        	
                                                        	sql = "select * from closingStock where month ='"+month+"' and branch='"+branch1+"'";
                                                        	%>
                                                        	
                                                       	 <thead>
                                                           <tr>
                                                                <th>#</th>
                                                                <th>Date</th>
                                                                <th>Product</th>
                                                                <th>Open Stock</th>
                                                                <th>Load</th>
                                                                <th>Overage/Shortage</th>
                                                                <th>Available</th>
                                                                <th>Sales(Check)</th>
                                                                <th>Closing Stock</th>
                                                                <th>Deffirence</th>
                                                                <th>OpenStock Reading</th>
                                                                <th>ClosingStock Reading</th>
                                                                <th>Return To Tank</th>
                                                                <th>Sales Ltr</th>
                                                                 <th>Rate(Ghs)</th>
                                                                <th>Value(Ghs)</th>
                                                                <th>CashSale(Ghs)</th>
                                                                <th>CreditSale(Ghs)</th>
                                                                <th>Advances(Ghs)</th>
                                                                <th>Shortages(Ghs)</th>
                                                                <th>Balance b/f</th>
                                                                <th>Cash Avalable From sale</th>
                                                                <th>Shortage Repayment</th>
                                                                <th>Repayment of Advances</th>
                                                                <th>Received From Debtors</th>
                                                                <th>Expected Cash Deposit</th>
                                                                <th>Actions</th>
                                                               
                                                            </tr>
                                                       </thead>
                                                       <tbody>
                                                       <% 
                                                       
                                                       ResultSet rs1 = st.executeQuery(sql);
                                                       while(rs1.next()){
                                                       	
                                                       
                                                       
                                                       %> 
                                                       
                                                           <tr>
                                                                <th scope="row"><%out.println(i+=1); %></th>
                                                                <td><%out.println(rs1.getString("date")); %></td>
                                                                <td><%out.println(rs1.getString("product")); %></td>
                                                                <td><%out.println(rs1.getString("opens")); %></td>
                                                                <td><%out.println(rs1.getString("loads")); %></td>
                                                                <td><%out.println(rs1.getString("shortageOverage")); %></td>
                                                                <td><%out.println(rs1.getString("available")); %></td>
                                                                <td><%out.println(rs1.getString("salesCheck")); %></td>
                                                                <td><%out.println(rs1.getString("closingStockvalue")); %></td>
                                                                 <td><%out.println(rs1.getString("difference")); %></td>
                                                                <td><%out.println(rs1.getString("openStockR")); %></td>
                                                                <td><%out.println(rs1.getString("closeReading")); %></td>
                                                                <td><%out.println(rs1.getString("returnTotank")); %></td>
                                                                <td><%out.println(rs1.getString("salesltr")); %></td>
                                                                <td><%out.println(rs1.getString("rate")); %></td>
                                                                <td><%out.println(rs1.getString("value_")); %></td>
                                                                <td><%out.println(rs1.getString("cashSale")); %></td>
                                                                <td><%out.println(rs1.getString("creditSale")); %></td>
                                                                <td><%out.println(rs1.getString("advances")); %></td>
                                                                <td><%out.println(rs1.getString("shortage")); %></td>
                                                                <td><%out.println(rs1.getString("balance")); %></td>
                                                                <td><%out.println(rs1.getString("cashAvailable")); %></td>
                                                                 <td><%out.println(rs1.getString("shortageRepayment")); %></td>
                                                                <td><%out.println(rs1.getString("advanceRepayment")); %></td>
                                                                <td><%out.println(rs1.getString("receivedFromDebtors")); %></td>
                                                                <td><%out.println(rs1.getString("expected")); %></td>
                                                                
                                                                 <td>
                                                                <a href="supply.jsp" title="Update"><i class="ti-pencil-alt" style="color:orange; padding:5px;"></i></a>
											                    <a href="supply.jsp" title="Delete"><i class="ti-trash" style="color:red"></i></a>
                                                                </td>
                                                            </tr>
                                                         <%}
                                                        	// add where date between =
                                                        }else if(date1 != null){
                                                        	sql = "select * from closingStock where date between '"+date1+"' and '"+date2+"' and branch='"+branch1+"'";
                                                        	
                                                        	%>
                                                        	
                                                          	 <thead>
                                                              <tr>
                                                                <th>#</th>
                                                                <th>Date</th>
                                                                <th>Product</th>
                                                                <th>Open Stock</th>
                                                                <th>Load</th>
                                                                <th>Overage/Shortage</th>
                                                                <th>Available</th>
                                                                <th>Sales(Check)</th>
                                                                <th>Closing Stock</th>
                                                                <th>Deffirence</th>
                                                                <th>OpenStock Reading</th>
                                                                <th>ClosingStock Reading</th>
                                                                <th>Return To Tank</th>
                                                                <th>Sales Ltr</th>
                                                                 <th>Rate(Ghs)</th>
                                                                <th>Value(Ghs)</th>
                                                                <th>CashSale(Ghs)</th>
                                                                <th>CreditSale(Ghs)</th>
                                                                <th>Advances(Ghs)</th>
                                                                <th>Shortages(Ghs)</th>
                                                                <th>Balance b/f</th>
                                                                <th>Cash Avalable From sale</th>
                                                                <th>Shortage Repayment</th>
                                                                <th>Repayment of Advances</th>
                                                                <th>Received From Debtors</th>
                                                                <th>Expected Cash Deposit</th>
                                                                <th>Actions</th>
                                                               
                                                            </tr>
                                                          </thead>
                                                          <tbody>
                                                          <% 
                                                          
                                                          ResultSet rs1 = st.executeQuery(sql);
                                                          while(rs1.next()){
                                                          	
                                                          
                                                          
                                                          %> 
                                                          
                                                              <tr>
                                                                <th scope="row"><%out.println(i+=1); %></th>
                                                                <td><%out.println(rs1.getString("date")); %></td>
                                                                <td><%out.println(rs1.getString("product")); %></td>
                                                                <td><%out.println(rs1.getString("opens")); %></td>
                                                                <td><%out.println(rs1.getString("loads")); %></td>
                                                                <td><%out.println(rs1.getString("shortageOverage")); %></td>
                                                                <td><%out.println(rs1.getString("available")); %></td>
                                                                <td><%out.println(rs1.getString("salesCheck")); %></td>
                                                                <td><%out.println(rs1.getString("closingStockvalue")); %></td>
                                                                 <td><%out.println(rs1.getString("difference")); %></td>
                                                                <td><%out.println(rs1.getString("openStockR")); %></td>
                                                                <td><%out.println(rs1.getString("closeReading")); %></td>
                                                                <td><%out.println(rs1.getString("returnTotank")); %></td>
                                                                <td><%out.println(rs1.getString("salesltr")); %></td>
                                                                <td><%out.println(rs1.getString("rate")); %></td>
                                                                <td><%out.println(rs1.getString("value_")); %></td>
                                                                <td><%out.println(rs1.getString("cashSale")); %></td>
                                                                <td><%out.println(rs1.getString("creditSale")); %></td>
                                                                <td><%out.println(rs1.getString("advances")); %></td>
                                                                <td><%out.println(rs1.getString("shortage")); %></td>
                                                                <td><%out.println(rs1.getString("balance")); %></td>
                                                                <td><%out.println(rs1.getString("cashAvailable")); %></td>
                                                                 <td><%out.println(rs1.getString("shortageRepayment")); %></td>
                                                                <td><%out.println(rs1.getString("advanceRepayment")); %></td>
                                                                <td><%out.println(rs1.getString("receivedFromDebtors")); %></td>
                                                                <td><%out.println(rs1.getString("expected")); %></td>
                                                                
                                                                 <td>
                                                                <a href="supply.jsp" title="Update"><i class="ti-pencil-alt" style="color:orange; padding:5px;"></i></a>
											                    <a href="supply.jsp" title="Delete"><i class="ti-trash" style="color:red"></i></a>
                                                                </td>
                                                            </tr>
                                                            <%}
                                                          
                                                        }
                                                        
                                                
                                                          %>  
                                                           
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                                    
                                              <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                                             <script>
												$(document).ready( function () {
												    $('#testData').DataTable();
												} );
												
												
												</script> 
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="styleSelector">
                
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Warning Section Ends -->
<!-- Required Jquery -->
    <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>     <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>     <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>     <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script src="assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
<!-- modernizr js -->
    <script type="text/javascript" src="assets/js/SmoothScroll.js"></script>     <script src="assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="assets/js/vertical-layout.min.js "></script>
<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Custom js -->
<script type="text/javascript" src="assets/js/script.js"></script>

<!--          ////////    Data table Js ///////////////////// -->
<script src=https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js></script>
<script src=https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>

</body>

</html>
