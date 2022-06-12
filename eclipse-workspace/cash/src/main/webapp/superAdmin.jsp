
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    
	System.out.println(m5);

 %>


<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
%>


<%
Gson gsonObj2 = new Gson();

		
List<Object> list5 = new ArrayList<Object>();		
List<Object> list6 = new ArrayList<Object>();
			
String dataPoints5 = null;
String dataPoints6 = null;
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
	Statement statement = connection.createStatement();
	String xVal1, yVal1;
	
	ResultSet resultSet1 = statement.executeQuery("select * from testData");
	
	while(resultSet1.next()){
		xVal1 = resultSet1.getString("lable");
		yVal1 = resultSet1.getString("datat");
		 list5.add(xVal1);
		 list6.add(yVal1);
		dataPoints5 = gsonObj.toJson(list5);
		dataPoints6 = gsonObj.toJson(list6);
		
	}

	connection.close();
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
      
      
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      
      
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
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
	Statement statement = connection.createStatement();
	String b=null;
	String p=null;
	ResultSet resultSet = statement.executeQuery("select * from login where branch='main'");
	
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
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
                                                                              <label>Station Branch</label>
                                                                                <input type="text" class="form-control" name="station"required>
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
														                           con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
                                  <a href="dashBoard1.jsp" class="waves-effect waves-dark">
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
                                      <li class=" ">
                                          <a href="CreateSummary.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Create Summary</span>
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
                                                                <h6 class="text-muted m-b-0"></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-bar-chart f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-purple">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">4</p>
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
                                                                <h4 class="text-c-green">Total AGO Sold ltr</h4>
                                                                <h6 class="text-muted m-b-0"></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-file-text-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-green">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">80000</p>
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
                                                                <h4 class="text-c-red">Total PMS Sold ltr</h4>
                                                                <h6 class="text-muted m-b-0"></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-calendar-check-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">55000</p>
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
                                                                <h6 class="text-muted m-b-0"></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-blue">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">10000</p>
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
                                                                <h4 class="text-c-purple">Total Cash From PMS sold</h4>
                                                                <h6 class="text-muted m-b-0"></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-bar-chart f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-purple">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">50000</p>
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
                                                                <h6 class="text-muted m-b-0"></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-file-text-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-green">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">50</p>
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
                                                                <h6 class="text-muted m-b-0"></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-calendar-check-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">5000</p>
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
                                                                <h6 class="text-muted m-b-0"></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-blue">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">8000</p>
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
                                                        <h5>Sales Analytics</h5>
                                                        <span class="text-muted">Get 15% Off on <a href="https://www.amcharts.com/" target="_blank">amCharts</a> licences. Use code "codedthemes" and get the discount.</span>
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
                                                    <div class="card-block">
                                                        
                                                        	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
													              
													 <canvas id="line-chart" width="600" height="150"></canvas>             
													<script>
													new Chart(document.getElementById("line-chart"), {
														  type: 'line',
														  data: {
														    labels: ["January","February","March","April","May","June","July","August","September","October","November","December"],
														    datasets: [{ 
														        data: [1,114,106,106,107,111,133,221,783,2478,234,545],
														        label: "Com 11",
														        borderColor: "red",
														        fill: false
														      }, 
														      { 
														        data: [100,3,40,200,7,26,82,172,312,800],
														        label: "Kpone",
														        borderColor: "blue",
														        fill: false
														      },
														      { 
															        data: [600,60,100,2,7,50,82,172,312,500],
															        label: "Pokuase",
															        borderColor: "green",
															        fill: false
															      },
															      { 
																        data: [10,3,400,2,7,250,82,172,312,100],
																        label: "Malejor",
																        borderColor: "orange",
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
                                            <div class="col-xl-4 col-md-12">
                                                
                                                <div class="card quater-card">
                                                 
                                                  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
              
														<canvas id="doughnut-chart" width="400" height="150"></canvas>
														<script type="text/javascript">
														new Chart(document.getElementById("doughnut-chart"), {
														    type: 'doughnut',
														    data: {
														      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
														      datasets: [
														        {
														          label: "Population (millions)",
														          backgroundColor: [
														              'rgb(255, 99, 132)',
														              'rgb(54, 162, 235)',
														              'rgb(255, 205, 86)'
														            ],
														            
														          data: [2478,5267,734,784,433]
														        }
														      ]
														    },
														    options: {
														      title: {
														        display: true,
														        text: 'Predicted world population (millions) in 2050'
														      }
														    }
														});
														
														
														</script>
                                                </div>
                                               </div>
                                          
                                            
                                            <!--  sale analytics end -->
    
                                            <!--  project and team member start -->
                                            <div class="col-xl-8 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Projects</h5>
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
													                '#CFFB50',
													                '#FFE978',
													               
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
                                            
                                            <!--                                  //////////////////////////////// table start //////////////////////////////// -->
                                              <div class="col-xl-6 col-md-6">
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
						                                                    <table class="table table-hover">
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
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
						                                                           <table class="table table-hover">
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
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
                                                        <h5>Lube Bay Summary</h5>
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
						                                                    <table class="table table-hover">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
							                                                                <th>Date</th>
							                                                                <th>Product</th>
							                                                                <th>Litres Sold</th>
							                                                                <th>Amount</th>
							                                                                <th>Balance</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                                <th scope="row">1</th>
						                                                                <td>11/Nov/21</td>
						                                                                <td>12345</td>
						                                                                <td>9000</td>
						                                                                <td>AGO</td>
						                                                                <td>6.77</td>
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
						                                                    <table class="table table-hover">
						                                                        <thead>
						                                                            <tr>
						                                                              <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>TOTAL INCOME</th>
						                                                                <th>LESS DAILY WAGES AND EXPENSES</th>
						                                                                <th>TOTAL EXPECTED DEPOSIT</th>
						                                                                <th>ACTUAL AMOUNT DEPOSITED</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                                <th scope="row">1</th>
						                                                                <td>11/Nov/21</td>
						                                                                <td>9000</td>
						                                                                <td>1000</td>
						                                                                <td>9000</td>
						                                                                <td>8000</td>
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
                                                    
                                                          <div class="row">
                                                            <div class="col-sm-12">
                                                                
                                                              <div class="card-block table-border-style">
						                                                <div class="table-responsive">
						                                                    <table class="table table-hover">
						                                                        <thead>
						                                                            <tr>
						                                                               <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Total Income</th>
						                                                                <th>Less Expenses</th>
						                                                                <th>Daily wages</th>
						                                                                <th>Operational Expenses</th>
						                                                                <th>Less Elect Prepaid Expenses</th>
						                                                                <th>Net Income/Profit</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                             <th scope="row">1</th>
						                                                                <td>11/Nov/21</td>
						                                                                <td>12345</td>
						                                                                <td>9000</td>
						                                                                <td>AGO</td>
						                                                                <td>6.77</td>
						                                                                <td>200</td>
						                                                                <td>0.00</td>
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
						                                                    <table class="table table-hover">
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
						                                                    <table class="table table-hover">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Description</th>
						                                                                <th>Type</th>
						                                                                <th>Amount Used</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                               <th scope="row">1</th>
						                                                                <td>11/Nov/21</td>
						                                                                <td>12345</td>
						                                                                <td>9000</td>
						                                                                <td>AGO</td>
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
						                                                    <table class="table table-hover">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Description</th>
						                                                                <th>Amount Used</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                                <th scope="row">1</th>
						                                                                <td>11/Nov/21</td>
						                                                                <td>pump maintenance</td>
						                                                               <td>1000</td>
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
						                                                    <table class="table table-hover">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Task</th>
						                                                                <th>Required Certificate</th>
						                                                                <th>Permit Agency</th>
						                                                                <th>Current Date</th>
						                                                                <th>Expiry Date</th>
						                                                                <th>Countdown days</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                              <th scope="row">1</th>
						                                                                <td>11/Nov/21</td>
						                                                                <td>12345</td>
						                                                                <td>9000</td>
						                                                                <td>AGO</td>
						                                                                <td>6.77</td>
						                                                                <td>6 day remaining</td>
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
						                                                    <table class="table table-hover">
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
						                                                    <table class="table table-hover">
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
						                                                    <table class="table table-hover">
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
                                            </div> 
                                            
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
						                                                    <table class="table table-hover">
						                                                        <thead>
						                                                            <tr>
						                                                                <th>#</th>
						                                                                <th>Date</th>
						                                                                <th>Month</th>
						                                                                <th>Amount Banked</th>
						                                                                
						                                                            </tr>
						                                                        </thead>
						                                                        <tbody>
						                                                            <tr>
						                                                                <th scope="row">1</th>
						                                                                <td>11/11/2021</td>
						                                                                <td>November</td>
						                                                                <td>9000</td>
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
						                                                    <table class="table table-hover">
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
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
						                                                    <table class="table table-hover">
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
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
						                                                                <a href="supply.jsp" title="Update"><i class="ti-pencil-alt" style="color:orange; padding:5px;"></i></a>
																	                    <a href="supply.jsp" title="Delete"><i class="ti-trash" style="color:red"></i></a>
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
						                                                    <table class="table table-hover">
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
						                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
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
    
</body>

</html>
