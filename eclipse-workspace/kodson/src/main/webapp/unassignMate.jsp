<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<% 
    
        String id = request.getParameter("id");

        

        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("update drivers set mate=null where id = ?");

        pst.setString(1, id);
        
        pst.executeUpdate();
        %>

<script>   
            alert("Mate unassigned");           
       </script>
<%    
    response.sendRedirect("driverManager.jsp");
    
%>

<!DOCTYPE html>
<html lang="en">


</html>