
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>
 <%

 Calendar cal = Calendar.getInstance();
	Calendar cal1 = Calendar.getInstance();
	//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
	
	String m4 =new SimpleDateFormat("MMMM").format(cal1.getTime())+"/"+new SimpleDateFormat("yyyy").format(cal1.getTime());
	String m5 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal1.getTime());
    
//	System.out.println(m5);

 %>


<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
	Statement statement = connection.createStatement();
	String xVal, yVal;
	
	ResultSet resultSet = statement.executeQuery("select * from datapoints");
	
	while(resultSet.next()){
		xVal = resultSet.getString("x");
		yVal = resultSet.getString("y");
		map = new HashMap<Object,Object>(); map.put("x", Double.parseDouble(xVal)); map.put("y", Double.parseDouble(yVal)); list.add(map);
		dataPoints = gsonObj.toJson(list);
	}
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}
if(request.getParameter("update" )!= null){
	try{
		
	String name=request.getParameter("ltr");
	
	String id=(String)session.getAttribute("id");
	System.out.println("the name is "+ name);
	PreparedStatement pst;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
	pst=con.prepareStatement("update login set manager=? where ID=?");
	pst.setString(1, name);
	pst.setString(2, id);
	pst.executeUpdate();
	}catch(Exception e){}
}
%>


<%
Gson gsonObj2 = new Gson();

		
List<Object> list5 = new ArrayList<Object>();		
List<Object> list6 = new ArrayList<Object>();
			
String dataPoints5 = null;
String dataPoints6 = null;
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
	Statement statement = connection.createStatement();
	String xVal1, yVal1;
	
	ResultSet resultSet1 = statement.executeQuery("SELECT branch,closingStockvalue FROM closingstock WHERE id IN (SELECT MAX(id) AS id FROM closingstock where product in('PMS') GROUP BY branch)");
	
	while(resultSet1.next()){
		xVal1 = resultSet1.getString(1);
		yVal1 = resultSet1.getString(2);
		 list5.add(xVal1);
		 list6.add(yVal1);
		dataPoints5 = gsonObj.toJson(list5);
		dataPoints6 = gsonObj.toJson(list6);
		
	}
	
	//System.out.println(dataPoints5);

	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}
%>


<%
Gson gsonObj22 = new Gson();

		
List<Object> list55 = new ArrayList<Object>();		
List<Object> list66 = new ArrayList<Object>();
			
String dataPoints55 = null;
String dataPoints66 = null;
 
	try{	
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
	Statement statement1 = connection1.createStatement();
	String xVal1x, yVal1y;
	
	ResultSet resultSet2 = statement1.executeQuery("SELECT branch,closingStockvalue FROM closingstock WHERE id IN (SELECT MAX(id) AS id FROM closingstock where product in('AGO') GROUP BY branch)");
	
	while(resultSet2.next()){
		xVal1x = resultSet2.getString(1);
		yVal1y = resultSet2.getString(2);
		 list55.add(xVal1x);
		 list66.add(yVal1y);
		dataPoints55 = gsonObj22.toJson(list55);
		dataPoints66 = gsonObj22.toJson(list66);
		
	}
	
	

	connection1.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cash Oil </title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
      <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
      <meta name="author" content="codedthemes" />
      <!-- Favicon icon -->
      <link href="assets/images/cash.jpg" rel="icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
      <!-- waves.css -->
      <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- themify icon -->
      <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
      <!-- scrollbar.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
        <!-- am chart export.css -->
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">
      
          <!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
      
      
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      
           <!-- /////////////////////        Data Table css /////////////////////    -->  
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css"/>
      
      <script type="text/javascript">
window.onload = function() { 
 
<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "MONTHLY SALES FROM DATA BASE"
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
<% } %> 
 
}
</script>
      
      
  </head>

  <body>
  
  	  <%
  	try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
	Statement statement = connection.createStatement();
	String b=null;
	String p=null;
	ResultSet resultSet = statement.executeQuery("select * from login where branch='main Branch'");
	
	if(resultSet.next()){
		b=resultSet.getString("branch");
		p=resultSet.getString("password");
	}
	
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
  	    String branch = (String)session.getAttribute("branch");
  	    String pass = (String)session.getAttribute("pass");
         
        if(!pass.equals(p) || !branch.equals(b) || pass.equals(null) || pass.equals("")){
              response.sendRedirect("index.jsp");   
        }
  	}catch(Exception e){
  		 response.sendRedirect("index.jsp"); 
  	}
        %>
        
       

<% 
    
     if(request.getParameter("branch")!=null)
    {
    	
        
        String branch = request.getParameter("branch");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        pst = con.prepareStatement("insert into branch(branchName,manger)values(?,'')");
        pst.setString(1, branch+" Branch");
        pst.executeUpdate();  
         
        out.println("<script>alert('Branch Added')</script>");
    }
   %>

<% 
    
     if(request.getParameter("manager")!=null)
    {
    	
        
        String name = request.getParameter("name");
        String station = request.getParameter("station");
        String pass = request.getParameter("pass");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        pst = con.prepareStatement("insert into login(manager,branch,password)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, station);
        pst.setString(3, pass);
        pst.executeUpdate();  
         
        out.println("<script>alert('Manager Authenticated')</script>");
    }
   %>
   
   <% 
    
     if(request.getParameter("remove")!=null)
    {
    	
        
        String name = request.getParameter("name");
      
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        pst = con.prepareStatement("delete from login where manager = ?");
        pst.setString(1, name);
        pst.executeUpdate();  
         
        out.println("<script>alert('Manager Removed from the System')</script>");
    }
   %>
   
   <% 
    
     if(request.getParameter("post")!=null)
    {
    	
        
        String name = request.getParameter("mypost");
        String month = m4;
        String date = m5;
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        pst = con.prepareStatement("insert into message(post,month,date)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, month);
        pst.setString(3, date);
        pst.executeUpdate();  
         
        out.println("<script>alert('Post Shared')</script>");
    }
   %>

  <script type="text/javascript"></script>
  <!-- Pre-loader start -->
  <div class="theme-loader">
      <div class="loader-track">
          <div class="preloader-wrapper">
              <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
              <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <nav class="navbar header-navbar pcoded-header">
              <div class="navbar-wrapper">
                  <div class="navbar-logo">
                      <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="javascript:void(0)">
                          <i class="ti-menu"></i>
                      </a>
                      <div class="mobile-search waves-effect waves-light">
                          <div class="header-search">
                              <div class="main-search morphsearch-search">
                                  <div class="input-group">
                                      <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                      <input type="text" class="form-control" placeholder="Enter Keyword">
                                      <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                  </div>
                              </div>
                          </div>
                      </div>
                     
                  </div>
                
                  <div class="navbar-container container-fluid">
                      <ul class="nav-left">
                          <li>
                              <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                          </li>
                          <li class="header-search">
                              <div class="main-search morphsearch-search">
                                  <div class="input-group">
                                      <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                      <input type="text" class="form-control">
                                      <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                  </div>
                              </div>
                              
                              
                              
                          </li>
                          <li>
                              <a href="javascript:void(0)" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                  <i class="ti-fullscreen"></i>
                              </a>
                          </li>
                          
                          
                      </ul>
                      <ul class="nav-right">
                          <li class="header-notification">
                              <a href="javascript:void(0)" class="waves-effect waves-light">
                                  <i class="ti-bell"></i>
                                  <span class="badge bg-c-red"><!-- ////////  count requests ///// -->3</span>
                              </a>
                              <ul class="show-notification">
                                  <li>
                                      <h6>Requests</h6>
                                      <label class="label label-danger">New</label>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                         
                                          <div class="media-body">
                                              <h5 class="notification-user">John Doe</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          
                                          <div class="media-body">
                                              <h5 class="notification-user">Joseph William</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          
                                          <div class="media-body">
                                              <h5 class="notification-user">Sara Soudein</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                              </ul>
                          </li>
                          <li class="user-profile header-notification">
                              <a href="javascript:void(0)" class="waves-effect waves-light">
                                  <i class="fa-solid fa-user-tie" style="font-size:18px;"></i>
                                  <span style="font-size:12px;">Welcome <% String name = (String)session.getAttribute("name"); out.println(name);%></span>
                                  <i class="ti-angle-down"></i>
                              </a>
                              <ul class="show-notification profile-notification">
                                  <li class="waves-effect waves-light">
                                      <a href="javascript:void(0)">
                                          <i class="ti-settings"></i> Manage
                                      </a>
                                  </li>
                                   <li class="waves-effect waves-light">
                                      <a data-toggle="modal" data-target="#branchModal">
                                          <i class="ti-zoom-in"></i> Add Branch
                                      </a>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <a data-toggle="modal" data-target="#managerModal">
                                          <i class="ti-user"></i> Authenticate a Manager
                                      </a>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <a data-toggle="modal" data-target="#removeModal">
                                          <i class="ti-na"></i> Remove a Manager
                                      </a>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <a data-toggle="modal" data-target="#postModal">
                                          <i class="ti-announcement"></i> Make a Post
                                      </a>
                                  </li>
                                  
                                   <li class="waves-effect waves-light">
                                      <a data-toggle="modal" data-target="#resetModal">
                                          <i class="ti-reload"></i> Reset Account
                                      </a>
                                  </li>
                                  
                                  <li class="waves-effect waves-light">
                                      <a href="logOut">
                                          <i class="ti-share-alt"></i> Logout
                                      </a>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>


 <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="branchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Add Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="#" method="post">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            
                                                                            <div class="col-sm-8">
                                                                              <label>Branch Location</label>
                                                                                <input type="text" class="form-control" name="branch" required>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary" name="branch">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
													
													
													
													 <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="resetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Account Reset Form</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="resetPass" method="post">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-6">
                                                                              <label>Enter User Name</label>
                                                                                <input type="text" class="form-control" name="uName" required>
                                                                            </div>
                                                                            
                                                                          
                                                                            
                                                                              <div class="col-sm-6">
                                                                              <label>Enter Old Password</label>
                                                                                <input type="text" class="form-control" name="oldPass" required>
                                                                            </div>
                                                                            
                                                                              <div class="col-sm-6">
                                                                              <label>Enter New Password</label>
                                                                                <input type="text" class="form-control" name="newPass" required>
                                                                            </div>
                                                                            
                                                                              <div class="col-sm-6">
                                                                              <label>Repeat Password</label>
                                                                                <input type="text" class="form-control" name="repeatPass" required>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
													
													 <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="managerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Add a Manager</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="#" method="POST">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-8">
                                                                              <label>Manager's Name</label>
                                                                                <input type="text" class="form-control" name="name" required>
                                                                            </div>
                                                                            
                                                                            <div class="col-sm-8">
                                                                              <label>Select Station</label>
                                                                                
                                                                                <select class="form-control" name="station">
																				<%
																				try{
																				Class.forName("com.mysql.jdbc.Driver");
																				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
																				Statement st = con.createStatement();
																				String sql = "Select branchName from branch";
																				ResultSet rst = st.executeQuery(sql);
																				while(rst.next()){
																				%>
																				
																				<option><%=rst.getString(1) %></option>
																				<%} 
																				}catch(Exception e){
																					
																				}
																				%>
																				</select>
                                                                            </div>
                                                                            
                                                                           
                                                                            <div class="col-sm-8">
                                                                              <label>Password</label>
                                                                                <input type="text" class="form-control" name="pass" required>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary" name="manager">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
													
													 <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Remove a Manager</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="#">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-8">
                                                                            <select name="name" class="form-control">
                                                                            <%
											                  
                                                                            Connection con;
                                                                            Statement st;
                                                                            ResultSet rs;
											                  
											                    		   try{
														                    	   Class.forName("com.mysql.jdbc.Driver");
														                           con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
														                    	    st = con.createStatement();
														                    	   String query ="select manager from login";
														                    	    rs = st.executeQuery(query);
											                    	   
											                    	  		 while(rs.next()){
											                    		   
											                    		   %>

																			<option><%=rs.getString("manager") %></option>
																			<% 
											                    			   
											                    	 			  }
											                    	   
											                   			    }catch(Exception e){
											                    	   
											                       		}
                                                          			%>
                                                                        </select>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary" name="remove">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
													
													 <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Send Message to managers</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="#" method="post">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-12">
                                                                              <label>Write a post</label>
                                                                                <textarea  class="form-control" name="mypost" required></textarea>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary" name="post">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
          <nav class="pcoded-navbar">
                      <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                      <div class="pcoded-inner-navbar main-menu">
                          <div class="">
                              <div class="main-menu-header">
                                  <img class="img-80 img-radius" src="assets/images/cash.jpg" alt="User-Profile-Image">
                                  <div class="user-details">
                                      <span id="more-details">CASH OIL<i class="fa fa-caret-down"></i></span>
                                  </div>
                              </div>
        
                              <div class="main-menu-content">
                                  <ul>
                                      <li class="more-details">
                                          <a href="user-profile.html"><i class="ti-user"></i>View Profile</a>
                                          <a href=""><i class="ti-settings"></i>Settings</a>
                                          <a href="auth-normal-sign-in.html"><i class="ti-layout-sidebar-left"></i>Logout</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          <div class="p-15 p-b-0">
                              
                          </div>
                          
                          
                          
                          
                          <div class="pcoded-navigation-label" data-i18n="nav.category.navigation"></div>
                          <ul class="pcoded-item pcoded-left-item">
                              <li class="active">
                                  <a href="superAdmin.jsp" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                              <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-ruler-vertical"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Dippings</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="supply.jsp" class="waves-effect waves-dark" >
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Product Supply</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="OpenStock.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">invoices</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="pump.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Pump Readings</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="ClosingStock.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Closing Stock</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     

                
                                  </ul>
                              </li>
                          </ul>
                          <div class="pcoded-navigation-label" data-i18n="nav.category.forms"></div>
                          <ul class="pcoded-item pcoded-left-item">
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-oil-can"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Lube Bay</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="lubeStock.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Stock</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="lubeSale.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Add Sale</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="lubeBay.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                   
                
                                  </ul>
                              </li>
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-car-crash"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Washing Bay</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="washingBay.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Data</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="washingBankAnalysis.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Bank Deposit Analysis</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="washingBayIncomeAnalysis.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Income Analysis</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="washingBayReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  
                                     
                                 
                
                                  </ul>
                              </li>
        
                          </ul>
        
                          <div class="pcoded-navigation-label" data-i18n="nav.category.forms"></div>
                          <ul class="pcoded-item pcoded-left-item">
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa fa-tasks"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Credits</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="credit.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Credit</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                         <li class=" ">
                                          <a href="creditRepayment.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Credit Repayments</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                      <li class=" ">
                                          <a href="creditReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                    
                                   
                                  </ul>
                              </li>
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa  fa-sort-amount-asc"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Utility</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="utility.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Utility</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="UtilityReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                               
                                    
                
                                  </ul>
                              </li>
                                 <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-screwdriver-wrench"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Maintenance</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="maintenance.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Data</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="maintenaceReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     
                                
                
                                  </ul>
                              </li>
        
                          </ul>
        
                          <div class="pcoded-navigation-label" data-i18n="nav.category.other"></div>
                          <ul class="pcoded-item pcoded-left-item">
                                                          <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class=" fa fa-bar-chart-o"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Statutory</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="statutory.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Statutory</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="statutoryReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                   
                
                                  </ul>
                              </li>
                              
                              
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-money-bill-1"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Master Load</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="masterLoad.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Master Load Allowance</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="masterLoadReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     
                                    
                                     
                
                                  </ul>
                              </li>
                              
                              
                               <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa fa-book"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Daily Sales</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="sales.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Daily Sales</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                     
                                      <li class=" ">
                                          <a href="fall.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Win Fall/Short Fall</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="gains.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Cumulative Gain/Loss</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="Reco.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Reconciliation Of Cash Deposit</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                       <li class=" ">
                                          <a href="rChanges.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Closing Stock As at Rate Change</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                              </li>
                              
                               <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-money-check-dollar"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Payroll</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="employee.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Employee</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="payRoll.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Add Payroll</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                                      <li class=" ">
                                          <a href="payReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Payroll Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                   
                                   
                
                                  </ul>
                              </li>
                              
                                                            <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa fa-file"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Summary</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="summary.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">View Summary</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                    
                                     
                                 
                
                                  </ul>
                              </li>
                              
                               <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-dollar-sign"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Employee Allowance</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="addAllowance.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Allowance</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li class=" ">
                                          <a href="allowanceReport.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Allowance Report</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      
                
                                  </ul>
                              </li>
                              
                                <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-hand-open"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Requests</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="request.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Make Request</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                              </li>
                              
                                                            <li class="pcoded-hasmenu">
                                      <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-server"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Bank Lodgements</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="bankLogement.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">View Bank Lodgement</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>

                                  </ul>
                              </li>
                              

                          </ul>
                      </div>
                  </nav>
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                     
                      <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">
                                            <!-- task, page, download counter  start -->
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-purple">Total Stations</h4>
                                                                <h6 class="text-muted m-b-0">
                                                                <%
                                                                String pms="";
                                                                Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                                Statement st3 = con3.createStatement();
                                                                String pmsSql = "select count(branchName) from branch";// remember its monthly
                                                                ResultSet rstr = st3.executeQuery(pmsSql);
                                                                while(rstr.next()){
                                                                	pms=rstr.getString(1);
                                                                }
                                                               // out.println(pms);
                                                                %>
                                                                </h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-bar-chart f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-purple">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <h4 class="text-white m-b-0"><%out.println(pms); %></h4>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
            
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-green">Total AGO Sold So Far</h4>
                                                                <h6 class="text-muted m-b-0">
                                                                
                                                                <%
                                                                String ago="";
                                                                String pmsSql1 = "select sum(salesltr) from closingStock where product='AGO'";// remember its monthly
                                                                ResultSet rstr1 = st3.executeQuery(pmsSql1);
                                                                while(rstr1.next()){
                                                                	ago=rstr1.getString(1);
                                                                }
                                                              //  out.println(ago);
                                                                %>
                                                                
                                                                </h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-file-text-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-green">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <h4 class="text-white m-b-0"><%out.println(ago); %></h4>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-red">Total PMS Sold ltr So Far</h4>
                                                                <h6 class="text-muted m-b-0">
                                                                
                                                                 <%
                                                                String ago1="";
                                                                String pmsSql11 = "select sum(salesltr) from closingStock where product='PMS'";// remember its monthly
                                                                ResultSet rstr11 = st3.executeQuery(pmsSql11);
                                                                while(rstr11.next()){
                                                                	ago1=rstr11.getString(1);
                                                                }
                                                              //  out.println(ago);
                                                                %>
                                                                
                                                                </h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-calendar-check-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <h4 class="text-white m-b-0"><%out.println(ago1); %></h4>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-blue">Total Cash From AGO Sold</h4>
                                                                <h6 class="text-muted m-b-0">
                                                                
                                                                 <%
                                                                String ago11="";
                                                                String pmsSql111 = "select sum(cashSale) from closingStock where product='AGO'";// remember its monthly
                                                                ResultSet rstr111 = st3.executeQuery(pmsSql11);
                                                                while(rstr111.next()){
                                                                	ago11=rstr111.getString(1);
                                                                }
                                                              //  out.println(ago);
                                                                %>
                                                                
                                                                </h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-blue">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <h4 class="text-white m-b-0"><%out.println(ago11); %></h4>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                                 
                                            
                                             <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-purple">Total Cash From PMS sold So Far</h4>
                                                                <h6 class="text-muted m-b-0">
                                                                
                                                                 <%
                                                                String ago2="";
                                                                String pmsSql2 = "select sum(cashSale) from closingStock where product='AGO'";// remember its monthly
                                                                ResultSet rstr2 = st3.executeQuery(pmsSql2);
                                                                while(rstr2.next()){
                                                                	ago2=rstr2.getString(1);
                                                                }
                                                              //  out.println(ago);
                                                                %>
                                                                
                                                                </h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-bar-chart f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-purple">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <h4 class="text-white m-b-0"><%out.println(ago2); %></h4>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
            
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-green">Total Employees</h4>
                                                                <h6 class="text-muted m-b-0">
                                                                
                                                                 <%
                                                                String ago3="";
                                                                String pmsSql3 = "select count(name) from employee";// remember its monthly
                                                                ResultSet rstr3 = st3.executeQuery(pmsSql3);
                                                                while(rstr3.next()){
                                                                	ago3=rstr3.getString(1);
                                                                }
                                                              //  out.println(ago);
                                                                %>
                                                                
                                                                </h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-file-text-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-green">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <h4 class="text-white m-b-0"><%out.println(ago3); %></h4>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-red">Total Maintenance Expenses</h4>
                                                                <h6 class="text-muted m-b-0">
                                                                
                                                                <%
                                                                String ago4="";
                                                                String pmsSql4 = "select sum(amount) from statiomaitenance";// remember its monthly
                                                                ResultSet rstr4 = st3.executeQuery(pmsSql4);
                                                                while(rstr4.next()){
                                                                	ago4=rstr4.getString(1);
                                                                }
                                                              //  out.println(ago);
                                                                %>
                                                                
                                                                </h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-calendar-check-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <h4 class="text-white m-b-0"><%out.println(ago4); %></h4>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-blue">Total Utility Expenses</h4>
                                                                <h6 class="text-muted m-b-0">
                                                                
                                                                <%
                                                                String ago5="";
                                                                String pmsSql5 = "select sum(amount) from statiomaitenance";// remember its monthly
                                                                ResultSet rstr5 = st3.executeQuery(pmsSql5);
                                                                while(rstr5.next()){
                                                                	ago5=rstr5.getString(1);
                                                                }
                                                              //  out.println(ago);
                                                                %>
                                                                
                                                                </h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-blue">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <h4 class="text-white m-b-0"><%out.println(ago5); %></h4>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- task, page, download counter  end -->
    
                                            <!--  sale analytics start -->
                                            <div class="col-xl-12 col-md-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h3>Yearly Sales Analysis For Various Fuel Stations</h3>
                                                        
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                    <%

// underground tanks
Gson gsonObj4 = new Gson();

		
List<Object> lists5 = new ArrayList<Object>();		
List<Object> lists6 = new ArrayList<Object>();
			
List<Object> list7 = new ArrayList<Object>();		
List<Object> list8 = new ArrayList<Object>();
List<Object> list9 = new ArrayList<Object>();
			
List<Object> list10 = new ArrayList<Object>();
List<Object> list11 = new ArrayList<Object>();
			
List<Object> list12 = new ArrayList<Object>();
List<Object> list13 = new ArrayList<Object>();
List<Object> list14 = new ArrayList<Object>();
List<Object> list15 = new ArrayList<Object>();
			
String dataPoint5 = null;
String dataPoint6 = null;
String dataPoints7 = null;
String dataPoints8 = null;
 
String dataPoints9 = null;
String dataPoints10 = null;
			
String dataPoints11 = null;
String dataPoints12 = null;

String dataPoints13 = null;
String dataPoints14 = null;
String dataPoints15 = null;
String dataPoints16 = null;
String dataPoints17 = null;
			
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
	Statement statement = connection.createStatement();
	Statement statement1 = connection.createStatement();
	Statement statement2 = connection.createStatement();
	Statement statement3 = connection.createStatement();
	String xVal1, yVal1;
	String xVal2, yVal2;
	String xVal3, yVal4,yVal8,yVal6,yVal7,yVal9;
			
	String xVal5, yVal5;
	String xVal6;
	
	
	ResultSet resultSet3 = statement3.executeQuery("select distinct o.month,SUM(o.cashSale) OVER(PARTITION BY o.month) as cost from closingstock o where branch='Kpone Branch'");// kpone
	while(resultSet3.next()){
		xVal3 = resultSet3.getString(2);
		yVal5 = resultSet3.getString(1);
		 list10.add(xVal3);
		 list12.add(yVal5);
		
		dataPoints9 = gsonObj.toJson(list10);
		dataPoints12 = gsonObj.toJson(list12);
		//System.out.println("dataPoints9 is "+dataPoints9);
	}
	
	ResultSet resultSet4 = statement2.executeQuery("select distinct o.month,SUM(o.cashSale) OVER(PARTITION BY o.month) as cost from closingstock o where branch='Comm 11 Branch'");// com 11
	while(resultSet4.next()){
		
		yVal4 = resultSet4.getString(2);
		
		list15.add(yVal4);
		
		dataPoints10 = gsonObj.toJson(list15);
		//System.out.println("dataPoints10 is "+dataPoints10);
	}
	
	ResultSet resultSet5 = statement2.executeQuery("select distinct o.month,SUM(o.cashSale) OVER(PARTITION BY o.month) as cost from closingstock o where branch='Pokuase Branch'");// pokuase
	while(resultSet5.next()){
		
		yVal8 = resultSet5.getString(2);
		
		list14.add(yVal8);
		
		dataPoints13 = gsonObj.toJson(list14);
		
	//	System.out.println("dataPoints13 is "+dataPoints13);
	}
	
	ResultSet resultSet6 = statement2.executeQuery("select distinct o.month,SUM(o.cashSale) OVER(PARTITION BY o.month) as cost from closingstock o where branch='Hwakpo Branch'"); // hwakpo
	while(resultSet6.next()){
		
		yVal6 = resultSet6.getString(2);
		
		 list7.add(yVal6);
		
		dataPoints14 = gsonObj.toJson(list7);
		//System.out.println("dataPoints14 is "+dataPoints14);
	}
	
	ResultSet resultSet7 = statement2.executeQuery("select distinct o.month,SUM(o.cashSale) OVER(PARTITION BY o.month) as cost from closingstock o where branch='Malejor Branch'"); //malejor
	while(resultSet7.next()){
		
		yVal9 = resultSet7.getString(2);
		
		 list8.add(yVal9);
		
		dataPoints15 = gsonObj.toJson(list8);
		
		//System.out.println("dataPoints15 is "+dataPoints15);
	}



%>
                                                    
                                                    
                                                    <div class="card-block">
                                                        
                                                        	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
													              
													 <canvas id="line-chart" width="600" height="150"></canvas>             
													<script>
													new Chart(document.getElementById("line-chart"), {
														  type: 'line',
														  data: {
														    labels: <%out.println(dataPoints12);%>,
														    datasets: [{ 
														        data: <%out.println(dataPoints10);%>,
														        label: "Com 11",
														        borderColor: "red",
														        fill: false
														      }, 
														      { 
														        data: <%out.println(dataPoints9);%>,
														        label: "Kpone",
														        borderColor: "blue",
														        fill: false
														      },
														      { 
															        data: <%out.println(dataPoints13);%>,
															        label: "Pokuase",
															        borderColor: "green",
															        fill: false
															      },
															      { 
																        data: <%out.println(dataPoints15);%>,
																        label: "Malejor",
																        borderColor: "orange",
																        fill: false
																      },
																      { 
																	        data: <%out.println(dataPoints14);%>,
																	        label: "Hwakpo",
																	        borderColor: "OrangeRed",
																	        fill: false
																	      }
														    ]
														  },
														  options: {
														    title: {
														      display: true,
														      text: 'World population per region (in millions)'
														    }
														  }
														});
													
													</script>
                                                        
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            
                                          
                                            
                                            <!--  sale analytics end -->
    
                                            <!--  project and team member start -->
                                            <div class="col-xl-6 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h3>PMS Underground Products For Various Stations</h3>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    
                                                                 <script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
              
                                                                  <canvas id="myChart" width="400" height="150"></canvas>
                
             
                
													<script>
													const ctx = document.getElementById('myChart').getContext('2d');
													const myChart = new Chart(ctx, {
													    type: 'bar',
													    data: {
													        labels:<%out.println(dataPoints5);%>,
													        datasets: [{
													           
													            data:<%out.println(dataPoints6);%>,
													            backgroundColor: [
													                '#FF4500',
													                '#FFD700',
													                '#9ACD32',
													                '#800000',
													                '#DAA520',
													                '#191970',
													                '#00BFFF',
													               
													            ],
													            borderColor: [
													                '#CFFB50',
													                '#FFE978',
													                
													            ],
													            borderWidth: 1
													            
													            
													        }]
													    },
													    options: {
													        scales: {
													            y: {
													                beginAtZero: true
													            }
													        }
													    }
													});
													</script>
                                                </div>
                                            </div>
                                            
                                            
                                                                                        <!--  project and team member start -->
                                            <div class="col-xl-6 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h3>AGO Underground Products For Various Stations</h3>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    
                                                                 <script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
              
                                                                  <canvas id="myChart1" width="400" height="150"></canvas>
                
             
                
													<script>
													const ctx1 = document.getElementById('myChart1').getContext('2d');
													const myChart1 = new Chart(ctx1, {
													    type: 'bar',
													    data: {
													        labels:<%out.println(dataPoints55);%>,
													        datasets: [{
													           
													            data:<%out.println(dataPoints66);%>,
													            backgroundColor: [
													                '#FF4500',
													                '#FFD700',
													                '#9ACD32',
													                '#800000',
													                '#DAA520',
													                '#191970',
													                '#00BFFF',
													               
													            ],
													            borderColor: [
													                '#CFFB50',
													                '#FFE978',
													                
													            ],
													            borderWidth: 1
													            
													            
													        }]
													    },
													    options: {
													        scales: {
													            y: {
													                beginAtZero: true
													            }
													        }
													    }
													});
													</script>
                                                </div>
                                            </div>
                                            
                                            
                                            
                                            <div class="col-xl-4 col-md-12">
                                                
                                                <div class="card quater-card">
                                                 <h4>Total Utility Expenses For Various Stations</h4>
                                                    <%
                                                List<Object> utype = new ArrayList<Object>();
                                                List<Object> amount = new ArrayList<Object>();
                                                String ut = null;
                                                String am = null;
                                                
                                                String query112 = "select distinct o.branch,SUM(o.amount) OVER(PARTITION BY o.branch) as cost from utility o";
                                                
                                                Statement state = connection.createStatement();
                                                ResultSet rstt = state.executeQuery(query112);
                                                String yVal;
                                            	String  xVal;
                                            	// this code tobe used in production -- -- select distinct o.month, o.Date,SUM(o.cashSale) OVER(PARTITION BY o.Date) as cost from closingstock o where o.month = CONCAT(MONTHNAME(now()),'/',year(o.date))
                                            	ResultSet resultSet = statement.executeQuery("select distinct o.month, o.Date,SUM(o.cashSale) OVER(PARTITION BY o.Date) as cost from closingstock o");
                                            	
                                            	while(rstt.next()){
                                            		xVal = rstt.getString(1);
                                            		yVal = rstt.getString(2);
                                            		
                                            		utype.add(xVal);
                                            		amount.add(yVal);
                                            		ut = gsonObj.toJson(utype);
                                            		am = gsonObj.toJson(amount);
                                            		
                                            	}
                                            	//System.out.println(dataPoints);
                                            	
                                                %>
                                                 
                                                  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
              
														<canvas id="doughnut-chart" width="400" height="150"></canvas>
														<script type="text/javascript">
														new Chart(document.getElementById("doughnut-chart"), {
														    type: 'doughnut',
														    data: {
														      labels: <%out.println(ut);%>,
														      datasets: [
														        {
														          label: "Population (millions)",
														          backgroundColor: [
														              'rgb(255, 99, 132)',
														              'rgb(54, 162, 235)',
														              'rgb(255, 205, 86)',
														              'rgb(54, 162, 235)'
														            ],
														            
														          data: <%out.println(am);%>
														        }
														      ]
														    },
														    options: {
														      title: {
														        display: true,
														        text: 'Monthly Utitlity Expenses'
														      }
														    }
														});
														
														
												</script>
                                                </div>
                                               </div>
                                            
                                            
                                            
                                            
                                            <!--                                  //////////////////////////////// table start //////////////////////////////// -->
                                              <div class="col-xl-8 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Request From various Stations</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData15">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Date</th>
						                                                                
						                                                                <th>Branch</th>
						                                                                <th>Request Title</th>
						                                                                <th>Request </th>
						                                                                <th>Status</th>
						                                                                <th>Action</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                        
						                                                          <% 
						                                                        Class.forName("com.mysql.jdbc.Driver");
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
													                                        int i3=0;
																							String query3 = "select * from requests";
																						     st = con.createStatement();
													
																							rs = st.executeQuery(query3);
													
																							while (rs.next()) {
																								String id = rs.getString("id");
																						%>
						                                                            <tr>
						                                                                <th scope="row"><%=i3+=1 %></th>
						                                                                <th scope="row"><%=rs.getString("date") %></th>
						                                                                <td><%out.println(rs.getString("branch")); %></td>
						                                                                <td><%out.println(rs.getString("title")); %></td>
						                                                                <td ><%out.println(rs.getString("requst")); %></td>
						                                                                
						                                                                <td class="">
						                                                                <%
						                                                                String days =rs.getString("status");
						                                                                if(days.equals("Approved")){
						                                                                	out.println("<span class=\"badge badge-success\">"+days+"</span>");
						                                                                }else if(days.equals("Pending")){
						                                                                	out.println("<span class=\"badge badge-primary\">"+days+"</span>");
						                                                                }else{
						                                                                	out.println("<span class=\"badge badge-danger\">"+days+"</span>");
						                                                                }
						                                                                %>
						                                                                </td>
						                                                                 <td>
						                                                                <a href="approve.jsp?id=<%=rs.getString("id") %>" title="Click to Approve" ><i class="ti-check" style="color:Green; padding:5px;"></i></a>
																	                    <a href="decline.jsp?id=<%=rs.getString("id") %>" title="Decline"><i class="ti-close" style="color:red"></i></a>
						                                                                </td>
						                                                            </tr>               
						                                                        <%} %>
						                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                            
                                                   <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Supplied Products To Various Stations</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                           <table class="table table-hover" id="testData16">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Date</th>
                                                                <th>Branch</th>
                                                                <th>Invoice No.</th>
                                                                <th>Expected Received</th>
                                                                <th>Product type</th>
                                                                 <th>Quantity Received</th>
                                                                <th>Price/Rate</th>
                                                                <th>Overage</th>
                                                                <th>Shortage</th>
                                                                <th>Total</th>
                                                             
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                          <% 
                                                          
                                                    
                                                          
						                                                        Class.forName("com.mysql.jdbc.Driver");
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
													                                        int i10=0;
																							String query11 = "select * from productSupply";
																						     st = con.createStatement();
													
																							rs = st.executeQuery(query11);
													
																							while (rs.next()) {
																								
																						%>
                                                            <tr>
                                                                <th scope="row"><%out.println(i10+=1); %></th>
                                                                <td><%out.println(rs.getString("date")); %></td>
                                                                <td><%out.println(rs.getString("branch")); %></td>
                                                                <td><%out.println(rs.getString("invoice")); %></td>
                                                                <td><%out.println(rs.getString("eQ")); %></td>
                                                                <td><%out.println(rs.getString("product")); %></td>
                                                                <td><%out.println(rs.getString("rate")); %></td>
                                                                <td><%out.println(rs.getString("qR")); %></td>
                                                                <td><%out.println(rs.getString("shortage")); %></td>
                                                                <td><%out.println(rs.getString("overage")); %></td>
                                                                <td><%out.println(rs.getString("total")); %></td>
                                                                
                                                               
                                                            </tr>
                                                          
                                                           <%} %>
                                                        </tbody>
                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div>  
                                            
                                            
                                              <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Lube Bay Sale Summary</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData17">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
							                                                                <th>Date</th>
							                                                                <th>Branch</th>
							                                                                <th>Month</th>
							                                                             
							                                                                <th>Litres Sold</th>
							                                                                <th>Rate</th>
							                                                                <th>Amount</th>
							                                                                <th>Balance</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
                                                        <%
                                                        
                                                       // Connection con;
                                                       // Statement st;
                                                        Statement st1;
                                                       // ResultSet rs;
                                                        ResultSet rs1;
                                                        try{
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                        String sql = "select * from lubeSale ";
                                                       
                                                        String sql1 ="SELECT  sum(litresRecieved) from lubeStock";
                                                        
                                                        double te=0;
                                                        double lr=0;
                                                        double lt=0;
                                                        int i =0;
                                                        st = con.createStatement();
                                                        st1 = con.createStatement();
                                                        rs=st.executeQuery(sql);
                                                        rs1=st1.executeQuery(sql1);
                                                        
                                                        while(rs.next()){
                                                        %>
                                                            <tr>
                                                                <th scope="row"><%out.println(i+=1); %></th>
                                                                <td scope="row"><%out.println(rs.getString("date")); %></td>
                                                                <td scope="row"><%out.println(rs.getString("branch")); %></td>
                                                                <td scope="row"><%out.println(rs.getString("month")); %></td>
                                                                <td scope="row"><%out.println(rs.getString("litresSold")); %></td>
                                                                <td scope="row"><%out.println(rs.getString("rate")); %></td>
                                                                <td scope="row"><%
                                                                
                                                                double lts = rs.getDouble("litresSold");
                                                                double rate = rs.getDouble("rate");
                                                               
                                                                out.println(lts*rate);
                                                                
                                                                %></td>
                                                                <td>
                                                                <%
                                                                   if(rs1.next()){
                                                                	   te=rs1.getDouble(1);
                                                                	   
                                                                   }
                                                               
                                                                lr+=lts;
                                                                out.println(te-lr);
                                                                
                                                                %>
                                                                </td>
                                                                
                                                            </tr>
                                                          <%} 
                                                        }catch(Exception e){}
                                                          %>
                                                           
                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                                <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Washing Bay Bank Analysis</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData">
						                                                        <thead>
						                                                            <tr>
						                                                              <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Branch</th>
						                                                                <th>Month</th>
						                                                                <th>TOTAL INCOME</th>
						                                                                <th>LESS DAILY WAGES AND EXPENSES</th>
						                                                                <th>TOTAL EXPECTED DEPOSIT</th>
						                                                                <th>ACTUAL AMOUNT DEPOSITED</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
                                                        <%
                                                     
                                                        try{
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                        st = con.createStatement();
                                                        
                                                        String sql = "select * from washingBayData";
                                                     
                                                        rs = st.executeQuery(sql);
                                                        double totalIncome = 0;
                                                        double wages=0;
                                                        double comm=0;
                                                        double epenses=0;
                                                        double expectedBank=0;
                                                        double actual=0;
                                                        int i=0;
                                                        while(rs.next()){
                                                        
                                                        %>
                                                            <tr>
                                                                <th scope="row"><%out.println(i+=1);%></th>
                                                                <td><%=rs.getString("date") %></td>
                                                                <td><%=rs.getString("branch") %></td>
                                                                <td><%=rs.getString("month") %></td>
                                                                <td>
                                                                <%
                                                                epenses += rs.getDouble("expenses");
                                                                comm += rs.getDouble("commission");
                                                                totalIncome += rs.getDouble("sales");
                                                                out.println(totalIncome);
                                                                
                                                                %>
                                                                
                                                                </td>
                                                                <td><%
                                                                wages=epenses+comm;
                                                                out.println(wages);
                                                                
                                                                %></td>
                                                                <td><%
                                                                expectedBank = totalIncome - wages;
                                                                out.println(expectedBank);
                                                                %></td>
                                                                <td><%
                                                                actual += rs.getDouble("deposite");
                                                                out.println(actual);
                                                                %></td>
                                                            </tr>
                                                            <%}
                                                        }catch(Exception e){}
                                                        %>
                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                                  <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Washing Bay Income Analysis</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                    <%
                                                 
                                                    
                                                    double Elct=0;
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                    st = con.createStatement();
                                                    
                                                    String sql0 = "select sum(amount) from utility where area='Washing Bay'";
                                                    rs = st.executeQuery(sql0);
                                                    while(rs.next()){
                                                    	Elct = rs.getDouble(1);
                                                    }
                                                    
                                                    %>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData1">
						                                                        <thead>
						                                                            <tr>
						                                                               <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Branch</th>
						                                                                <th>Month</th>
						                                                                <th>Total Income</th>
						                                                                <th>Less Expenses</th>
						                                                                <th>Daily wages</th>
						                                                                <th>Operational Expenses</th>
						                                                                
						                                                                <th>Net Income/Profit</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                         <tbody>
                                                        <%
                                                      try{
                                                        
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                        st = con.createStatement();
                                                        
                                                        String sql1 = "select * from washingBayData";
                                                       
                                                        rs = st.executeQuery(sql1);
                                                        double totalIncome = 0;
                                                        double wages=0;
                                                        double comm=0;
                                                        double epenses=0;
                                                        double expectedBank=0;
                                                        double actual=0;
                                                        double opera=0;
                                                        double net = 0;
                                                        int i=0;
                                                        while(rs.next()){
                                                        
                                                        %>
                                                            <tr>
                                                                <th scope="row"><%out.println(i+=1);%></th>
                                                                <td><%=rs.getString("date") %></td>
                                                                <td><%=rs.getString("branch") %></td>
                                                                <td>
                                                                <%
                                                                epenses += rs.getDouble("expenses");
                                                                comm += rs.getDouble("commission");
                                                                totalIncome += rs.getDouble("sales");
                                                                out.println(totalIncome);
                                                                
                                                                %>
                                                                
                                                                </td>
                                                                <td><%
                                                                wages=epenses+comm;
                                                                out.println(wages);
                                                                
                                                                %></td>
                                                                <td><%
                                                                
                                                                out.println(comm);
                                                                %></td>
                                                                
                                                                 <td><%
                                                             ///////////////// operational Exp
                                                             
                                                             opera+=rs.getDouble("expenses");
                                                                out.println(opera);
                                                                %></td>
                                                                
                                                                <td><%
                                                                
                                                                double check= Elct +wages +opera;
                                                                net = totalIncome - check;
                                                                //System.out.println(totalIncome +"  check is   " + check +" elctri "+ Elct+ " wages "+wages+" opration "+opera + " net is =" + net);
                                                                out.println(net);
                                                                %></td>
                                                            </tr>
                                                            <%} 
                                                      }catch(Exception e){}
                                                            %>
                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                                <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Credits Made By Various Stations</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData2">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Branch</th>
						                                                                <th>month</th>
						                                                                <th>Customer Name</th>
						                                                                <th>Truck/Machine</th>
						                                                                <th>Product</th>
						                                                                <th>Litres Taken</th>
						                                                                <th>Rate</th>
						                                                                <th>Total</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
                                                        <%
                                                       
                                                        try{
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                       // con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                        st=con.createStatement();
                                                        String sql="select * from credit";
                                                       
                                                        rs=st.executeQuery(sql);
                                                        int i=0;
                                                        while(rs.next()){
                                                        	
                                                        %>
                                                            <tr>
                                                                <th scope="row"><%out.println(i+=1); %></th>
                                                                <td><%out.println(rs.getString("date")); %></td>
                                                                <td><%out.println(rs.getString("branch")); %></td>
                                                                <td><%out.println(rs.getString("month")); %></td>
                                                                <td><%out.println(rs.getString("customer")); %></td>
                                                                <td><%out.println(rs.getString("truckMachine")); %></td>
                                                                <td><%out.println(rs.getString("product")); %></td>
                                                                <td><%out.println(rs.getString("ltr")); %></td>
                                                                <td><%out.println(rs.getString("rate")); %></td>
                                                                <td><%out.println(rs.getString("total")); %></td>
                                                               
                                                                
                                                            </tr>
                                                          
                                                           <%}
                                                        }catch(Exception e){}
                                                        %>
                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div>  
                                            
                                            
                                               <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Various Stations Utility Expenses</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData3">
						                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Branch</th>
                                                                <th>Date</th>
                                                                <th>Month</th>
                                                                <th>Description</th>
                                                                <th>Type</th>
                                                                <th>Amount Used</th>
                                                                <th>Area</th>
                                                                
                                                                
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                      
                                                           try{
                                                           Class.forName("com.mysql.jdbc.Driver");
                                                           con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                           st=con.createStatement();
                                                           String sql="select * from utility";
                                                          
                                                           rs=st.executeQuery(sql);
                                                           int i=0;
                                                           while(rs.next()){
                                                           
                                                        %>
                                                            <tr>
                                                                <th scope="row"><%out.println(i+=1); %></th>
                                                                <td><%out.println(rs.getString("branch")); %></td>
                                                                <td><%out.println(rs.getString("date")); %></td>
                                                                <td><%out.println(rs.getString("month")); %></td>
                                                                <td><%out.println(rs.getString("decription")); %></td>
                                                                <td><%out.println(rs.getString("uType")); %></td>
                                                                <td><%out.println(rs.getString("amount")); %></td>
                                                                <td><%out.println(rs.getString("area")); %></td>
                                                              
                                                            </tr>
                                                          <%}
                                                           }catch(Exception e){}
                                                           %>
                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                            
                                                  <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Stations Maintenance Expenses</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData4">
						                                                       <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Date</th>
                                                                <th>Branch</th>
                                                                <th>Month</th>
                                                                <th>Description</th>
                                                                <th>Amount Used</th>
                                                                
                                                                
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                      
                                                          try{
                                                          Class.forName("com.mysql.jdbc.Driver");
                                                          con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                          st=con.createStatement();
                                                          String sql ="select * from statioMaitenance";
                                                          
                                                          rs=st.executeQuery(sql);
                                                          int i=0;
                                                          while(rs.next()){
                                                        	  
                                                          
                                                        		  
                                                        %>
                                                            <tr>
                                                                <th scope="row"><%out.println(i+=1); %></th>
                                                                <td><%out.println(rs.getString("date")); %></td>
                                                                <td><%out.println(rs.getString("branch")); %></td>
                                                                <td><%out.println(rs.getString("month")); %></td>
                                                                <td><%out.println(rs.getString("decription")); %></td>
                                                                <td><%out.println(rs.getString("amount")); %></td>
                                                                 
                                                            </tr>
                                                          
                                                           <%}
                                                          }catch(Exception e){}
                                                          %>
                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div>  
                                            
                                            
                                                 <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Statutory Summary</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData5">
						                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Branch</th>
                                                                <th>Task</th>
                                                                <th>Required Certificate</th>
                                                                <th>Permit Agency</th>
                                                                <th>Current Date</th>
                                                                <th>Expiry Date</th>
                                                                <th>Countdown days</th>
                                                                 <th>Status</th>
                                                                
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        	<%   
 
									                             try{ 
									                                int i = 0;
									                                Class.forName("com.mysql.jdbc.Driver");
									                                con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
									                                
									                                  String query = "SELECT ID, task,cert,permit,currentDate,expiryDate, FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) as Days, FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) % 1440 / 60) as Hours, TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) % 60 as Minutes FROM fuelstatutory   where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) >1 and branch='";
									                                  
									                                 //Statement st = con.createStatement();
									                                  
									                                    rs =  st.executeQuery(query);
									                                    
									                                        while(rs.next())
									                                        {
									                                          
									                                            i+=1;
									                                %>
                                                        
                                                            <tr>
                                                                <th scope="row"><%out.println(i); %></th>
                                                                <td><%out.println(rs.getString("branch")); %></td>
                                                                <td><%out.println(rs.getString("task")); %></td>
                                                                <td><%out.println(rs.getString("cert")); %></td>
                                                                <td><%out.println(rs.getString("permit")); %></td>
                                                                <td><%out.println(rs.getString("currentDate")); %></td>
                                                                <td><%out.println(rs.getString("expiryDate")); %></td>
                                                               
                                                                <td><%out.println(rs.getString(7)+"days "+rs.getString(8)+"Hours "+rs.getString(9)+"Min"); %></td>
                                                                 <td> 
                                                                 
                                                                 <% 
                                                                 int days =rs.getInt(7);
                                                                 if(days>=50){
                                                                	 out.println("<div class=\"progress\"><div class=\"progress-bar progress-bar-striped bg-success progress-bar-animated\" role=\"progressbar\" aria-valuenow=\"20\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 100%\"></div></div> ");
                                                                 }else if(days>=25){
                                                                	 out.println("<div class=\"progress\"><div class=\"progress-bar progress-bar-striped bg-primary progress-bar-animated\" role=\"progressbar\" aria-valuenow=\"20\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 50%\"></div></div> ");
                                                                 }else{
                                                                	 out.println("<div class=\"progress\"><div class=\"progress-bar progress-bar-striped bg-danger progress-bar-animated\" role=\"progressbar\" aria-valuenow=\"20\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 20%\"></div></div> ");
                                                                 }
                                                                   
																	%>
																	</td>
                                                                
                                                            </tr>
                                                          <%}
									                             }catch(Exception e){}
									                                        %>
                                                           
                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                       <!--        <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Sales Summary</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData6">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Manages Name</th>
						                                                                <th>Request Description</th>
						                                                                
						                                                                <th>Status</th>
						                                                                <th>Action</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                                <th scope="row">1</th>
						                                                                <th scope="row">Nov/11/2021</th>
						                                                                <td>Maxwell Owusu</td>
						                                                                <td>Employee Allowance</td>
						                                                                <td style="color:blue">Pending</td>
						                                                                 <td>
						                                                                <a href="supply.jsp" title="Approve"><i class="ti-check" style="color:Green; padding:5px;"></i></a>
																	                    <a href="supply.jsp" title="Decline"><i class="ti-close" style="color:red"></i></a>
						                                                                </td>
						                                                            </tr>               
						                                                        
						                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                                <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>PayRoll Summary</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData7">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
							                                                                <th>Month</th>
							                                                                <th>Name</th>
							                                                                <th>Position</th>
							                                                                <th>Basic</th>
							                                                                <th>Status</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                               <th scope="row">1</th>
						                                                                <td>Nov/2021</td>
						                                                                <td>Maxwell Owusu</td>
						                                                                <td>Manager</td>
						                                                                <td>9000</td>
						                                                                <td>Paid</td>
						                                                            </tr>               
						                                                        
						                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div>  
                                            
                                                  <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Allowance Summary</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData8">
						                                                        <thead>
						                                                            <tr>
						                                                                   <th>#</th>
								                                                                <th>Date</th>
								                                                                <th>Month</th>
								                                                                <th>Week</th>
								                                                                <th>Name</th>
								                                                                <th>Position</th>
								                                                                <th>Amount</th>
								                                                                <th>Status</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                               <th scope="row">1</th>
						                                                                <td>11/Nov/21</td>
						                                                                <td>Nov</td>
						                                                                <td>Week 1</td>
						                                                                <td>Name 1</td>
						                                                                <td>Manager</td>
						                                                                <td>25</td>
						                                                                <td>Received</td>
						                                                            </tr>               
						                                                        
						                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div>  -->
                                            
                                               <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Bank Lodgement Summary</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData9">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Month</th>
						                                                                <th>Branch</th>
						                                                                <th>Amount Banked</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                        <%
	                                                       
	                                                       try{
	                                                        String sql="";
	                                                       
	                                                        int i=0;
	                                                        
                                                        
                                                        	sql = "select sum(bankLodgement), date,month,branch,bankLodgement from closingStock group by date";
                                                        	
                                                        	ResultSet rst = st.executeQuery(sql);
                                                            while(rst.next()){
                                                        	
                                                        	
                                                        	%>
						                                                           <tr>
                                                                <th scope="row"><%out.println(i+=1); %></th>
                                                                <td><%out.println(rst.getString(2)); %></td>
                                                                <td><%out.println(rst.getString(3)); %></td>
                                                                <td><%out.println(rst.getString(4)); %></td>
                                                                <td><%out.println(rst.getString(1)); %></td>
                                                               
                                                                
                                                            </tr>
                                                            <%}
	                                                        }catch(Exception e){}
                                                            %>             
						                                                        
						                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                            
                                                <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Assign/Uassign Manager To a Station</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData10">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Station/Branch</th>
						                                                                <th>Manager</th>
						                                                                <th>Assign A Manager</th>
						                                                                <th>Unassign A Manager</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                        <% 
						                                                        Class.forName("com.mysql.jdbc.Driver");
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
													                                        int i=0;
																							String query = "select * from branch";
																						     st = con.createStatement();
													
																							rs = st.executeQuery(query);
													
																							while (rs.next()) {
																								String id = rs.getString("id");
																						%>
						                                                            <tr>
						                                                                <th scope="row"><%out.println(i+=1); %></th>
						                                                                <td><%out.println(rs.getString("branchName")); %></td>
						                                                                <td><%out.println(rs.getString("manger")); %></td>
						                                                                <td><a title="assign a manager" href="assignManager.jsp?id=<%=rs.getString(1) %>" style="cursor:pointer"><i class="ti-user"></i><i class="ti-plus"></i></a></td>
						                                                                <td><a title="Unassign a manager" href="unAssignManager.jsp?id=<%=rs.getString(1) %>" style="cursor:pointer"><i class="ti-user"></i><i class="ti-minus"></i></a></td>
						                                                            </tr>               
						                                                        <%} %>
						                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                            
                                              <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Added Managers</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData11">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Manger's Name</th>
						                                                                
						                                                                <th>Actions</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                          <% 
						                                                        Class.forName("com.mysql.jdbc.Driver");
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
													                                        int i1=0;
																							String query1 = "select * from login";
																						     st = con.createStatement();
													
																							rs = st.executeQuery(query1);
													
																							while (rs.next()) {
																								String id = rs.getString("id");
																						%>
						                                                            <tr>
						                                                                <th scope="row"><%out.println(i1+=1); %></th>
						                                                                <td><%out.println(rs.getString(2)); %></td>
						                                                              
						                                                               <td>
                                                                <button onclick="search(<%=rs.getString(1)%>)" title="Update" data-toggle="modal" data-target="#updateModal"><i class="ti-pencil-alt" style="color:orange; cursor:pointer; padding:5px;"></i></button>
											                    <button onclick="testDelete(<%=rs.getString(1)%>)" title="Delete"><i class="ti-trash" style="color:red; cursor:pointer; padding:5px;"></i></button>
						                                                                </td>
						                                                            </tr>               
						                                                        <%} %>
						                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                            <!-- Modal -->
													<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Update Manager</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													      
													        <form action="#" method="post">
                                                                        <div class="form-group row  container justify-content-center" >
                                                                           <div class="col-sm-6">
                                                                            <label>Liters Sold</label>
                                                                                <input type="text" class="form-control"
                                                                                name="ltr" id="ltr" required>
                                                                            </div>
                                                                           
                                                                            
                                                                           
                                                                        </div>
                                                                      
                                                                    
                                                                      
                                                                         <div align="center">
                                                    <br>
                                                    
                                                     <button type="submit" name="update" class="btn waves-effect waves-light btn-success btn-outline-success"><i class="fa-regular fa-floppy-disk"></i>Update</button>
                                                     <button class="btn waves-effect waves-light btn-danger btn-outline-danger" type="reset"><i class="fa-solid fa-ban"></i>Cancel</button>
                                                    </div>
                                                                      
                                                                    </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div> 
													 <script>
																	          function search(id){
																	        	  
																	        	
																	        	  
																	        	  $.ajax({
																	        		  
																	        		  type:"POST",
																	        		  url:"updatelube.jsp",
																	        		  data:{"myid" :id,"option":'admin'},
																	        		  
																	        		  success:function(msg){
																	        			  var obj = JSON.parse(msg);
																	        			  $("#ltr").val(obj[0].name);
																	        			  
																	        			
																	        			
																	        			 
																	        		  },
																	        		  error(err){
																	        			  alertify.error('Error');
																	        		  }
																	        		  
																	        		  
																	        	  })
																	        	  
																	          }
																	          
																	          
																	    </script>
                                            
                                             <script>
			                                            
																	              function testDelete(id){
																	            	  alert(id);
																	            	  var doit = confirm("Do you want to delete data");
																	            	      if(doit){
																	            	    	 
																	            	    	  deletes(id);
																	            	      }else
																	            	    	  alert("Cancelled");
																	              }

																	    	    	  
																	              function deletes(id){
																	        	  $.ajax({
																	        		  type:"POST",
																	        		  url:"updatelube.jsp",
																	        		  data:{"myid" :id,"option":'adminD'},
																	        		  
																	        		  success:function(msg){
																	        			  var obj = JSON.parse(msg);
																	        			 
																	        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
																	        			  var millisecondsToWait = 700;
																	        			  setTimeout(function() {
																	        				  location.href="lubeSale.jsp";
																	        			  }, millisecondsToWait);
																	        			  
																	        		  },
																	        		  error(err){
																	        			  alertify.error('Error');
																	        		  }
																	        		  
																	        		  
																	        	  })
																	        	  
																	          }
																	          
																	          
																	    </script>
                                            
                                               <div class="col-xl-6 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>My Posts For this month</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData12">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Date</th>
						                                                                
						                                                                <th>Posts</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                        
						                                                            <% 
						                                                        Class.forName("com.mysql.jdbc.Driver");
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
													                                        int i2=0;
																							String query2 = "select * from message";
																						     st = con.createStatement();
													
																							rs = st.executeQuery(query2);
													
																							while (rs.next()) {
																								String id = rs.getString("id");
																						%>
						                                                            <tr>
						                                                                <th scope="row"><%out.println(i2+=1); %></th>
						                                                                <td><%out.println(rs.getString("date"));%></td>
						                                                                 <td><%out.println(rs.getString("post")); %></td>
						                                                              
						                                                            </tr>               
						                                                        <%} %>
						                                                        </tbody>
						                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                            
                                               <div class="col-xl-12 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Uploaded Invoices</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover" id="testData13">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Branch</th>
						                                                                <th>Scanned Invoice</th>
						                                                                <th>Actions</th>
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                        <%
					
						                                                        
						                                                        Class.forName("com.mysql.jdbc.Driver");
						                                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
						                                                        st = con.createStatement();
						                                                        String sql = "select * from invoices";
						                                                        rs=st.executeQuery(sql);
						                                                        int i22=0;
						                                                        while(rs.next()){
						                                                        	
						                                                        	
						                                                        	
									                                                        %>
									                                                            <tr>
									                                                                <th scope="row"><%out.println(i22+=1); %></th>
									                                                                <td><%out.println(rs.getString("date"));%></td>
									                                                                <td><%out.println(rs.getString("branch"));%></td>
									                                                                <td>
									                                                                 <a href="viewInvoice.jsp?id=<%=rs.getString("ID") %>"><img src="NewFile1.jsp?id=<%=rs.getString("ID")%>" width=130 height=130></a>
									                                                              
									                                                                </td>
									                                                                <td>
									                                                               <button onclick="testDelete(<%=rs.getString(1)%>)" title="Delete"><i class="ti-trash" style="color:red; cursor:pointer; padding:5px;"></i></button>
																				                   <%--  <a href="viewInvoice.jsp?id=<%=rs.getString("ID") %>" title="Veiw"><i class="ti-eye" style="color:black; padding:5px;"></i></a> --%>
																				                    <a href="./DownloadFileFromDb?id=<%=rs.getString("ID") %>" title="Download"><button><i class="ti-cloud-down" style="color:green; padding:5px;"></i></button></a>
																				                    </td>
									                                                            </tr>
									                                                          <%} %>
									                                                           
									                                                        </tbody>
									                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                               <div class="col-xl-12 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Pdf Summary Reports</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                   <table class="table table-hover"id="testData14">
					                                                        <thead>
					                                                            <tr>
					                                                                <th>#</th>
					                                                                <th>Date</th>
					                                                                <th>Branch</th>
					                                                                <th>File</th>
					                                                                <th>Actions</th>
					                                                            </tr>
					                                                        </thead>
					                                                        <tbody>
					                                                        <%
					                                                        
					                                                        Class.forName("com.mysql.jdbc.Driver");
					                                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
					                                                        st = con.createStatement();
					                                                        String sql1 = "select * from summarypdf";
					                                                        rs=st.executeQuery(sql1);
					                                                        int ii=0;
					                                                        while(rs.next()){
					                                                        	
					                                                        	
					                                                        	
								                                                        %>
								                                                            <tr>
								                                                                <th scope="row"><%out.println(ii+=1); %></th>
								                                                                <td><%out.println(rs.getString("date"));%></td>
								                                                                <td><%out.println(rs.getString("branch"));%></td>
								                                                                <td>
								                                                                 <a href="sumpdf.jsp?id=<%=rs.getString("ID") %>"> <img src="assets/images/pdf.jpg" width=20 height=20></a>
								                                                              
								                                                                </td>
								                                                                <td>
								                                                               <button onclick="testDelete(<%=rs.getString(1)%>)" title="Delete"><i class="ti-trash" style="color:red; cursor:pointer; padding:5px;"></i></button>
																			                   <%--  <a href="viewInvoice.jsp?id=<%=rs.getString("ID") %>" title="Veiw"><i class="ti-eye" style="color:black; padding:5px;"></i></a> --%>
																			                    <a href="./downloadpdf?id=<%=rs.getString("ID") %>" title="Download"><button><i class="ti-cloud-down" style="color:green; padding:5px;"></i></button></a>
																			                    </td>
								                                                            </tr>
								                                                          <%} %>
								                                                           
								                                                        </tbody>
								                                                    </table>
						                                                </div>
						                                            </div>   
                                                            </div>
                                                        </div>
                                                    
                                                     
                                                </div>
                                            </div> 
                                            
                                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                                             <script>
												$(document).ready( function () {
												    $('#testData').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData1').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData2').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData3').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData4').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData5').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData6').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData7').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData8').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData9').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData10').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData11').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData12').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData13').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData14').DataTable();
												} );
												
												
												</script>
												
												<script>
												$(document).ready( function () {
												    $('#testData15').DataTable();
												} );
												
												
												</script>
												<script>
												$(document).ready( function () {
												    $('#testData16').DataTable();
												} );
												
												
												</script>
												<script>
												$(document).ready( function () {
												    $('#testData17').DataTable();
												} );
												
												
												</script>
                                            
                             
                                    <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                  		
															<div class="modal fade" id="unassignModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Unassign a Manager</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-8">
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select The Manager</option>
                                                                            <option value="opt2">Type 2</option>
                                                                            <option value="opt3">Type 3</option>
                                                                            <option value="opt4">Type 4</option>
                                                                            <option value="opt5">Type 5</option>
                                                                            <option value="opt6">Type 6</option>
                                                                            <option value="opt7">Type 7</option>
                                                                            <option value="opt8">Type 8</option>
                                                                        </select>
                                                                            </div>
                                                                        </div>
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Unassign</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
                          
                                           
                                            <!--  project and team member end -->
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <form action="qr" method="Post">
                                <input type="text" value="http://kodson.org" name="testQr">
                                <button class="btn btn-primary" type="submit">Generate QR</button>
                              
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    
    <!-- Required Jquery -->
    <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
    <script type="text/javascript" src="assets/pages/widget/excanvas.js "></script>
    <!-- waves js -->
    <script src="assets/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="assets/js/modernizr/modernizr.js "></script>
    <!-- slimscroll js -->
    <script type="text/javascript" src="assets/js/SmoothScroll.js"></script>
    <script src="assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
    <!-- Chart js -->
    <script type="text/javascript" src="assets/js/chart.js/Chart.js"></script>
    <!-- amchart js -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="assets/pages/widget/amchart/gauge.js"></script>
    <script src="assets/pages/widget/amchart/serial.js"></script>
    <script src="assets/pages/widget/amchart/light.js"></script>
    <script src="assets/pages/widget/amchart/pie.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <!-- menu js -->
    <script src="assets/js/pcoded.min.js"></script>
    <script src="assets/js/vertical-layout.min.js "></script>
    <!-- custom js -->
    <script type="text/javascript" src="assets/pages/dashboard/custom-dashboard.js"></script>
    <script type="text/javascript" src="assets/js/script.js "></script>
    
    <!--          ////////    Data table Js ///////////////////// -->
<script src=https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js></script>
<script src=https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    
</body>

</html>
