<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html style="background-color: azure;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<style type="text/css">
.header {
	color:#D2B48C;
	text-align:center; 
	padding-left: 8px;
}
body {
    background-color: lightblue;
}
</style>

<title>ASSIGN PROJECT TASK</title>
</head>
<body style="background-color: azure;">
	<div align="center" class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-header"></div>
		<div class="header">
			<h3 style="color: azure;font-family: cursive;">ASSIGNMENT OF TASK</h3>
		</div>
	</div>
	<br><br><br><br>
	
	<div align="center" style="background-color: azure;">
		<table>
			<tr>
				<td style="color: darkblue;font-family: cursive;"><b>Select Project: </b>
					<select id=selectbox1 class="form-control" style="background-color: azure;color: darkblue;">
						<option>All projects**</option>
							<c:forEach var="list" items="${projectDetails}" varStatus="status">
								<option id=project>${list.projectName}</option>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="color: darkblue;font-family: cursive;"><b>Description*: </b>
					<input type="text" placeholder = "description" id="description" class="form-control" style="background-color: azure;color: darkblue;"/>
				</td>
			</tr>
			<tr>
				<td style="color: darkblue;font-family: cursive;"><b>Enter start Date: </b>
					<input type="text" class="form-control" id="checkindate" style="background-color: azure;color: darkblue;" onkeypress="return isValidDate(event);"/>
				</td>
			</tr>
			<tr>
				<td style="color: darkblue;font-family: cursive;"><b>Enter end Date: </b>
					<input type="text" class="form-control" id="checkoutdate" style="background-color: azure;color: darkblue;" onkeypress="return isValidDate(event);"/>
				</td>
			</tr>
			<tr>
				<td style="color: darkblue;font-family: cursive;"><b>Employees: </b>
					<select id="result" class="form-control" style="background-color: azure;color: darkblue;">
						<option>Employees.. </option>
					</select>
				</td>
			</tr>
		</table>
		<br>
		
		<input type="button" class="btn btn-primary" value="Add a Task" onclick="Call();">
		<input type="button" class="btn btn-danger" value="Cancel" onclick="cancel();" />
  
		<div id="updateResult"></div>
	</div>
</body>

<title>jQuery UI Datepicker - Default functionality</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
		$("#checkindate").datepicker({
			numberOfMonths : 1,
			changeMonth : true,//this option for allowing user to select month
			changeYear : true,//this option for allowing user to select from year range
			onSelect : function(selected) {
				var dt = new Date(selected);
				dt.setDate(dt.getDate() + 1);
				$("#checkoutdate").datepicker("option", "minDate", dt);
			}
		});
		$("#checkoutdate").datepicker({
			numberOfMonths : 1,
			changeMonth : true,//this option for allowing user to select month
			changeYear : true,//this option for allowing user to select from year range
			onSelect : function(selected) {
				var dt = new Date(selected);
				dt.setDate(dt.getDate() - 1);
				$("#checkindate").datepicker("option", "maxDate", dt);
			}
		});
	});

	$('#selectbox1').change(function() {
		var data1 = $('#selectbox1').val();
		$.ajaxSetup({
					scriptCharset : "utf-8",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8"
				});

		$.ajax({
			type : "GET",
			url : "<spring:url value='/getEmployees' />",
			data : "projectName=" + data1,
			dataType : "json",

			success : function(data) {
				console.log(data);
				if(data === "no employees found for selected project select other project"){
			             location.href = "http://localhost:8081/Spring201/assignTask";
				}
				$.each(data, function(index, currEmp) {
					var toAppend = '';
					var $res = $('#result');

					toAppend += '<option id= "ids">'
							+ currEmp.empId + ","
							+ currEmp.name + '</option>';
					$('#result').append(toAppend);
					index++;
				});
			},
			complete : function(xhr, textStatus) {
			},
			error : function(data) {
				alert("error:" + data)
			}
		});
	});

	function Call() {
		var selected = $('#result option:selected').text();
		var substr = selected.split(',');
		var empId = substr[0];
		var empName = substr[1];
		
		$.ajax({
			type : "post",
			url : "<spring:url value='/updateProject' />",
			cache : false,
			dataType : "json",

			data : 'startDate=' + $("#checkindate").val() + "&endDate="
					+ $("#checkoutdate").val() + "&description="
					+ $("#description").val() + "&empId=" + empId + "&empName="
					+ empName,

			success : function(response) {

				$('#updateResult').append("Details added successfully")
				alert("Details added successfully.")
				alert("Redirecting to home page.")
				location.href = "http://localhost:8081/Spring201/"
			},
			complete : function(xhr, textStatus) {
			},
			error : function() {
				alert('Error while request..');
			}
		});
	}

	function cancel() {
		alert("Redirecting to home page.")
		location.href = "http://localhost:8081/Spring201/"
	}
</script>

<script type="text/javascript">
	var specialKeys = new Array();
	specialKeys.push(8);
	function IsNumeric(e) {
		var keyCode = e.which ? e.which : e.keyCode
		var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys
				.indexOf(keyCode) != -1);
		document.getElementById("error").style.display = ret ? "none"
				: "inline";
		return ret;
	}
	function isValidDate(date) {
		var matches = /^(\d{1,2})[-\/](\d{1,2})[-\/](\d{4})$/.exec(date);
		if (matches == null)
			return false;
		var d = matches[2];
		var m = matches[1] - 1;
		var y = matches[3];
		var composedDate = new Date(y, m, d);
		document.getElementById("errors").style.display = matches ? "none"
				: "inline";
		return composedDate.getDate() == d && composedDate.getMonth() == m
				&& composedDate.getFullYear() == y;
	}
</script>

</html>
