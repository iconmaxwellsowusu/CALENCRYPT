package sendMail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import java.net.URI;
import java.util.Arrays;

/**
 * Servlet implementation class sms
 */


public class sms extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public sms() {
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println(" hello please seen it ................ ");
		
	    final String to = request.getParameter("mail");
	    final String messg = request.getParameter("mess");
	    

final String ACCOUNT_SID = "AC3afcbdaf9526bac4bf35235b8477bb84"; //Find your Account Sid and Auth Token at https://www.twilio.com/console
final String AUTH_TOKEN = "5318b897b402cb18216826af351c85b2";

String messageBody = messg;
//String to = jTextFieldTo.getText().toString();
String sendList[] = to.split(",");

Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

//for(int i=0; i<to.length; i++)
for(String to1 : sendList)
{
Message message = Message.creator(
    new com.twilio.type.PhoneNumber(to1),                //Recipient(s)
    new com.twilio.type.PhoneNumber("+12182768809"),    //Sender Phone No. - Find your Twilio phone number at https://www.twilio.com/console
    messageBody)
//.setMediaUrl(										//MMS, Comment out this and the next line if you don't want to attach picture to your message.
   // Arrays.asList(URI.create("http://oracleprofessor.com/LO.jpg")))	//MMS
.create();
System.out.println(message.getSid());

}
	    
	    
		
		
	}

}
