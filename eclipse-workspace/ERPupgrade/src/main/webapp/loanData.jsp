<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>


<%  
JSONArray list = new JSONArray();
Connection con;
PreparedStatement pst;
ResultSet rs;


Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");

String query = "select * from employee";

Statement stmt = con.createStatement();

rs = stmt.executeQuery(query);
int i=0;
String option= request.getParameter("option");

String ids= request.getParameter("myid");

if(option.equals("get")){
while(rs.next())
{
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String name = rs.getString("Name");
    String account = rs.getString("AccountNumber");
    String bank = rs.getString("BankName");
    String ssnit = rs.getString("ssnit");
    String department = rs.getString("department");
    String position = rs.getString("position");
    String status = rs.getString("bStatus");
    i+=1;
    String number= String.valueOf(i);
    

    obj.put("id", id);
    obj.put("name", name);
    obj.put("account", account);
    obj.put("bank", bank);
    obj.put("ssnit", ssnit);
    obj.put("department", department);
    obj.put("position", position);
    obj.put("status", status);
    obj.put("number", number);
    list.add(obj);
}

out.print(list.toJSONString());
out.flush();
}else if(option.equals("show")){
	String query1 = "select * from employee where id='"+ids+"'";

	rs = stmt.executeQuery(query1);
	
	
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String id = rs.getString("id");
	    String name = rs.getString("Name");
	    String gender = rs.getString("gender");
	    String Mstatus = rs.getString("Mstatus");
	    String email = rs.getString("email");
	    String Number1 = rs.getString("phone1");
	    String Number2 = rs.getString("phone2");
	    String localAddress = rs.getString("localAddress");
	    String reference = rs.getString("reference");
	    String ssnit = rs.getString("ssnit");
	    String company = rs.getString("company");
	    String department = rs.getString("department");
	    String position = rs.getString("position");
	    String dateofjoining = rs.getString("dateJoining");
	    String dateofleaving = rs.getString("dateLeaving");
	    String bStatus = rs.getString("bStatus");
	    String basicSalary = rs.getString("basicSalary");
	    String accountHolder = rs.getString("AccountName");
	    String accountNumber = rs.getString("AccountNumber");
	    String bankName = rs.getString("BankName");
	    String bankBranch = rs.getString("BankBranch");
	    String bankShortCode = rs.getString("BankShortCode");
	    
	    
	    
	    i+=1;
	    String number= String.valueOf(i);
	    
	    
	    obj.put("number", number);
	    obj.put("id", id);
	    obj.put("name", name);
	    obj.put("gender", gender);
	    obj.put("Mstatus", Mstatus);
	    obj.put("email", email);
	    obj.put("Number1", Number1);
	    obj.put("Number2", Number2);
	    obj.put("localAddress", localAddress);
	    obj.put("reference", reference);
	    obj.put("ssnit", ssnit);
	    obj.put("company", company);
	    obj.put("department", department);
	    obj.put("position", position);
	    obj.put("dateofjoining", dateofjoining);
	    obj.put("dateofleaving", dateofleaving);
	    obj.put("bStatus", bStatus);
	    obj.put("basicSalary", basicSalary);
	    obj.put("accountHolder", accountHolder);
	    obj.put("accountNumber", accountNumber);
	    obj.put("bankName", bankName);
	    obj.put("bankBranch", bankBranch);
	    obj.put("bankShortCode", bankShortCode);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
}else if(option.equals("show1")){
	String query1 = "select * from loan where id='"+ids+"'";

	rs = stmt.executeQuery(query1);
	
	
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String id = rs.getString("id");
	    String name = rs.getString("employee");
	    String date = rs.getString("loandate");
	    String amount = rs.getString("amount");
	    String reason = rs.getString("reason");
	  
	    
	    
	    
	    i+=1;
	    String number= String.valueOf(i);
	    
	    
	    obj.put("number", number);
	    obj.put("id", id);
	    obj.put("name", name);
	    obj.put("amount", amount);
	    obj.put("reason", reason);
	    obj.put("date", date);
	  
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("add")){
	String name = request.getParameter("Name");
    String date = request.getParameter("date");
    String amount = request.getParameter("amount").replaceAll(",", "");
    String reason = request.getParameter("reason");

    System.out.println(name);
  
    pst = con.prepareStatement("insert into loan(employee,loandate,amount,reason)values(?,?,?,?)");
    pst.setString(1, name);
    pst.setString(2, date);
    pst.setString(3, amount);
    pst.setString(4, reason);

    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("bankShortCode", name);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}else if(option.equals("addup")){
	
	String name = request.getParameter("Name");
    String date = request.getParameter("date");
    String amount = request.getParameter("amount").replaceAll(",", "");
    String reason = request.getParameter("reason");
    String id = request.getParameter("myid");
    
  
    pst = con.prepareStatement("update loan set employee=?,loandate=?,amount=?,reason=? where id=?");
    pst.setString(1, name);
    pst.setString(2, date);
    pst.setString(3, amount);
    pst.setString(4, reason);
   
    pst.setString(5, id);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("name", name);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}else if(option.equals("activate")){
	
	String id = request.getParameter("myid");
	pst = con.prepareStatement("update employee set bStatus='Not Active' where id=?");
	pst.setString(1, id);
	
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("id", id);
    list.add(obj);
}



else if(option.equals("getA")){
	String query2 = "select * from employee where bStatus='Active'";


	rs = stmt.executeQuery(query2);
	int ii=0;
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String id = rs.getString("id");
	    String name = rs.getString("Name");
	    String account = rs.getString("AccountNumber");
	    String bank = rs.getString("BankName");
	    String ssnit = rs.getString("ssnit");
	    String department = rs.getString("department");
	    String position = rs.getString("position");
	    String status = rs.getString("bStatus");
	    i+=1;
	    String number= String.valueOf(ii);
	    

	    obj.put("id", id);
	    obj.put("name", name);
	    obj.put("account", account);
	    obj.put("bank", bank);
	    obj.put("ssnit", ssnit);
	    obj.put("department", department);
	    obj.put("position", position);
	    obj.put("status", status);
	    obj.put("number", number);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
	}else if(option.equals("getD")){
		String query2 = "select * from employee where bStatus='Not Active'";


		rs = stmt.executeQuery(query2);
		int ii=0;
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String id = rs.getString("id");
		    String name = rs.getString("Name");
		    String account = rs.getString("AccountNumber");
		    String bank = rs.getString("BankName");
		    String ssnit = rs.getString("ssnit");
		    String department = rs.getString("department");
		    String position = rs.getString("position");
		    String status = rs.getString("bStatus");
		    i+=1;
		    String number= String.valueOf(ii);
		    

		    obj.put("id", id);
		    obj.put("name", name);
		    obj.put("account", account);
		    obj.put("bank", bank);
		    obj.put("ssnit", ssnit);
		    obj.put("department", department);
		    obj.put("position", position);
		    obj.put("status", status);
		    obj.put("number", number);
		    list.add(obj);
		}

		out.print(list.toJSONString());
		out.flush();
		}else if(option.equals("dActivate")){
			
			String id = request.getParameter("myid");
			pst = con.prepareStatement("update employee set bStatus='Active' where id=?");
			pst.setString(1, id);
			
		    pst.executeUpdate();
		    JSONObject obj = new JSONObject();
		    obj.put("id", id);
		    list.add(obj);
		    
		    out.print(list.toJSONString());
			out.flush();
		}else if(option.equals("getN")){
			String query2 = "select * from employee where bStatus='Active'";
           
			rs = stmt.executeQuery(query2);
			
			while(rs.next())
			{
			    
			    
			    String name = rs.getString("Name");
			    JSONObject obj = new JSONObject();
			    obj.put("name", name);
			    list.add(obj);
			}

			out.print(list.toJSONString());
			out.flush();
			}else if(option.equals("getL")){
				String query2 = "select * from loan";


				rs = stmt.executeQuery(query2);
				int ii=0;
				while(rs.next())
				{
				    JSONObject obj = new JSONObject();
				    String id = rs.getString("ID");
				    String name = rs.getString("employee");
				    String date = rs.getString("loandate");
				    String amount = rs.getString("amount");
				    String reason = rs.getString("reason");
				    ii+=1;
				    String number= String.valueOf(ii);
				    
				    obj.put("id", id);
				    obj.put("number", number);
				    obj.put("name", name);
				    obj.put("date", date);
				    obj.put("amount", amount);
				    obj.put("reason", reason);
				    
				    list.add(obj);
				}

				out.print(list.toJSONString());
				out.flush();
				
				}else if(option.equals("delete")){
					
                    System.out.println("deleting ..............");
					
					pst = con.prepareStatement("delete from loan where id=?");
					pst.setString(1, ids);
					pst.executeUpdate();
					
					    JSONObject obj = new JSONObject();
					    
					    obj.put("id", ids);
					   
					    
					    list.add(obj);
					

					out.print(list.toJSONString());
					out.flush();
					}

%>