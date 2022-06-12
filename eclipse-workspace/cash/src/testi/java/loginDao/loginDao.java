package loginDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDao {
	String query = "select * from login where manager=? and branch=? and password=?";
	String url ="jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	String userName ="kodson_iconmaxwells";
	String pass="0040105715@Icon";
	
	public boolean check(String manager,String branch,String password) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url,userName,pass);
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, manager);
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
