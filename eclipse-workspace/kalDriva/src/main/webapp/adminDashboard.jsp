<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="control.DBConnection" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Caldriva</title>
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
      <link href="assets/images/profile.jpg" rel="icon">
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
      
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
                 <!-- Alertify CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<!-- Bootstrap theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
	  <!-- Alertify js -->  
	 <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
  </head>

  <body>
  
     <%
	
	Connection con=DBConnection.getConnection();
	Statement st = con.createStatement();
    String union = (String)session.getAttribute("name");
    String branch = (String)session.getAttribute("branch");
    String pass = (String)session.getAttribute("pass");
  	try{
	 

	String b=null;
	String p=null;
	String u=null;
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
	ResultSet resultSet = st.executeQuery("select * from login where unions='"+union+"' and branch='"+branch+"' and password='"+pass+"'");
	
	while(resultSet.next()){
		b=resultSet.getString("branch");
		u=resultSet.getString("unions");
		p=resultSet.getString("password");
	}
        if( !branch.equals("admin") && !branch.equals("Union")){
              response.sendRedirect("index.jsp");   
        }
  	}catch(Exception e){
  		 response.sendRedirect("index.jsp"); 
  		 
  	}
   %> 
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
                    <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
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
                            <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                <i class="ti-fullscreen"></i>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav-right">
                        <li class="header-notification">
                            <a href="#!" class="waves-effect waves-light">
                                <i class="ti-bell"></i>
                                <span class="badge bg-c-red"></span>
                            </a>
                            <ul class="show-notification">
                                <li>
                                    <h6>Notifications</h6>
                                    <label class="label label-danger">New</label>
                                </li>
                             
                           
                            </ul>
                        </li>
                        
                         <%
					     String dash = branch;
					     String dashPage="";
					     String admin = "adminDashboard.jsp";
					     String union1 = "unionDashboard.jsp";
					     String branch1 = "BranchDashboard.jsp";
					     
					       if(dash.equals("admin")){
					       	dashPage = admin;
					       }else if(dash.equals("Union")){
					       	dashPage = union1;
					       	
					       }else{
					       	dashPage = branch1;
					       }
					     
					     %> 
                        
                        <li class="user-profile header-notification">
                            <a href="#!" class="waves-effect waves-light">
                                <img src="assets/images/use.jpg" class="img-radius" alt="User-Profile-Image">
                                <span>BN - TECNOLOGY</span>
                                <i class="ti-angle-down"></i>
                            </a>
                            <ul class="show-notification profile-notification">
                                
                                <li class="waves-effect waves-light">
                                     <a class="dropdown-item" data-toggle="modal" data-target="#reset" style="cursor:pointer"><i class="fa-solid fa-wrench"></i> Account Reset</a>
                                </li>
                                <li class="waves-effect waves-light">
                                     <a class="dropdown-item" data-toggle="modal" data-target="#union" style="cursor:pointer"><i class="fa-solid fa-users"></i>Add Union Account</a>
                                </li>
                                
                                <li class="waves-effect waves-light">
                                     <a class="dropdown-item" data-toggle="modal" data-target="#branch" style="cursor:pointer"><i class="fa-solid fa-user-group"></i>Add Branch Account</a>
                                </li>
                                
                                <li class="waves-effect waves-light">
                                    <a class="dropdown-item" data-toggle="modal" data-target="#field" style="cursor:pointer"><i class="fa-solid fa-chalkboard-user"></i>Add field staff </a>
                                </li>
                                
                                <li class="waves-effect waves-light">
                                   <a class="dropdown-item" href="logOut" style="cursor:pointer;"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
         <!--Danger theme Modal -->
                                                    <div class="modal fade text-left" id="reset" tabindex="-1"
                                                        role="dialog" aria-labelledby="myModalLabel120"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                            role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header bg-danger">
                                                                    <h5 class="modal-title white" id="myModalLabel120">
                                                                        Reset Your Account
                                                                    </h5>
                                                                    <button type="button" class="close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                        <i data-feather="x"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                  <div class="row">
                                                                    <div class="col-sm-4">
							                                            <label>Union</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                               >
							                                        </div>
							                                        
							                                        <div class="col-sm-4">
							                                            <label>Branch</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                                >
							                                        </div>
							                                        
							                                        <div class="col-sm-4">
							                                            <label>Password</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                                >
							                                        </div>
							                                        </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button"
                                                                        class="btn btn-light-secondary"
                                                                        data-dismiss="modal">
                                                                        
                                                                        <span >Close</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">
                                                                        
                                                                        <span>Reset</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                      <div class="modal fade text-left" id="union" tabindex="-1"
                                                        role="dialog" aria-labelledby="myModalLabel120"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                            role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header bg-danger">
                                                                    <h5 class="modal-title white" id="myModalLabel120">
                                                                        Authenticate Union Manager
                                                                    </h5>
                                                                    <button type="button" class="close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                        <i data-feather="x"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                  <div class="row">
                                                                     <div class="col-md-6 mb-3">
																			<label for="" class="mt-1">Select Union</label>
																				<select name="driver" id="unionM" class="form-control">
																				<%
																				    String sql="Select * from union1";
																				   
																					ResultSet rst = st.executeQuery(sql);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("unionName")%></option>
																				<%} %>
																					
																				</select> 
																			</div>
							                                        
							                                       <div class="col-md-6 mb-6">
							                                            <label>Manager's Name</label>
							                                            <select class="form-control" type="text"
							                                                id="mName" required>
							                                                
							                                                <%
																				    String sqll="Select * from branchmanager";
																				    
																					 rst = st.executeQuery(sqll);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("manager")%></option>
																				<%} %>
																					
																				</select> 
							                                        </div>
							                                        
							                                        <div class="col-sm-12">
							                                            <label>Password</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                               id="uPass" >
							                                        </div>
							                                        </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button"
                                                                        class="btn btn-light-secondary"
                                                                        data-dismiss="modal">
                                                                        <span>Close</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal" onclick="addUnion()">
                                                                   
                                                                        <span>Authenticate Manager</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="modal fade text-left" id="field" tabindex="-1"
                                                        role="dialog" aria-labelledby="myModalLabel120"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                            role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header bg-danger">
                                                                    <h5 class="modal-title white" id="myModalLabel120">
                                                                        Add a Field Staff
                                                                    </h5>
                                                                    <button type="button" class="close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                        <i data-feather="x"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                  <div class="row">
                                                                      <div class="col-md-6 mb-3">
																			<label for="" class="mt-1">Select Union</label>
																				<select name="driver" id="fUnion" class="form-control">
																				<%
																				    String sql5="Select * from union1";
																				    
																					 st = con.createStatement();
																					 rst = st.executeQuery(sql5);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("unionName")%></option>
																				<%} %>
																					
																				</select> 
																			</div>
							                                        
							                                        
							                                        <div class="col-md-6 mb-3">
																			<label for="" class="mt-1">Select Branch</label>
																				<select name="driver" id="fbranch" class="form-control">
																				<%
																				    String sql6="Select * from branch";
																					 st = con.createStatement();
																					 rst = st.executeQuery(sql6);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("branchName")%></option>
																				<%} %>
																					
																				</select> 
																			</div>
							                                        
							                                     <div class="col-sm-6">
							                                            <label>Staff's Name</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                                id="staff">
							                                        </div>
							                                        
							                                        <div class="col-sm-6">
							                                            <label>Password</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                                id="staffPass">
							                                        </div>
							                                        </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button"
                                                                        class="btn btn-light-secondary"
                                                                        data-bs-dismiss="modal">
                                                                        
                                                                        <span >Close</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-danger ml-1"
                                                                        data-dismiss="modal" onclick="addFieldStaff()">
                                                                       
                                                                        <span>add Staff</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                   <div class="modal fade text-left" id="branch" tabindex="-1"
                                                        role="dialog" aria-labelledby="myModalLabel120"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                            role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header bg-danger">
                                                                    <h5 class="modal-title white" id="myModalLabel120">
                                                                        Add Branch Manager
                                                                    </h5>
                                                                    <button type="button" class="close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                        <i data-feather="x"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                  <div class="row">
                                                                   
							                                        
							                                        <div class="col-md-6 mb-3">
																			<label for="" class="mt-1">Select Union</label>
																				<select name="driver" id="bUnion" class="form-control">
																				<%
																				    String sql4="Select * from union1";
																				    
																					 st = con.createStatement();
																					 rst = st.executeQuery(sql4);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("unionName")%></option>
																				<%} %>
																					
																				</select> 
																			</div>
							                                        
							                                        
							                                        <div class="col-md-6 mb-3">
																			<label for="" class="mt-1">Select Branch</label>
																				<select name="driver" id="bBranch" class="form-control">
																				<%
																				    String sql1="Select * from branch";
																				    
																					 st = con.createStatement();
																					 rst = st.executeQuery(sql1);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("branchName")%></option>
																				<%} %>
																					
																				</select> 
																			</div>
																			
																  <div class="col-md-6 mb-3">
							                                            <label>Manager's Name</label>
							                                            <select class="form-control" type="text"
							                                                id="bName" required>
							                                                
							                                                <%
																				    String sqll1="Select * from branch";
																				    
																					 rst = st.executeQuery(sqll1);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("branchManager")%></option>
																				<%} %>
																					
																				</select> 
							                                        </div>
							                                        
							                                        <div class="col-sm-6">
							                                            <label>Password</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                            id="bpass" required>
							                                        </div>
							                                        </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button"
                                                                        class="btn btn-light-secondary"
                                                                        data-dismiss="modal">
                                                                       
                                                                        <span>Close</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal" onclick="addBranch()">
                                                                        <span>Authenticate Branch Manager</span>
                                                                    </button>
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
                                  <img class="img-80 img-radius" src="assets/images/profile.jpg" alt="User-Profile-Image">
                                  <div class="user-details">
                                      <span id="more-details">C A L D R I V A<i class="fa fa-caret-down"></i></span>
                                  </div>
                              </div>
        
                              <div class="main-menu-content">
                                 <ul>
                                      <li class="more-details">
                                           <a href="#">
                                              <i class="fa-solid fa-chart-pie"></i> Generate Report
                                           </a>
                                          
                                      </li>
                                      <li class="more-details">
                                           <a href="logOut">
		                                        <i class="fa-solid fa-right-from-bracket"></i> Logout
		                                    </a>
                                          
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          <div class="p-15 p-b-0">
                              
                          </div>
                          
                          
                          
                          
                          <div class="pcoded-navigation-label" data-i18n="nav.category.navigation"></div>
                          <ul class="pcoded-item pcoded-left-item">
                              <li class="active">
                                  <a href="<%out.println(dashPage); %>" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                      <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                              </li>
                               <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-control-shuffle"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Branches</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="station.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Branch</span>
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
                                      <span class="pcoded-micon"><i class="fa-solid fa-car"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Vehicles</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="vehicles.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Vehicles</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                              </li>
                                  <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="fa-solid fa-users"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Drivers</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="drivers.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Drivers</span>
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
                                      <span class="pcoded-micon"><i class="ti-map"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Trips</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="trips.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Trips</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                                   <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="onBoard.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">See passengers in a trip</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                                  
                                   <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="onBoard.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Started Trips</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                                  
                                   <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="onBoard.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Cancelled Trips</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                                  
                                   <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="onBoard.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Completed Trips</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                                  
                                   <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="onBoard.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Uncompleted Trips</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                                  
                              </li>
                               <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-user"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Passengers</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="passengers.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Passengers</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                  </ul>
                              </li>
                                <li class="pcoded-hasmenu">
                                  <a href="javascript:void(0)" class="waves-effect waves-dark">
                                      <span class="pcoded-micon"><i class="ti-pencil-alt"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Bookings</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="booking.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Booking</span>
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
                                      <span class="pcoded-micon"><i class="fa-solid fa-biohazard"></i></span>
                                      <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Unions</span>
                                      <span class="pcoded-mcaret"></span>
                                  </a>
                                  <ul class="pcoded-submenu">
                                      <li class=" ">
                                          <a href="union.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Union</span>
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
                      <script src="jquery-3.6.0.js" type="text/javascript"></script>
					  <script src="component/jquery/jquery.min.js" type="text/javascript"></script>
					  <script src="component/jquery.validate.min.js" type="text/javascript"></script>
					  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
					  <script type="text/javascript">
					  
					  trip();
						income();
						tUnion();
						tBranch();
						tVehicles();
						tDrivers();
						tStations();
						tUncompleted();
						function addUnion(){
				        	  
				        	  $.ajax({
				        		  
				        		  type:"POST",
				        		  url:"calData.jsp",
				        		  data:{"union":$("#unionM").val(),"name":$("#mName").val(),"pass":$("#uPass").val(),"option":'addunion'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  var obj = JSON.parse(msg);
				        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error('Error');
				        		  }
				        		  
				        		  
				        	  })
				        	  
				          }
						
						function addBranch(){
				        	  
						      
						       $.ajax({
					        		  
					        		  type:"POST",
					        		  url:"calData.jsp",
					        		  data:{"bBranch":$("#bBranch").val(),"name":$("#bName").val(),"union":$("#bUnion").val(),"pass":$("#bpass").val(),"option":'addbranchM'},
					        		 
					        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
					        		  success:function(msg){
					        			  var obj = JSON.parse(msg);
					        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
					        			  
					        		  },
					        		  error(err){
					        			  alertify.error('Error');
					        		  }
					        		  
					        		  
					        	  })
				        	  
				          }
						
						function addFieldStaff(){
				        	   
						       $.ajax({
					        		  
					        		  type:"POST",
					        		  url:"calData.jsp",
					        		  data:{"union":$("#fUnion").val(),"branch":$("#fbranch").val(),"name":$("#staff").val(),"pass":$("#staffPass").val(),"option":'addstaff'},
					        		 
					        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
					        		  success:function(msg){
					        			  var obj = JSON.parse(msg);
					        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
					        			  
					        		  },
					        		  error(err){
					        			  alertify.error('Error');
					        		  }
					        		  
					        		  
					        	  })
				        	  
				          }
						
						
						
						
						
						function trip(){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"test.jsp",
				        		  data:{"option":'adminM'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  var obj = JSON.parse(msg);
				        			  var datapoints = obj[0].dataPoints;
				        			  
				        		
				        			  var options = {
				        					  chart: {
				        					      height: 350,
				        					      type: 'bar',
				        					  },
				        					  dataLabels: {
				        					      enabled: false
				        					  },
				        					  series: [],
				        					  colors: '#435ebe',
				        					  noData: {
				        					    text: 'Loading...'
				        					  }
				        					}

				        					var chart = new ApexCharts(
				        					  document.querySelector("#chart"),
				        					  options
				        					);

				        					chart.render();
				        					
				        					var url = 'NewFile.jsp';

				        					$.getJSON(url, function(response) {
				        					  chart.updateSeries([{
				        					    name: 'Trips',
				        					    data: response
				        					  }])
				        					});

				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						
						
						function income(){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"test.jsp",
				        		  data:{"option":'adminIncome'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  var obj = JSON.parse(msg);
				        			  var datapoints = obj[0].dataPoints;
				        			  
				        			  
				        			  var options = {
				        					  chart: {
				        					      height: 350,
				        					      type: 'bar',
				        					  },
				        					  dataLabels: {
				        					      enabled: false
				        					  },
				        					  series: [],
				        					  colors: '#435ebe',
				        					  noData: {
				        					    text: 'Loading...'
				        					  }
				        					}

				        					var chart = new ApexCharts(
				        					  document.querySelector("#chart1"),
				        					  options
				        					);

				        					chart.render();
				        					
				        					var url = 'adminIncome.jsp';

				        					$.getJSON(url, function(response) {
				        					  chart.updateSeries([{
				        					    name: 'Income',
				        					    data: response
				        					  }])
				        					});

				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						
						/////////////////////   tiles data /////////////////////////////////////////////
						
						function tUnion(){
	            		 $.ajax({
			        		  type:"GET",
			        		  url:"test.jsp",
			        		  data:{"option":'countU'},
			        		 
			        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
			        		  success:function(msg){
			        			  
			        			  var obj = JSON.parse(msg);
			        			
			        				 //  var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
			        				 // $("#seat").val(obj[0].seatForU);
			        			  $("#uni").html(obj[0].totalU);
			        			  $("#un1").html(obj[0].totalU);
				        			 
			        			  
			        		  },
			        		  error(err){
			        			  alertify.error(' an error occured');
			        		  }
			        		  
			        		  
			        	  })
	            	 }
						
						function tBranch(){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"test.jsp",
				        		  data:{"option":'tBranch'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  
				        			  var obj = JSON.parse(msg);
				        			
				        				  // var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
				        			  $("#bra").html(obj[0].totalB);
					        			 
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						
						function tVehicles(val){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"test.jsp",
				        		  data:{"option":'tVehicles'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  
				        			  var obj = JSON.parse(msg);
				        			
				        				 //   var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
				        			  $("#vehi").html(obj[0].totalV);
					        			 
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						
						function tDrivers(){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"test.jsp",
				        		  data:{"option":'tDrivers'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  
				        			  var obj = JSON.parse(msg);
				        			
				        				 //  var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
				        			  $("#dri").html(obj[0].totalDri);
					        			 
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						
						function tStations(){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"test.jsp",
				        		  data:{"option":'tStations'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  
				        			  var obj = JSON.parse(msg);
				        			
				        				  // var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
				        				 
				        				  $("#stat").html(obj[0].totalSta);
				        				  $("#stat1").html(obj[0].totalSta);
					        			 
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						
						function tStaffs(){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"calData.jsp",
				        		  data:{"seat" :val,"option":'seat'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  
				        			  var obj = JSON.parse(msg);
				        			
				        				  // var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
				        				  $("#seat").val(obj[0].seatForU);
					        			 
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						
						function tBranchM(){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"calData.jsp",
				        		  data:{"seat" :val,"option":'seat'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  
				        			  var obj = JSON.parse(msg);
				        			
				        				 //  var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
				        				  $("#seat").val(obj[0].seatForU);
					        			 
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						function tSuper(){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"calData.jsp",
				        		  data:{"seat" :val,"option":'seat'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  
				        			  var obj = JSON.parse(msg);
				        			
				        				 //  var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
				        				  $("#seat").val(obj[0].seatForU);
					        			 
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						
						function tUncompleted(){
		            		 $.ajax({
				        		  type:"GET",
				        		  url:"test.jsp",
				        		  data:{"option":'tUncompleted'},
				        		 
				        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
				        		  success:function(msg){
				        			  
				        			  var obj = JSON.parse(msg);
				        			
				        				 //  var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
				        			  $("#uncomp").html(obj[0].totalUnc);
					        			 
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error(' an error occured');
				        		  }
				        		  
				        		  
				        	  })
		            	 }
						
						function logOut(){
							
							$.ajax({
				        		  
				        		  type:"POST",
				        		  url:"logOut",
				        		  data:{"myid" :ids},
				        		  
				        		  success:function(msg){
				        			  var obj = JSON.parse(msg);
				        			
				        			
				        			  
				        		  },
				        		  error(err){
				        			  alertify.error('Error');
				        		  }
				        		  
				        		  
				        	  })
						}
						
                  	/////////////////////   tiles data /////////////////////////////////////////////
						
						</script>
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
                                                             <div class="col-md-8">
				                                                <h6 class="text-muted font-semibold">Total Union</h6>
				                                                <h4><div id="uni"></div></h4>
				                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-bar-chart f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">% change</p>
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
                                                            <div class="col-md-8">
				                                                <h6 class="text-muted font-semibold">Total Branches</h6>
				                                                <h4><div id="bra"></div></h4>
				                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-file-text-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-green">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">% change</p>
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
                                                            <div class="col-md-8">
				                                                <h6 class="text-muted font-semibold">Total number of vehicles</h6>
				                                                <h4><div id="vehi"></div></h4>
				                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-calendar-check-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-info">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">% change</p>
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
			                                            <div class="col-md-8">
			                                                <h6 class="text-muted font-semibold">Total number of Stations</h6>
			                                                <h4><div id="stat"></div></h4>
			                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-success">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">% change</p>
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
                                                            <div class="col-md-8">
				                                                <h6 class="text-muted font-semibold">Total number of Staffs</h6>
				                                                <h6 class="font-extrabold mb-0">112</h6>
				                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-secondary">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">% change</p>
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
                                                           <div class="col-md-8">
				                                                <h6 class="text-muted font-semibold">Total Branch Managers</h6>
				                                                <h4><div id="stat1"></div></h4>
				                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-info">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">% change</p>
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
                                                             <div class="col-md-8">
				                                                <h6 class="text-muted font-semibold">Total Union Supervisors</h6>
				                                                <h4><div id="un1"></div></h4>
				                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-yellow">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">% change</p>
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
                                                            <div class="col-md-8">
				                                                <h6 class="text-muted font-semibold">Total Uncompleted Trips</h6>
				                                                <h4><div id="uncomp"></div></h4>
				                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-blue">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">% change</p>
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
                                                        <h5> Monthly Income</h5>
                                                    </div>
                                                    <div class="card-body">
				                                         <div id="chart1"></div>
				                                    
				                                   
				                                    </div>
                                                </div>
                                            </div>
                                          
                                            <!--  sale analytics end -->
    
                                            <!--  project and team member start -->
                                           <div class="col-xl-12 col-md-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Trips Per Month</h5>
                                                    </div>
                                                    <div class="card-body">
				                                         <div id="chart"></div>
				                                    
				                                   
				                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-12 col-md-12">
                                                <div class="card ">
                                                    <div class="card-header">
                                                        <h5>System users</h5>
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
                                                        <div class="align-middle m-b-30">
                                                            <img src="assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                            <div class="d-inline-block">
                                                                <h6>David Jones</h6>
                                                                <p class="text-muted m-b-0">Developer</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--  project and team member end -->
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 10]>
    <div class="ie-warning">
        <h1>Warning!!</h1>
        <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
        <div class="iew-container">
            <ul class="iew-download">
                <li>
                    <a href="http://www.google.com/chrome/">
                        <img src="assets/images/browser/chrome.png" alt="Chrome">
                        <div>Chrome</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.mozilla.org/en-US/firefox/new/">
                        <img src="assets/images/browser/firefox.png" alt="Firefox">
                        <div>Firefox</div>
                    </a>
                </li>
                <li>
                    <a href="http://www.opera.com">
                        <img src="assets/images/browser/opera.png" alt="Opera">
                        <div>Opera</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.apple.com/safari/">
                        <img src="assets/images/browser/safari.png" alt="Safari">
                        <div>Safari</div>
                    </a>
                </li>
                <li>
                    <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                        <img src="assets/images/browser/ie.png" alt="">
                        <div>IE (9 & above)</div>
                    </a>
                </li>
            </ul>
        </div>
        <p>Sorry for the inconvenience!</p>
    </div>
    <![endif]-->
    <!-- Warning Section Ends -->
    
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
