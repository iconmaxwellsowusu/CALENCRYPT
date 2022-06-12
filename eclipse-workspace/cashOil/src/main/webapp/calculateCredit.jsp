		
			<%@page import="org.json.simple.*"%>
			
			<%
			
			JSONArray list =new JSONArray();
			
			String ltr = request.getParameter("ltr");  
			String rate = request.getParameter("rate");  
			 
			
			double lt = Double.parseDouble(ltr);
			double rat = Double.parseDouble(rate);
			
			double total= lt*rat;
			String tot = String.valueOf(total);
			JSONObject obj = new JSONObject();
			obj.put("tot", tot);
			list.add(obj);
			out.println(list.toJSONString());
			out.flush();
			%>