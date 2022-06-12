package cashOil;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;

/**
 * Servlet implementation class qr
 */
@WebServlet("/qr")
public class qr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String qrContent= request.getParameter("testQr");
		
		
		
		  ByteArrayOutputStream out = QRCode.from(qrContent).to(ImageType.PNG).withSize(300, 300).stream();
		          
		        response.setContentType("image/png");
		        response.setContentLength(out.size());
		          
		        OutputStream os = response.getOutputStream();
		        os.write(out.toByteArray());
		         
		        os.flush();
		        os.close();
		         
		
	}

	

}
