<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
    
    <%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="org.json.*"%>
<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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
													
													
													
													<%
															Gson gsonObj2 = new Gson();
															
																	
															List<Object> list5 = new ArrayList<Object>();		
															
																		
															String dataPoints5 = null;
															
															 
															try{
																Class.forName("com.mysql.jdbc.Driver"); 
																Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
																Statement statement = connection.createStatement();
																String xVal1, yVal1;
																
																ResultSet resultSet1 = statement.executeQuery("select distinct label from sets");
																
																while(resultSet1.next()){
																	xVal1 = resultSet1.getString("label");
																	
																	 list5.add(xVal1);
																	
																	dataPoints5 = gsonObj2.toJson(list5);
																	
																	
																}
															
																connection.close();
															}
															catch(SQLException e){
																out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
																dataPoints5 = null;
															}
															
															
															%>
															
															<%
															Gson gsonObj3 = new Gson();
															
																	
																	
															List<Object> list6 = new ArrayList<Object>();
																		
														
															String dataPoints6 = null;
															 
															try{
																Class.forName("com.mysql.jdbc.Driver"); 
																Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
																Statement statement = connection.createStatement();
																String xVal1, yVal1;
																
																ResultSet resultSet1 = statement.executeQuery("select * from sets");
																
																while(resultSet1.next()){
																	
																	yVal1 = resultSet1.getString("dataset");
																	 
																	 list6.add(yVal1);
																	
																	dataPoints6 = gsonObj3.toJson(list6);
																	
																}
															
																connection.close();
															}
															catch(SQLException e){
																out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
																dataPoints5 = null;
															}
															
															
															
															
															%>
													
													
											<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
int i=0;
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cashoil","root","root");
	Statement statement = connection.createStatement();
	String yVal;
	String  xVal;
	ResultSet resultSet = statement.executeQuery("select * from sets");
	
	while(resultSet.next()){
		xVal = resultSet.getString("label");
		yVal = resultSet.getString("dataset");
		map = new HashMap<Object,Object>(); map.put("x", xVal); map.put("y", Double.parseDouble(yVal)); list.add(map);
		dataPoints = gsonObj.toJson(list);
		
	}
	System.out.println(dataPoints);
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}


%>
										
										
											 
										
											<!-- ------------------------------ dynamic data set ------------------------------------------------------------------- -->
													
														<!-- ------------------------------ dynamic data set ------------------------------------------------------------------- -->
													
											 <canvas id="myChart" width="600" height="150"></canvas> 		
											<script type="text/javascript">
											
											const fetchAsync = async() => {
											    const response = await fetch("covid_us_states.json"),
											        keyValues = await response.json()
											    return keyValues
											}

											fetchAsync().then(keyValues => {
											    const time_labels = ["January","February","March"] ,
											        states =<%out.println(dataPoints5);%>,
											        covid_datasets = [],
											        bg = [
											            'rgba(27, 158, 119, 0.5)',
											            'rgba(217, 95, 2, 0.5)',
											            'rgba(117, 112, 179, 0.5)',
											            'rgba(231, 41, 138, 0.5)',
											            'rgba(102, 166, 30, 0.5)',
											            'rgba(230, 171, 2, 0.5)',
											            'rgba(166, 118, 29, 0.5)',
											            'rgba(102, 102, 102, 0.5)'
											        ],
											        bc = [
											            'rgb(27, 158, 119)',
											            'rgb(217, 95, 2)',
											            'rgb(117, 112, 179)',
											            'rgb(231, 41, 138)',
											            'rgb(102, 166, 30)',
											            'rgb(230, 171, 2)',
											            'rgb(166, 118, 29)',
											            'rgb(102, 102, 102)'
											        ]
											        
											        var dd = <%out.println(dataPoints6);%>
											        
											    for (let i = 1; i < states.length + 1; i++) {
											        covid_datasets.push({
											            label: states[i - 1],
											            data: Object.values(dd.slice(0,time_labels.length)),
											            backgroundColor: bg[i - 1],
											            borderColor: bc[i - 1]
											        })
											        
											       console.log(dd.slice(0,time_labels.length));
											    }
											    const myNewChart = new Chart(document.getElementById('myChart'), {
											        type: 'line',
											        data: {
											            datasets: covid_datasets,
											            labels: time_labels
											        },
											        options: {
											            scales: {
											                x: {
											                    title: {
											                        display: true,
											                        text: 'Month'
											                    },
											                },
											                y: {
											                    title: {
											                        display: true,
											                        text: 'Profit'
											                    }
											                }
											            },
											            plugins: {
											                title: {
											                    display: true,
											                    text: "Branch",
											                    font: {
											                        size: 16
											                    }
											                },
											                legend: {
											                    display: true
											                }
											            }
											        }
											    })
											})

											
											
											</script>	
											
											
										
										
										
										
										
													
								<!-- ------------------------------ dynamic data set ------------------------------------------------------------------- -->
													
											 <canvas id="myChart" width="600" height="150"></canvas> 		
											<script type="text/javascript">
											
											const fetchAsync = async() => {
											    const response = await fetch("covid_us_states.json"),
											        keyValues = await response.json()
											    return keyValues
											}

											fetchAsync().then(keyValues => {
											    const time_labels = Object.values(keyValues.slice(1).map(element => element[0])),
											        states = Object.values(keyValues[0]),
											        covid_datasets = [],
											        bg = [
											            'rgba(27, 158, 119, 0.5)',
											            'rgba(217, 95, 2, 0.5)',
											            'rgba(117, 112, 179, 0.5)',
											            'rgba(231, 41, 138, 0.5)',
											            'rgba(102, 166, 30, 0.5)',
											            'rgba(230, 171, 2, 0.5)',
											            'rgba(166, 118, 29, 0.5)',
											            'rgba(102, 102, 102, 0.5)'
											        ],
											        bc = [
											            'rgb(27, 158, 119)',
											            'rgb(217, 95, 2)',
											            'rgb(117, 112, 179)',
											            'rgb(231, 41, 138)',
											            'rgb(102, 166, 30)',
											            'rgb(230, 171, 2)',
											            'rgb(166, 118, 29)',
											            'rgb(102, 102, 102)'
											        ]
											    for (let i = 1; i < states.length + 1; i++) {
											        covid_datasets.push({
											            label: states[i - 1],
											            data: Object.values(keyValues.slice(1, 6).map(element => element[i])),
											            backgroundColor: bg[i - 1],
											            borderColor: bc[i - 1]
											        })
											    }
											    const myNewChart = new Chart(document.getElementById('myChart'), {
											        type: 'line',
											        data: {
											            datasets: covid_datasets,
											            labels: time_labels
											        },
											        options: {
											            scales: {
											                x: {
											                    title: {
											                        display: true,
											                        text: 'Month'
											                    },
											                },
											                y: {
											                    title: {
											                        display: true,
											                        text: 'Profit'
											                    }
											                }
											            },
											            plugins: {
											                title: {
											                    display: true,
											                    text: "Branch",
											                    font: {
											                        size: 16
											                    }
											                },
											                legend: {
											                    display: true
											                }
											            }
											        }
											    })
											})

											
											
											</script>		
													

</body>
</html>