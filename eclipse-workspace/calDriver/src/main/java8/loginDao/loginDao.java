package loginDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDao {
	String query = "select * from login where unions=? and branch=? and password=?";
	String url ="jdbc:mysql://localhost/caldriva";
	String userName ="root";
	String pass="root";
	
	public boolean check(String unions,String branch,String password) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url,userName,pass);
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, unions);
			st.setString(2, branch);
			st.setString(3, password);
			
			ResultSet rs = st.executeQuery(); 
			if(rs.next()) {
				
				return true;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

}
