		    <%@page import="java.sql.*"%>
			<%@page import="org.json.simple.*"%>
			
			<%
			String title = request.getParameter("title");
			String type = request.getParameter("type");
			String region = request.getParameter("region");
			String marital = request.getParameter("marital");
			String minis = request.getParameter("minis");
			String occu = request.getParameter("occu");
			String job = request.getParameter("job");
			String bs = request.getParameter("bs");
			String class1 = request.getParameter("class1");
			String course = request.getParameter("course");
			String position = request.getParameter("position");
			String squad = request.getParameter("squad");
			String group = request.getParameter("group");
			String pos = request.getParameter("pos");
			String reason = request.getParameter("reason");
			String section = request.getParameter("section");
			JSONArray list =new JSONArray();
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/cop","root","root");
			Statement st = con.createStatement();
			
		    if(title != null){
			String sql = "Select * from title";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
			
				String area = rs.getString("title");
			
				obj.put("area", area);
				list.add(obj);
				
	
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    Statement stm = con.createStatement();		
		    
		    if(region != null){
				String sql = "Select * from region";
			    ResultSet rs = stm.executeQuery(sql);
			    while(rs.next()){
			    	
					JSONObject obj = new JSONObject();
					String area = rs.getString("region");
					
					obj.put("area", area);
					list.add(obj);
					
			    }
				out.println(list.toJSONString());
				out.flush();
			    }
		    
Statement st1 = con.createStatement();
			
		    if(marital != null){
			String sql = "Select * from marital";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("marital");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
		    
			
		    if(type != null){
			String sql = "Select * from type";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("type");
				
				obj.put("area", area);
				list.add(obj);
				System.out.println("the type is "+area);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
		    
Statement st2 = con.createStatement();
			
		    if(minis != null){
			String sql = "Select * from minis";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("minis");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st3 = con.createStatement();
			
		    if(occu != null){
			String sql = "Select * from occu";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("occu");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st4 = con.createStatement();
			
		    if(job != null){
			String sql = "Select * from job";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("job");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st5 = con.createStatement();
			
		    if(bs != null){
			String sql = "Select * from bs";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("bs");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st6 = con.createStatement();
			
		    if(class1 != null){
			String sql = "Select * from class";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("class");
				
				obj.put("area", area);
				list.add(obj);
				System.out.println(area);
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st7 = con.createStatement();
			
		    if(course != null){
			String sql = "Select * from course";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("course");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }

Statement st8 = con.createStatement();
			
		    if(position != null){
			String sql = "Select * from position1";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("position");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st9 = con.createStatement();
			
		    if(squad != null){
			String sql = "Select * from squad";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("squad");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st10 = con.createStatement();
			
		    if(group != null){
			String sql = "Select * from group1";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("group1");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st11 = con.createStatement();
			
		    if(pos != null){
			String sql = "Select * from pos";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("pos");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st12 = con.createStatement();
			
		    if(reason != null){
			String sql = "Select * from reason";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("reason");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
Statement st13 = con.createStatement();
			
		    if(section != null){
			String sql = "Select * from section";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next()){
		    	
				JSONObject obj = new JSONObject();
				String area = rs.getString("section");
				
				obj.put("area", area);
				list.add(obj);
				
		    }
			out.println(list.toJSONString());
			out.flush();
		    }
		    
		    
String title1 = request.getParameter("title1");

		    
		    if(title1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into title(title) values(?)");
		    	pst.setString(1, title1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("title1", title1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				
				System.out.println("you inserted "+ title1);
				
		    }
		    
String type1 = request.getParameter("type1");

		    
		    if(type1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into type(type) values(?)");
		    	pst.setString(1, type1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("type1", type1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				
				System.out.println("you inserted type"+ type1);
				
		    }
		    
		    
String region2 = request.getParameter("region2");

		    
		    if(region2 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into region(region) values(?)");
		    	pst.setString(1, region2);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("region2", region2);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				
				
				
		    }
		    
String marital1 = request.getParameter("marital1");

		    
		    if(marital1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into marital(marital) values(?)");
		    	pst.setString(1, marital1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("marital1", marital1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				
		    }
		    
String minis1 = request.getParameter("minis1");

		    
		    if(minis1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into minis(minis) values(?)");
		    	pst.setString(1, minis1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("minis1", minis1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				
		    }
		    
String occu1 = request.getParameter("occu1");

		    
		    if(occu1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into occu(occu) values(?)");
		    	pst.setString(1, occu1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("occu1", occu1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				
		    }
		    
String job1 = request.getParameter("job1");

		    
		    if(job1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into job(job) values(?)");
		    	pst.setString(1, job1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("job1", job1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
			
		    }
		    
String bs1 = request.getParameter("bs1");

		    
		    if(bs1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into bs(bs) values(?)");
		    	pst.setString(1, bs1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("bs1", bs1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				
		    }
		    
String class2 = request.getParameter("class12");

		   
		    if(class2 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into class(class) values(?)");
		    	pst.setString(1, class2);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("class2", class2);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
			
		    }
		    
String position1 = request.getParameter("position1");

		    
		    if(position1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into position1(position) values(?)");
		    	pst.setString(1, position1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	
		    	obj.put("position1", position1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
			
		    }
		    
String squad1 = request.getParameter("squad1");

		    
		    if(squad1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into squad(squad) values(?)");
		    	pst.setString(1, squad1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("squad1", squad1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				System.out.println("squad you inserted "+ squad1);
		    }
		    
String group1 = request.getParameter("group1");

		    
		    if(group1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into group1(group1) values(?)");
		    	pst.setString(1, group1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("group1", group1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
			
		    }
		    
String pos1 = request.getParameter("pos1");

		    
		    if(pos1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into pos(pos) values(?)");
		    	pst.setString(1, pos1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("pos1", pos1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				System.out.println("pos you inserted "+ pos1);
		    }
		    
String reason1 = request.getParameter("reason1");

		    
		    if(reason1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into reason(reason) values(?)");
		    	pst.setString(1, reason1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("reason1", reason1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
			
		    }
		    
String section1 = request.getParameter("section1");

		    
		    if(section1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into section(section) values(?)");
		    	pst.setString(1, section1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("section1", section1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				
		    }
		    
String course1 = request.getParameter("course1");

		    
		    if(course1 != null){
		    	PreparedStatement pst= con.prepareStatement("insert into course(course) values(?)");
		    	pst.setString(1, course1);
		    	pst.executeUpdate();
		    	
		    	JSONObject obj = new JSONObject();
		    	obj.put("course1", course1);
				list.add(obj);
				
				out.println(list.toJSONString());
				out.flush();
				
		    }
		    
			
			%>