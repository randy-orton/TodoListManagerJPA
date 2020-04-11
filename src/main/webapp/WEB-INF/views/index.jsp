<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html>
<head>
<link href="/TodoListManagerJPA/css/app.css" rel="stylesheet"/>
<!-- <link href="/css/app.css" rel="stylesheet"/>
 -->
<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<!-- <script type="text/javascript" src="/static/js/app.js"></script> -->
<script type="text/javascript" src="/TodoListManagerJPA/js/app.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Todo Manager</title>
</head>
<body ng-app="todoManager" ng-controller="todoController">
	</br>
	<h4 class="todo">Todo Manager</h4>
	
	<form ng-submit="submitTodo()">
		<table>
 
			<tr>
				<th colspan="2">Add/Edit todo</th>
			</tr>
			<tr>
				<td>Task Name</td>
				<td><input type="text" ng-model="todoForm.taskName" /></td>
			</tr>
			<tr>
				<td>Task Desc</td>
				<td><input type="text" ng-model="todoForm.taskDesc" /></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><select id="status"  ng-model="todoForm.status" ng-options="x for x in status" /></select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit"
					class="blue-button" /></td>
			</tr>
		</table>
	</form>
	
	<table>
		<tr>
 
				<th width="120">Task Name</th>
				<th width="120">Task Desc</th>
				<th width="60">Status</th>
				<th width="60">Operations</th>
 
		</tr>
 
		<tr ng-repeat="todo in todos" ng-init="statusCls=getClass(todo)">
 
			<td>{{ todo.taskName }}</td>
			<td>{{ todo.taskDesc }}</td>
			<td class="statusCls"> {{ todo.status }} </td>
		
			<td><a ng-click="editTodo(todo)" class="blue-button">Edit</a>
				| <a ng-click="deleteTodo(todo)" class="red-button">Delete</a></td>
		</tr>
 
	</table>

</body>
</html>