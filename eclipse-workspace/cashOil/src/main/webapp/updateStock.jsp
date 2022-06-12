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
						System.out.println(" id itself is "+id);
						session.setAttribute("id", id);
						String i = (String)session.getAttribute("id");
						
						
				    st = con.prepareStatement("select * from closingStock where id=?");
				    st.setString(1, id);
			
					rs = st.executeQuery();
			
					while (rs.next()==true) {
						String date = rs.getString("date");
						String product = rs.getString("product");
						String closingStockvalue = rs.getString("closingStockvalue");
						String closeReading = rs.getString("closeReading");
						String returnTotank = rs.getString("returnTotank");
						String salesltr = rs.getString("salesltr");
						String rate = rs.getString("rate");
						String difference = rs.getString("difference");
						String creditSale = rs.getString("creditSale");
						String advances = rs.getString("advances");
						String balance = rs.getString("balance");
						
						
						
						String opens = rs.getString("opens");
						String loads = rs.getString("loads");
						String shortageOverage = rs.getString("shortageOverage");
						String available = rs.getString("available");
						String salesCheck = rs.getString("salesCheck");
						String openStockR = rs.getString("openStockR");
						String value_ = rs.getString("value_");
						String cashSale = rs.getString("cashSale");
						String shortage = rs.getString("shortage");
						String cashAvailable = rs.getString("cashAvailable");
						String shortageRepayment = rs.getString("shortageRepayment");
						String advanceRepayment = rs.getString("advanceRepayment");
						String receivedFromDebtors = rs.getString("receivedFromDebtors");
						String expected = rs.getString("expected");
						String bankLodgement = rs.getString("bankLodgement");
						
						
						JSONObject obj = new JSONObject();
						obj.put("date", date);
						obj.put("product", product);
						obj.put("closingStockvalue", closingStockvalue);
						obj.put("closeReading", closeReading);
						obj.put("returnTotank", returnTotank);
						obj.put("salesltr", salesltr);
						obj.put("rate", rate);
						obj.put("difference", difference);
						obj.put("creditSale", creditSale);
						obj.put("advances", advances);
						obj.put("balance", balance);
						
						obj.put("opens", opens);
						obj.put("loads", loads);
						
						obj.put("shortageOverage", shortageOverage);
						obj.put("available", available);
						obj.put("salesCheck", salesCheck);
						obj.put("openStockR", openStockR);
						obj.put("value_", value_);
						obj.put("cashSale", cashSale);
						obj.put("shortage", shortage);
						obj.put("cashAvailable", cashAvailable);
						obj.put("shortageRepayment", shortageRepayment);
						obj.put("advanceRepayment", advanceRepayment);
						obj.put("receivedFromDebtors", receivedFromDebtors);
						obj.put("expected", expected);
						obj.put("bankLodgement", bankLodgement);
						
						list.add(obj);
						
				
						
					}
					
					out.println(list.toJSONString());
					out.flush();
					
					
					int oldId = Integer.parseInt(id);
					int id2= oldId - 1;
					if(id2<1){
						id2=oldId;
						
					}
					
					System.out.println(" id2 is "+id2);
					String query = "Select * from closingStock where id ='"+id2+"'";
					Statement st1 = con.createStatement();
					ResultSet rst = st1.executeQuery(query); 
					
					while(rst.next()){
					double oldRate = rst.getDouble("rate");
					
					session.setAttribute("oldRate", oldRate);
					System.out.println("the old rate is "+ oldRate);
					double win = rst.getDouble("winFall");
					session.setAttribute("win", win);
					
					double shortf = rst.getDouble("shortFall");
					session.setAttribute("shortf", shortf);
					}
					con.close();
				 
				 
				 }else if(option.equals("calculate")){
					 
					 
					 
						
						String closingStocks = request.getParameter("closingStock");  
						String openStockReading4 = request.getParameter("openStockR"); 
						String openStock5 = request.getParameter("openStock"); 
						String closingStochRead = request.getParameter("closingStockR");  
						String returnToTanks = request.getParameter("returnToTank");  
						String rates = request.getParameter("rate");  
						
						String credits = request.getParameter("credit");  
						String advances = request.getParameter("advance");  
						String shortages = request.getParameter("shortage");  
						
						String balances = request.getParameter("balance");  
						String cashAvailables = request.getParameter("cashAvailable");  
						String shortageRepayments = request.getParameter("shortageRepayment");  
						String receivedFromDebtors = request.getParameter("receivedFromDebtors"); 
						String ovsh = request.getParameter("overageShortage");
						String lo = request.getParameter("load");
						
						double load=  Double.parseDouble(lo); 
						double closingStock_ = Double.parseDouble(closingStocks);
						double closingStockRead_=Double.parseDouble(closingStochRead);
						double returnToTanks_ = Double.parseDouble(returnToTanks);
						double rate_ = Double.parseDouble(rates);
						double credits_=Double.parseDouble(credits);
						double advances_ = Double.parseDouble(advances);
						double shortages_ = Double.parseDouble(shortages);
						double balances_ = Double.parseDouble(balances);
						double shortageRepayments_ = Double.parseDouble(shortageRepayments);
						double receivedFromDebtors_=Double.parseDouble(receivedFromDebtors);
						double overageShortage =Double.parseDouble(ovsh);
						double openStock=  Double.parseDouble(openStock5);
						double openStockReading = Double.parseDouble(openStockReading4);
						
						////////////////////////////////////  Available   ////////////////////////////////
						double available= openStock + load + overageShortage;
					     double roundOff = Math.round(available*100)/100D;
					     String.format("%.3f", roundOff);
					     available=roundOff;
					     //////////////////////////////////   sales Check   /////////////////////////////
						 double salesCheck = available-closingStock_;
						 double roundOff1 = Math.round(salesCheck*100)/100D;
					     String.format("%.3f", roundOff1);
					     salesCheck=roundOff1;
					     
					     /////////////////////////////////   Sold ltr   /////////////////////////////////
					     double cal =   closingStockRead_-openStockReading;
					     System.out.println("cal = "+cal);
						 double salesltr = cal-returnToTanks_;
						  double roundOff2 = Math.round(salesltr*100)/100D;
					      String.format("%.3f", roundOff2);
					      salesltr=roundOff2;
						//////////////////////////////////////   difference  ////////////////////////////
						double difference= salesCheck - salesltr;
						  double roundOff3 = Math.round(difference*100)/100D;
					      String.format("%.3f", roundOff3);
					      difference=roundOff3;
					      System.out.println("diifffrreennccee ="+ salesltr);
			             ////////////////////////////////////// value Ghs  ////////////////////////////

						double valueGhs = salesltr*rate_;
						
						  double roundOff4 = Math.round(valueGhs*100)/100D;
					      String.format("%.3f", roundOff4);
					      valueGhs=roundOff4;
					      
			            ////////////////////////////////////// cashSaleGhs  ////////////////////////////
						
						double cashSaleGhs =valueGhs-credits_;
						
						  double roundOff5 = Math.round(cashSaleGhs*100)/100D;
					      String.format("%.3f", roundOff5);
					      cashSaleGhs=roundOff5; 
			//////////////////////////////////////cashAvailableFromSales  ////////////////////////////
						double cashAvailableFromSales = cashSaleGhs-advances_-shortages_-balances_;
						
						  double roundOff6 = Math.round(cashAvailableFromSales*100)/100D;
					      String.format("%.3f", roundOff6);
					      cashAvailableFromSales=roundOff6; 
			//////////////////////////////////////expectedCash  ////////////////////////////
						double expectedCash = cashAvailableFromSales+shortageRepayments_+advances_+receivedFromDebtors_;
						  double roundOff7 = Math.round(expectedCash*100)/100D;
					      String.format("%.3f", roundOff7);
					      expectedCash=roundOff7; 
					      
					      double bank = expectedCash;
						
						String available1 = String.valueOf(available);
						
						String salesCheck1 = String.valueOf(salesCheck);
					
						String salesltr1 = String.valueOf(salesltr);
						
						String difference1 = String.valueOf(difference);
						
						String valueGhs1 = String.valueOf(valueGhs);
						
						String cashSaleGhs1 = String.valueOf(cashSaleGhs);
					
						String cashAvailableFromSales1 = String.valueOf(cashAvailableFromSales);
						
						String expectedCash1 = String.valueOf(expectedCash);
						
						String openStock1 = String.valueOf(openStock);
						
						String openStockReading1 = String.valueOf(openStockReading);
						
						String load1 = String.valueOf(load);
						
						String overageShortage1 = String.valueOf(overageShortage);
						String bank1 = String.valueOf(bank);
						
						
						JSONObject obj = new JSONObject();
						obj.put("available1", available1.replaceAll("-", ""));
						obj.put("salesCheck1", salesCheck1.replaceAll("-", ""));
						obj.put("salesltr1", salesltr1.replaceAll("-", ""));
						obj.put("difference1", difference1.replaceAll("-", ""));
						obj.put("valueGhs1", valueGhs1.replaceAll("-", ""));
						obj.put("cashSaleGhs1", cashSaleGhs1.replaceAll("-", ""));
						obj.put("cashAvailableFromSales1", cashAvailableFromSales1.replaceAll("-", ""));
						obj.put("expectedCash1", expectedCash1.replaceAll("-", ""));
						obj.put("bank1", bank1.replaceAll("-", ""));
						obj.put("openStock1", openStock1.replaceAll("-", ""));
						obj.put("openStockReading1", openStockReading1.replaceAll("-", ""));
						obj.put("load1", load1.replaceAll("-", ""));
						obj.put("overageShortage1", overageShortage1.replaceAll("-", ""));
						list.add(obj);
						
						out.println(list.toJSONString());
						out.flush();
					 
					 
					 
				 }else if(option.equals("delete")){
					 String id = request.getParameter("myid"); 
					
						st = con.prepareStatement("delete from closingStock where id=?");
						st.setString(1, id);
					    st.executeUpdate();
						
					    
					    JSONObject obj = new JSONObject();
					    obj.put("id", id);
					    list.add(obj);
					    
					    out.println(list.toJSONString());
						out.flush();
					}
				
				 
				 
				 
					
					 
			%>