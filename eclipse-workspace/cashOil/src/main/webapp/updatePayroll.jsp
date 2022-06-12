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
						
				    st = con.prepareStatement("select * from payroll where id=?");
				    st.setString(1, id);
			
					rs = st.executeQuery();
			
					while (rs.next()==true) {
						String empName = rs.getString("empName");
						String paye = rs.getString("paye");
						String allowance = rs.getString("allowance");
						String basic = rs.getString("basic");
						String snit5 = rs.getString("snit5");
						String taxable = rs.getString("taxable");
						String position = rs.getString("position");
						String gra = rs.getString("gra");
						String totalStatutory = rs.getString("totalStatutory");
						String netpay = rs.getString("netpay");
						String snit13 = rs.getString("snit13");
						String totalsnit = rs.getString("totalsnit");
						String totalpay = rs.getString("totalpay");
						String allowaceandsalary = rs.getString("allowaceandsalary");
						
						
						JSONObject obj = new JSONObject();
						obj.put("empName", empName);
						obj.put("paye", paye);
						obj.put("allowance", allowance);
						obj.put("basic", basic);
						obj.put("snit5", snit5);
						obj.put("taxable", taxable);
						obj.put("position", position);
						obj.put("gra", gra);
						obj.put("totalStatutory", totalStatutory);
						obj.put("netpay", netpay);
						obj.put("snit13", snit13);
						obj.put("totalsnit", totalsnit);
						obj.put("totalpay", totalpay);
						obj.put("allowaceandsalary", allowaceandsalary);
						
						list.add(obj);
						
				
						
					}
					out.println(list.toJSONString());
					out.flush();
					 
				 }else if(option.equals("delete")){
					 
					 
					 String id = request.getParameter("myid"); 
					 System.out.println(id);
						st = con.prepareStatement("delete from payroll where id=?");
						st.setString(1, id);
					    st.executeUpdate();
						
					    
					    JSONObject obj = new JSONObject();
					    obj.put("id", id);
					    list.add(obj);
					    
					    out.println(list.toJSONString());
						out.flush();
					}
				 
					
					 
			%>