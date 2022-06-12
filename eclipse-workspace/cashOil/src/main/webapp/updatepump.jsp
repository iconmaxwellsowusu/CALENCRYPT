			<%@page import="java.sql.*"%>
			<%@page import="org.json.simple.*"%>
			
			<%
			
			JSONArray list =new JSONArray();
			Connection con;
			PreparedStatement st;
			ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");

			String option = request.getParameter("option");   
		
				 
						String id = request.getParameter("myid"); 
						
						if(option.equals("no")){
						
						session.setAttribute("id", id);
						String i = (String)session.getAttribute("id");
						
				    st = con.prepareStatement("select * from pump where id=?");
				    st.setString(1, id);
			
					rs = st.executeQuery();
			
					while (rs.next()==true) {
						String date = rs.getString("date");
						String position = rs.getString("position");
						String product = rs.getString("product");
						String reading = rs.getString("reading");
					
						
						JSONObject obj = new JSONObject();
						obj.put("date", date);
						obj.put("position", position);
						obj.put("product", product);
						obj.put("reading", reading);
						
						
						list.add(obj);
						
				
						
					}
					out.println(list.toJSONString());
					out.flush();
				}else if(option.equals("delete")){
					
					st = con.prepareStatement("delete from pump where id=?");
					st.setString(1, id);
				    st.executeUpdate();
					
				    
				    JSONObject obj = new JSONObject();
				    obj.put("id", id);
				    list.add(obj);
				    
				    out.println(list.toJSONString());
					out.flush();
				}
						
						
					
				 
					
					 
			%>