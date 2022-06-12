			<%@page import="java.sql.*"%>
			<%@page import="org.json.simple.*"%>
			
			<%
			
			JSONArray list =new JSONArray();
			Connection con;
			PreparedStatement st;
			ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
			String accNum = request.getParameter("myid");       
				
				    
				    st = con.prepareStatement("select * from message where id=?");
				    st.setString(1, accNum);
			
					rs = st.executeQuery();
			
					if (rs.next()==true) {
						String message = rs.getString("post");
						
						
						JSONObject obj = new JSONObject();
						obj.put("message", message);
						
						
						list.add(obj);
						
					
						
					}
					out.println(list.toJSONString());
					out.flush();
					
					
			
			%>