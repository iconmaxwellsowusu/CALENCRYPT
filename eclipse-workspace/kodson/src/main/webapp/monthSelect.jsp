<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />
</head>
<body>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

	<div class='input-group date datepicker' id='table'>
		<input type='text' name="tgl" class="form-control" /> <span
			class="input-group-addon"> <span
			class="glyphicon glyphicon-calendar"></span>
		</span>
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



</body>
</html>