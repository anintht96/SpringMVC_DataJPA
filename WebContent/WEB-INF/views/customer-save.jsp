<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer-save</title>
</head>
<body>

	<h1>Customer save</h1>
	<a href="${pageContext.request.contextPath }/">Index</a>

	<form:form action="customer-save" method="POST" modelAttribute="customer">
		<table>
			<tr>
				<td>ID </td>
				<td> <form:input path="id"/> </td>
			</tr>
			<tr>
				<td>Name </td>
				<td> <form:input path="name"/> </td>
			</tr>
			<tr>
				<td>Address </td>
				<td> <form:input path="address"/> </td>  
			</tr>
			<tr>
				<td>Age </td>
				<td> <form:input path="age"/> </td>
			</tr>
			<tr>
				<td colspan="2"> <button type="submit">Save</button> 
			</tr>
		</table>
	</form:form>

</body>
</html>