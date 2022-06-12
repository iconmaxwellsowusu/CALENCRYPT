package cashOil;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadFileFromDb")
public class DownloadFileFromDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFileFromDb() {
        super();
        // TODO Auto-generated constructor stub
    }

	


		
		
		 private static final int BUFFER_SIZE = 10096;   
	     
		    // database connection settings
		   
		     
		    protected void doGet(HttpServletRequest request,
		            HttpServletResponse response) throws ServletException, IOException {
		        // get upload id from URL's parameters
		        int uploadId = Integer.parseInt(request.getParameter("id"));
		        System.out.println("this the ID "+uploadId);
		         
		        Connection conn = null; // connection to the database
		         
		        try {
		            // connects to the database
		            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		            conn = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
		 
		            // queries the database
		            String sql = "SELECT * FROM invoices WHERE ID = ?";
		            PreparedStatement statement = conn.prepareStatement(sql);
		            statement.setInt(1, uploadId);
		 
		            ResultSet result = statement.executeQuery();
		            if (result.next()) {
		                // gets file name and file blob data
		                String fileName = "invoice";
		               
		                Blob blob = result.getBlob("invoice");
		                InputStream inputStream = blob.getBinaryStream();
		                int fileLength = inputStream.available();
		                 
		                System.out.println("fileLength = " + fileLength);
		 
		                ServletContext context = getServletContext();
		 
		                // sets MIME type for the file download
		                String mimeType = context.getMimeType(fileName);
		                if (mimeType == null) {        
		                    mimeType = "application/octet-stream";
		                }              
		                 
		                // set content properties and header attributes for the response
		                response.setContentType(mimeType);
		                response.setContentLength(fileLength);
		                response.setContentType("invoice/png");
		                response.setHeader("Content-Disposition","Inline; filename=\"invoice.png\"");
		 
		                // writes the file to the client
		                OutputStream outStream = response.getOutputStream();
		                 
		                byte[] buffer = new byte[BUFFER_SIZE];
		                int bytesRead = -1;
		                 
		                while ((bytesRead = inputStream.read(buffer)) != -1) {
		                    outStream.write(buffer, 0, bytesRead);
		                }
		                 
		                inputStream.close();
		                outStream.close();             
		            } else {
		                // no file found
		                response.getWriter().print("File not found for the id: " + uploadId);  
		            }
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		            response.getWriter().print("SQL Error: " + ex.getMessage());
		        } catch (IOException ex) {
		            ex.printStackTrace();
		            response.getWriter().print("IO Error: " + ex.getMessage());
		        } finally {
		            if (conn != null) {
		                // closes the database connection
		                try {
		                    conn.close();
		                } catch (SQLException ex) {
		                    ex.printStackTrace();
		                }
		            }          
		        }

		}
		
	}

	


