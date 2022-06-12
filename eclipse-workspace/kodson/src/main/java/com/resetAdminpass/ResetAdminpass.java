package com.resetAdminpass;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.AdminloginDao.adminLoginDao;
import com.Adminmodel.AdminmodelMVC;


/**
 * Servlet implementation class ResetAdminpass
 */
@WebServlet("/ResetAdminpass")
public class ResetAdminpass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetAdminpass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username_=request.getParameter("username_");
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass_");
		String Repeatpass=request.getParameter("Repeatpass");
		
		HttpSession session = request.getSession();
		
		String currentpass = (String)session.getAttribute("password_");
		String uname = (String)session.getAttribute("userName");
		
		
		
        if(username_.equals(null)||username_==""|| oldpass.equals(null)||oldpass==""|| newpass.equals(null)||newpass=="" || Repeatpass.equals(null)||Repeatpass==""){
			
			request.setAttribute("msg", "all fields are required");
			getServletContext().getRequestDispatcher("/driverManager.jsp").forward(request, response);	
		}
        
        else if(!newpass.equals(Repeatpass)){
			request.setAttribute("msg", "password does not match");
			getServletContext().getRequestDispatcher("/driverManager.jsp").forward(request, response);	
		}
        
        else if(!currentpass.equals(oldpass)){
        	getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);	
        }
        
        else {
        	
        	AdminmodelMVC m = new AdminmodelMVC();
        	m.setUsername(username_);
        	m.setCurrentPass(Repeatpass);
        	
        	String sql ="update userrole set password_=? where userName=?";
        	int i = adminLoginDao.Adminresetpass(m, sql);
        	
        	if(i!=0){
            	
        		System.out.println("password updated");
        		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        	
        	else{
        		System.out.println("try again ");
        	}
        } 
	}

}
