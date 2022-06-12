<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>

<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>


<%  
JSONArray list = new JSONArray();
Connection con;
PreparedStatement pst;
ResultSet rs;

Calendar cal = Calendar.getInstance();
Calendar cal1 = Calendar.getInstance();
//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 

String m4 =new SimpleDateFormat("yyyy").format(cal1.getTime())+"-"+new SimpleDateFormat("MM").format(cal1.getTime())+"-"+new SimpleDateFormat("dd").format(cal1.getTime());
String m5 =new SimpleDateFormat("MMMM").format(cal1.getTime())+"/"+new SimpleDateFormat("yyyy").format(cal1.getTime());

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");

String query = "select * from employee";
String departments = request.getParameter("department");
if(departments != null){
	  query =  "SELECT * FROM employee WHERE  Name NOT IN(SELECT empName FROM payroll where payroll.payDay = CONCAT(MONTHNAME(now()),'/',year(payroll.date)))and department='"+departments+"' and bStatus='Active'";
     
}
Statement stmt = con.createStatement();

rs = stmt.executeQuery(query);
int i=0;
String option= request.getParameter("option");
String month = request.getParameter("month");
String ids= request.getParameter("myid");
session.setAttribute("id", ids);

if(option.equals("get") && month != ""){
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
}else if(option.equals("getList") && month != ""){
	
	String sqlAll = "select * from employee";
	rs = stmt.executeQuery(sqlAll);
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
	}


else if(option.equals("getL")){
	String department1 = request.getParameter("department");
	//System.out.println(department1);
	String query1 = "SELECT * FROM employee WHERE  Name IN(SELECT empName FROM payroll where payroll.payDay = CONCAT(MONTHNAME(now()),'/',year(payroll.date)))and department='"+department1+"'";
	rs = stmt.executeQuery(query1);
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
	}


else if(option.equals("show")){
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
	    String basicSalary = rs.getString("basicSalary").replaceAll(",", "");
	    String accountHolder = rs.getString("AccountName");
	    String accountNumber = rs.getString("AccountNumber");
	    String bankName = rs.getString("BankName");
	    String bankBranch = rs.getString("BankBranch");
	    String bankShortCode = rs.getString("BankShortCode");
	    String debtB="";
	    String strQuery = "SELECT (SELECT COALESCE(SUM(amount), 0) FROM loan where employee='"+name+"') + (SELECT COALESCE(SUM(amount), 0) FROM deduction where employee='"+name+"') - (SELECT (COALESCE(SUM(dAmount),0) + COALESCE(SUM(loanAmount), 0)+ COALESCE(SUM(adjustment), 0) + COALESCE(SUM(bicycle), 0)) AS 'TOTAL'FROM payroll where empName='"+name+"')";       
	    rs = stmt.executeQuery(strQuery);
	    
	    double debt=0.00;
	    double debt1=0.00;
	    double currentL=0.00;
	    // for Debt Balance
	    while(rs.next()){
         debt = rs.getDouble(1);

       double roundOff = Math.round(debt*100)/100D;
       String.format("%.3f", roundOff);
       

       if(debt<0)
       	roundOff = Math.max(roundOff, 0);
       debt=roundOff;
       debtB = String.valueOf(debt);
       }
	 // for current 
	    String strQuery3 =  "SELECT deduction FROM payroll WHERE id=(SELECT max(id) FROM payroll) and empName='"+name+"'";
	    rs = stmt.executeQuery(strQuery3);
	    while(rs.next()){
        	 debt1 = rs.getDouble(1);
        }
	    double roundOff1 = Math.round(debt1*100)/100D;
        String.format("%.3f", roundOff1);
        if(roundOff1<=0){
            roundOff1=0.00;
        }
        debt1=roundOff1;
        currentL = debt-debt1;
        debtB = String.valueOf(debt1);
        
        //for employer
        double basic = Double.parseDouble(basicSalary);
        double employer = basic/100*13.5;
        double roundOff = Math.round(employer*100)/100D;
        String.format("%.3f", roundOff);
        employer=roundOff;
        
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
	    obj.put("bankBranch",bankName+" / "+bankBranch);
	    obj.put("bankShortCode", bankShortCode);
	    obj.put("date", m4);
	    obj.put("debtB", debtB);
	    obj.put("currentL", currentL);
	    obj.put("employer", employer);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
}else if(option.equals("delete")){
	
	pst = con.prepareStatement("delete from payroll where id=?");
	pst.setString(1, ids);
	pst.executeUpdate();
	System.out.println("id is  "+ids);
	JSONObject obj = new JSONObject();
    obj.put("id", ids);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
	
}else if(option.equals("add")){
	
	String payEmpName = request.getParameter("payEmpName");
	String date1 = request.getParameter("date1");
	String payEmpSsnit = request.getParameter("payEmpSsnit");
	String payEmpCatName = request.getParameter("payEmpCatName");
	
	String months = request.getParameter("month");
	String payEmpBasic = request.getParameter("payEmpBasic").replace(",", "");
	String payEmpDebtBal = request.getParameter("payEmpDebtBal");
	String payEmpSFFl = request.getParameter("payEmpSFFl");
	String payEmpCurLoanSur = request.getParameter("payEmpCurLoanSur");
	String payEmpSSFP = request.getParameter("payEmpSSFP");
	String payEmpAdjust = request.getParameter("payEmpAdjust");
	String payEmpTaxableS = request.getParameter("payEmpTaxableS");
	String payEmpDeduct = request.getParameter("payEmpDeduct");
	double dec = Double.parseDouble(payEmpDeduct);//////////////////////////////////
	
	String payEmpPaye = request.getParameter("payEmpPaye");
	String payEmpBicyc = request.getParameter("payEmpBicyc");
	double testB = Double.parseDouble(payEmpBicyc);/////////////////////////////
	double allcalc = dec+testB;//////////////////////////////////
	String payEmpStatuDeduc = request.getParameter("payEmpStatuDeduc");
	String payEmpBeforOdaDeduc = request.getParameter("payEmpBeforOdaDeduc");
	String payEmpNetSal = request.getParameter("payEmpNetSal");
	String payEmpTotDebt = request.getParameter("payEmpTotDebt");
	String payEmpBlaAwt = request.getParameter("payEmpBlaAwt");
	String payEmpTotDeduc = request.getParameter("payEmpTotDeduc");
	String payEmpNetSalPay = request.getParameter("payEmpNetSalPay");
	String payEmpPayMethod = request.getParameter("payEmpPayMethod");
	String payEmpBankBranch = request.getParameter("payEmpBankBranch");
	String payEmpBankNo = request.getParameter("payEmpBankNo");
	String payEmpPaidAmt = request.getParameter("payEmpPaidAmt");
	String position = request.getParameter("position");
	String payEmpCompany = request.getParameter("payEmpCompany");
	
    

    con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
    pst = con.prepareStatement("insert into payroll(empName,date,ssnit,department,payDay,basic,debtBalance,employer,currentLoan,employee,adjustment,taxableSalary,dAmount,paye,bicycle,statutoryD,netpayBefore,netSalary,totalDebt,outstandingBalance,totalDeduction,netpayable,pmethod,bankBrach,accountNumber,paidAmount,deduction,position,Company)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
   
	pst.setString(1, payEmpName);
    pst.setString(2, date1);
    pst.setString(3, payEmpSsnit);
    pst.setString(4, payEmpCatName);
    pst.setString(5, months);
	pst.setString(6, payEmpBasic);
    pst.setString(7, payEmpDebtBal);
    pst.setString(8, payEmpSFFl);
    pst.setString(9, payEmpCurLoanSur);
    pst.setString(10, payEmpSSFP);
	pst.setString(11, payEmpAdjust);
    pst.setString(12, payEmpTaxableS);
    pst.setString(13, payEmpDeduct);
    pst.setString(14, payEmpPaye);
    pst.setString(15, payEmpBicyc);
	pst.setString(16, payEmpStatuDeduc);
    pst.setString(17, payEmpBeforOdaDeduc);
    pst.setString(18, payEmpNetSal);
    pst.setString(19, payEmpTotDebt);
    pst.setString(20, payEmpBlaAwt);
	pst.setString(21, payEmpTotDeduc);
    pst.setString(22, payEmpNetSalPay);
    pst.setString(23, payEmpPayMethod);
    pst.setString(24, payEmpBankBranch);
    pst.setString(25, payEmpBankNo);
    pst.setString(26, payEmpPaidAmt);
    pst.setString(27, payEmpBlaAwt);////////////////////////
    pst.setString(28, position);
    pst.setString(29, payEmpCompany);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("bankShortCode", payEmpName);
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
					
                   // System.out.println("deleting ..............");
					
					pst = con.prepareStatement("delete from empFile where id=?");
					pst.setString(1, ids);
					pst.executeUpdate();
					
					    JSONObject obj = new JSONObject();
					    
					    obj.put("id", ids);
					   
					    
					    list.add(obj);
					
                    
					out.print(list.toJSONString());
					out.flush();
					}else if(option.equals("calculate")){
						
						String query1 = "select * from employee where id='"+ids+"'";
                        double basic = new Double(request.getParameter("basic"));
                        double deduction =0.00; 
                        String de =request.getParameter("deduction");
                        if(de != ""){
                        	deduction= Double.parseDouble(de);
                        }
                        double paye = 0.00;
                        String pa = request.getParameter("paye");
                        if(pa != ""){
                        	paye = Double.parseDouble(pa);
                        }
                        double byc = 0.00;
                        String by = request.getParameter("byc");
                        if(by != ""){
                        	byc = Double.parseDouble(by);
                        }
                        double employee = 0.00;
                        String emp = request.getParameter("employee");
                        if(emp != null){
                        	employee = Double.parseDouble(emp);
                        }
                        double employer1 = 0.00;
                        String empl = request.getParameter("employer");
                        if(empl != null){
                        	employer1 = Double.parseDouble(empl);
                        }
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
						    String debtB="";
						    String strQuery = "SELECT (SELECT COALESCE(SUM(amount), 0) FROM loan where employee='"+name+"') + (SELECT COALESCE(SUM(amount), 0) FROM deduction where employee='"+name+"') - (SELECT (COALESCE(SUM(dAmount),0) + COALESCE(SUM(loanAmount), 0)+ COALESCE(SUM(adjustment), 0) + COALESCE(SUM(bicycle), 0)) AS 'TOTAL'FROM payroll where empName='"+name+"')";       
						    rs = stmt.executeQuery(strQuery);
						    
						    double debt=0.00;
						    double debt1=0.00;
						    double currentL=0.00;
						    // for Debt Balance
						    while(rs.next()){
					         debt = rs.getDouble(1);

					       double roundOff = Math.round(debt*100)/100D;
					       String.format("%.3f", roundOff);
					       

					       if(debt<0)
					       	roundOff = Math.max(roundOff, 0);
					       debt=roundOff;
					       debtB = String.valueOf(debt);
					       }
						 // for current 
						    String strQuery3 =  "SELECT deduction FROM payroll WHERE id=(SELECT max(id) FROM payroll) and empName='"+name+"'";
						    rs = stmt.executeQuery(strQuery3);
						    while(rs.next()){
					        	 debt1 = rs.getDouble(1);
					        }
						    double roundOff1 = Math.round(debt1*100)/100D;
					        String.format("%.3f", roundOff1);
					        if(roundOff1<=0){
					            roundOff1=0.00;
					        }
					        debt1=roundOff1;
					        currentL = debt-debt1;
					        debtB = String.valueOf(debt1);
					        
					        //for employer
					        //double basic = Double.parseDouble(basicSalary);
					        double employer = basic/100*employer1;
					        double roundOff = Math.round(employer*100)/100D;
					        String.format("%.3f", roundOff);
					        employer=roundOff;
					        
					        //for employee
					        
					        double employe = basic/100*employee;
					        double roundOff2 = Math.round(employe*100)/100D;
					        String.format("%.3f", roundOff2);
					        employe=roundOff2;
					        
					        //for taxable salary
					        
					        double taxable = basic- employe;
					        double roundOff3 = Math.round(taxable*100)/100D;
					        String.format("%.3f", roundOff3);
					        taxable=roundOff3;
					        
					        // for statutory
					        
					        double statutory = paye + employe;
					        double roundOff4 = Math.round(statutory*100)/100D;
					        String.format("%.3f", roundOff4);
					        statutory=roundOff4;
					        
					        // for net before
					        
					        double netBeforeOther = basic-statutory;
					        double roundOff5 = Math.round(netBeforeOther*100)/100D;
					        String.format("%.3f", roundOff5);
					        netBeforeOther=roundOff5;
					        
					        //for netpay
					        double minus = byc + deduction;
					        double netpay = netBeforeOther-minus;
					        double roundOff6 = Math.round(netpay*100)/100D;
					        String.format("%.3f", roundOff6);
					        
					        netpay=roundOff6;
					        
					        //for outstanding
					        double checkOut = currentL+debt1;
					        double balanceOutstanding = checkOut-minus;
					      
					        double roundOff7 = Math.round(balanceOutstanding*100)/100D;
					        String.format("%.3f", roundOff7);
					        balanceOutstanding=roundOff7;
					        
					        //for total deduction
					        double totaldeduction=statutory+minus;
					        double roundOff8 = Math.round(totaldeduction*100)/100D;
					        String.format("%.3f", roundOff8);
					        totaldeduction=roundOff8;
					        // for total debt
					        double totalDebt = checkOut;
					        double roundOff9 = Math.round(totalDebt*100)/100D;
					        String.format("%.3f", roundOff9);
					        totalDebt=roundOff9;
					        
					        // netpay
					        // balanceOutstanding
					        // totaldeduction
					        // netpay
					        // netpay
					        		
						    i+=1;
						    String number= String.valueOf(i);
						    String totout = String.valueOf(totaldeduction);
						    String netpayy = String.valueOf(netpay);
						    
						    obj.put("employer", employer);
						    obj.put("employee", employe);
						    obj.put("taxable", taxable);
						    obj.put("statutory", statutory);
						    obj.put("netBefore", netBeforeOther);
						    obj.put("netpay", netpayy);
						    obj.put("totalDebt", totalDebt);
						    obj.put("outstanding", balanceOutstanding);
						    obj.put("totalDedution", totout);
						    obj.put("netSalary", netpayy);
						    obj.put("paidAmount", netpayy);
						    obj.put("date", m4);
						    obj.put("debtB", debtB);
						    obj.put("currentL", currentL);
						    
						    list.add(obj);
						}

						out.print(list.toJSONString());
						out.flush();
					}else if(option.equals("bring")){
						
						String department = request.getParameter("test");
						
						String count = "select count(empName) from payroll where department LIKE '"+department+"'";
				           
						rs = stmt.executeQuery(count);
						
						while(rs.next())
						{
						    String data = rs.getString(1);
						    JSONObject obj = new JSONObject();
						    obj.put("test", data);
						    list.add(obj);
						}

						out.print(list.toJSONString());
						out.flush();
					}else if(option.equals("paySlip") && month != ""){
						String departments1 = request.getParameter("department");
						System.out.println(departments1);
						String sqlAll = "select * from payroll where payDay='"+month+"' and department='"+departments1+"'";
						rs = stmt.executeQuery(sqlAll);
						while(rs.next())
						{
						    JSONObject obj = new JSONObject();
						    String id = rs.getString("id");
						    String name = rs.getString("empName");
						    String basic = rs.getString("basic");
						    String payDay = rs.getString("payDay");
						    String paidAmount = rs.getString("paidAmount");
						    String dAmount = rs.getString("dAmount");
						    String outstandingBalance = rs.getString("outstandingBalance");
						    String bankBrach = rs.getString("bankBrach");
						    String account_Number = rs.getString("accountNumber");
						    i+=1;
						    String number= String.valueOf(i);
						    

						    obj.put("id", id);
						    obj.put("name", name);
						    obj.put("basic", basic);
						    obj.put("payDay", payDay);
						    obj.put("paidAmount", paidAmount);
						    obj.put("dAmount", dAmount);
						    obj.put("outstandingBalance", outstandingBalance);
						    obj.put("bankBrach", bankBrach);
						    obj.put("account_Number", account_Number);
						    obj.put("number", number);
						    list.add(obj);
						}

						out.print(list.toJSONString());
						out.flush();
						}else if(option.equals("tax") && month != ""){
							String departments1 = request.getParameter("department");
							double paye1 = 0.00;
							double amount1 = 0.00;
							double employer1 = 0.00;
							double employee1 =0.00;
							
							String sqlAll = "select * from payroll where payDay='"+month+"' and Company='"+departments1+"' and ssnit != '--'";
							rs = stmt.executeQuery(sqlAll);
							while(rs.next())
							{
							    JSONObject obj = new JSONObject();
							    String id = rs.getString("id");
							    String empName = rs.getString("empName");
							    String basic = rs.getString("basic");
							    String ssnit = rs.getString("ssnit");
							    double paye = rs.getDouble("paye");
							    double paidAmount = rs.getDouble("paidAmount");
							    double employer = rs.getDouble("employer");
							    double employee = rs.getDouble("employee");
							    
							    
							    paye1 += paye;
							    amount1 += paidAmount;
							    employer1+= employer;
							    employee1 += employee;
							    
							    i+=1;
							    String number= String.valueOf(i);
							    

							    obj.put("id", id);
							    obj.put("empName", empName);
							    obj.put("basic", basic);
							    obj.put("ssnit", ssnit);
							    obj.put("paye", paye);
							    obj.put("paidAmount", paidAmount);
							    obj.put("employer", employer);
							    obj.put("employee", employee);
							   
							    obj.put("number", number);
							    list.add(obj);
							}
							
							session.setAttribute("paye1", paye1);
							session.setAttribute("amount1", amount1);
							session.setAttribute("employer1", employer1);
							session.setAttribute("employee1", employee1);

							out.print(list.toJSONString());
							out.flush();
							}else if(option.equals("sesion")){
								
								JSONObject obj = new JSONObject();
								
								double pa = (Double)session.getAttribute("paye1");
								double am = (Double)session.getAttribute("amount1");
								double em = (Double)session.getAttribute("employer1");
								double emp = (Double)session.getAttribute("employee1");
								
								obj.put("pa", pa);
								obj.put("am", am);
								obj.put("em", em);
								obj.put("emp", emp);
							    list.add(obj);
							    
							    out.print(list.toJSONString());
								out.flush();
								
							}else if(option.equals("payRoll") && month != ""){
								String departments1 = request.getParameter("department");
								double pay = 0.00;
								
								
								String sqlAll = "SELECT payroll.id,payroll.empName,payroll.accountNumber,payroll.bankBrach,payroll.paidAmount ,employee.BankShortCode from payroll,employee  where employee.Name=payroll.empName and payroll.payDay='"+month+"' and payroll.department='"+departments1+"'";
								rs = stmt.executeQuery(sqlAll);
								while(rs.next())
								{
								    JSONObject obj = new JSONObject();
								    String id = rs.getString(1);
								    String empName = rs.getString(2);
								    String account = rs.getString(3);
								    String code = rs.getString(6);
								    String bankBranch = rs.getString(4);
								    double netPay = rs.getDouble(5);
								    
								    pay += netPay;
								   
								    i+=1;
								    String number= String.valueOf(i);
								    

								    obj.put("id", id);
								    obj.put("empName", empName);
								    obj.put("account", account);
								    obj.put("code", code);
								    obj.put("bankBranch", bankBranch);
								    obj.put("netPay", netPay);
								    
								    obj.put("number", number);
								    list.add(obj);
								}
								
								session.setAttribute("pay", pay);
								

								out.print(list.toJSONString());
								out.flush();
								}else if(option.equals("sesion1")){
									
									JSONObject obj = new JSONObject();
									
									double pa = (Double)session.getAttribute("pay");
									
									
									obj.put("pa", pa);
									
								    list.add(obj);
								    
								    out.print(list.toJSONString());
									out.flush();
									
								}else if(option.equals("debt") && month != ""){
									
									double totalBasic = 0.00;
									double totalDebtBefore = 0.00;
									double totalDeduction = 0.00;
									double totalDebtAfter =0.00;
									double totalPay =0.00;
									
									String sqlAll = "select * from payroll where payDay='"+month+"' and currentLoan >0";
									rs = stmt.executeQuery(sqlAll);
									while(rs.next())
									{
									    JSONObject obj = new JSONObject();
									    String id = rs.getString("id");
									    String empName = rs.getString("empName");
									    double basic = rs.getDouble("basic");
									    double debtBefore = rs.getDouble("currentLoan");
									    double deduction = rs.getDouble("dAmount");
									    double debtAfter = rs.getDouble("deduction");
									    double paidAmount = rs.getDouble("paidAmount");
									    
									    
									    
									    totalBasic += basic;
									    totalDebtBefore += debtBefore;
									    totalDeduction+= deduction;
									    totalDebtAfter += debtAfter;
									    totalPay += paidAmount;
									    
									    i+=1;
									    String number= String.valueOf(i);
									    

									    obj.put("id", id);
									    obj.put("empName", empName);
									    obj.put("basic", basic);
									    obj.put("debtBefore", debtBefore);
									    obj.put("deduction", deduction);
									    obj.put("debtAfter", debtAfter);
									    obj.put("paidAmount", paidAmount);
									   
									   
									    obj.put("number", number);
									    list.add(obj);
									}
									
									session.setAttribute("totalBasic", totalBasic);
									session.setAttribute("totalDebtBefore", totalDebtBefore);
									session.setAttribute("totalDeduction", totalDeduction);
									session.setAttribute("totalDebtAfter", totalDebtAfter);
									session.setAttribute("totalPay", totalPay);

									out.print(list.toJSONString());
									out.flush();
									}else if(option.equals("sesion2")){
										
										JSONObject obj = new JSONObject();
										
										double totalBasic = (Double)session.getAttribute("totalBasic");
										double totalDebtBefore = (Double)session.getAttribute("totalDebtBefore");
										double totalDeduction = (Double)session.getAttribute("totalDeduction");
										double totalDebtAfter = (Double)session.getAttribute("totalDebtAfter");
										double totalPay = (Double)session.getAttribute("totalPay");
										
										obj.put("totalBasic", totalBasic);
										obj.put("totalDebtBefore", totalDebtBefore);
										obj.put("totalDeduction", totalDeduction);
										obj.put("totalDebtAfter", totalDebtAfter);
										obj.put("totalPay", totalPay);
									    list.add(obj);
									    System.out.println(totalDebtBefore);
									    out.print(list.toJSONString());
										out.flush();
									}



%>














