<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
	
	String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
	String m5 =new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());


 %>
<%@page import="org.json.simple.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

				<%
				
				
				JSONArray list =new JSONArray();
				
				String branch = "testBranch"; 
				String month = m5; 
				String date = request.getParameter("date"); 
				String pump = request.getParameter("pump"); 
				String read = request.getParameter("read"); 
				String product = request.getParameter("product");
				
				
				
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
				pst = con.prepareStatement("insert into pump(branch,month,date,position,reading,product) values(?,?,?,?,?,?)");
				
				pst.setString(1, branch);
				pst.setString(2, month);
				pst.setString(3, date);
				pst.setString(4, pump);
				pst.setString(5, read);
				pst.setString(6, product);
				
				pst.executeUpdate();
				
				%>

</body>
</html>