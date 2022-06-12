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
}else if(option.equals("delete")){
	
}else if(option.equals("add")){
	
	String name = request.getParameter("Name");
    String gender = request.getParameter("gender");
    String Mstatus = request.getParameter("Mstatus");
    String email = request.getParameter("email");
    String Number1 = request.getParameter("Number1");
    String Number2 = request.getParameter("Number2");
    String adr = request.getParameter("adr");
    String reference = request.getParameter("reference");
    String ssnit = request.getParameter("ssnit");
    String company = request.getParameter("company");
    String department = request.getParameter("department");
    String position =request.getParameter("position");
    String dateofjoining =request.getParameter("date-of-joining");
    String dateofleaving = request.getParameter("date-of-leaving");
    String bStatus = request.getParameter("b-status");
    String basicSalary = request.getParameter("basicSalary");
    String accountHolder = request.getParameter("accountHolder");
    String accountNumber = request.getParameter("accountNumber");
    String bankName = request.getParameter("bankName");
    String bankBranch = request.getParameter("bankBranch");
    String bankShortCode = request.getParameter("bankShortCode");
    
  
    pst = con.prepareStatement("insert into employee(Name,gender,email,phone1,phone2,localAddress,Mstatus,reference,ssnit,department,position,dateJoining,dateLeaving,bStatus,basicSalary,company,AccountName,AccountNumber,BankName,BankBranch,BankShortCode)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    pst.setString(1, name);
    pst.setString(2, gender);
    pst.setString(3, email);
    pst.setString(4, Number1);
    pst.setString(5, Number2);
    pst.setString(6, adr);
    pst.setString(7, Mstatus);
    pst.setString(8, reference);
    pst.setString(9, ssnit);
   
    pst.setString(10, department);
    pst.setString(11, position);
    pst.setString(12, dateofjoining);
    pst.setString(13, dateofleaving);
    pst.setString(14, bStatus);
    pst.setString(15, basicSalary);
    pst.setString(16, company);
  
    pst.setString(17, accountHolder);
    pst.setString(18, accountNumber);
    pst.setString(19, bankName);
    pst.setString(20, bankBranch);
    pst.setString(21, bankShortCode);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("bankShortCode", bankShortCode);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}else if(option.equals("edit")){
	
	String name = request.getParameter("Name");
    String gender = request.getParameter("gender");
    String Mstatus = request.getParameter("Mstatus");
    String email = request.getParameter("email");
    String Number1 = request.getParameter("Number1");
    String Number2 = request.getParameter("Number2");
    String adr = request.getParameter("adr");
    String reference = request.getParameter("reference");
    String ssnit = request.getParameter("ssnit");
    String company = request.getParameter("company");
    String department = request.getParameter("department");
    String position =request.getParameter("position");
    String dateofjoining =request.getParameter("date-of-joining");
    String dateofleaving = request.getParameter("date-of-leaving");
    String bStatus = request.getParameter("b-status");
    String basicSalary = request.getParameter("basicSalary");
    String accountHolder = request.getParameter("accountHolder");
    String accountNumber = request.getParameter("accountNumber");
    String bankName = request.getParameter("bankName");
    String bankBranch = request.getParameter("bankBranch");
    String bankShortCode = request.getParameter("bankShortCode");
    String id = request.getParameter("myid");
    
  
    pst = con.prepareStatement("update employee set Name=?,gender=?,email=?,phone1=?,phone2=?,localAddress=?,Mstatus=?,reference=?,ssnit=?,department=?,position=?,dateJoining=?,dateLeaving=?,bStatus=?,basicSalary=?,company=?,AccountName=?,AccountNumber=?,BankName=?,BankBranch=?,BankShortCode=? where id =?");
    pst.setString(1, name);
    pst.setString(2, gender);
    pst.setString(3, email);
    pst.setString(4, Number1);
    pst.setString(5, Number2);
    pst.setString(6, adr);
    pst.setString(7, Mstatus);
    pst.setString(8, reference);
    pst.setString(9, ssnit);
   
    pst.setString(10, department);
    pst.setString(11, position);
    pst.setString(12, dateofjoining);
    pst.setString(13, dateofleaving);
    pst.setString(14, bStatus);
    pst.setString(15, basicSalary);
    pst.setString(16, company);
  
    pst.setString(17, accountHolder);
    pst.setString(18, accountNumber);
    pst.setString(19, bankName);
    pst.setString(20, bankBranch);
    pst.setString(21, bankShortCode);
    pst.setString(22, id);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("bankShortCode", bankShortCode);
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
	}else if(option.equals("getD")){
		String query2 = "select * from employee where bStatus='Not Active'";


		rs = stmt.executeQuery(query2);
		int ii=1;
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
				String query2 = "select * from empFile";


				rs = stmt.executeQuery(query2);
				int ii=0;
				while(rs.next())
				{
				    JSONObject obj = new JSONObject();
				    String id = rs.getString("ID");
				    String name = rs.getString("empName");
				    String date = rs.getString("Ldate");
				    String desc = rs.getString("description");
				    String phone = rs.getString("phone");
				    String company = rs.getString("company");
				    String position = rs.getString("position");
				    String depart = rs.getString("department");
				    String letter = rs.getString("letter");
				    ii+=1;
				    String number= String.valueOf(ii);
				    
				    obj.put("id", id);
				    obj.put("number", number);
				    obj.put("name", name);
				    obj.put("desc", desc);
				    obj.put("phone", phone);
				    obj.put("company", company);
				    obj.put("position", position);
				    obj.put("depart", depart);
				    obj.put("letter", letter);
				    obj.put("date", date);
				    
				    list.add(obj);
				}

				out.print(list.toJSONString());
				out.flush();
				
				}else if(option.equals("delete")){
					
                    System.out.println("deleting ..............");
					
					pst = con.prepareStatement("delete from empFile where id=?");
					pst.setString(1, ids);
					pst.executeUpdate();
					
					    JSONObject obj = new JSONObject();
					    
					    obj.put("id", ids);
					   
					    
					    list.add(obj);
					

					out.print(list.toJSONString());
					out.flush();
					}

%>