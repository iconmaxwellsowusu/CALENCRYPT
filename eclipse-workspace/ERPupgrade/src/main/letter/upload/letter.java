package upload;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONObject;
import org.json.simple.JSONArray;

@WebServlet(name = "letter", urlPatterns = {"/letter"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb



public class letter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Calendar cal = Calendar.getInstance();
	Calendar cal1 = Calendar.getInstance();
	//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
	
	String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"/"+new SimpleDateFormat("MMM").format(cal1.getTime())+"/"+new SimpleDateFormat("yyyy").format(cal1.getTime());
	String m5 =new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
    
PrintWriter out;
    public letter() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		      
		        response.setContentType("text/html;charset=UTF-8");
		        out = response.getWriter();
		        int result = 0;
		        String sql = "insert into invoices(invoice,branch,month,date) values(?,?,?,?)";
		        Part part = request.getPart("file");
		        Part file = request.getPart("file");
		       // String pdf = request.getParameter("pdf");
		        String name = request.getParameter("Name");
		        String number = request.getParameter("Number11");
		        String company = request.getParameter("company");
		        String department = request.getParameter("department");
		        String position = request.getParameter("position");
		        String desc = request.getParameter("desc");
		        
		        System.out.println(m4);
		        
		        JSONArray list = new JSONArray();
		 
		        if(file != null) {
		        	sql = "insert into empFile(letter,Ldate,empName,phone,company,department,position,description) values(?,?,?,?,?,?,?,?)";
		        	part = file;
		        }
		       // HttpSession session = request.getSession(false);
		        
		        String date = m4;
		       
		       // String branch = branch;
		        if (part != null) {
		            try {
		            	Connection con;
		            	Class.forName("com.mysql.jdbc.Driver");
		            	con=DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");
		                PreparedStatement ps = con.prepareStatement(sql);
		                InputStream is = part.getInputStream();
		                ps.setBlob(1, is);
		                ps.setString(2, date);
		                ps.setString(3, name);
		                ps.setString(4, number);
		                ps.setString(5, company);
		                ps.setString(6, department);
		                ps.setString(7, position);
		                ps.setString(8, desc);
		                
		                
		                result = ps.executeUpdate();
		                is.close();
		                con.close();
		                JSONObject obj = new JSONObject();
		                obj.put("name", name);
		                list.add(obj);
		            

		            out.print(list.toJSONString());
		            out.flush();
		            } catch (Exception e) {
		                out.println(e);
		            }
		        }
		        
		    }
		
	}


