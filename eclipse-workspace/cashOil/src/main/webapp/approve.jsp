<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <% 
    
   
        String id = request.getParameter("id");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        pst = con.prepareStatement("update requests set status='Approved' where id=?");
        pst.setString(1, id);
        pst.executeUpdate();  
         
        response.sendRedirect("superAdmin.jsp");
   
   %>
</body>
</html>