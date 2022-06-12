<%@ page import="java.io.*"%>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URLEncoder" %>

<%

//Your username key
String username = "&username=" + "bntechnology";
String password = "&password=" + "BN41104012";
String message = "&message=" + "This Message Was Sent From Java Hellio Server By Maxwell";
String senderId = "&senderId=" + "BN-TECH";
String msisdn = "&msisdn=" + "0245045970";

//Prepare Url
URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;

//Base Endpoint

String baseUrl="https://api.helliomessaging.com/v1/sms?";

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
    out.println(response1);

    //finally close connection
    reader.close();
}
catch (IOException e)
{
        e.printStackTrace();
}
  
%>

<h2>Sending Mail in JSP...............</h2>
