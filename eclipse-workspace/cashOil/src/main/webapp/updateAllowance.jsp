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
			System.out.println(option);
		
				 if(option.equals("cerdit")){
						String id = request.getParameter("myid"); 
						
						session.setAttribute("id", id);
						String i = (String)session.getAttribute("id");
						
				    st = con.prepareStatement("select * from credit where id=?");
				    st.setString(1, id);
			
					rs = st.executeQuery();
			
					while (rs.next()==true) {
						String date = rs.getString("date");
						String customer = rs.getString("customer");
						String truckMachine = rs.getString("truckMachine");
						String product = rs.getString("product");
						
						String ltr = rs.getString("ltr");
						String rate = rs.getString("rate");
						String total = rs.getString("total");
						
						
						JSONObject obj = new JSONObject();
						obj.put("date", date);
						obj.put("customer", customer);
						obj.put("truckMachine", truckMachine);
						obj.put("product", product);
						obj.put("ltr", ltr);
						obj.put("rate", rate);
						obj.put("total", total);
						
						
						
						list.add(obj);
						
				
						
					}
					out.println(list.toJSONString());
					out.flush();
					
				 }else if(option.equals("update")){
					 
					   String id = request.getParameter("myid"); 
						System.out.println(id);
						session.setAttribute("id", id);
						String i = (String)session.getAttribute("id");
						
				    st = con.prepareStatement("select * from allowance where id=?");
				    st.setString(1, id);
			
					rs = st.executeQuery();
			
					while (rs.next()==true) {
						String date = rs.getString("date");
						String empName = rs.getString("empName");
						String position = rs.getString("position");
						String amount = rs.getString("amount");
						String aWeek = rs.getString("aWeek");
						
						JSONObject obj = new JSONObject();
						obj.put("date", date);
						obj.put("empName", empName);
						obj.put("position", position);
						obj.put("amount", amount);
						obj.put("aWeek", aWeek);
						list.add(obj);
						
				
						
					}
					out.println(list.toJSONString());
					out.flush();
					 
				 }else if(option.equals("delete")){
					 
					 
					 String id = request.getParameter("myid"); 
					 System.out.println(id);
						st = con.prepareStatement("delete from allowance where id=?");
						st.setString(1, id);
					    st.executeUpdate();
						
					    
					    JSONObject obj = new JSONObject();
					    obj.put("id", id);
					    list.add(obj);
					    
					    out.println(list.toJSONString());
						out.flush();
					}
				 
					
					 
			%>