<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
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
                    
					String employee = request.getParameter("employee");
					String p = request.getParameter("paye");
					String position="";
					double allowance=0.00;
					double paye=Double.parseDouble(p);
					double basic=0.00;
					double snit5 =0.00;
					double taxableincome=0.00;
					double statutory = 0.00;
					double netpay=0.00;
					double snit13 = 0.00;
					double totalsnit=0.00;
					double totalbill=0.00;
					double salaryAl=0.00;
					
					String branch = "from session";
					String month = m5;



					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
					pst = con.prepareStatement("select sum(amount) from allowance where empName=? and month=?");
					pst.setString(1,employee);
					pst.setString(2,month);
					// remember to add the branch for selection after locking all pages
					
					rs=pst.executeQuery();
							if(rs.next()){
								
								allowance=rs.getDouble(1);
								
								
							}
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
					pst = con.prepareStatement("select * from employee where name=?");
					pst.setString(1,employee);
					// remember to add the branch for selection after locking all pages
					
					rs=pst.executeQuery();
							while(rs.next()){
								
								basic=rs.getDouble("basic");
								position=rs.getString("position");
								
							}
							
							
							snit5 = basic/100*5.5;
							 double roundOff1 = Math.round(snit5*100)/100D;
						     String.format("%.3f", roundOff1);
						     snit5=roundOff1;
							
						     taxableincome = basic-snit5;
							 roundOff1 = Math.round(taxableincome*100)/100D;
						     String.format("%.3f", roundOff1);
						     taxableincome=roundOff1;
							
						     statutory = paye+snit5;
							 roundOff1 = Math.round(statutory*100)/100D;
						     String.format("%.3f", roundOff1);
						     statutory=roundOff1;
							
						     netpay = basic-statutory+allowance;
							 roundOff1 = Math.round(netpay*100)/100D;
						     String.format("%.3f", roundOff1);
						     netpay=roundOff1;
							
						     snit13 = basic/100*13;
							 roundOff1 = Math.round(snit13*100)/100D;
						     String.format("%.3f", roundOff1);
						     snit13=roundOff1;
							
						     totalsnit = snit13+snit5;
							 roundOff1 = Math.round(totalsnit*100)/100D;
						     String.format("%.3f", roundOff1);
						     totalsnit=roundOff1;
							
						     totalbill = netpay+snit13;
							 roundOff1 = Math.round(totalbill*100)/100D;
						     String.format("%.3f", roundOff1);
						     totalbill=roundOff1;
							
						     salaryAl=basic+allowance;
							 roundOff1 = Math.round(salaryAl*100)/100D;
						     String.format("%.3f", roundOff1);
						     salaryAl=roundOff1;
							
						     String sn5 = String.valueOf(snit5);
						     String taxincome = String.valueOf(taxableincome);
						     String stat = String.valueOf(statutory);
						     String net = String.valueOf(netpay);
						     String sn13 = String.valueOf(snit13);
						     String totalsn = String.valueOf(totalsnit);
						     String totalb = String.valueOf(totalbill);
						     String salaryA = String.valueOf(salaryAl);
						     
						     String all = String.valueOf(allowance);
						     String pay = String.valueOf(paye);
						     String bas = String.valueOf(basic);
					
						     
						     JSONObject obj = new JSONObject();
							 obj.put("sn5", sn5);
							 obj.put("taxincome", taxincome);
							 obj.put("stat", stat);
							 obj.put("net", net);
							 obj.put("sn13", sn13);
							 obj.put("totalsn", totalsn);
							 obj.put("totalb", totalb);
							 obj.put("salaryA", salaryA);
							 obj.put("position", position);
							
							 obj.put("gra", pay);
							 obj.put("allowance", all);
							 obj.put("basic", bas);
							 
							 list.add(obj);
							 
							 out.println(list.toJSONString());
							 out.flush();
							 
							
							 
							 


%>




