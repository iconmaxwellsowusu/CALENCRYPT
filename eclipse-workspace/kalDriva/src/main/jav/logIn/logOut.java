package logIn;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

/**
 * Servlet implementation class logOut
 */
//@WebServlet("/logOut")
@WebServlet(name = "logOut", value = "/logOut")
public class logOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("logging out...... in servlet");
		
		HttpSession session = request.getSession(false);
		  if(session!=null) 
	        {
	            session.invalidate(); 
	            request.setAttribute("errMessage", "You have logged out successfully");
	            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
	            requestDispatcher.forward(request, response);
	            
	        }
		
	}



}
