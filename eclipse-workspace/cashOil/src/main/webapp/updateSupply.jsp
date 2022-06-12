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
						
				    st = con.prepareStatement("select * from productSupply where id=?");
				    st.setString(1, id);
			
					rs = st.executeQuery();
			
					while (rs.next()==true) {
						String invoice = rs.getString("invoice");
						String eq = rs.getString("eQ");
						String rq = rs.getString("qR");
						String product = rs.getString("product");
						String rate = rs.getString("rate");
						String overage = rs.getString("overage");
						String shortage = rs.getString("shortage");
						String total = rs.getString("total");
						
						
						JSONObject obj = new JSONObject();
						obj.put("invoice", invoice);
						obj.put("eq", eq);
						obj.put("rq", rq);
						obj.put("product", product);
						obj.put("rate", rate);
						obj.put("overage", overage);
						obj.put("shortage", shortage);
						obj.put("total", total);
						
						list.add(obj);
						
				
						
					}
					out.println(list.toJSONString());
					out.flush();
				}else if(option.equals("delete")){
					
					
					
			
					st = con.prepareStatement("delete from productSupply where id=?");
					st.setString(1, id);
				    st.executeUpdate();
					
				    
				    JSONObject obj = new JSONObject();
				    obj.put("id", id);
				    list.add(obj);
				    
				    out.println(list.toJSONString());
					out.flush();
				}else if(option.equals("invoice")){
					
					
					
			
					st = con.prepareStatement("delete from invoices where id=?");
					st.setString(1, id);
				    st.executeUpdate();
					
				    
				    JSONObject obj = new JSONObject();
				    obj.put("id", id);
				    list.add(obj);
				    
				    out.println(list.toJSONString());
					out.flush();
				}
					
				 
					
					 
			%>