package cashOil;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


 import java.util.Date;
 import java.time.Month;
 import java.time.LocalDate;
 import  java.util.Calendar;
 import java.text.SimpleDateFormat;
 import java.text.*;



@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImage extends HttpServlet {

	 Calendar cal = Calendar.getInstance();
		Calendar cal1 = Calendar.getInstance();
		//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
		
		String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
		String m5 =new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
	
    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        Part part = request.getPart("file");
        String date = m4;
        String month = m5;
        String branch = "test branch";
        if (part != null) {
            try {
            	Connection con;
            	Class.forName("com.mysql.jdbc.Driver");
            	con=DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
                PreparedStatement ps = con.prepareStatement("insert into invoices(invoice,branch,month,date) values(?,?,?,?)");
                InputStream is = part.getInputStream();
                ps.setBlob(1, is);
                ps.setString(2, branch);
                ps.setString(3, month);
                ps.setString(4, date);
                result = ps.executeUpdate();
                is.close();
                con.close();
               
                if (result > 0) {
                    response.sendRedirect("OpenStock.jsp");
                } else {
                    response.sendRedirect("index.jsp?message=Some+Error+Occurred");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

}
