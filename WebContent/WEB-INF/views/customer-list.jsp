<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer-list</title>
</head>
<body>

	<h1>Customer List Age Greater 15</h1>
	<a href="${pageContext.request.contextPath }/">Index</a>
	<c:if test="${not empty list }">
		<table border="1">
			<tr>
				<th>ID </th>
				<th>Name </th>
				<th>Address </th>
				<th>Age </th>
			</tr>
			<c:forEach items="${list }" var="item">
				<tr>
					<td>${item.id } </td>
					<td>${item.name } </td>
					<td>${item.address } </td>
					<td>${item.age } </td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>