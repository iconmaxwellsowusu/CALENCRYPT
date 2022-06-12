
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>


<%
// for monthly sales

	    String branch = (String)session.getAttribute("branch");
	    String pass = (String)session.getAttribute("pass");

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
int i=0;
String month="";
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
	Statement statement = connection.createStatement();
	String yVal;
	int  xVal;
	// this code tobe used in production -- -- select distinct o.month, o.Date,SUM(o.cashSale) OVER(PARTITION BY o.Date) as cost from closingstock o where o.month = CONCAT(MONTHNAME(now()),'/',year(o.date))
	ResultSet resultSet = statement.executeQuery("select distinct o.month, o.Date,SUM(o.cashSale) OVER(PARTITION BY o.Date) as cost from closingstock o where branch='"+branch+"'");
	
	while(resultSet.next()){
		xVal = i+=1;
		yVal = resultSet.getString(3);
		month = resultSet.getString(1);
		map = new HashMap<Object,Object>(); map.put("x", xVal); map.put("y", Double.parseDouble(yVal)); list.add(map);
		dataPoints = gsonObj.toJson(list);
		
	}
	//System.out.println(dataPoints);
	
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}


%>


<%

// underground tanks
Gson gsonObj2 = new Gson();

		
List<Object> list5 = new ArrayList<Object>();		
List<Object> list6 = new ArrayList<Object>();
			
List<Object> list7 = new ArrayList<Object>();		
List<Object> list8 = new ArrayList<Object>();
List<Object> list9 = new ArrayList<Object>();
			
List<Object> list10 = new ArrayList<Object>();
List<Object> list11 = new ArrayList<Object>();
			
List<Object> list12 = new ArrayList<Object>();
List<Object> list13 = new ArrayList<Object>();
			
String dataPoints5 = null;
String dataPoints6 = null;
String dataPoints7 = null;
String dataPoints8 = null;
 
String dataPoints9 = null;
String dataPoints10 = null;
			
String dataPoints11 = null;
String dataPoints12 = null;
			
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
	Statement statement = connection.createStatement();
	Statement statement1 = connection.createStatement();
	Statement statement2 = connection.createStatement();
	Statement statement3 = connection.createStatement();
	String xVal1, yVal1;
	String xVal2, yVal2;
	String xVal3, yVal4;
			
	String xVal5, yVal5;
	String xVal6, yVal6;
	ResultSet resultSet1 = statement.executeQuery("select branch, closingStockvalue from closingStock  where product='PMS' and branch='"+branch+"' ORDER BY ID DESC LIMIT 1");
	
	
	while(resultSet1.next()){
		xVal1 = resultSet1.getString("branch");
		yVal1 = resultSet1.getString(2);
		 list5.add(xVal1+" PMS");
		 list6.add(yVal1);
		dataPoints5 = gsonObj.toJson(list5);
		dataPoints6 = gsonObj.toJson(list6);
		
	}
	ResultSet resultSet2 = statement1.executeQuery("select branch, closingStockvalue from closingStock  where product='AGO' and branch='"+branch+"' ORDER BY ID DESC LIMIT 1");
	while(resultSet2.next()){
		xVal2 = resultSet2.getString("branch");
		yVal2 = resultSet2.getString(2);
		 list7.add(xVal2+" AGO");
		 list8.add(yVal2);
		dataPoints7 = gsonObj.toJson(list7);
		dataPoints8 = gsonObj.toJson(list8);
		
	}
	
	ResultSet resultSet3 = statement3.executeQuery("select distinct o.month,SUM(o.cashSale) OVER(PARTITION BY o.month) as cost from closingstock o where product = 'PMS' and branch='"+branch+"'");
	while(resultSet3.next()){
		xVal3 = resultSet3.getString(2);
		yVal5 = resultSet3.getString(1);
		 list10.add(xVal3);
		 list12.add(yVal5);
		
		dataPoints9 = gsonObj.toJson(list10);
		dataPoints12 = gsonObj.toJson(list12);
		
	}
	
	ResultSet resultSet4 = statement2.executeQuery("select distinct o.month,SUM(o.cashSale) OVER(PARTITION BY o.month) as cost from closingstock o where product = 'AGO' and branch='"+branch+"'");
	while(resultSet4.next()){
		
		yVal4 = resultSet4.getString(2);
		
		 list11.add(yVal4);
		
		dataPoints10 = gsonObj.toJson(list11);
		
	}

	
	//System.out.println(dataPoints9+ " " +dataPoints10);






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
<% out.println(dataPoints); } %> 
 ////////////////  shows modal for admin to select //////////////
 var txt ='no';
 if(txt=='yes'){
	 $('#\\monthlyModal').modal('show');
 }
}
</script>
      
      
  </head>

  <body>
  
    <%
  	try{
	Class.forName("com.mysql.jdbc.Driver"); 

	String b=null;
	String p=null;
	
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");

	
	
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
                              <a href="javascript:void(0)" class="waves-effect waves-light">
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
                      <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="icon-close icons"></i></a></div>
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
                                      <li >
                                          <a href="statutory.jsp" class="waves-effect waves-dark">
                                              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                              <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Add Statutory</span>
                                              <span class="pcoded-mcaret"></span>
                                          </a>
                                      </li>
                                      <li>
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
                                      <span class="pcoded-mcaret">00+</span>
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
                                                                <h4 class="text-c-purple"><%
                                                                String pms="";
                                                                Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
                                                                Statement st3 = con3.createStatement();
                                                                String pmsSql = "select sum(salesltr) from closingStock where product='PMs' and branch='"+branch+"'";// remember its monthly
                                                                ResultSet rstr = st3.executeQuery(pmsSql);
                                                                while(rstr.next()){
                                                                	pms=rstr.getString(1);
                                                                }
                                                                out.println(pms);
                                                                %></h4>
                                                                <h6 class="text-muted m-b-0">PMS Litres Sold For <%out.println(month); %></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-bar-chart f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-purple">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0"></p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="ti-paint-bucket text-white f-16"></i>
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
                                                                <h4 class="text-c-green"><%
                                                                String ago="";
                                                                String pmsSql1 = "select sum(salesltr) from closingStock where product='AGO' and branch='"+branch+"'";// remember its monthly
                                                                ResultSet rstr1 = st3.executeQuery(pmsSql1);
                                                                while(rstr1.next()){
                                                                	ago=rstr1.getString(1);
                                                                }
                                                                out.println(ago);
                                                                %></h4>
                                                                <h6 class="text-muted m-b-0">AGO Litres Sold For <%out.println(month); %></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-file-text-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-green">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0"></p>
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
                                                                <h4 class="text-c-red"><%
                                                                String pmsload="";
                                                                String pmsSql2 = "select sum(loads) from closingStock where product='PMS' and branch='"+branch+"'";// remember its monthly
                                                                ResultSet rstr2 = st3.executeQuery(pmsSql2);
                                                                while(rstr2.next()){
                                                                	pmsload=rstr2.getString(1);
                                                                }
                                                                out.println(pmsload);
                                                                
                                                                %></h4>
                                                                <h6 class="text-muted m-b-0">PMS Stock Received For <%out.println(month); %></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-calendar-check-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0"></p>
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
                                                                <h4 class="text-c-blue"><%
                                                                String agoload="";
                                                                String agoSql2 = "select sum(loads) from closingStock where product='AGO' and branch='"+branch+"'";// remember its monthly
                                                                ResultSet rstr3 = st3.executeQuery(agoSql2);
                                                                while(rstr3.next()){
                                                                	agoload=rstr3.getString(1);
                                                                }
                                                                out.println(agoload);
                                                                
                                                                %></h4>
                                                                <h6 class="text-muted m-b-0">AGO Received For <%out.println(month); %></h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-blue">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0"></p>
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
                                                        <h3>Daily Sales Analytics for <%out.println(month);%></h3>
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
                                                        
                                                        <div id="chartContainer" style="height: 370px; width:100%"></div>
                                                        
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-md-12">
                                                
                                                <div class="card quater-card">
                                                
                                                <%
                                                List<Object> utype = new ArrayList<Object>();
                                                List<Object> amount = new ArrayList<Object>();
                                                String ut = null;
                                                String am = null;
                                                
                                                String query1 = "select distinct o.uType,SUM(o.amount) OVER(PARTITION BY o.uType) as cost from utility o where branch='"+branch+"'";
                                                
                                                Statement state = connection.createStatement();
                                                ResultSet rstt = state.executeQuery(query1);
                                                String yVal;
                                            	String  xVal;
                                            	// this code tobe used in production -- -- select distinct o.month, o.Date,SUM(o.cashSale) OVER(PARTITION BY o.Date) as cost from closingstock o where o.month = CONCAT(MONTHNAME(now()),'/',year(o.date))
                                            	ResultSet resultSet = statement.executeQuery("select distinct o.month, o.Date,SUM(o.cashSale) OVER(PARTITION BY o.Date) as cost from closingstock o where branch='"+branch+"'");
                                            	
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
                                          
                                            
                                            <!--  sale analytics end -->
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
                                            <!--  project and team member start -->
                                            <div class="col-xl-4 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Underground Stock</h5>
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
              
                                                                  <canvas id="myChart" width="200" height="150"></canvas>
                
             
                
													<script>
													const ctx = document.getElementById('myChart').getContext('2d');
													const myChart = new Chart(ctx, {
													    type: 'bar',
													    data: {
													        labels:<%out.println(dataPoints5);%>,
													        datasets: [{
													           
													            data:<%out.println(dataPoints6);%>,
													            backgroundColor: [
													                'rgba(255, 99, 132, 0.2)',
													                'rgba(54, 162, 235, 0.2)',
													               
													            ],
													            borderColor: [
													                'rgba(255, 99, 132, 1)',
													                'rgba(54, 162, 235, 1)',
													                
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
                                            
                                            
                                              <div class="col-xl-4 col-md-6">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Underground Stock</h5>
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
              
                                                                  <canvas id="myCharts1" width="200" height="150"></canvas>
                
             
                
													<script>
													const ctx1 = document.getElementById('myCharts1').getContext('2d');
													const myCharts = new Chart(ctx1, {
													    type: 'bar',
													    data: {
													        labels:<%out.println(dataPoints7);%>,
													        datasets: [{
													           
													            data:<%out.println(dataPoints8);%>,
													            backgroundColor: [
													               
													                'rgba(55, 163, 235, 0.2)'
													               
													            ],
													            borderColor: [
													             
													                'rgba(54, 162, 235, 1)'
													                
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
                                            
                                            
                                                 <div class="col-xl-12 col-md-12">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col">
                                                                <h4>Statutory days count down</h4>
                                                                <p class="text-muted"></p>
                                                            </div>
                                                            <div class="col-auto">
                                                                
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
                                                                 <th>Status</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        	<%   
 
									                                Connection con;
									                                PreparedStatement pst;
									                                ResultSet rs;
									                                int i1 = 0;
									                                Class.forName("com.mysql.jdbc.Driver");
									                                con = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
									                                
									                                  String query = "SELECT ID, task,cert,permit,currentDate,expiryDate, FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) as Days, FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) % 1440 / 60) as Hours, TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) % 60 as Minutes FROM fuelstatutory   where FLOOR(TIMESTAMPDIFF(MINUTE, NOW(), expiryDate) / 1440) >1 and branch='"+branch+"'";
									                                  Statement st = con.createStatement();
									                                  
									                                    rs =  st.executeQuery(query);
									                                    
									                                        while(rs.next())
									                                        {
									                                          
									                                            i1+=1;
									                                %>
                                                        
                                                            <tr>
                                                                <th scope="row"><%out.println(i1); %></th>
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
                                                                 <td>
                                                                <button onclick="search(<%=rs.getString("id")%>)" title="Update" data-toggle="modal" data-target="#updateModal"><i class="ti-pencil-alt" style="color:orange; cursor:pointer; padding:5px;"></i></button>

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
                                                
                                            </div> 
                                            <div class="col-xl-12 col-md-12">
                                                <div class="card ">
                                                    <div class="card-header">
                                                        <h5>Sales Comparison for AGO and PMS</h5>
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
													              
													 <canvas id="line-chart" width="600" height="150"></canvas>             
													<script>
													new Chart(document.getElementById("line-chart"), {
														  type: 'line',
														  data: {
														    labels: <%out.println(dataPoints12);%>,
														    datasets: [{ 
														        data: <%out.println(dataPoints9);%>,
														        label: "PMS",
														        borderColor: "#3e95cd",
														        fill: false
														      }, 
														      { 
														        data: <%out.println(dataPoints10);%>,
														        label: "AGO",
														        borderColor: "#c45850",
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
