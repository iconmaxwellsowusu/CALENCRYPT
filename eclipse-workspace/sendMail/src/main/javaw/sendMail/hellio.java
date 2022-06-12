package sendMail;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hellio")
public class hellio extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public hellio() {
        super();
        // TODO Auto-generated constructor stub
    }

	//bntechnology
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String baseUrl="https://api.helliomessaging.com/v1/sms?";
		 final String phone = request.getParameter("mail");
		 final String messg = request.getParameter("mess");
		
		 
		//Your username key
		 String username = "&username=" + "bntechnology";// it was copied from the page
		 String password = "&password=" + "BN41104012";
		 String message = "&message=" + messg;// data coming from jsp to test API
		 String senderId = "&senderId=" + "BN-TECH";
		 String msisdn = "&msisdn=" + phone; //also coming from jsp
		 
		 
		 //Prepare Url
		 URLConnection myURLConnection=null;
		 URL myURL=null;
		 BufferedReader reader=null;
		 
		 //Base Endpoint

		//Prepare parameter string
		 StringBuilder sbPostData= new StringBuilder(baseUrl);
		 sbPostData.append("&username="+username);
		 sbPostData.append("&password="+password);
		 sbPostData.append("&senderId="+senderId);
		 sbPostData.append("&msisdn="+msisdn);
		 sbPostData.append("&message="+message);
		 
		//final string
		 baseUrl = sbPostData.toString();
		 
		 try
		 {
		     //prepare connection
		     myURL = new URL(baseUrl);
		     myURLConnection = myURL.openConnection();
		     myURLConnection.connect();
		     reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
		     
	            //reading response
	            String response1;
	            while ((response1 = reader.readLine()) != null)
	            //print response
	            System.out.println(response1);

	            //finally close connection
	            reader.close();
		     
		 }
		 catch (IOException e)
		 {
		         e.printStackTrace();
		 }
		 
	}

}
