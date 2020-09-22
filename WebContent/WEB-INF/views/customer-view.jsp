<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer view</title>
</head>
<body>

	<h1>Customer view</h1>
	<a href="${pageContext.request.contextPath }/">Index</a>
	
	<c:if test="${not empty view }">
		<table>
			<tr>
				<td>Id: </td>
				<td>${view.id } </td>
			</tr>
			<tr>
				<td>Name: </td>
				<td>${view.name } </td>
			</tr>
			<tr>
				<td>Address: </td>
				<td>${view.address } </td>
			</tr>
			<tr>
				<td>Age: </td>
				<td>${view.age } </td>
			</tr>
		</table>
	</c:if>

</body>
</html>