<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

String query = "insert into department(departmentName) values(?)";

Statement stmt = con.createStatement();
int i=0;
String option= request.getParameter("option");

String ids= request.getParameter("myid");

if(option.equals("department")){
    JSONObject obj = new JSONObject();
    
    String name = request.getParameter("Name");
    pst=con.prepareStatement(query);
    pst.setString(1, name);
    pst.executeUpdate();
    obj.put("name", name);
    
    list.add(obj);


out.print(list.toJSONString());
out.flush();
}else if(option.equals("position")){
	String query1 = "insert into positions(positionName) values(?)";
	
    JSONObject obj = new JSONObject();
    
    String name = request.getParameter("Name");
    pst=con.prepareStatement(query1);
    pst.setString(1, name);
    pst.executeUpdate();
    obj.put("name", name);
    
    list.add(obj);


out.print(list.toJSONString());
out.flush();
} else if(option.equals("get")){
	
	ResultSet rst1;
	String query2 = "select * from department";
	String total="";
	rst1 = stmt.executeQuery(query2);
	int i1=1;
	while(rst1.next())
	{
	    
	  //  ResultSet rst;
	    String number= String.valueOf(i1);
	    String id = rst1.getString("id");
	    String name = rst1.getString("departmentName");
	    String query3 = "select count(Name) from employee where department='"+name+"' and bStatus='Active'";
	    Statement stt = con.createStatement();
		ResultSet rss = stt.executeQuery(query3);
	    while(rss.next()){
	    	total=rss.getString(1);
		    i1+=1;
    
	    }
	    
	    JSONObject obj = new JSONObject();
	    obj.put("name", name);
	    obj.put("number", number);
	    obj.put("total", total);
	    obj.put("id", id);
	    list.add(obj);
	}
    
	out.print(list.toJSONString());
	out.flush();
	}else if(option.equals("getL")){
		
		ResultSet rst1;
		String query2 = "select * from positions";
		
		rst1 = stmt.executeQuery(query2);
		int i1=1;
		while(rst1.next())
		{
			i1+=1;
			
		  //  ResultSet rst;
		    String number= String.valueOf(i1);
		    String name = rst1.getString("positionName");
		    String id = rst1.getString("id");
		   
		    JSONObject obj = new JSONObject();
		    obj.put("name", name);
		    obj.put("number", number);
		    obj.put("id", id);
		    list.add(obj);
		}
	    
		out.print(list.toJSONString());
		out.flush();
		}else if(option.equals("show")){
			String query1 = "select * from department where id='"+ids+"'";
           
			rs = stmt.executeQuery(query1);
			
			
			while(rs.next())
			{
			    JSONObject obj = new JSONObject();
			  
			    String name = rs.getString("departmentName");
			    
			    obj.put("name", name);
			  
			    list.add(obj);
			}

			out.print(list.toJSONString());
			out.flush();
		}else if(option.equals("updateD")){
			String query1 = "update department set departmentName=? where id=?";
            String name = request.getParameter("name");
			pst = con.prepareStatement(query1);
			pst.setString(1, name);
			pst.setString(2, ids);
			pst.executeUpdate();
			
			    JSONObject obj = new JSONObject();
			    obj.put("id", ids);
			    list.add(obj);
			

			out.print(list.toJSONString());
			out.flush();
		}else if(option.equals("showP")){
			String query1 = "select * from positions where id='"+ids+"'";
           
			rs = stmt.executeQuery(query1);
			
			
			while(rs.next())
			{
			    JSONObject obj = new JSONObject();
			  
			    String name = rs.getString("positionName");
			    System.out.println(name);
			    obj.put("name", name);
			  
			    list.add(obj);
			}

			out.print(list.toJSONString());
			out.flush();
		}else if(option.equals("updateP")){
			String query1 = "update positions set positionName=? where id=?";
            String name = request.getParameter("name");
			pst = con.prepareStatement(query1);
			pst.setString(1, name);
			pst.setString(2, ids);
			pst.executeUpdate();
			
			    JSONObject obj = new JSONObject();
			    obj.put("id", ids);
			    list.add(obj);
			

			out.print(list.toJSONString());
			out.flush();
		}else if(option.equals("deleteD")){
			String query1 = "delete from department where id=?";
			pst = con.prepareStatement(query1);
			pst.setString(1, ids);
			pst.executeUpdate();
			
			    JSONObject obj = new JSONObject();
			    obj.put("id", ids);
			    list.add(obj);
			

			out.print(list.toJSONString());
			out.flush();
		}else if(option.equals("deleteP")){
			String query1 = "delete from positions where id=?";
			pst = con.prepareStatement(query1);
			pst.setString(1, ids);
			pst.executeUpdate();
			
			    JSONObject obj = new JSONObject();
			    obj.put("id", ids);
			    list.add(obj);
			

			out.print(list.toJSONString());
			out.flush();
		}
%>