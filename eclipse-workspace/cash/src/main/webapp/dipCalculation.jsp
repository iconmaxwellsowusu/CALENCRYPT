		    <%@page import="java.sql.*"%>
			<%@page import="org.json.simple.*"%>
			
			<%
			
			double openStock = 0.00;
			double openStockReading=0;
			double load=0;
			double overageShortage =0;
			double currentRate =0;
			String openStock2="";
			String openStockReading2="";
			Connection con;
			PreparedStatement st;
			ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
			       
			String date = request.getParameter("date");  
			String product = request.getParameter("product");
			
			HttpSession sess = request.getSession(false);
			sess.setAttribute("product", product);
			  
				    
				    st = con.prepareStatement("select * from productSupply where date=? and product=?");
				    st.setString(1, date);
				    st.setString(2, product);
					rs = st.executeQuery();
			
					if (rs.next()==true) {
						double shortage=rs.getDouble("shortage");
						double overage=rs.getDouble("overage");
						
						overageShortage =  shortage+overage;
						load =rs.getDouble("qR");
						
					}
					
					/*----------------------------------------------------------------------------*/
					Connection con1;
					Statement st1;
                    ResultSet rs1;
                    con1 = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
                    
					st1 = con1.createStatement();
				    String sql = "select * from closingStock where  ID = (SELECT MAX(ID) FROM closingStock) and product ='"+product+"'";
					rs1 = st1.executeQuery(sql);
			
					if (rs1.next()==true) {
						
						openStockReading2=rs1.getString("closeReading");
						
						openStock2 = rs1.getString("closingStockvalue"); 
						
					}
			JSONArray list =new JSONArray();
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
			
			
			      if(openStock2.equals(null)||openStock2.equals("")){
			    	  openStock=Double.parseDouble(openStock5);
			    	  sess.setAttribute("openStock", openStock);
			    	
			      }else{
			      openStock=Double.parseDouble(openStock2);
			      sess.setAttribute("openStock", openStock);
			      
			      }
			 if(openStockReading2.equals("")||openStockReading2.equals(null)){
				 openStockReading = Double.parseDouble(openStockReading4);
				 sess.setAttribute("openStockReading", openStockReading);
				
			 }else{
				 openStockReading = Double.parseDouble(openStockReading2);
				 sess.setAttribute("openStockReading", openStockReading);
				 
			 }
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
			
			
			
			JSONObject obj = new JSONObject();
			obj.put("available1", available1.replaceAll("-", ""));
			obj.put("salesCheck1", salesCheck1.replaceAll("-", ""));
			obj.put("salesltr1", salesltr1.replaceAll("-", ""));
			obj.put("difference1", difference1.replaceAll("-", ""));
			obj.put("valueGhs1", valueGhs1.replaceAll("-", ""));
			obj.put("cashSaleGhs1", cashSaleGhs1.replaceAll("-", ""));
			obj.put("cashAvailableFromSales1", cashAvailableFromSales1.replaceAll("-", ""));
			obj.put("expectedCash1", expectedCash1.replaceAll("-", ""));
			obj.put("openStock1", openStock1.replaceAll("-", ""));
			obj.put("openStockReading1", openStockReading1.replaceAll("-", ""));
			obj.put("load1", load1.replaceAll("-", ""));
			obj.put("overageShortage1", overageShortage1.replaceAll("-", ""));
			list.add(obj);
			out.println(list.toJSONString());
			out.flush();
			
			
			/*---------------------------------           WinFall and ShortFall Logic -------------------------------------------*/
			Connection con2;
			PreparedStatement st2;
            ResultSet rs2;
            con2 = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
            
			st2 = con2.prepareStatement("select * from closingStock where  ID = (SELECT MAX(ID) FROM closingStock)");
		 
		 
			rs2 = st2.executeQuery();
			String rat="";
			double rateDiff = 0.00;
			double shortFall=0.00;
			double winFall = 0.00;
			
			HttpSession sessrateDiff = request.getSession(false);
			HttpSession sessrateshortFall = request.getSession(false);
			HttpSession sessratewinFall = request.getSession(false);
			
			if (rs2.next()==true) {
				 currentRate=rs2.getDouble("rate");
				 rat = rs2.getString("rate");
				 rateDiff = rs2.getDouble("rateDiff");
				 winFall = rs2.getDouble("winFall");
				 shortFall = rs2.getDouble("shortFall");
				
			}
			 
			          if(!rat.equals("")){
			        	  if(rate_ == currentRate && winFall ==0.00 && shortFall ==0.00){
			        		  winFall=0.00;
			        		  shortFall=0.00;
			        		  rateDiff =0.00;
			        		  
			        		  sessrateDiff.setAttribute("rateDiff", rateDiff);
			        		  sessrateshortFall.setAttribute("shortFall", shortFall);
			        		  sessratewinFall.setAttribute("winFall", winFall);
			        		  
			        		  System.out.println("Since all are zero "+winFall+" "+shortFall);
			        	  }
			        	  else if(rate_ == currentRate && winFall ==0.00 ){
							
			        		  shortFall = rateDiff*closingStock_;
			        		  winFall=0.00;
			        		  
			        		  sessrateDiff.setAttribute("rateDiff", rateDiff);
			        		  sessrateshortFall.setAttribute("shortFall", shortFall);
			        		  sessratewinFall.setAttribute("shortFall", shortFall);
			        		  
			        		  System.out.println("shortFall ="+shortFall);
			        		  
						}else if(rate_ == currentRate && shortFall ==0.00 ){
							
							  winFall = rateDiff*closingStock_;
							  shortFall=0.00;
							  sessrateDiff.setAttribute("rateDiff", rateDiff);
			        		  sessrateshortFall.setAttribute("shortFall", shortFall);
			        		  sessratewinFall.setAttribute("winFall", winFall);
			        		  System.out.println("winFall ="+winFall);
			        		  
						}
			        	  
			        	  else if(rate_>currentRate){
			        		 rateDiff = rate_- currentRate;
			        		
							 double roundOff11 = Math.round(rateDiff * 100.0) / 100.0;
							 rateDiff=roundOff11;
							 winFall = roundOff11*closingStock_;
							 shortFall=0.00;
							 
							  sessrateDiff.setAttribute("rateDiff", rateDiff);
			        		  sessrateshortFall.setAttribute("shortFall", shortFall);
			        		  sessratewinFall.setAttribute("winFall", winFall);
							 
							System.out.println("dif ="+roundOff11+"stock ="+closingStock_);
							System.out.println("winfall is "+winFall);
						}else if(rate_<currentRate){
							
							rateDiff =currentRate- rate_ ;
			        		
							double roundOff11 = Math.round(rateDiff * 100.0) / 100.0;
							shortFall = roundOff11*closingStock_;
							winFall =0.00;
							rateDiff=roundOff11;
							
							  sessrateDiff.setAttribute("rateDiff", rateDiff);
			        		  sessrateshortFall.setAttribute("shortFall", shortFall);
			        		  sessratewinFall.setAttribute("winFall", winFall);
							
							System.out.println("dif ="+roundOff11+"stock ="+closingStock_);
							System.out.println("short fall is"+shortFall);

          
						}
						
						
			          }else{
			        	  shortFall=0.00;
			        	  winFall = 0.00;
			        	  rateDiff=0.00;
			        	  
						  sessrateDiff.setAttribute("rateDiff", rateDiff);
		        		  sessrateshortFall.setAttribute("shortFall", shortFall);
		        		  sessratewinFall.setAttribute("winFall", winFall);
			        	  
			        	  System.out.println("both win,rateDiff and short are "+0.00);
			          }
			%>
			
			
			
			
			
			
			
			
			
			