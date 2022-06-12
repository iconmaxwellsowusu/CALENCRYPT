		
			<%@page import="org.json.simple.*"%>
			
			<%
			
			JSONArray list =new JSONArray();
			
			String eQuantity = request.getParameter("eQuantity");  
			String price = request.getParameter("price");  
			String quantityR = request.getParameter("quantityR");  
			
			
			double eQ = Double.parseDouble(eQuantity);
			double p = Double.parseDouble(price);
			double qR = Double.parseDouble(quantityR);
				    
            double shortage = 0;
            double overage = 0;
			double total = 0;
			double ov=0;
			
			if(qR > eQ){
				shortage=0;
				overage =qR -eQ;
				ov =overage + eQ;
				total=ov*p;
				
			}else if(qR < eQ){
				shortage=eQ-qR;
				overage = 0;
				ov =eQ-shortage ;
				total=ov*p;
			}
			else if(qR == eQ){
				shortage=0;
				overage = 0;
				ov =qR ;
				total=ov*p;
			}
			
			String sh = String.valueOf(shortage);
			String ovr = String.valueOf(overage);
			String tot = String.valueOf(total);
			
			JSONObject obj = new JSONObject();
			obj.put("sh", sh);
			obj.put("ovr", ovr);
			obj.put("tot", tot);
			list.add(obj);
			out.println(list.toJSONString());
			out.flush();
			%>