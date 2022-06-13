<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <form action="" method="post" class="form-horizontal">
        <fieldset>
            <!-- Form Name -->
            <legend>EXAMPLE</legend>
            <div class="form-group rowauto" data-toggle="buttons">
                <label for="selectall">SELECT/UNSELECT ALL:</label>
                <label class="btn btn-success active checkboxkox">
                    <input type="checkbox" id="selectall" name="selectall" autocomplete="off" checked onclick="eventCheckBox()">
                    <span class="glyphicon glyphicon-ok"></span>
                </label>
            </div>
        </fieldset>
        <hr/>
        <fieldset>
            <div class="row rowauto">
                <div class="col-sm-1">
                    <div class="form-group rowauto" data-toggle="buttons">
                        <label class="btn btn-success active checkboxkox">
                            <input type="checkbox" id="check_1" name="check_1" autocomplete="off" checked>
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                    </div>                  
                </div>
            </div>
            <div class="row rowauto">
                <div class="col-sm-1">
                    <div class="form-group rowauto" data-toggle="buttons">
                        <label class="btn btn-success active checkboxkox">
                            <input type="checkbox" id="check_2" name="check_2" autocomplete="off" checked>
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                    </div>                  
                </div>
            </div>
        </fieldset>
        <hr/>
    </form>
    <script type="text/javascript">
    
    function eventCheckBox() {
    	let checkbox1 = document.getElementById("check_1");
      checkbox1.checked = !checkbox1.checked;
      
      let checkbox2 = document.getElementById("check_2");
      checkbox2.checked = !checkbox2.checked;
    }
    
    </script>
</body>
</html>