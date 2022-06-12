
       <%@page import="java.sql.*"%>


<% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Statement st;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
        st=con.createStatement();
        
        String query = "select * from payslip where id='"+id+"'";
        rs = st.executeQuery(query);
         
        while(rs.next()){
        	String test=rs.getString("empName");
        	String test1 = rs.getString("month");
        	 HttpSession sess = request.getSession(false);
        	 sess.setAttribute("name", test);
        	 sess.setAttribute("month", test1);
        }
        String test = (String)session.getAttribute("name");
        String test1 = (String)session.getAttribute("month");
        System.out.println("test session "+ test);
        System.out.println("test session "+ test1);
     
        pst = con.prepareStatement("delete from payroll where empName=? and payDay =?");
        pst.setString(1, test);
        pst.setString(2, test1);
        pst.executeUpdate();
        
        
        pst = con.prepareStatement("delete from payslip where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        
        

       
       response.sendRedirect("PaySlipList.jsp");
       %>