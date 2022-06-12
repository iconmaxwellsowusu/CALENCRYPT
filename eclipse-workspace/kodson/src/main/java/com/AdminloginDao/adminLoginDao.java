package com.AdminloginDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Adminmodel.AdminmodelMVC;



public class adminLoginDao {

	
	String sql ="select * from login where uname=? and pass = ?";
    String url ="jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String username="kodson_maxwell";
    String password="0040105715@Icon";
	
	public boolean check(String uname, String pass){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = (Connection) DriverManager.getConnection(url,username,password);
		    PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
		    st.setString(1, uname);
		    st.setString(2, pass);
		    
		    ResultSet rs = st.executeQuery();
		    
		    if(rs.next()){
		    	return true;
		    }
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	public static int Adminresetpass(AdminmodelMVC m, String sql) {
		int i = 0;
		
		Connection con = connect();	
		try {
			
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setString(1, m.getCurrentPass());
			ps.setString(2, m.getUsername());
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	return i;
	}


	private static Connection connect() {
Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			  con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/kodsonvms","root","root");
			System.out.println("Connected");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
}
