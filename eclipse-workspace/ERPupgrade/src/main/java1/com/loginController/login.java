package com.loginController;

import java.io.IOException;
 


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.loginBean.loginBean;
import com.loginDao.loginDao;
 
@WebServlet("/login")

public class login extends HttpServlet {
private static final long serialVersionUID = 1L;
 
public login() {
}
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
    String userName = request.getParameter("username");
    String password_= request.getParameter("password");
 
    loginBean loginBean = new loginBean();
 
    loginBean.setUserName(userName);
    loginBean.setPassword(password_);
 
    loginDao loginDao = new loginDao();
 
    try
    {
        String userValidate = loginDao.authenticateUser(loginBean);
 
        if(userValidate.equals("Operations Manager"))
        {
           
 
            HttpSession session = request.getSession(); //Creating a session
            session.setAttribute("operations", userName); //setting session attribute
            session.setAttribute("password_", password_);
            request.setAttribute("userName", userName);
            request.setAttribute("password_", password_);
 
            response.sendRedirect("driverManager.jsp");
            
            
        }
        else if(userValidate.equals("Admin/HR"))
        {
           
 
            HttpSession session = request.getSession();
            session.setAttribute("admin", userName);
            session.setAttribute("password_", password_);
            request.setAttribute("userName", userName);
            request.setAttribute("password_", password_);
 
            response.sendRedirect("DashBoard.jsp");
        }
        else if(userValidate.equals("Maintenance Manager"))
        {
           
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("password_", password_);
            session.setAttribute("maintenance", userName);
            request.setAttribute("userName", userName);
            request.setAttribute("password_", password_);
 
            response.sendRedirect("Sta_ob.jsp");
        }
        
        else if(userValidate.equals("Journey Planner"))
        {
          
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("password_", password_);
            session.setAttribute("Jplanner", userName);
            request.setAttribute("userName", userName);
            request.setAttribute("password_", password_);
 
            response.sendRedirect("journey.jsp");
        }
        
        else if(userValidate.equals("Procurement"))
        {
            
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("password_", password_);
            session.setAttribute("Procurement", userName);
            request.setAttribute("userName", userName);
            request.setAttribute("password_", password_);
 
            response.sendRedirect("dash_board.jsp");
        }
        
        else if(userValidate.equals("Trip Entry Clerk"))
        {
            
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("password_", password_);
            session.setAttribute("Trip", userName);
            request.setAttribute("userName", userName);
            request.setAttribute("password_", password_);
 
            response.sendRedirect("trips.jsp");
        }
        
        else if(userValidate.equals("General Manager"))
        {
            
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("manager", userName);
            request.setAttribute("userName", userName);
            session.setAttribute("password_", password_);
            request.setAttribute("password_", password_);
 
            response.sendRedirect("gmHome.jsp");
        }
        
        else if(userValidate.equals("Finance Manager"))
        {
            
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("finance", userName);
            session.setAttribute("password_", password_);
            request.setAttribute("userName", userName);
            request.setAttribute("password_", password_);
 
            response.sendRedirect("journey.jsp");
        }
        
        else
        {
            request.setAttribute("errMessage", userValidate);
            
            response.sendRedirect("loginError.jsp");
        }
    }
    catch (IOException e1)
    {
        e1.printStackTrace();
    }
    catch (Exception e2)
    {
        e2.printStackTrace();
    }
} //End of doPost()
}
