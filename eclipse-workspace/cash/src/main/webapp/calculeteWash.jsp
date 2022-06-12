		
			<%@page import="org.json.simple.*"%>
			
			<%
			
			JSONArray list =new JSONArray();
			
			String sales = request.getParameter("sales");  
			String exp = request.getParameter("exp");  
			 
		
			
			double sal = Double.parseDouble(sales);
			double ex = Double.parseDouble(exp);
			
				    
            double sal1 = 0;
			double co1 = 0;
			double dep=0;
			
			co1=sal/3;
			double depo = ex+co1;
			dep=sal-depo;
			
			
			String s = String.valueOf(co1);
			String d = String.valueOf(dep);
			
			
			JSONObject obj = new JSONObject();
			obj.put("s", s);
			obj.put("d", d);
			
			list.add(obj);
			out.println(list.toJSONString());
			out.flush();
			%>