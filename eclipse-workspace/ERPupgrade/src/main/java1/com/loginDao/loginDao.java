package com.loginDao;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import com.loginBean.loginBean;
import com.loginUtil.DbConnection;
 
public class loginDao {
 
public String authenticateUser(loginBean loginBean)
{
    String userName = loginBean.getUserName();
    String password = loginBean.getPassword();
    
 
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
 
    String userNameDB = "";
    String passwordDB = "";
    String roleDB = "";
 
    try
    {
        con = DbConnection.createConnection();
        statement = con.createStatement();
        resultSet = statement.executeQuery("select userName,password_ ,role from userrole");
 
        while(resultSet.next())
        {
        	
            userNameDB = resultSet.getString("userName");
            
            passwordDB = resultSet.getString("password_");
            
            roleDB = resultSet.getString("role");
 
            if(userName.equals(userNameDB)&& password.equals(passwordDB) && roleDB.equals("Operations Manager")) 
            return("Operations Manager");
            
            else if(userName.equals(userNameDB) && password.equals(passwordDB)&& roleDB.equals("Admin/HR"))
            return ("Admin/HR");
            
            else if(userName.equals(userNameDB) && password.equals(passwordDB)&& roleDB.equals("Maintenance Manager"))
            return ("Maintenance Manager");
            
            else if(userName.equals(userNameDB) && password.equals(passwordDB)&& roleDB.equals("Journey Planner"))
            return ("Journey Planner");
            
            else if(userName.equals(userNameDB) && password.equals(passwordDB)&& roleDB.equals("Procurement"))
                return ("Procurement");
            
            else if(userName.equals(userNameDB) && password.equals(passwordDB)&& roleDB.equals("Trip Entry Clerk"))
                return ("Trip Entry Clerk");
            
            else if(userName.equals(userNameDB) && password.equals(passwordDB)&& roleDB.equals("General Manager"))
                return ("General Manager");
            
            else if(userName.equals(userNameDB) && password.equals(passwordDB)&& roleDB.equals("Finance Manager"))
                return ("Finance Manager");
        }
    }
    catch(SQLException e)
    {
        e.printStackTrace();
    }
    return "Invalid user credentials";
}
}