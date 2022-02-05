<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	    <%@page import="java.sql.*"%>
			<%@page import="org.json.simple.*"%>

<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>

 <%

 Calendar cal = Calendar.getInstance();
	Calendar cal1 = Calendar.getInstance();
	//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
	
	String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
	String m5 =new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());

 %>


<%

JSONArray list =new JSONArray();
Connection con;
PreparedStatement pst;
ResultSet rs;
                   if(request.getParameter("chil")!=null){ 
					String description = request.getParameter("descrip");
					String gender = request.getParameter("gender");
					String currentx=request.getParameter("currentx");
				
					//System.out.println("you came here with "+ description + " " + gender + " "+ currentx );
					
					int current= Integer.parseInt(currentx);
					int prev = 0;
					int total = 0;
					int pg = 0;
                    int diff=0;
                    String pr="";

					Connection con1;
					Statement st1;
                    ResultSet rs1;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con1 = DriverManager.getConnection("jdbc:mysql://localhost/cop","root","root");
                    
					st1 = con1.createStatement();    
				    String sql = "SELECT currentx FROM demography WHERE descrip ='"+description+"' and gender ='"+gender+"' ORDER BY ID LIMIT 1";
					rs1 = st1.executeQuery(sql);
			
					if (rs1.next()==true) {
						
						prev=rs1.getInt(1);
						pr = rs1.getString(1);
						

					}
					
					
					st1 = con1.createStatement();    
				    String sql1 = "SELECT total FROM demography WHERE descrip ='"+description+"' ORDER BY ID DESC LIMIT 1";
					rs1 = st1.executeQuery(sql1);
			
					if (rs1.next()==true) {
						
						pg=rs1.getInt(1);

					}
					
					if(pr.equals("")|| pr.equals("")){
						prev = 0;
					}	
					
					if(pr.equals("")|| pr.equals("")){
						diff = 0;
						
					}else if(prev>=current){
						diff = prev - current;
						
					}else if(current>=prev){
						diff = current-prev;
						
					}
						
					total = pg + current;
							
							

							
					
						     String prv = String.valueOf(prev);
						     String tot = String.valueOf(total);
						     String dif = String.valueOf(diff);
						     
						     JSONObject obj = new JSONObject();
							 
							 
							 obj.put("prv", prv);
							 obj.put("tot", tot);
							 obj.put("dif", dif);
							 
							 list.add(obj);
							 
							 out.println(list.toJSONString());
							 out.flush();
							 } 
							
							 
			if(request.getParameter("minis")!=null){
				
				String description = request.getParameter("descrip");
				
				String currentx=request.getParameter("currentx");
			
				//System.out.println("you came here with "+ description + " " + gender + " "+ currentx );
				
				int current= Integer.parseInt(currentx);
				int prev = 0;
				int total = 0;
				int pg = 0;
                int diff=0;
                String pr="";

				Connection con1;
				Statement st1;
                ResultSet rs1;
                
                Class.forName("com.mysql.jdbc.Driver");
                con1 = DriverManager.getConnection("jdbc:mysql://localhost/cop","root","root");
                
				st1 = con1.createStatement();    
			    String sql = "SELECT currentx FROM minitries WHERE descrip ='"+description+"' ORDER BY ID LIMIT 1";
				rs1 = st1.executeQuery(sql);
		
				if (rs1.next()==true) {
					
					prev=rs1.getInt(1);
					pr = rs1.getString(1);
					

				}
				
				
				st1 = con1.createStatement();    
			    String sql1 = "SELECT total FROM minitries WHERE descrip ='"+description+"' ORDER BY ID DESC LIMIT 1";
				rs1 = st1.executeQuery(sql1);
		
				if (rs1.next()==true) {
					
					pg=rs1.getInt(1);

				}
				
				if(pr.equals("")|| pr.equals("")){
					prev = 0;
				}	
				
				if(pr.equals("")|| pr.equals("")){
					diff = 0;
					
				}else if(prev>=current){
					diff = prev - current;
					
				}else if(current>=prev){
					diff = current-prev;
					
				}
					
				total = pg + current;
						
						

						
				
					     String prv = String.valueOf(prev);
					     String tot = String.valueOf(total);
					     String dif = String.valueOf(diff);
					     
					     JSONObject obj = new JSONObject();
						 
						 
						 obj.put("prv", prv);
						 obj.put("tot", tot);
						 obj.put("dif", dif);
						 
						 list.add(obj);
						 
						 out.println(list.toJSONString());
						 out.flush();
				
			}				 


%>




