<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
    
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
      
      
      JSONArray list = new JSONArray();
      String id = request.getParameter("myid");
      
      
      Connection con;
      PreparedStatement pst;
      ResultSet rs;
      
      Class.forName("com.mysql.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");
      pst = con.prepareStatement("delete from empFile where id=?");
      pst.setString(1, id);
      
      
      pst.executeUpdate();
      
      JSONObject obj = new JSONObject();
	    
	    obj.put("id", id);
	   
	    
	    list.add(obj);
	

	out.print(list.toJSONString());
	out.flush();
        
      %>

</body>
</html>