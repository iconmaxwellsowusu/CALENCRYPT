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
		
			if(option.equals("stock")){
				 
						String id = request.getParameter("myid"); 
						System.out.println(id);
						
						session.setAttribute("id", id);
						String i = (String)session.getAttribute("id");
						
				    st = con.prepareStatement("select * from lubestock where id=?");
				    st.setString(1, id);
			
					rs = st.executeQuery();
			
					while (rs.next()==true) {
						String date = rs.getString("date");
						String product = rs.getString("product");
						String ltr = rs.getString("litresRecieved");
						
					
						
						JSONObject obj = new JSONObject();
						obj.put("date", date);
						obj.put("product", product);
						obj.put("ltr", ltr);
						
						
						
						list.add(obj);
						
				
						
					}
					out.println(list.toJSONString());
					out.flush();
					
			}else if(option.equals("sale")){
				
				String id = request.getParameter("myid"); 
				System.out.println(id);
				
				session.setAttribute("id", id);
			
				
		    st = con.prepareStatement("select * from lubeSale where id=?");
		    st.setString(1, id);
	
			rs = st.executeQuery();
	
			while (rs.next()==true) {
				String date = rs.getString("date");
				String litresSold = rs.getString("litresSold");
				String rate = rs.getString("rate");
				
			
				
				JSONObject obj = new JSONObject();
				obj.put("date", date);
				obj.put("litresSold", litresSold);
				obj.put("rate", rate);
				
				
				
				list.add(obj);
				
		
				
			}
			out.println(list.toJSONString());
			out.flush();
				
			}else if(option.equals("deleteS")){
				 String id = request.getParameter("myid"); 
					
					st = con.prepareStatement("delete from lubestock where id=?");
					st.setString(1, id);
				    st.executeUpdate();
					
				    
				    JSONObject obj = new JSONObject();
				    obj.put("id", id);
				    list.add(obj);
				    
				    out.println(list.toJSONString());
					out.flush();
				}else if(option.equals("deleteL")){
					 String id = request.getParameter("myid"); 
						
						st = con.prepareStatement("delete from lubeSale where id=?");
						st.setString(1, id);
					    st.executeUpdate();
						
					    
					    JSONObject obj = new JSONObject();
					    obj.put("id", id);
					    list.add(obj);
					    
					    out.println(list.toJSONString());
						out.flush();
					}else if(option.equals("adminD")){
						 String id = request.getParameter("myid"); 
							
							st = con.prepareStatement("delete from login where id=?");
							st.setString(1, id);
						    st.executeUpdate();
							
						    
						    JSONObject obj = new JSONObject();
						    obj.put("id", id);
						    list.add(obj);
						    
						    out.println(list.toJSONString());
							out.flush();
						}
				 
					else if(option.equals("admin")){
						
						String id = request.getParameter("myid"); 
						
						
						session.setAttribute("id", id);
					
						
				    st = con.prepareStatement("select * from login where id=?");
				    st.setString(1, id);
			
					rs = st.executeQuery();
			
					while (rs.next()==true) {
						String name = rs.getString("manager");
						
						
						System.out.println(name);
						
						JSONObject obj = new JSONObject();
						obj.put("name", name);
						
						
						
						
						list.add(obj);
						
						 out.println(list.toJSONString());
					     out.flush();
						
					}
					}
					 
			%>