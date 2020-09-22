<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>

	<a href="customer-save">Customer Save</a> <br>
	<a href="customer-age-greater/15">List Age Greater 15</a> <br>
	<a href="customer-page/">Page 0</a> <br>
	<a href="customer-page/?page=2&size=10">page 2 size 10</a> <br>
	
	
	<c:if test="${not empty list }">
		<table border="1">
			<tr>
				<th>ID </th>
				<th>Name </th>
				<th>Address </th>
				<th>Age </th>
				<th>View </th>
				<th>Edit </th>
				<th>Delete </th>
			</tr>
			<c:forEach items="${list }" var="item">
				<tr>
					<td>${item.id } </td>
					<td>${item.name } </td>
					<td>${item.address } </td>
					<td>${item.age } </td>
					<td> <a href="customer-view/${item.id }">View</a> </td>
					<td> <a href="customer-edit/${item.id }">Edit</a> </td>
					<td> <a href="customer-delete/${item.id }">Delete</a> </td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>