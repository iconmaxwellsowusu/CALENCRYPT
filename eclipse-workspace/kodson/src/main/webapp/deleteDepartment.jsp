<%@page import="java.sql.*"%>


<% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        pst = con.prepareStatement("delete from department where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        
       
        %>


<script>
            
            alert("Record Deletee");
            wait(1000);
       </script>

<%
       
       response.sendRedirect("CreateDepartment.jsp");
       %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>