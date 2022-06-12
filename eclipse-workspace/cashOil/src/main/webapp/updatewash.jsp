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
						
						if(option.equals("sale")){
						session.setAttribute("id", id);
						String i = (String)session.getAttribute("id");
						
				    st = con.prepareStatement("select * from washingBayData where id=?");
				    st.setString(1, id);
			
					rs = st.executeQuery();
			
					while (rs.next()==true) {
						String date = rs.getString("date");
						String particulars = rs.getString("particulars");
						String numberOfCars = rs.getString("numberOfCars");
						String sales = rs.getString("sales");
						
						String expenses = rs.getString("expenses");
						String commission = rs.getString("commission");
						String Exdeposite = rs.getString("Exdeposite");
						String deposite = rs.getString("deposite");
					    
						
						JSONObject obj = new JSONObject();
						obj.put("date", date);
						obj.put("particulars", particulars);
						obj.put("numberOfCars", numberOfCars);
						obj.put("sales", sales);
						obj.put("expenses", expenses);
						obj.put("commission", commission);
						obj.put("Exdeposite", Exdeposite);
						obj.put("deposite", deposite);
						
						
						list.add(obj);
						
				
						
					}
					out.println(list.toJSONString());
					out.flush();
				}
					
					else if(option.equals("delete")){
						 
						
							st = con.prepareStatement("delete from washingBayData where id=?");
							st.setString(1, id);
						    st.executeUpdate();
							
						    
						    JSONObject obj = new JSONObject();
						    obj.put("id", id);
						    list.add(obj);
						    
						    out.println(list.toJSONString());
							out.flush();
						}
					
				
					
				 
					
					 
			%>