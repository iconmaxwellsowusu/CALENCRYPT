<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>

<%@page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%@page import="java.sql.*"%>
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
	
	String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
	String m5 =new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());


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
    
    
</head>

<body>



<% 
    
     if(request.getParameter("save")!=null)
    {
    	
        
        String month = m5;
        String branch = "test Branch";
        String date = request.getParameter("date");
        String product = (String)session.getAttribute("product");
        
        double open = (Double)session.getAttribute("openStock");
         
        String load = request.getParameter("load");
        String overageShortage = request.getParameter("overage/shortage");
        String available = request.getParameter("available");
        String salesCheck = request.getParameter("salesCheck");
        String closingStock = request.getParameter("closingStock");
        String difference = request.getParameter("difference");
        double openStockR = (Double)session.getAttribute("openStockReading");
       
        String closingStockR = request.getParameter("closingStockR");
        String returnToTank = request.getParameter("returnToTank");
        String saleltr = request.getParameter("saleLtr");
        String rate = request.getParameter("rate");
        String value = request.getParameter("value");
        String cashSale = request.getParameter("cashSale");
        String credit = request.getParameter("credit");
        String advance = request.getParameter("advances");
        String shortage = request.getParameter("shortage");
        String balance = request.getParameter("balance");
        String cashAvailable = request.getParameter("cashAvailable");
        String shortageRepayment = request.getParameter("shortageRepayment");
        String advance1 = request.getParameter("advance");
        String receivedFromDetors = request.getParameter("receivedFromDebtors");
        String expected = request.getParameter("expected");
        String bankLodgement = request.getParameter("bank");
        
        double rateDif = (Double)session.getAttribute("rateDiff");
        double winfall = (Double)session.getAttribute("winFall");
        double shortfall = (Double)session.getAttribute("shortFall");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
        pst = con.prepareStatement("insert into closingStock(month,branch,date,product,opens,loads,shortageOverage,available,salesCheck,closingStockvalue,difference,openStockR,closeReading,returnTotank,salesltr,rate,value_,cashSale,creditSale,advances,shortage,balance,cashAvailable,shortageRepayment,advanceRepayment,receivedFromDebtors,expected,bankLodgement,rateDiff,winFall,shortFall)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        pst.setString(1, month);
        pst.setString(2, branch);
        pst.setString(3, date);
        pst.setString(4, product);
        pst.setDouble(5, open);
        pst.setString(6, load);
        pst.setString(7, overageShortage);
        pst.setString(8, available);
        pst.setString(9, salesCheck);
        pst.setString(10, closingStock);
        pst.setString(11, difference);
        pst.setDouble(12, openStockR);
        pst.setString(13, closingStockR);
        pst.setString(14, returnToTank);
        pst.setString(15, saleltr);
        pst.setString(16, rate);
        pst.setString(17, value);
        pst.setString(18, cashSale);
        pst.setString(19, credit);
        pst.setString(20, advance);
        pst.setString(21, shortage);
        pst.setString(22, balance);
        pst.setString(23, cashAvailable);
        pst.setString(24, shortageRepayment);
        pst.setString(25, advance1);
        pst.setString(26, receivedFromDetors);
        pst.setString(27, expected);
        pst.setString(28, bankLodgement);
        
        pst.setDouble(29, rateDif);
        pst.setDouble(30, winfall);
        pst.setDouble(31, shortfall);

        pst.executeUpdate();  
         
        out.println("<script>alert('Stock Closed')</script>");
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
                                  <span style="font-size:12px;">Welcome Manager</span>
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
                        <div class="main-body">
                            <div class="page-wrapper">
                                <div class="page-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>CLOSING STOCK</h5> <% String disable = "true"; %>
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
                                                
                                                
                                                <div align="center">
                                                     <h6>Please Select Product First</h6>
                                                     
                                                     <form action="">
                                                     
                                                          <div class="col-sm-2">
                                                                            
                                                                                <select class="form-control" name="product" id="product" class="custom-select" name="product" id="product" required >
                                                                                
																					<option value=""></option>
																					<option value="PMS">PMS</option>
																					<option value="AGO">AGO</option>
																					<option value="OTHER">OTHER</option>
																				</select> 
                                                                            </div>
                                                     
                                                     </form>
                                                </div>
                                                
                                                
                                                <!-- -------------------------------------  Dynamic field area -------------------------------      -->
                                                <div class="card-block">
                                                
                                                 <h6>Add Pump Readings Here</h6><br><i class="ti-hand-point-down"></i>
													  <div class="row" >
													    <div class="form-group">
													      
													      <div class="col-sm-10">
													        <div class="dynamic-wrap">
													          <form role="form" autocomplete="off">
													            <div class="entry input-group">
													        
													              <input class="form-control form-default " id="date" placeholder="Date" type="date"/>
													           
													              <input class="form-control form-default " id="number" placeholder="Pump Number" type="text"/>
													              
													              <input class="form-control form-default read" id="read" placeholder="Readings" type="text"/>
													              <span class="input-group-btn">
													                <button class="btn btn-success btn-add" type="button">
													                        <i class="ti-plus"></i>
													                </button>
													              </span>
													            </div>
													          </form>
													          <br>
													         
													        </div>
													      </div>
													    </div>
													  </div>
                                                    
                                                            <form method="post" action="#">
                                                                        <div class="form-group row  container justify-content-center" >
                                                                            <div class="col-sm-2">
                                                                                <label>Date</label>
                                                                                <input type="Date" class="form-control" name="date" id="date" required>
                                                                            </div>
                                                                           
                                                                            
                                                                             <div class="col-sm-2">
                                                                            <label>Return to tank</label>
                                                                                <input type="text" class="form-control"
                                                                              name="returnToTank" id="returnToTank" value="0.00" required>
                                                                            </div>
                                                                        
                                                                        <div class="col-sm-2">
                                                                                 <label>Rate Ghs</label>
                                                                                <input type="text" class="form-control" value="0.00" name="rate" id="rate" required>
                                                                            </div>    
                                                                            
                                                                            
                                                                       
                                                                        </div>
                                                                  
                                                                       <div class="form-group row  container justify-content-center" > 
                                                                       
                                                                       
                                                                       
                                                                       <div class="col-sm-2">
                                                                            <label>Credit Sales Ghs</label>
                                                                                <input type="text" class="form-control" value="0.00" name="credit" id="credit"required>
                                                                            </div> 
                                                                       
                                                                          <div class="col-sm-2">
                                                                                 <label>Advances Ghs</label>
                                                                                <input type="text" class="form-control" value="0.00" name="advances" id="advances"required>
                                                                            </div>
                                                                            <div class="col-sm-2">
                                                                            <label>Shortage Ghs</label>
                                                                                <input type="text" class="form-control"
                                                                              name="shortage" id="shortage"  value="0.00" required>
                                                                            </div>
                                                                            
                                                                             <div class="col-sm-2">
                                                                            <label>Balance b/f</label>
                                                                                <input type="text" class="form-control"
                                                                              name="balance" id="balance"  value="0.00" required>
                                                                            </div>
                                                                           
                                                                            
                                                                             

                                                                        </div>
                                                                        
                                                                        <div class="form-group row  container justify-content-center" >  
                                                                        
                                                                        
                                                                        <div class="col-sm-2">
                                                                            <label>Closing Stock</label>
                                                                                <input type="text" class="form-control"
                                                                                name="closingStock" id="closingStock" value="0.00" required>
                                                                            </div>
                                                                        
                                                                           <div class="col-sm-2">
                                                                                 <label>Shortage repayment</label>
                                                                                <input type="text" class="form-control" value="0.00" name="shortageRepayment" id="shortageRepayment"required>
                                                                            </div>
                                                                            <div class="col-sm-2">
                                                                            <label>Repayment of Advances</label>
                                                                                <input type="text" class="form-control"
                                                                              name="advance" id="advance" value="0.00" required>
                                                                            </div>
                                                                            
                                                                             <div class="col-sm-2">
                                                                            <label>Received from debtors</label>
                                                                                <input type="text" class="form-control"
                                                                               name="receivedFromDebtors" id="receivedFromDebtors" value="0.00" required>
                                                                            </div>
                                                                            
                                                                            
                                                                        

                                                                        </div>
                                                                        
                                                                        <%
                                                                          
                                                                        Connection con;
                                                                        ResultSet rs;
                                                                        Statement st;
                                                                        
                                                                        Class.forName("com.mysql.jdbc.Driver");
                                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/kodson_cashOil?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_iconmaxwells","0040105715@Icon");
                                                                        st = con.createStatement();
                                                                        String sql = "Select * from closingStock";
                                                                        
                                                                        rs= st.executeQuery(sql);
                                                                        String read="";
                                                                        if(rs.next()){
                                                                        	 read = rs.getString("openStockR");
                                                                        	 
                                                                        }
                                                                        
                                                                        %>
                                                                        
                                                                       <div class="form-group row  container justify-content-center" >  
                                                                        
                                                                        
                                                                        
                                                                         <div class="col-sm-2">
                                                                                 <label>Open Stock Reading</label>
                                                                                 <input type="text" class="form-control" value="0.00" name="openStockR" id="openStockR">
                                                                            </div>
                                                                            
                                                                            
                                                                            
                                                                         <div class="col-sm-2">
                                                                            <label>Open Stock</label>
                                                                                <input type="text" class="form-control" name="open" id="open" >
                                                                            </div>
                                                                        
                                                                           
                                                                        </div>
                                                                        <script type="text/javascript">
                                                                        
                                                                        
                    								                        var bt = document.getElementById('openStockR');
                    								                        var txt = '<%= read%>'
                    								                        
                    								                        if (txt == '') {
                    								                            bt.disabled = false;
                    								                            alert("Please Enter Open Stock and Open Stock reading since its your first time");
                    								                        }
                    								                        else {
                    								                            bt.disabled = true;
                    								                            
                    								                        }
                    								                        
                    								                        
                    								                        var bt = document.getElementById('open');
                    								                        var txt = '<%= read%>'
                    								                        
                    								                        if (txt == '') {
                    								                            bt.disabled = false;
                    								                           
                    								                        }
                    								                        else {
                    								                            bt.disabled = true;
                    								                            
                    								                        }
                    								                      
                                                                        
                                                                        </script>
                                                                       <!-- ----------------------------- Calculated Values ----------------------------------------- --> 
                                                                           
                                                                      <hr style="border: 1px solid orange; margin-bottom:0px;">
                                                                      <div align="center"><h6 style="margin-top:15px">Calculated Values Below</h6></div>
                                                                      <hr style="border: 1px solid orange; margin-bottom:0px;">
																			<br>
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        <div class="form-group row  container justify-content-center" >  
                                                                        
                                                                         
                                                                            <div class="col-sm-2">
                                                                            <label>Closing Stock Reading</label>
                                                                                <input type="text" class="form-control"
                                                                              name="closingStockR" id="closingStockR" value="0.00" readonly required>
                                                                            </div>
                                                                            
                                                                          
                                                                       
                                                                       
                                                                                                                                           
                                                                             
                                                                            <div class="col-sm-2">
                                                                            <label>Value Ghs</label>
                                                                                <input type="text" class="form-control"
                                                                              name="value" id="value" readonly value="0.00" >
                                                                            </div>
                                                                            
                                                                            
                                                                          <div class="col-sm-2">
                                                                            <label>Cash Sale Ghs</label>
                                                                                <input type="text" class="form-control"
                                                                              name="cashSale" id="cashSale" readonly value="0.00" >
                                                                            </div>

                                                                        </div>
                                                                        
                                                                        
                                                                        <div class="form-group row  container justify-content-center" >  
                                                                       
                                                                       
                                                                          
                                                                            <div class="col-sm-2">
                                                                            <label>Load</label>
                                                                                <input type="text" class="form-control" name="load" id="load" readonly>
                                                                            </div>
                                                                       
                                                                       <div class="col-sm-2">
                                                                            <label>Overage/Shortage</label>
                                                                                <input type="text" class="form-control" name="overage/shortage" id="overage/shortage" readonly value="0.00">
                                                                            </div>
                                                                                                                                           
                                                                             <div class="col-sm-2">
                                                                                 <label>Available</label>
                                                                                <input type="text" class="form-control" name="available" id="available" readonly value="0.00">
                                                                            </div>                                                               
                                                                           

                                                                        </div>
                                                                        
                                                                        <div class="form-group row  container justify-content-center" >  
                                                                       
                                                                       <div class="col-sm-2">
                                                                            <label>Cash Available</label>
                                                                                <input type="text" class="form-control" value="0.00" name="cashAvailable" id="cashAvailable" readonly>
                                                                            </div>
                                                                                                                                           
                                                                          <div class="col-sm-2">
                                                                            <label>Sales Check</label>
                                                                                <input type="text" class="form-control"
                                                                               name="salesCheck" id="salesCheck" readonly value="0.00" >
                                                                            </div>
                                                                        
                                                                         <div class="col-sm-2">
                                                                            <label>Difference</label>
                                                                                <input type="text" class="form-control" name="difference" id="difference" readonly value="0.00">
                                                                            </div>
                                                                              
                                                                           <div class="col-sm-2">
                                                                            <label>Sales Ltr</label>
                                                                                <input type="text" class="form-control" value="0.00" name="saleLtr" id="saleLtr" readonly>
                                                                            </div>                                                                
                                                                             

                                                                        </div>
                                                                        
                                                                           <div class="form-group row  container justify-content-center" >  
                                                                            <div class="col-sm-2">
                                                                            <label>Expected Cash</label>
                                                                                <input type="text" class="form-control"
                                                                              name="expected" id="expected" readonly value="0.00" >
                                                                            </div>
                                                                            
                                                                             <div class="col-sm-2">
                                                                            <label>Bank Lodgement</label>
                                                                                <input type="text" class="form-control"
                                                                               name="bank" id="bank" value="0.00" readonly>
                                                                            </div>

                                                                        </div>
                                                                       
                                                                    
                                                                     
                                                                     
                                                                      <div align="center">
					                                                    <br>
					                                                   
					                                                     <button class="btn waves-effect waves-light btn-success btn-outline-success" type="submit" name="save"><i class="fa-regular fa-floppy-disk"></i>Save</button>
					                                                     <button class="btn waves-effect waves-light btn-danger btn-outline-danger" type="reset"><i class="fa-solid fa-ban"></i>Cancel</button>
					                                                    </div>
                                                                     
                                                                    </form>
                                                   
                                                      <button class="btn waves-effect waves-light btn-primary btn-outline-primary" type="submit" onclick="calculate()"><i class="fa-regular fa-floppy-disk"></i>Calculate</button>
                                                    <br>
                                                    
                                                    
                                                    
										    <script src="jquery-3.6.0.js" type="text/javascript"></script>
										    <script src="component/jquery/jquery.min.js" type="text/javascript"></script>
										    <script src="component/jquery.validate.min.js" type="text/javascript"></script>
										    
										    <script type="text/javascript" src="DataTables/datatables.min.js"></script>
										    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>
										    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
										    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
										
										    <script>
										          function calculate(){
										        	  
										        
										        	  $.ajax({
										        		  
										        		  type:"POST",
										        		  url:"dipCalculation.jsp",
										        		  data:{"date":$("#date").val() ,"product":$("#product").val(),"closingStock":$("#closingStock").val(),"closingStockR":$("#closingStockR").val(),"returnToTank":$("#returnToTank").val(),
										        			  "rate":$("#rate").val() ,"credit":$("#credit").val(), "advance":$("#advance").val(),"shortage":$("#shortage").val(),"balance":$("#balance").val(),
										        			  "cashAvailable":$("#cashAvailable").val(),"shortageRepayment":$("#shortageRepayment").val(),"receivedFromDebtors":$("#receivedFromDebtors").val(),"openStock":$("#open").val(),"openStockR":$("#openStockR").val()},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  $("#available").val(obj[0].available1);
										        			  $("#salesCheck").val(obj[0].salesCheck1);
										        			  $("#saleLtr").val(obj[0].salesltr1);
										        			  $("#difference").val(obj[0].difference1);
										        			  $("#value").val(Math.abs(obj[0].valueGhs1));
										        			  $("#cashSale").val(obj[0].cashSaleGhs1);
										        			  $("#cashAvailable").val(obj[0].cashAvailableFromSales1);
										        			  $("#expected").val(obj[0].expectedCash1);
										        			  $("#open").val(obj[0].openStock1);
										        			  $("#openStockR").val(obj[0].openStockReading1);
										        			  $("#load").val(obj[0].load1);
										        			  $("#overage/shortage").val(obj[0].overageShortage1);
										        		  },
										        		  error(err){
										        			  alert("error!! please make sure you select the date and product")
										        		  }
										        		  
										        		  
										        	  })
										        	  
										          }
										          
										          
										    </script>
										    
										    		<script type="text/javascript">
												$(function() {
													 var date;
													 var pump;
													 var read;
													  $(document).on('click', '.btn-add', function(e) {
													    e.preventDefault();
												       
													    var dynaForm = $('.dynamic-wrap form:first'),
													      currentEntry = $(this).parents('.entry:first'),
													      newEntry = $(currentEntry.clone()).appendTo(dynaForm);
												
													   date = newEntry.find('#date').val();
													   pump = newEntry.find('#number').val();
													   read = newEntry.find('#read').val();
													   
													   
													    newEntry.find('input').val('');
													    dynaForm.find('.entry:not(:last) .btn-add')
													      .removeClass('btn-add').addClass('btn-remove')
													      .removeClass('btn-success').addClass('btn-danger')
													      .html('<i class="ti-minus"></i>');
													    sumIt();
													  }).on('click', '.btn-remove', function(e) {
													    $(this).parents('.entry:first').remove();
													    sumIt1();
													    e.preventDefault();
													    return false;
													    
													  });
													 
													  function sumIt() {
														  
														  $.ajax({
																
															  type:"POST",
											        		  url:"insetIntopump.jsp",
											        		  data:{"date":date,"pump":pump,"read":read,"product":$("#product").val() },
											        		  
											        		  success:function(msg){
											        			  alert("Reading Taken");
											        		  },
											        		  
											        		  error(err){
											        			  alert("error!! please make sure you select the date and product")
											        		  }
															  
														  });
														  
														  var total = 0, val;
														  $('.read').each(function() {
														    val = $(this).val();
														    val = isNaN(val) || $.trim(val) === "" ? 0 : parseFloat(val);
														    total += val;
														   
														  });
														
														  $('#closingStockR').val(total);
														  
														
														}
													  
													  function sumIt1() {
														  var total = 0, val;
														  $('.read').each(function() {
														    val = $(this).val();
														    val = isNaN(val) || $.trim(val) === "" ? 0 : parseFloat(val);
														    total -= val;
														    
														  });
														
														  $('#closingStockR').val(total);
														  
														  $.ajax({
																
															  type:"POST",
											        		  url:"deletepumpR.jsp",
											        		  data:{"date":date,"pump":pump,"read":read},
											        		  
											        		  success:function(msg){
											        			  alert("Reading Deleted");
											        		  },
											        		  
											        		  error(err){
											        			  alert("error!!")
											        		  }
															  
														  });
														  
														}
													});
												
												</script>
										    
										    
                                              <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Date</th>
                                                                <th>Product</th>
                                                                <th>Open Stock</th>
                                                                <th>Load</th>
                                                                <th>Overage/Shortage</th>
                                                                <th>Available</th>
                                                                <th>Sales(Check)</th>
                                                                <th>Closing Stock</th>
                                                                <th>Deffirence</th>
                                                                <th>OpenStock Reading</th>
                                                                <th>ClosingStock Reading</th>
                                                                <th>Return To Tank</th>
                                                                <th>Sales Ltr</th>
                                                                 <th>Rate(Ghs)</th>
                                                                <th>Value(Ghs)</th>
                                                                <th>CashSale(Ghs)</th>
                                                                <th>CreditSale(Ghs)</th>
                                                                <th>Advances(Ghs)</th>
                                                                <th>Shortages(Ghs)</th>
                                                                <th>Balance b/f</th>
                                                                <th>Cash Avalable From sale</th>
                                                                <th>Shortage Repayment</th>
                                                                <th>Repayment of Advances</th>
                                                                <th>Received From Debtors</th>
                                                                <th>Expected Cash Deposit</th>
                                                                <th>Actions</th>
                                                               
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        
                                                        <%
                                                        
                                                        Statement st1;
                                                        ResultSet rs1;
                                                        
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        st1=con.createStatement();
                                                        String query = "select * from closingStock";
                                                        int i=0;
                                                        rs1 = st1.executeQuery(query);
                                                        while(rs1.next()){
                                                        i+=1;
                                                        %>
                                                            <tr>
                                                                <th scope="row"><%out.println(i); %></th>
                                                                <td><%out.println(rs1.getString("date")); %></td>
                                                                <td><%out.println(rs1.getString("product")); %></td>
                                                                <td><%out.println(rs1.getString("opens")); %></td>
                                                                <td><%out.println(rs1.getString("loads")); %></td>
                                                                <td><%out.println(rs1.getString("shortageOverage")); %></td>
                                                                <td><%out.println(rs1.getString("available")); %></td>
                                                                <td><%out.println(rs1.getString("salesCheck")); %></td>
                                                                <td><%out.println(rs1.getString("closingStockvalue")); %></td>
                                                                 <td><%out.println(rs1.getString("difference")); %></td>
                                                                <td><%out.println(rs1.getString("openStockR")); %></td>
                                                                <td><%out.println(rs1.getString("closeReading")); %></td>
                                                                <td><%out.println(rs1.getString("returnTotank")); %></td>
                                                                <td><%out.println(rs1.getString("salesltr")); %></td>
                                                                <td><%out.println(rs1.getString("rate")); %></td>
                                                                <td><%out.println(rs1.getString("value_")); %></td>
                                                                <td><%out.println(rs1.getString("cashSale")); %></td>
                                                                <td><%out.println(rs1.getString("creditSale")); %></td>
                                                                <td><%out.println(rs1.getString("advances")); %></td>
                                                                <td><%out.println(rs1.getString("shortage")); %></td>
                                                                <td><%out.println(rs1.getString("balance")); %></td>
                                                                <td><%out.println(rs1.getString("cashAvailable")); %></td>
                                                                 <td><%out.println(rs1.getString("shortageRepayment")); %></td>
                                                                <td><%out.println(rs1.getString("advanceRepayment")); %></td>
                                                                <td><%out.println(rs1.getString("receivedFromDebtors")); %></td>
                                                                <td><%out.println(rs1.getString("expected")); %></td>
                                                                
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="styleSelector">
                
                </div>
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

</body>

</html>
