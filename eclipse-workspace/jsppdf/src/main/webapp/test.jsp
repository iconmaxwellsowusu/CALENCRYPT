<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table>
<% 
   

String select[] = request.getParameterValues("id"); 

    if (select != null && select.length != 0) {
    	System.out.println("You have selected: ");
        for (int i = 0; i < select.length; i++) {
            System.out.println(select[i]); 
   



    
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");
    
      String quer = "select * from trips where id='"+select[i]+"'";
      Statement s = con.createStatement();
      
        rs =  s.executeQuery(quer);
        
            while(rs.next())
            {
            	String name = rs.getString("name");
            	String truck = rs.getString("vehicleNumber");
            	System.out.println(" is "+name+" drives "+ truck );
            	
            }  
        }
       }
%>
</table>
</body>
</html>