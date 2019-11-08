<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html style="background-color: azure;">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<style type="text/css">
		.header {
			color: #D2B48C;
			text-align: center;
			padding-left: 8px;
		}
		.display {
			display:initial !important;
			width:12% !important;
			padding:3px 12px !important;
		}
    	.marginDisplay {
			margin:none !important;
		} 
		.hidden {
			display: none;
		}
		</style>
	</head>
	
	<body style="background-color: azure;">
		<div align="center" class="navbar navbar-inverse navbar-fixed-top marginDisplay">
			<div class="navbar-header"></div>
			<div class="header">
				<h3 style="color: azure;font-family: cursive;">VIEW ASSIGNED TASK</h3>
			</div>
		</div>
		
		<div align = "center" style="color: darkblue;margin-top: 100px;background-color: azure;">
			<label style="font-family: cursive;">Select Project:</label>
			<select class = "form-control display" id=selectbox style="background-color: azure;color: darkblue;">
				<p>Filter by projects</p>
				<option id="project" style="font-family: cursive;" disabled="disabled" selected="selected">Select</option>
				<c:forEach var="list" items="${projectDetails}" varStatus="status">
					<option id=project>${list.projectName}</option>
				</c:forEach>
			</select>
		
			<div id="result" style="color: darkblue;background-color: azure;"></div>
		
			<table id="table" class="hidden" border=1>
				<tr>
					<th>Id</th>
					<th>Employee</th>
				</tr>
			</table>
		</div>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">
	
			$('#selectbox').change(function() {
				var data1 = $('#selectbox').val();
				$.ajaxSetup({
					scriptCharset : "utf-8",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8"
				});
	
				$.ajax({
					type : "GET",
					url : "<spring:url value='/getProjectDetails' />",
					data : "projectName=" + data1,
					dataType : "json",
	
					success : function(data) {
						
						var projectName="";
						if (!$.trim(data)) {   
						    alert("No employee is assigned with a task in this project." + data);
						}
						else {
						 	$.each(data, function(index, tasks) {
							projectName = tasks.projectName;
							$('#projectName').append(projectName);
							
						    var des ="";
						    var tab ="";
							var startDate = new Date(tasks.startTask);
							var dateString = startDate.getDate() + "/" + startDate.getMonth() + "/" + startDate.getFullYear();
							var endDate = new Date(tasks.endTask);
							var endDateString = endDate.getDate() + "/" + endDate.getMonth() + "/" + endDate.getFullYear();
							
							des += "<br><b><u>"+"Project Name:-"+"</u></b>&nbsp;"+tasks.projectName+"&emsp;<b><u>"+"Task Description:-"+"</u></b>&nbsp;"+
							tasks.taskDescription+"&emsp;<b><u>"+"Start Task:-"+"</u></b>&nbsp;"+dateString+"&emsp;<b><u>"+"End Task:-"+"</u></b>&nbsp;"+
							endDateString+"</br><br>";
							
						    tab += "<tr><th>&nbsp;"+"Id"+"&nbsp;</th><th>&nbsp;"+"Employee"+"&nbsp;</th></tr>";
	
						    for(var i =0;i < tasks.listTaskEmployee.length;i++){
							  tab +="<tr><td>&nbsp;"+tasks.listTaskEmployee[i].id+"&nbsp;</td>"+"<td>&nbsp;"+tasks.listTaskEmployee[i].name+"&nbsp;</td></tr>";
						    }   
					
				            $("#result").append("<div id='counter"+index+"'></div>");
				            $("#result").append("<table id='d"+index+"' border=1>"+"<tr><th>"+"Id"+"</th><th>"+"Employee"+"</th></tr>"+"</table>");
				    		$("#counter"+index).html(des);
				            $("#d"+index).html(tab);	
				            tab = null;
							});  
						}
					},
					complete : function(xhr, textStatus) {
					},
					error : function(data) {
						alert("error:" + data)
					}
				});
	
			});
		</script>
	</body>
</html>
