<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="java.sql.*"%>
	  <%@page import="org.json.simple.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

      <%
      
      
      
      String date = request.getParameter("date");
      String pump = request.getParameter("pump");
      String read = request.getParameter("read");
      
      Connection con;
      PreparedStatement pst;
      ResultSet rs;
      
      Class.forName("com.mysql.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
      pst = con.prepareStatement("delete from pump where date=? and position=? and reading =?");
      pst.setString(1, date);
      pst.setString(2, pump);
      pst.setString(3, read);
      
      pst.executeUpdate();
        
      %>

</body>
</html>