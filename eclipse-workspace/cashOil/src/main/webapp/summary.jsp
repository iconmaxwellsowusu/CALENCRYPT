<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%@page import="java.sql.*"%>
<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>

 <%
 String branch1 = (String)session.getAttribute("branch");
 Calendar cal = Calendar.getInstance();
	Calendar cal1 = Calendar.getInstance();
	//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
	
	String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());


 %>

<!DOCTYPE html>
<html lang="en">

<head>
      <title>Cash Oil</title>

  <!-- Favicons -->
  <link href="assets/images/cash.jpg" rel="icon">
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
    <meta name="keywords" content="flat ui, admin Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="codedthemes" />
    <!-- Favicon icon -->
   
    <!-- Google font-->     <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
    
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  
  
   <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" /> 
   
        <!-- /////////////////////        Data Table css /////////////////////    -->  
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css"/>  
    
</head>

<body>

<%
  	try{
	Class.forName("com.mysql.jdbc.Driver"); 

	String b=null;
	String p=null;
	
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
	    String branch = (String)session.getAttribute("branch");
	    String pass = (String)session.getAttribute("pass");
	
        Connection con;
     
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
        Statement statement = con.createStatement();
	ResultSet resultSet = statement.executeQuery("select * from login where branch='"+branch+"' and '"+pass+"'");
	
	while(resultSet.next()){
		b=resultSet.getString("branch");
		p=resultSet.getString("password");
	}
	
         
        if(!pass.equals(p) || !branch.equals(b) || pass.equals(null) || pass.equals("")){
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
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-2.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">John Doe</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                          <div class="media-body">
                                              <h5 class="notification-user">Joseph William</h5>
                                              <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                              <span class="notification-time">30 minutes ago</span>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="waves-effect waves-light">
                                      <div class="media">
                                          <img class="d-flex align-self-center img-radius" src="assets/images/avatar-3.jpg" alt="Generic placeholder image">
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
                              <a href="#!" class="waves-effect waves-light">
                                  <i class="fa-solid fa-user-tie" style="font-size:18px;"></i>
                                  <span style="font-size:12px;">Welcome <% String name = (String)session.getAttribute("name"); out.println(name);%></span>
                                  <i class="ti-angle-down"></i>
                              </a>
                               <ul class="show-notification profile-notification">
                                  <li class="waves-effect waves-light">
                                      <a href="javascript:void(0)">
                                          <i class="ti-settings"></i> Settings
                                      </a>
                                  </li>
                                  
                                  <li class="waves-effect waves-light">
                                      <a href="posts.jsp">
                                          <i class="ti-email"></i>Posts From Head Office
                                      </a>
                                  </li>
                                  <!-- ///////////   ---------------   ////////////////-->
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
                                          <a href="superAdmin.jsp"><i class="ti-user"></i>Admin Page</a>
                                          
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
                                          <a href="supply.jsp" class="waves-effect waves-dark">
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
                        <div class="main-body">
                            <div class="page-wrapper">
                                <div class="page-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>SUMMARY</h5> <% String disable = "true"; %>
                                                      <div class="btn-group " role="group" data-toggle="tooltip" data-placement="top">
								                        <input type="button" class="btn btn-primary btn-sm waves-effect waves-light" title="select month" value="Month" id="month" onclick="manage(this)">
								                        <input type="button" class="btn btn-primary btn-sm waves-effect waves-light" title="select period" value="Period" id="period" onclick="manage1(this)">
								                        <input type="button" class="btn btn-primary btn-sm waves-effect waves-light" title="select branch" value="Branch" id="branch" onclick="manage2(this)">
								                    </div>
								                    
								                    <script type="text/javascript">
								                	function manage(txt) {
								                        var bt = document.getElementById('month');
								                        var txt = '<%= disable%>'
								                        if (txt == 'true') {
								                            bt.disabled = false;
								                            $('#monthlyModal').modal('show');
								                        }
								                        else {
								                            bt.disabled = true;
								                            alert("You are not the admin");
								                            
								                        }
								                    }   
								                	
								                	function manage1(txt) {
								                        var bt = document.getElementById('period');
								                        var txt = '<%= disable%>'
								                        if (txt == 'true') {
								                            bt.disabled = false;
								                            $('#periodModal').modal('show');
								                        }
								                        else {
								                            bt.disabled = true;
								                            alert("You are not the admin");
								                            
								                        }
								                    }  
								                	
								                	
								                	function manage2(txt) {
								                        var bt = document.getElementById('branch');
								                        var txt = '<%= disable%>'
								                        if (txt == 'true') {
								                            bt.disabled = false;
								                            $('#branchModal').modal('show');
								                        }
								                        else {
								                            bt.disabled = true;
								                            alert("You are not the admin");
								                            
								                        }
								                    }  
								                    </script>
								                    
								                              <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="monthlyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Month and Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-6">
                                                                              <label>Select Month</label>
                                                                                <input type="Month" class="form-control" required>
                                                                            </div>
                                                                            
                                                                            <div class="col-sm-6">
                                                                              <label>Select Branch</label>
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select One Value Only</option>
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
													
													<!-- Modal -->
													<div class="modal fade" id="periodModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Dates and Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-6">
                                                                              <label>Select Date From</label>
                                                                                <input type="date" class="form-control" required>
                                                                            </div>
                                                                            
                                                                            <div class="col-sm-6">
                                                                              <label>Select Date To</label>
                                                                                <input type="date" class="form-control" required>
                                                                            </div>
                                                                        </div>
                                                                        
                                                                         <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-8">
                                                                            
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select One Value Only</option>
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
													<div class="modal fade" id="branchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Branch</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="summary.jsp">
													        
													           <div class="form-group row  container justify-content-center">
                                                                            <div class="col-sm-8">
                                                                            <label>Select Branch</label>
                                                                            <select name="select" class="form-control">
                                                                            <option value="opt1">Select One Value Only</option>
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
													        
													        <button type="submit" class="btn btn-primary">Submit</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div> 
                                                    <span>  </span>
                                                    <div class="card-header-right">
                                                        <ul class="list-unstyled card-option">
                                                            <li><i class="fa fa-chevron-left"></i></li>
                                                            <li><i class="fa fa-window-maximize full-card"></i></li>
                                                            <li><i class="fa fa-minus minimize-card"></i></li>
                                                            <li><i class="fa fa-refresh reload-card"></i></li>
                                                            <li><i class="fa fa-times close-card"></i></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="card-block">
                                                       <!-- //////////////////////////////////////////////////  Monthly Modals      ////////////////////////////-->  
                                               <!-- Button trigger modal -->
													
													
													<!-- Modal -->
													<div class="modal fade" id="monthlyModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Month</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="#" method="post">
													        
													           <!-- /////////////////////////   month and year selector ///////////////////////////////-->                         
                                
									                                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
									                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
									                                <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
									
																
																<div class="form-group row  container justify-content-center" >
																<div class="col-md-6 mb-3">
																<label >Select month</label>	                                 
																	<div class='input-group date datepicker' id='table'>						
																	  <input type="text" name="month" class="form-control" required/>
																	  <span class="input-group-addon">
																	    <i class="ti-arrow-circle-down"></i>
																	  </span>
																	</div>
																</div>
																
																
																									
																</div>	
																	<script>
																	
																	$('#table').datepicker({
																		  format: 'MM/yyyy',
																		  icons: {
																		    time: 'fa fa-time',
																		    date: 'fa fa-calendar',
																		    up: 'fa fa-chevron-up',
																		    down: 'fa fa-chevron-down',
																		    previous: 'fa fa-chevron-left',
																		    next: 'fa fa-chevron-right',
																		    today: 'fa fa-screenshot',
																		    clear: 'fa fa-trash',
																		    close: 'fa fa-remove'
																		  },
																		  startView: "months",
																		  minViewMode: "months"
																		});
																	
																	</script>
									                         <!-- //////////////////////////////////////-------------------------//////////////////////// -->  
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary">Generate Report</button>
													        <button type="reset" class="btn btn-secondary">Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
                                               <!-- //////////////////////////////////////////////////   Date  Modals      ////////////////////////////-->    
                                               
                                               
                                               	<!-- Modal -->
													<div class="modal fade" id="dateModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select Dates</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="#">
													        
													          <div class="form-group row  container justify-content-center" >
                                                                            <div class="col-sm-6">
                                                                               <label>Date from</label>
                                                                                <input type="Date" class="form-control" name="date1">
                                                                            </div>
                                                                            <div class="col-sm-6">
                                                                              <label>Date to</label>
                                                                                <input type="Date" class="form-control" name="date2"
                                                                               required >
                                                                            </div>
                                                                            
                                                                          </div> 
                                                                        	
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary" >Generate Report</button>
													        <button type="reset" class="btn btn-secondary" >Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													      
													    </div>
													  </div>
													</div>
													
													
													         
													
   
                                               <!-- //////////////////////////////////////////////////    file Modals     ////////////////////////////-->
                                               
                                               	<!-- Modal -->
													<div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLongTitle">Select File</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        <form action="uploadImage" method="post" enctype="multipart/form-data">
													        
													           <div class="form-group row  container justify-content-center" >
                                                                            
                                                                            <div class="col-sm-8">
                                                                               <label><i class="fa-solid fa-cloud-arrow-up"></i>Select pdf file</label>
                                                                                <input type="file" class="form-control" name="pdf" required>
                                                                            </div>
                                                                            
                                                                        </div> 
													        
													         <div class="modal-footer">
													        
													        <button type="submit" class="btn btn-primary" >Send Summary</button>
													        <button type="reset" class="btn btn-secondary" >Reset</button>
													        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
													        
													      </div>
													        </form>
													      </div>
													     
													     
													     
													     
													     
													     
													     
													     
																			<!-- <video id="player" controls autoplay></video>
																			<button id="capture">Capture</button>
																			<canvas id="canvas" width=320 height=240></canvas>
																			<script>
																			  const player = document.getElementById('player');
																			  const canvas = document.getElementById('canvas');
																			  const context = canvas.getContext('2d');
																			  const captureButton = document.getElementById('capture');
																			
																			  const constraints = {
																			    video: true,
																			  };
																			
																			  captureButton.addEventListener('click', () => {
																			    // Draw the video frame to the canvas.
																			    context.drawImage(player, 0, 0, canvas.width, canvas.height);
																			  });
																			
																			  // Attach the video stream to the video element and autoplay.
																			  navigator.mediaDevices.getUserMedia(constraints)
																			    .then((stream) => {
																			      player.srcObject = stream;
																			    });
																			</script> -->
													     
													     
													     
													     
													     
													     
													     
													     
													     
													     
													     
													      
													    </div>
													  </div>
													</div>
                                         
                                                    <div align="center">
                                                    <br>
                                                    <button class="btn waves-effect waves-light btn-inverse btn-outline-inverse" data-toggle="modal" data-target="#monthlyModal1"><i class="fa-solid fa-calendar-days"></i>Generate Monthly Summary</button>
                                                    <button class="btn waves-effect waves-light btn-info btn-outline-info" data-toggle="modal" data-target="#dateModal1"><i class="ti-timer"></i>Generate period Based summary</button>
                                                     <button class="btn waves-effect waves-light btn-primary btn-outline-primary" data-toggle="modal" data-target="#fileModal"><i class="fa-solid fa-cloud-arrow-up"></i>Send Summary to Head Office</button>
                                                    
                                                     <button class="btn waves-effect waves-light btn-success btn-outline-success" onclick="print()"><i class="fa-solid fa-print"></i>Print/Download<i class="fa-solid fa-cloud-arrow-down"></i></button>
                                                      
                                                    </div>
                                                    
                                                    <br>
                                                    
                                                    <script src="jquery-3.6.0.js" type="text/javascript"></script>
													                       <script src="component/jquery/jquery.min.js" type="text/javascript"></script>
													                       <script src="component/jquery.validate.min.js" type="text/javascript"></script>
													                       
													                       <script type="text/javascript" src="DataTables/datatables.min.js"></script>
													                       <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>
													                       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
													                       <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

																	    <script>
																	          function print(){
																	        	  
																	        
																	        	  $.ajax({
																	        		  
																	        		  type:"POST",
																	        		  url:"printSummary.jsp",
																	        		  data:{"print":'print'},
																	        		  
																	        		  success:function(msg){
																	        			  var obj = JSON.parse(msg);
																	        			  
																	        		  },
																	        		  error(err){
																	        			 
																	        		  }
																	        		  
																	        		  
																	        	  })
																	        	  
																	          }
																	          
																	          
																	    </script>
                                                    
                                                     <%
                                        
                                       
                                        
                                        Connection con;
                                        ResultSet rs;
                                        Statement st;
                                        
                                        double pmsOpen=0;
                                        double agoOpen=0;
                                        double pmsClose=0;
                                        double agoClose=0;
                                        double rate=0;
                                        double currentRate=0;
                                        double closingStock=0;
                                        double productSupplid=0;
                                        double win = 0;
                                        double shortf=0; 
                                        double cumGain =0;
                                        double lube=0;
                                        double washingBay=0;
                                        double water=0;
                                        double elec=0;
                                        double debtReceived=0;
                                        double debtRecov=0;
                                        double gen=0;
                                        double payR=0;
                                        double tt=0;
                                        double npa=0;
                                        double gsa=0;
                                        double epa=0;
                                        double property=0;
                                        double statutory=0;
                                        double maintenance=0;
                                        double openStock = 0;
                                        double cum=0;
                                        double lodgement=0.00;
                                        
                                        String month = request.getParameter("month");
                                        String date1 = request.getParameter("date1");
                                        String date2 = request.getParameter("date2");
                                        
                                        if(month==null && date1 == null){
                                        	out.println("please select month or dates");
                                        }
                                        
                                        
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                        st=con.createStatement();
                                        
                                        if(month != null){
                                        	session.setAttribute("month", month);
                                        	String m = (String)session.getAttribute("month");
                                        	System.out.println(m);
                                        	//open Stock pms	
                                        String sql="select * from closingStock where month='"+month+"' and product='PMS' and branch='"+branch1+"' ORDER BY ID asc LIMIT 1";
                                        rs=st.executeQuery(sql);
                                        while(rs.next()){
                                        	pmsOpen=rs.getDouble("opens"); 
                                        	rate=rs.getDouble("rate"); 
                                        	
                                        }
                                          //open Stock Ago
                                        String sql1="select * from closingStock where month='"+month+"' and product='AGO' and branch='"+branch1+"' ORDER BY ID asc LIMIT 1";
                                        rs=st.executeQuery(sql1);
                                        while(rs.next()){
                                        	agoOpen=rs.getDouble("opens"); 
                                        	
                                        }
                                        openStock = pmsOpen+agoOpen*rate;
                                        session.setAttribute("openStock", openStock);
                                       
                                    	//close Stock pms
                                    	 
                                        String sql2="SELECT rate,closingStockvalue FROM closingStock where month='"+month+"' and product='PMS' and branch='"+branch1+"' ORDER BY ID desc LIMIT 1";
                                        rs=st.executeQuery(sql2);
                                        while(rs.next()){
                                        	pmsClose=rs.getDouble("closingStockvalue"); 
                                        	currentRate = rs.getDouble("rate");
                                        	 
                                        	
                                        }
                                          //close Stock Ago
                                        String sql3="SELECT closeReading,closingStockvalue FROM closingStock where month='"+month+"' and product='AGO' and branch='"+branch1+"' ORDER BY ID desc LIMIT 1";
                                        rs=st.executeQuery(sql3);
                                        while(rs.next()){
                                        	agoClose=rs.getDouble("closingStockvalue"); 
                                        	
                                        }
                                        
                                        closingStock=pmsClose+agoClose*currentRate;
                                        session.setAttribute("closingStock",closingStock);
                                        
                                        // Bank Lodgement 
                                        String lod="SELECT sum(expected) FROM closingStock where month='"+month+"' and branch='"+branch1+"'";
                                        rs=st.executeQuery(lod);
                                        while(rs.next()){
                                        	lodgement=rs.getDouble(1); 
                                        	session.setAttribute("lodgement", lodgement);
                                        }
                                       //product supplied
                                        
                                        ResultSet rs2; 
                                        String sql4="select sum(total) from productsupply where month='"+month+"' and branch='"+branch1+"'";
                                        
                                        rs2=st.executeQuery(sql4);
                                        while(rs2.next()){
                                        	productSupplid = rs2.getDouble(1);
                                            session.setAttribute("productSupplid", productSupplid);
                                       } 
                                       
                                      // winfall
                                       
                                        
                                        ResultSet rs3;
                                        String sql5="select sum(winFall) from closingStock where month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql5);
                                        while(rs3.next()){
                                        	win = rs3.getDouble(1);
                                        	session.setAttribute("win", win);
                                        }
                                        
                                     // shortfall
                                        
                                        
                                        //ResultSet rs3;
                                        String sql6="select sum(shortFall) from closingStock where month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql6);
                                        while(rs3.next()){
                                        	shortf = rs3.getDouble(1);
                                        	session.setAttribute("shortf", shortf);
                                        }
                                        
                                     // total/cummulative Gain 
                                        
                                        
                                        
                                        
                                        
                                        
                                        // lube Bay
                                        
                                        //ResultSet rs3;
                                        String sql7="select sum(litresSold*rate) from lubesale where month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql7);
                                        while(rs3.next()){
                                        	lube = rs3.getDouble(1);
                                        	session.setAttribute("lube", lube);
                                        	
                                        } 
                                        
                                     // washing Bay
                                        
                                        //ResultSet rs3;
                                        String sql8="select sum(deposite) from washingbaydata where month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql8);
                                        while(rs3.next()){
                                        	washingBay = rs3.getDouble(1);
                                        	session.setAttribute("washingBay", washingBay);
                                        	
                                        }
                                        
                                        
                                        // Debt Receivable
                                        
                                        //ResultSet rs3;
                                        String sql9="select sum(total) from credit where branch='"+branch1+"' and month='"+month+"'";
                                        rs3=st.executeQuery(sql9);
                                        while(rs3.next()){
                                        	debtReceived = rs3.getDouble(1);
                                        	session.setAttribute("debtReceived", debtReceived);
                                        	
                                        }
                                        
                                        // Debt Recoverd
                                        
                                        
                                       // ResultSet rs3;
                                        String sql10="select sum(receivedFromDebtors) from closingStock where branch='"+branch1+"' and month='"+month+"'";
                                        rs3=st.executeQuery(sql10);
                                        while(rs3.next()){
                                        	debtRecov = rs3.getDouble(1);
                                        	session.setAttribute("debtRecov", debtRecov);
                                        }
                                        
                                        
                                        // Electricity
                                        //PER = stockBalance-sales;
                                        
                                       // ResultSet rs3;
                                        String sql11="select sum(amount)from utility where uType='Prepaid'and month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql11);
                                        while(rs3.next()){
                                        	elec = rs3.getDouble(1);
                                        	session.setAttribute("elec", elec);
                                        	
                                        }
                                        
                                        
                                     // Gen Set
                                        //PER = stockBalance-sales;
                                        
                                       // ResultSet rs3;
                                        String sql12="select sum(amount)from utility where uType='Gen-Fuel' and month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql12);
                                        while(rs3.next()){
                                        	gen = rs3.getDouble(1);
                                        	session.setAttribute("gen", gen);
                                        }
                                        
                                        // Water
                                       // PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql13="select sum(amount)from utility where uType='Water' and month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql13);
                                        while(rs3.next()){
                                        	water = rs3.getDouble(1);
                                        	session.setAttribute("water", water);
                                        }
                                        
                                        // Payroll
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql14="select sum(allowaceandsalary) from payroll where month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql14);
                                        while(rs3.next()){
                                        	payR = rs3.getDouble(1);
                                        	session.setAttribute("payR", payR);
                                        	
                                        }
                                        
                                        // tnt
                                        
                                        //later
                                        
                                     // NPA
                                       
                                        
                                        //ResultSet rs3;
                                        String sql15="select sum(amount)from fuelstatutory where cert='NPA' and month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql15);
                                        while(rs3.next()){
                                        	npa = rs3.getDouble(1);
                                        	session.setAttribute("npa", npa);
                                        	
                                        }
                                        
                                        // GSA
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql16="select sum(amount)from fuelstatutory where cert='GSA' and month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql16);
                                        while(rs3.next()){
                                        	gsa = rs3.getDouble(1);
                                        	session.setAttribute("gsa", gsa);
                                        	
                                        }
                                        
                                        // EPA
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql17="select sum(amount)from fuelstatutory where cert='EPA' and month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql17);
                                        while(rs3.next()){
                                        	epa = rs3.getDouble(1);
                                        	session.setAttribute("epa", epa);
                                        }
                                        
                                        // Property Rate
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql18="select sum(amount)from fuelstatutory where cert='Property Rate' and month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql18);
                                        while(rs3.next()){
                                        	property = rs3.getDouble(1);
                                        	session.setAttribute("property", property);
                                        }
                                        
                                        // Statutory
                                        //PER = stockBalance-sales;
                                        
                                       // ResultSet rs3;
                                        String sql19="select sum(amount)from fuelstatutory where month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql19);
                                        while(rs3.next()){
                                        	statutory = rs3.getDouble(1);
                                        	session.setAttribute("statutory", statutory);
                                        }
                                        
                                        // Maintenance
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql20="select sum(amount)from statiomaitenance where month='"+month+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql20);
                                        while(rs3.next()){
                                        	maintenance = rs3.getDouble(1);
                                        	session.setAttribute("maintenance", maintenance);
                                        }
                                        
                                        
                                        double opens=0;
                                        double supply=0;
                                        double stockBalance=0;
                                        double sales=0;
                                        double PER=0;
                                        double dipping=0;
                                        double gain=0;
                                        double loss=0;
                                        
                                        String ssql="select * from closingStock where month='"+month+"' and product ='PMS' and branch='"+branch1+"' ORDER BY ID asc LIMIT 1";
                                        //open Stock
                                        rs=st.executeQuery(ssql);
                                        while(rs.next()){
                                        	opens=rs.getDouble("opens"); 
                                        
                                        }
                                       //closing Stock
                                        ResultSet rs1;
                                        String ssql1 ="select sum(loads) from closingStock where month='"+month+"' and product ='PMS' and branch='"+branch1+"'";
                                        rs1=st.executeQuery(ssql1);
                                        while(rs1.next()){
                                        	supply = rs1.getDouble(1);
                                        	
                                        }
                                        //Stock Bal
                                        stockBalance = opens+supply;
                                        // sales
                                        ResultSet rrs2; 
                                        String ssql2="select sum(salesltr) from closingStock where month='"+month+"' and product ='PMS' and branch='"+branch1+"'";
                                        
                                        rrs2=st.executeQuery(ssql2);
                                        while(rrs2.next()){
                                        	sales = rrs2.getDouble(1);
                                        }
                                        // closing Stock per meter reading
                                        PER = stockBalance-sales;
                                        //dipping 
                                        ResultSet rrs3;
                                        String ssql3="select * from closingStock where month='"+month+"' and product ='PMS' and branch='"+branch1+"' ORDER BY ID desc LIMIT 1";
                                        rrs3=st.executeQuery(ssql3);
                                        while(rrs3.next()){
                                        	dipping = rrs3.getDouble("closingStockvalue");
                                        	
                                        }
                                        //gain or loss
                                        gain= dipping-PER;
                                        if(gain <=0){
                                        	loss=dipping-PER;
                                        	gain=0;
                                        }else if(gain >=0 ){
                                        	gain = dipping-PER;
                                        	loss = 0;
                                        }
                                        System.out.println(gain);
                                        
                                        
                                        
                                    
                                        double Agoopens=0;
                                        double Agosupply=0;
                                        double AgostockBalance=0;
                                        double Agosales=0;
                                        double AgoPER=0;
                                        double Agodipping=0;
                                        double Agogain=0;
                                        double Agoloss=0;
                                        if(month !=null){
                                        String Agosql="select * from closingStock where month='"+month+"' and product ='AGO' and branch='"+branch1+"' ORDER BY ID asc LIMIT 1";
                                        //open Stock
                                        rs=st.executeQuery(Agosql);
                                        while(rs.next()){
                                        	Agoopens=rs.getDouble("opens");
                                        }
                                       //closing Stock
                                        ResultSet Agors1;
                                        String Agosql1 ="select * from closingStock where month='"+month+"' and product ='AGO' and branch='"+branch1+"'";
                                        Agors1=st.executeQuery(Agosql1);
                                        while(Agors1.next()){
                                        	Agosupply += Agors1.getDouble("loads");
                                        	
                                        }
                                        //Stock Bal
                                        AgostockBalance = Agoopens+Agosupply;
                                        // sales
                                        ResultSet Agors2; 
                                        String Agosql2="select sum(salesltr) from closingStock where month='"+month+"'and product ='AGO' and branch='"+branch1+"'";
                                        
                                        Agors2=st.executeQuery(Agosql2);
                                        while(Agors2.next()){
                                        	Agosales = Agors2.getDouble(1);
                                        }
                                        // closing Stock per meter reading
                                        AgoPER = AgostockBalance-Agosales;
                                        //dipping 
                                        ResultSet Agors3;
                                        String Agosql3="select * from closingStock where month='"+month+"' and product ='AGO' and branch='"+branch1+"' ORDER BY ID desc LIMIT 1";
                                        Agors3=st.executeQuery(Agosql3);
                                        while(Agors3.next()){
                                        	Agodipping = Agors3.getDouble("closingStockvalue");
                                        	
                                        }
                                        //gain or loss
                                        Agogain= Agodipping-AgoPER;
                                       
                                        
                                       
                                        }
                                        cum=Agogain + gain;
                                        session.setAttribute("cum", cum);
                                        } 
                                        
                                        else if(date1 != null){
                                        	session.setAttribute("date1", date1);
                                        	session.setAttribute("date2", date2);
                                        	
                                         	
                                        	//open Stock pms	
                                        String sqlll="select * from closingStock where date between'"+date1+"' and'"+date2+"' and product='PMS' and branch='"+branch1+"' ORDER BY ID ASC LIMIT 1";
                                        rs=st.executeQuery(sqlll);
                                        while(rs.next()){
                                        	pmsOpen=rs.getDouble("opens"); 
                                        	rate=rs.getDouble("rate"); 
                                        	
                                        }
                                          //open Stock Ago
                                        String sql1="select * from closingStock where date between'"+date1+"' and'"+date2+"' and product='AGO' and branch='"+branch1+"' ORDER BY ID ASC LIMIT 1";
                                        rs=st.executeQuery(sql1);
                                        while(rs.next()){
                                        	agoOpen=rs.getDouble("opens"); 
                                        	
                                        }
                                        
                                        
                                        double totalOpen = pmsOpen+agoOpen;
                                        openStock = totalOpen*rate;
                                        
                                        session.setAttribute("openStock", openStock);
                                        
                                    	//close Stock pms
                                    	 
                                        String sql2="SELECT rate,closingStockvalue FROM closingStock where date between'"+date1+"' and'"+date2+"' and product='PMS' and branch='"+branch1+"'  ORDER BY ID DESC LIMIT 1";
                                        rs=st.executeQuery(sql2);
                                        while(rs.next()){
                                        	pmsClose=rs.getDouble("closingStockvalue"); 
                                        	currentRate = rs.getDouble("rate");
                                        }
                                          //close Stock Ago
                                        String sql3="SELECT closeReading,closingStockvalue FROM closingStock where date between'"+date1+"' and'"+date2+"' and product='AGO' and branch='"+branch1+"' ORDER BY ID DESC LIMIT 1";
                                        rs=st.executeQuery(sql3);
                                        while(rs.next()){
                                        	agoClose=rs.getDouble("closingStockvalue"); 
                                        
                                        }
                                        double totalclo = pmsClose+agoClose;
                                        closingStock=totalclo*currentRate;
                                        session.setAttribute("closingStock",closingStock);
                                       
                                        //Bank Lodgement
                                        
                                       String lod="SELECT sum(expected) FROM closingStock where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs=st.executeQuery(lod);
                                        while(rs.next()){
                                        	lodgement=rs.getDouble(1); 
                                        	session.setAttribute("lodgement", lodgement);
                                        }
                                        
                                        
                                        //product supplied
                                        
                                        ResultSet rs2; 
                                        String sql4="select sum(total) from productsupply where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        
                                        rs2=st.executeQuery(sql4);
                                        while(rs2.next()){
                                        	productSupplid = rs2.getDouble(1);
                                            session.setAttribute("productSupplid", productSupplid);
                                       } 
                                       
                                      // winfall
                                        ResultSet rs3;
                                        String sql5="select sum(winFall) from closingStock where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql5);
                                        while(rs3.next()){
                                        	win = rs3.getDouble(1);
                                        	session.setAttribute("win", win);
                                        }
                                        
                                     // shortfall
                                        
                                        
                                        //ResultSet rs3;
                                        String sql6="select sum(shortFall) from closingStock where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql6);
                                        while(rs3.next()){
                                        	shortf = rs3.getDouble(1);
                                        	session.setAttribute("shortf", shortf);
                                        }
                                        
                                     // total/cummulative Gain 
                                        
                                        
                                        
                                        
                                        
                                        
                                        // lube Bay
                                        
                                        //ResultSet rs3;
                                        String sql7="select sum(litresSold*rate) from lubesale where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql7);
                                        while(rs3.next()){
                                        	lube = rs3.getDouble(1);
                                        	session.setAttribute("lube", lube);
                                        	
                                        } 
                                        
                                     // washing Bay
                                        
                                        //ResultSet rs3;
                                        String sql8="select sum(deposite) from washingbaydata where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql8);
                                        while(rs3.next()){
                                        	washingBay = rs3.getDouble(1);
                                        	session.setAttribute("washingBay", washingBay);
                                        	
                                        }
                                        
                                        
                                        // Debt Receivable
                                        
                                        //ResultSet rs3;
                                        String sql9="select sum(total) from credit where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql9);
                                        while(rs3.next()){
                                        	debtReceived = rs3.getDouble(1);
                                        	session.setAttribute("debtReceived", debtReceived);
                                        	
                                        }
                                        
                                        // Debt Recoverd
                                        
                                        
                                       // ResultSet rs3;
                                        String sql10="select sum(receivedFromDebtors) from closingStock where date between'"+date1+"'and '"+date2+"'and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql10);
                                        while(rs3.next()){
                                        	debtRecov = rs3.getDouble(1);
                                        	session.setAttribute("debtRecov", debtRecov);
                                        }
                                        
                                        
                                        // Electricity
                                        //PER = stockBalance-sales;
                                        
                                       // ResultSet rs3;
                                        String sql11="select sum(amount)from utility where uType='Prepaid'and date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql11);
                                        while(rs3.next()){
                                        	elec = rs3.getDouble(1);
                                        	session.setAttribute("elec", elec);
                                        	
                                        }
                                        
                                        
                                     // Gen Set
                                        //PER = stockBalance-sales;
                                        
                                       // ResultSet rs3;
                                        String sql12="select sum(amount)from utility where uType='Gen-Fuel' and date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql12);
                                        while(rs3.next()){
                                        	gen = rs3.getDouble(1);
                                        	session.setAttribute("gen", gen);
                                        }
                                        
                                        // Water
                                       // PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql13="select sum(amount)from utility where uType='Water' and date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql13);
                                        while(rs3.next()){
                                        	water = rs3.getDouble(1);
                                        	session.setAttribute("water", water);
                                        }
                                        
                                        // Payroll
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql14="select sum(allowaceandsalary) from payroll where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql14);
                                        while(rs3.next()){
                                        	payR = rs3.getDouble(1);
                                        	session.setAttribute("payR", payR);
                                        	
                                        }
                                        
                                        // tnt
                                        
                                        //later
                                        
                                     // NPA
                                       
                                        
                                        //ResultSet rs3;
                                        String sql15="select sum(amount)from fuelstatutory where cert='NPA' and date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql15);
                                        while(rs3.next()){
                                        	npa = rs3.getDouble(1);
                                        	session.setAttribute("npa", npa);
                                        	
                                        }
                                        
                                        // GSA
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql16="select sum(amount)from fuelstatutory where cert='GSA' and date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql16);
                                        while(rs3.next()){
                                        	gsa = rs3.getDouble(1);
                                        	session.setAttribute("gsa", gsa);
                                        	
                                        }
                                        
                                        // EPA
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql17="select sum(amount)from fuelstatutory where cert='EPA' and date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql17);
                                        while(rs3.next()){
                                        	epa = rs3.getDouble(1);
                                        	session.setAttribute("epa", epa);
                                        }
                                        
                                        // Property Rate
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql18="select sum(amount)from fuelstatutory where cert='Property Rate' and date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql18);
                                        while(rs3.next()){
                                        	property = rs3.getDouble(1);
                                        	session.setAttribute("property", property);
                                        }
                                        
                                        // Statutory
                                        //PER = stockBalance-sales;
                                        
                                       // ResultSet rs3;
                                        String sql19="select sum(amount)from fuelstatutory where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql19);
                                        while(rs3.next()){
                                        	statutory = rs3.getDouble(1);
                                        	session.setAttribute("statutory", statutory);
                                        }
                                        
                                        // Maintenance
                                        //PER = stockBalance-sales;
                                        
                                        //ResultSet rs3;
                                        String sql20="select sum(amount)from statiomaitenance where date between'"+date1+"' and'"+date2+"' and branch='"+branch1+"'";
                                        rs3=st.executeQuery(sql20);
                                        while(rs3.next()){
                                        	maintenance = rs3.getDouble(1);
                                        	session.setAttribute("maintenance", maintenance);
                                        }
                                        	
                                        double opens=0;
                                        double supply=0;
                                        double stockBalance=0;
                                        double sales=0;
                                        double PER=0;
                                        double dipping=0;
                                        double gain=0;
                                        double loss=0;
                                        double total=0.00;
                                        String month1 = "";
                                        ResultSet result;
                                        String period = "SELECT u1.product,u1.loads, v.month,v.mindt,u1.opens,v.maxdt,u2.closingStockvalue FROM ( SELECT product, month, MIN(date) mindt, MAX(date) maxdt FROM closingstock WHERE product IN ('PMS') and branch IN ('"+branch1+"') and date between '"+date1+"' and '"+date2+"' GROUP BY product, month) v JOIN closingstock u1 USING (product) JOIN closingstock u2 USING (product) WHERE u1.date=v.mindt AND u2.date=v.maxdt"
                                        ;
                                        Statement st1 = con.createStatement();
                                        result = st.executeQuery(period);
                                        while(result.next()){
                                        month1 = result.getString(3);
                                        opens=result.getDouble("opens");
                                        dipping = result.getDouble("closingStockvalue");
                                        
                                        System.out.println(month1);
                                                
                                              Statement st2 = con.createStatement();
                                              ResultSet tst; 
                                              String rst = "SELECT sum(loads) FROM closingstock WHERE month ='"+month1+"' and product='PMS' and branch='"+branch1+"'";
                                              tst = st2.executeQuery(rst);
                                              while(tst.next()){
                                              	supply = tst.getDouble(1);
                                              }
                                             
                                               
                                             
                                              stockBalance = opens+supply;
                                             
                                              
                                              
                                              Statement st3 = con.createStatement();
                                              ResultSet tst1; 
                                              String rst1 = "SELECT sum(salesltr) FROM closingstock WHERE month ='"+month1+"' and product='PMS' and branch='"+branch1+"'";
                                              tst1 = st3.executeQuery(rst1);
                                              while(tst1.next()){
                                              	sales = tst1.getDouble(1);
                                              }
                                              
                                              PER = stockBalance-sales;
                                                
                                              
                                           
                                              gain= dipping-PER;
                                              if(gain <=0){
                                              	loss=dipping-PER;
                                              	gain=0;
                                              }else if(gain >=0 ){
                                              	gain = dipping-PER;
                                              	loss = 0;
                                              }
                                              
                                              
                                           
                                                                                            
                                             total += gain; 
                                           
                                        }     
                                        
                                        
                                        
                                        double Agoopens=0;
                                        double Agosupply=0;
                                        double AgostockBalance=0;
                                        double Agosales=0;
                                        double AgoPER=0;
                                        double Agodipping=0;
                                        double Agogain=0;
                                        double Agoloss=0;
                                        double Agototal=0.00;
                                          String month2="";
                                          
                                          ResultSet result1;
                                          String period1 = "SELECT u1.product,u1.loads, v.month,v.mindt,u1.opens,v.maxdt,u2.closingStockvalue FROM ( SELECT product, month, MIN(date) mindt, MAX(date) maxdt FROM closingstock WHERE product IN ('AGO') and branch IN ('"+branch1+"') and date between '"+date1+"' and '"+date2+"' GROUP BY product, month) v JOIN closingstock u1 USING (product) JOIN closingstock u2 USING (product) WHERE u1.date=v.mindt AND u2.date=v.maxdt";
                                       
                                          result = st.executeQuery(period1);
                                          while(result.next()){
                                         
                                        	  Agoopens=result.getDouble("opens");
                                        	  Agodipping = result.getDouble("closingStockvalue");
                                        	  month2 = result.getString(3);
                                        
                                                
                                                
                                                 Statement st2 = con.createStatement();
                                                ResultSet tst; 
                                                String rst = "SELECT sum(loads) FROM closingstock WHERE month ='"+month2+"' and product='AGO' and branch='"+branch1+"'";
                                                tst = st2.executeQuery(rst);
                                                while(tst.next()){
                                                	Agosupply = tst.getDouble(1);
                                                }
                                                
                                               
                                               
                                                AgostockBalance = Agoopens+Agosupply;
                                                  
                                                
                                                
                                                Statement st3 = con.createStatement();
                                                ResultSet tst1; 
                                                String rst1 = "SELECT sum(salesltr) FROM closingstock WHERE month ='"+month2+"' and product='AGO' and branch='"+branch1+"'";
                                                tst1 = st3.executeQuery(rst1);
                                                while(tst1.next()){
                                                	Agosales = tst1.getDouble(1);
                                                }
                                               
                                               
                                                AgoPER = AgostockBalance-Agosales;
                                               
                                                
                                               
                                                Agogain= Agodipping-AgoPER;
                                                if(Agogain <=0){
                                                	Agoloss= Agodipping-AgoPER;
                                                	Agogain=0;
                                                }else if(Agogain >=0 ){
                                                	Agogain = Agodipping-AgoPER;
                                                	Agoloss = 0;
                                                }
                                                
                                                
                                               
                                               Agototal += Agogain; 
                                          }     
                                        
                                        
                                        
                                        cum = Agototal + total;
                                        session.setAttribute("cum", cum);
                                     
                                            
                                            }
                                       
                                        
                                        %>    
                                                                   
                                        
                                                    
                                                     <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table table-sm" id="testData">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th></th>
                                                                <th>Opening Stock <br> Value</th>
                                                                <th>Total Bank <br> Lodgement</th>
                                                                <th>Closing Stock <br> Value</th>
                                                                <th>Total Product <br> Value</th>
                                                                <th>Win Fall</th>
                                                                <th>Short Fall</th>
                                                                <th>Cumulative Gain</th>
                                                                <th>Lube Bay</th>
                                                                <th>Washing Bay</th>
                                                                <th>Deptors Receivable</th>
                                                                
                                                                <th>Dept Recovery</th>
                                                                <th>Electricity</th>
                                                                <th>Gen-Set</th>
                                                                <th>Water</th>
                                                                <th>Pay Roll</th>
                                                                <th>T&T</th>
                                                                <th>NPA</th>
                                                                <th>GSA</th>
                                                                <th>EPA</th>
                                                                <th>Property Rate</th>
                                                                <th>Statutory</th>
                                                                <th>Repair And Maintenance</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row">1</th>
                                                                <td>Opening Stock</td>
                                                                <td><%out.println(" openStock = " + openStock); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                            
                                                              <tr>
                                                                <th scope="row">2</th>
                                                                <td>Cash Lodgement</td>
                                                                <td></td>
                                                                <td><%out.println(lodgement+" "); %> lodged</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                            
                                                              <tr>
                                                                <th scope="row">3</th>
                                                                <td>Closing Stock</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println(" closingStock = "+ closingStock); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">4</th>
                                                                <td>Total Supply</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( " productSupplid = " +productSupplid); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">5</th>
                                                                <td>WINFALL</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println(" win = "+ win); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">6</th>
                                                                <td>SHORTFALL</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( "shortf = "+ shortf); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">7</th>
                                                                <td>CUMMULATIVE GAIN</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println("Cummulative Gain = " +cum );%></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">8</th>
                                                                <td>LUBE BAY</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println(" lube = "+ lube); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">9</th>
                                                                <td>WASHING BAY</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println(" washingBay = "+ washingBay); %></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">10</th>
                                                                <td>DEBT RECEIVABLE</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println(" debtReceived = " + debtReceived); %></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                            
                                                            <tr>
                                                                <th scope="row">10</th>
                                                                <td>DEBT Recovery</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td><%out.println(" debtRecov = " + debtRecov); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                            
                                                              <tr>
                                                                <th scope="row">11</th>
                                                                <td>ELECTICITY</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td><%out.println( " elec = " +elec); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">12</th>
                                                                <td>GENSET</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( " gen = "+gen); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">13</th>
                                                                <td>WATER</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( " water = " + water); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">14</th>
                                                                <td>PAYROLL</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( " payR = "+ payR); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">15</th>
                                                                <td>T&T</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( " T&T = " + npa); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">16</th>
                                                                <td>NPA</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( " npa = " + npa); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">17</th>
                                                                <td>GSA</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( " gsa = " + gsa); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">18</th>
                                                                <td>EPA</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( " epa = "+ epa); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">19</th>
                                                                <td>PROPERTY RATE</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println(" property = " + property); %></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">20</th>
                                                                <td>STATUTORY</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println(" statutory = "+statutory ); %></td>
                                                                <td></td>
                                                                
                                                            </tr>
                                                              <tr>
                                                                <th scope="row">21</th>
                                                                <td>MAINTENANCE</td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><%out.println( " maintenance = "+ maintenance); %></td>
                                                                
                                                            </tr>
                                                             
                                                              
                                                            
                                                            
                                                          
                                                           
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                                    
                                              
                                              <br>
                                              <br>
                                              
                                          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                                            <script>
												$(document).ready( function () {
												    $('#testDat').DataTable();
												} );
												
												
												</script>
                                                    
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <div class="page-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>My Uploaded Summary pdf</h5> 
                                            
                                                    
                                               <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table table-sm" id="testData1">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Date</th>
                                                                <th>Received Reports</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                        
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                        st = con.createStatement();
                                                        String sql = "select * from summarypdf where branch='"+branch1+"'";
                                                        rs=st.executeQuery(sql);
                                                        int i=0;
                                                        while(rs.next()){
                                                        	
                                                        	
                                                        	
			                                                        %>
			                                                            <tr>
			                                                                <th scope="row"><%out.println(i+=1); %></th>
			                                                                <td><%out.println(rs.getString("date"));%></td>
			                                                                <td>
			                                                                <a href="sumpdf.jsp?id=<%=rs.getString("ID") %>"> <img src="assets/images/pdf.jpg"width=20 height=20></a>
			                                                              
			                                                                </td>
			                                                                <td>
			                                                               <button onclick="testDelete(<%=rs.getString(1)%>)" title="Delete"><i class="ti-trash" style="color:red; cursor:pointer; padding:5px;"></i></button>
														                   <%--  <a href="viewInvoice.jsp?id=<%=rs.getString("ID") %>" title="Veiw"><i class="ti-eye" style="color:black; padding:5px;"></i></a> --%>
														                    <a href="./downloadpdf?id=<%=rs.getString("ID") %>" title="Download"><i class="ti-cloud-down" style="color:green; padding:5px;"></i></a>
														                    </td>
			                                                            </tr>
			                                                          <%} %>
			                                                           
			                                                        </tbody>
			                                                    </table>
			                                                </div>
			                                            </div>
			                                            <script>
												$(document).ready( function () {
												    $('#testData1').DataTable();
												} );
												
												
												</script>
			                                            
			                                            
			                                            
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                                   <!-- Page-header end -->

               
            </div>
        </div>
    </div>
</div>



<!-- Warning Section Ends -->
<!-- Required Jquery -->
    <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>     <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>     <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>     <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script src="assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
<!-- modernizr js -->
    <script type="text/javascript" src="assets/js/SmoothScroll.js"></script>     <script src="assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="assets/js/vertical-layout.min.js "></script>
<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Custom js -->
<script type="text/javascript" src="assets/js/script.js"></script>

<!--          ////////    Data table Js ///////////////////// -->

<script src=https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js></script>
<script src=https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>

</body>

</html>
