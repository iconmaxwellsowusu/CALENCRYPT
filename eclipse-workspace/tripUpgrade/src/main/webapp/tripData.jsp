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


String departments = request.getParameter("department");

Statement stmt = con.createStatement();


int i=0;
String option= request.getParameter("option");
String month = request.getParameter("month");
String ids= request.getParameter("myid");
session.setAttribute("id", ids);

if(option.equals("getTrips")){
	String query = "select * from trips where status='Not Moved'";
	
	rs = stmt.executeQuery(query);
while(rs.next())
{
	//name,monthh,OilCompany,type,aloss,loadingDate,dischargingDate,waybillNumber,vehicleNumber ,qty,dischargingPoint,productLossLit,costPerlit,shortageValueGh,overNightAllowance,diductionAtSource,paymentDue,AmountReceivable,cashPaid,company,rate,distance,fuel,rloss,status,loadingPoint
    JSONObject obj = new JSONObject();
	String driver = rs.getString("name");
	String vehicleN = rs.getString("vehicleNumber");
	String loadingDate = rs.getString("loadingDate");
	String dischargingDate = rs.getString("dischargingDate");
	
	String mCompany = rs.getString("OilCompany");
	String subCompany = rs.getString("company");
	String month1 = rs.getString("monthh");
	String product = rs.getString("type");
	String allowableLoss = rs.getString("aloss");
	String costPerL = rs.getString("costPerlit");
	String wayBill = rs.getString("waybillNumber");
	String overnightAllowance = rs.getString("overNightAllowance");
	String quantity = rs.getString("qty");
	
	String discharg = rs.getString("dischargingPoint");
	String loadPoint = rs.getString("loadingPoint");
	
	String distance = rs.getString("distance");
	
	String rate = rs.getString("rate");
	
	String fuel = rs.getString("fuel");
	String shortagVal = rs.getString("shortageValueGh");
	String deduction = rs.getString("diductionAtSource");
	String payment = rs.getString("paymentDue");
	String amountR = rs.getString("AmountReceivable");
	String cashPaid = rs.getString("cashPaid");
	String actualLoss = rs.getString("rloss");
	String pLoss = rs.getString("productLossLit");
	String id = rs.getString("id");
	

    i+=1;
    String number= String.valueOf(i);
    

    obj.put("id", id);
    obj.put("number", number);
    obj.put("driver", driver);
    obj.put("vehicleN", vehicleN);
    obj.put("loadingDate", loadingDate);
    obj.put("dischargingDate", dischargingDate);
    obj.put("mCompany", mCompany);
    obj.put("subCompany", subCompany);
    obj.put("month1", month1);
    obj.put("product", product);
    obj.put("allowableLoss", allowableLoss);
    obj.put("costPerL", costPerL);
    obj.put("wayBill", wayBill);
    obj.put("overnightAllowance", overnightAllowance);
    obj.put("quantity", quantity);
    obj.put("discharg", discharg);
    obj.put("loadPoint", loadPoint);
    obj.put("distance", distance);
    obj.put("rate", rate);
    obj.put("fuel", fuel);
    obj.put("shortagVal", shortagVal);
    obj.put("deduction", deduction);
    obj.put("payment", payment);
    obj.put("amountR", amountR);
    obj.put("cashPaid", cashPaid);
    obj.put("actualLoss", actualLoss);
    obj.put("pLoss", pLoss);
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
	String query1 = "select * from trips where id='"+ids+"'";

	rs = stmt.executeQuery(query1);
	
	
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
		String driver = rs.getString("name");
		String vehicleN = rs.getString("vehicleNumber");
		String loadingDate = rs.getString("loadingDate");
		String dischargingDate = rs.getString("dischargingDate");
		
		String mCompany = rs.getString("OilCompany");
		String subCompany = rs.getString("company");
		String month1 = rs.getString("monthh");
		String product = rs.getString("type");
		String allowableLoss = rs.getString("aloss");
		String costPerL = rs.getString("costPerlit");
		String wayBill = rs.getString("waybillNumber");
		String overnightAllowance = rs.getString("overNightAllowance");
		String quantity = rs.getString("qty");
		String discharg = rs.getString("dischargingPoint");
		String loadPoint = rs.getString("loadingPoint");
		String distance = rs.getString("distance");
		String rate = rs.getString("rate");
		
		String fuel = rs.getString("fuel");
		String shortagVal = rs.getString("shortageValueGh");
		String deduction = rs.getString("diductionAtSource");
		String payment = rs.getString("paymentDue");
		String amountR = rs.getString("AmountReceivable");
		String cashPaid = rs.getString("cashPaid");
		String actualLoss = rs.getString("rloss");
		String pLoss = rs.getString("productLossLit");
        String location = loadPoint+" to "+discharg;
        
        double dis = Double.parseDouble(distance);
        double rat = Double.parseDouble(rate);
        double amount =dis*rat;
        
	    i+=1;
	    String number= String.valueOf(i);
	  
	    obj.put("driver", driver);
	    obj.put("vehicleN", vehicleN);
	    obj.put("loadingDate", loadingDate);
	    obj.put("dischargingDate", dischargingDate);
	    obj.put("mCompany", mCompany);
	    obj.put("subCompany", subCompany);
	    obj.put("month1", month1);
	    obj.put("product", product);
	    obj.put("allowableLoss", allowableLoss);
	    obj.put("costPerL", costPerL);
	    obj.put("wayBill", wayBill);
	    obj.put("overnightAllowance", overnightAllowance);
	    obj.put("quantity", quantity);
	    obj.put("location", location);
	    obj.put("amount", amount);
	    obj.put("distance", distance);
	    obj.put("rate", rate);
	    obj.put("fuel", fuel);
	    obj.put("shortagVal", shortagVal);
	    obj.put("deduction", deduction);
	    obj.put("payment", payment);
	    obj.put("amountR", amountR);
	    obj.put("cashPaid", cashPaid);
	    obj.put("actualLoss", actualLoss);
	    obj.put("pLoss", pLoss);
	    obj.put("number", number);
	   
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
	
	String driver = request.getParameter("driver");
	String vehicleN = request.getParameter("vehicleN");
	String loadingDate = request.getParameter("loadingDate");
	String dischargingDate = request.getParameter("dischargingDate");
	
	String mCompany = request.getParameter("mCompany");
	String subCompany = request.getParameter("subCompany");
	String month1 = request.getParameter("month");
	String product = request.getParameter("product");
	String allowableLoss = request.getParameter("allowableLoss");
	String costPerL = request.getParameter("costPerL");
	String wayBill = request.getParameter("wayBill");
	String overnightAllowance = request.getParameter("overnightAllowance");
	String quantity = request.getParameter("quantity");
	
	
	String location = request.getParameter("location");
	String distance = request.getParameter("distance");
	
	String rate = request.getParameter("rate");
	String amount = request.getParameter("amount");
	String fuel = request.getParameter("fuel");
	String roadEx = request.getParameter("roadEx");
	String shortagVal = request.getParameter("shortagVal");
	String deduction = request.getParameter("deduction");
	String payment = request.getParameter("payment");
	String amountR = request.getParameter("amountR");
	String cashPaid = request.getParameter("cashPaid");
	String actualLoss = request.getParameter("actualLoss");
	String pLoss = request.getParameter("pLoss");
	
	String discharg = location.substring(location.lastIndexOf(" ")+1);
	String loadPoint = location.substring(0, location.indexOf(" "));

    con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
    pst = con.prepareStatement("insert into trips(name,monthh,OilCompany,type,aloss,loadingDate,dischargingDate,waybillNumber,vehicleNumber ,qty,dischargingPoint,productLossLit,costPerlit,shortageValueGh,overNightAllowance,diductionAtSource,paymentDue,AmountReceivable,cashPaid,company,rate,distance,fuel,rloss,status,loadingPoint)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'Not Moved',?)");
    pst.setString(1, driver);
    pst.setString(2, month);
    pst.setString(3, mCompany);
    pst.setString(4, product);
    pst.setString(5, allowableLoss);
    pst.setString(6, loadingDate);
    pst.setString(7, dischargingDate);
    pst.setString(8, wayBill);
    pst.setString(9, vehicleN);
    pst.setString(10, quantity);
    pst.setString(11, discharg);
    pst.setString(12, pLoss);
    pst.setString(13, costPerL);
    pst.setString(14, shortagVal);
    pst.setString(15, overnightAllowance);
    pst.setString(16, deduction);
    pst.setString(17, payment);
    pst.setString(18, amountR);
    pst.setString(19, cashPaid);
    pst.setString(20, subCompany);
    pst.setString(21, rate);
    pst.setString(22, distance);
    pst.setString(23, fuel);
    pst.setString(24, actualLoss);
    pst.setString(25, loadPoint);
    pst.executeUpdate(); 
    JSONObject obj = new JSONObject();
    obj.put("bankShortCode", loadPoint);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}else if(option.equals("edit")){
	
	String driver = request.getParameter("driver");
	String vehicleN = request.getParameter("vehicleN");
	String loadingDate = request.getParameter("loadingDate");
	String dischargingDate = request.getParameter("dischargingDate");
	
	String mCompany = request.getParameter("mCompany");
	String subCompany = request.getParameter("subCompany");
	String month1 = request.getParameter("month");
	String product = request.getParameter("product");
	String allowableLoss = request.getParameter("allowableLoss");
	
	String costPerL = request.getParameter("costPerL");
	String wayBill = request.getParameter("wayBill");
	String overnightAllowance = request.getParameter("overnightAllowance");
	String quantity = request.getParameter("quantity");
	
	
	String location = request.getParameter("location");
	String distance = request.getParameter("distance");
	
	String rate = request.getParameter("rate");
	String amount = request.getParameter("amount");
	String fuel = request.getParameter("fuel");
	String roadEx = request.getParameter("roadEx");
	String shortagVal = request.getParameter("shortagVal");
	String deduction = request.getParameter("deduction");
	String payment = request.getParameter("payment");
	String amountR = request.getParameter("amountR");
	String cashPaid = request.getParameter("cashPaid");
	String actualLoss = request.getParameter("actualLoss");
	String pLoss = request.getParameter("pLoss");
	
	String discharg = location.substring(location.lastIndexOf(" ")+1);
	String loadPoint = location.substring(0, location.indexOf(" "));
    
  
    pst = con.prepareStatement("update trips set name=?,monthh=?,OilCompany=?,type=?,aloss=?,loadingDate=?,dischargingDate=?,waybillNumber=?,vehicleNumber=? ,qty=?,dischargingPoint=?,productLossLit=?,costPerlit=?,shortageValueGh=?,overNightAllowance=?,diductionAtSource=?,paymentDue=?,AmountReceivable=?,cashPaid=?,company=?,rate=?,distance=?,fuel=?,rloss=?,loadingPoint=? where id=?");
    pst.setString(1, driver);
    pst.setString(2, month);
    pst.setString(3, mCompany);
    pst.setString(4, product);
    pst.setString(5, allowableLoss);
    pst.setString(6, loadingDate);
    pst.setString(7, dischargingDate);
    pst.setString(8, wayBill);
    pst.setString(9, vehicleN);
    pst.setString(10, quantity);
    pst.setString(11, discharg);
    pst.setString(12, pLoss);
    pst.setString(13, costPerL);
    pst.setString(14, shortagVal);
    pst.setString(15, overnightAllowance);
    pst.setString(16, deduction);
    pst.setString(17, payment);
    pst.setString(18, amountR);
    pst.setString(19, cashPaid);
    pst.setString(20, subCompany);
    pst.setString(21, rate);
    pst.setString(22, distance);
    pst.setString(23, fuel);
    pst.setString(24, actualLoss);
    pst.setString(25, loadPoint);
    pst.setString(26, ids);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
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
						System.out.println("Calculating .........................");
						

						String pLoss = request.getParameter("productLoss");
						String aLoss = request.getParameter("allowableLoss");
						String costPL = request.getParameter("costPL");
						String overNight = request.getParameter("overNight");
						String cash = request.getParameter("cashPaid");
						// actual loss calculation
						double productLoss = Double.parseDouble(pLoss);
						double allowableLoss = Double.parseDouble(aLoss);
						double cashPaid = Double.parseDouble(cash);
						double actualLoss = productLoss - allowableLoss;
						double costP = Double.parseDouble(costPL);
						double paymentDue =0.00;
						double amountR = 0.00;
						if(actualLoss <=0){
							actualLoss=0.00;
						}
						//Shortage value gh
						double shortageValueGh = actualLoss*costP;
						//deduction at source
						double overnightAllowance = Double.parseDouble(overNight);
						double deductionAtSource=shortageValueGh;
						if(shortageValueGh>overnightAllowance){
							deductionAtSource = overnightAllowance;
							paymentDue = 0.00;
							amountR = shortageValueGh - overnightAllowance - cashPaid;
							overnightAllowance = 0.00;
						}else if(shortageValueGh<overnightAllowance){
							deductionAtSource = shortageValueGh;
							overnightAllowance = overnightAllowance-deductionAtSource;
							paymentDue = overnightAllowance;
							amountR =0.00;
						}else if(shortageValueGh==overnightAllowance){
							overnightAllowance=0.00;
						}
						
						
						
                        
						JSONObject obj = new JSONObject();
					    obj.put("actualLoss", actualLoss);
					    obj.put("shortageValueGh", shortageValueGh);
					    obj.put("deductionAtSource", deductionAtSource);
					    obj.put("overnightAllowance", overnightAllowance);
					    obj.put("paymentDue", paymentDue);
					    obj.put("amountR", amountR);
					    list.add(obj);
						out.print(list.toJSONString());
						out.flush();
					}else if(option.equals("bringLocation")){
						System.out.println("Location printng ....................");
						String location = request.getParameter("location");
						
						String count = "select * from location where locaction='"+location+"'";
				           
						rs = stmt.executeQuery(count);
						
						while(rs.next())
						{
						    double distance = rs.getDouble("distance_");
						    double rate = rs.getDouble("rate_");
						    double amount = distance*rate;
						    String fuel = rs.getString("fuel_");
						    
						    JSONObject obj = new JSONObject();
						    obj.put("distance", distance);
						    obj.put("rate", rate);
						    obj.put("amount", amount);
						    obj.put("fuel", fuel);
						    list.add(obj);
						}

						out.print(list.toJSONString());
						out.flush();
					}else if(option.equals("bringCar")){
						
						String bvo = request.getParameter("test");
						
						String count = "select truck from drivers where name='"+bvo+"'";
				           
						rs = stmt.executeQuery(count);
						
						while(rs.next())
						{
						    String data = rs.getString(1);
						    
						    JSONObject obj = new JSONObject();
						    obj.put("car", data);
						    list.add(obj);
						}

						out.print(list.toJSONString());
						out.flush();
					}
					
					
					else if(option.equals("paySlip") && month != ""){
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
									}else if(option.equals("move")){
										String select[] = request.getParameterValues("id[]");
										
										for (int i1 = 0; i1 < select.length; i1++) {
											System.out.println("array with jquery....."+select[i1]);
								            pst = con.prepareStatement("update trips set status='Moved' where id = '"+select[i1]+"'");
								            pst.executeUpdate();  
								        }
										JSONObject obj = new JSONObject();
										obj.put("totalPay", ids);
									    list.add(obj);
									    
									    out.print(list.toJSONString());
										out.flush();
									}else if(option.equals("trucks")){
										
										String query = "select vehicleNumber from trips where id ='"+ids+"'";
										
										rs = stmt.executeQuery(query);
										while(rs.next()){
											String tripN=rs.getString(1);
											String query1 = "select * from trips where vehicleNumber ='"+tripN+"'";
											rs = stmt.executeQuery(query1);
															while(rs.next())
															{
																JSONObject obj = new JSONObject();
																String driver = rs.getString("name");
																String vehicleN = rs.getString("vehicleNumber");
																String loadingDate = rs.getString("loadingDate");
																String dischargingDate = rs.getString("dischargingDate");
																
																String mCompany = rs.getString("OilCompany");
																String subCompany = rs.getString("company");
																String month1 = rs.getString("monthh");
																String product = rs.getString("type");
																String allowableLoss = rs.getString("aloss");
																String costPerL = rs.getString("costPerlit");
																String wayBill = rs.getString("waybillNumber");
																String overnightAllowance = rs.getString("overNightAllowance");
																String quantity = rs.getString("qty");
																
																String discharg = rs.getString("dischargingPoint");
																String loadPoint = rs.getString("loadingPoint");
																
																String distance = rs.getString("distance");
																
																String rate = rs.getString("rate");
																
																String fuel = rs.getString("fuel");
																String shortagVal = rs.getString("shortageValueGh");
																String deduction = rs.getString("diductionAtSource");
																String payment = rs.getString("paymentDue");
																String amountR = rs.getString("AmountReceivable");
																String cashPaid = rs.getString("cashPaid");
																String actualLoss = rs.getString("rloss");
																String pLoss = rs.getString("productLossLit");
																String id = rs.getString("id");
																

															    i+=1;
															    String number= String.valueOf(i);
															    

															    obj.put("id", id);
															    obj.put("number", number);
															    obj.put("driver", driver);
															    obj.put("vehicleN", vehicleN);
															    obj.put("loadingDate", loadingDate);
															    obj.put("dischargingDate", dischargingDate);
															    obj.put("mCompany", mCompany);
															    obj.put("subCompany", subCompany);
															    obj.put("month1", month1);
															    obj.put("product", product);
															    obj.put("allowableLoss", allowableLoss);
															    obj.put("costPerL", costPerL);
															    obj.put("wayBill", wayBill);
															    obj.put("overnightAllowance", overnightAllowance);
															    obj.put("quantity", quantity);
															    obj.put("discharg", discharg);
															    obj.put("loadPoint", loadPoint);
															    obj.put("distance", distance);
															    obj.put("rate", rate);
															    obj.put("fuel", fuel);
															    obj.put("shortagVal", shortagVal);
															    obj.put("deduction", deduction);
															    obj.put("payment", payment);
															    obj.put("amountR", amountR);
															    obj.put("cashPaid", cashPaid);
															    obj.put("actualLoss", actualLoss);
															    obj.put("pLoss", pLoss);
															    obj.put("number", number);
															    list.add(obj);
															}
						
															out.print(list.toJSONString());
															out.flush();
															
										}
									}else if(option.equals("getTripsPerTruck")){
										String query = "select * from trips";
										
										rs = stmt.executeQuery(query);
									while(rs.next())
									{
										//name,monthh,OilCompany,type,aloss,loadingDate,dischargingDate,waybillNumber,vehicleNumber ,qty,dischargingPoint,productLossLit,costPerlit,shortageValueGh,overNightAllowance,diductionAtSource,paymentDue,AmountReceivable,cashPaid,company,rate,distance,fuel,rloss,status,loadingPoint
									    JSONObject obj = new JSONObject();
										String driver = rs.getString("name");
										String vehicleN = rs.getString("vehicleNumber");
										String loadingDate = rs.getString("loadingDate");
										String dischargingDate = rs.getString("dischargingDate");
										
										String mCompany = rs.getString("OilCompany");
										String subCompany = rs.getString("company");
										String month1 = rs.getString("monthh");
										String product = rs.getString("type");
										String allowableLoss = rs.getString("aloss");
										String costPerL = rs.getString("costPerlit");
										String wayBill = rs.getString("waybillNumber");
										String overnightAllowance = rs.getString("overNightAllowance");
										String quantity = rs.getString("qty");
										
										String discharg = rs.getString("dischargingPoint");
										String loadPoint = rs.getString("loadingPoint");
										
										String distance = rs.getString("distance");
										
										String rate = rs.getString("rate");
										
										String fuel = rs.getString("fuel");
										String shortagVal = rs.getString("shortageValueGh");
										String deduction = rs.getString("diductionAtSource");
										String payment = rs.getString("paymentDue");
										String amountR = rs.getString("AmountReceivable");
										String cashPaid = rs.getString("cashPaid");
										String actualLoss = rs.getString("rloss");
										String pLoss = rs.getString("productLossLit");
										String id = rs.getString("id");
										

									    i+=1;
									    String number= String.valueOf(i);
									    

									    obj.put("id", id);
									    obj.put("number", number);
									    obj.put("driver", driver);
									    obj.put("vehicleN", vehicleN);
									    obj.put("loadingDate", loadingDate);
									    obj.put("dischargingDate", dischargingDate);
									    obj.put("mCompany", mCompany);
									    obj.put("subCompany", subCompany);
									    obj.put("month1", month1);
									    obj.put("product", product);
									    obj.put("allowableLoss", allowableLoss);
									    obj.put("costPerL", costPerL);
									    obj.put("wayBill", wayBill);
									    obj.put("overnightAllowance", overnightAllowance);
									    obj.put("quantity", quantity);
									    obj.put("discharg", discharg);
									    obj.put("loadPoint", loadPoint);
									    obj.put("distance", distance);
									    obj.put("rate", rate);
									    obj.put("fuel", fuel);
									    obj.put("shortagVal", shortagVal);
									    obj.put("deduction", deduction);
									    obj.put("payment", payment);
									    obj.put("amountR", amountR);
									    obj.put("cashPaid", cashPaid);
									    obj.put("actualLoss", actualLoss);
									    obj.put("pLoss", pLoss);
									    obj.put("number", number);
									    list.add(obj);
									}

									out.print(list.toJSONString());
									out.flush();
									}else if(option.equals("addLocations")){
										
										String lpoint = request.getParameter("lpoint");
										String dpoint = request.getParameter("dpoint");
										String rate = request.getParameter("rate");
										String distance = request.getParameter("distance");
										String fuel = request.getParameter("fuel");
										String location = lpoint +" to "+dpoint;
										System.out.println(rate);
									    con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root");
									    pst = con.prepareStatement("insert into location(loading_point,discharging_point,rate_,distance_,fuel_,locaction)values(?,?,?,?,?,?)");
									    pst.setString(1, lpoint);
									    pst.setString(2, dpoint);
									    pst.setString(3, rate);
									    pst.setString(4, distance);
									    pst.setString(5, fuel);
									    pst.setString(6, location);
									    pst.executeUpdate(); 
									    JSONObject obj = new JSONObject();
									    obj.put("location", location);
									    list.add(obj);
										
									    out.print(list.toJSONString());
										out.flush();
									}else if(option.equals("getLocations")){
										
										String sqlAll = "select * from location";
										rs = stmt.executeQuery(sqlAll);
										while(rs.next())
										{
										    JSONObject obj = new JSONObject();
										    String id = rs.getString("id");
										    String loading = rs.getString("loading_point");
										    String discharging = rs.getString("discharging_point");
										    String rate = rs.getString("rate_");
										    String distance = rs.getString("distance_");
										    String fuel = rs.getString("fuel_");
										   System.out.println("seen ......");
										    i+=1;
										    String number= String.valueOf(i);
										    

										    obj.put("id", id);
										    obj.put("loading", loading);
										    obj.put("discharging", discharging);
										    obj.put("rate", rate);
										    obj.put("distance", distance);
										    obj.put("fuel", fuel);
										    
										    obj.put("number", number);
										    list.add(obj);
										}

										out.print(list.toJSONString());
										out.flush();
										}else if(option.equals("showLocation")){
											String query1 = "select * from location where id='"+ids+"'";

											rs = stmt.executeQuery(query1);
											
											
											while(rs.next())
											{
											    JSONObject obj = new JSONObject();
												String loading = rs.getString("loading_point");
												String discharging = rs.getString("discharging_point");
												String rate = rs.getString("rate_");
												String distance = rs.getString("distance_");
												String fuel = rs.getString("fuel_");
												
										        
											    i+=1;
											    String number= String.valueOf(i);
											  
											    obj.put("loading", loading);
											    obj.put("discharging", discharging);
											    obj.put("rate", rate);
											    obj.put("distance", distance);
											    obj.put("fuel", fuel);
											   
											   
											    list.add(obj);
											}

											out.print(list.toJSONString());
											out.flush();
										}else if(option.equals("editLocation")){
											
											String lpoint = request.getParameter("lpoint");
											String dpoint = request.getParameter("dpoint");
											String rate = request.getParameter("rate");
											String distance = request.getParameter("distance");
											String fuel = request.getParameter("fuel");
											
										    pst = con.prepareStatement("update location set loading_point=?,discharging_point=?,rate_=?,distance_=?,fuel_=? where id=?");
										    pst.setString(1, lpoint);
										    pst.setString(2, dpoint);
										    pst.setString(3, rate);
										    pst.setString(4, distance);
										    pst.setString(5, fuel);
										    pst.setString(6, ids);
										    pst.executeUpdate();
										    JSONObject obj = new JSONObject();
										    list.add(obj);
											
										    out.print(list.toJSONString());
											out.flush();
										}

%>














