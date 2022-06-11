package logIn;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import loginDao.loginDao;

/**
 * Servlet implementation class logIn
 */
@WebServlet("/logIn")
public class logIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logIn() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("union");
		String branch = request.getParameter("branch");
		String pass = request.getParameter("pass");
		
		loginDao dao = new loginDao();
		HttpSession session = request.getSession(false);
		if(dao.check(name,branch, pass)) {
			
			if(name.equals("admin") && pass.equals(pass)) {
			
			session.setAttribute("name",name);
			session.setAttribute("branch",branch);
			session.setAttribute("pass",pass);
			response.sendRedirect("adminDashboard.jsp");
			
			
			}else if(name.equals(name)&& branch.equals("Union")&& pass.equals(pass)){
				session.setAttribute("name",name);
				session.setAttribute("branch",branch);
				session.setAttribute("pass",pass);
				response.sendRedirect("unionDashboard.jsp");
			}else if(name.equals(name)&&branch.contains("Branch") && pass.equals(pass)) {
				
				session.setAttribute("name",name);
				session.setAttribute("branch",branch);
				session.setAttribute("pass",pass);
				response.sendRedirect("BranchDashboard.jsp");
				
			}
		}
		
		else {
			response.sendRedirect("index.jsp");
		}
	}

}
