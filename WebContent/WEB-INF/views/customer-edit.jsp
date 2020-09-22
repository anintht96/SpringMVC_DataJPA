<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer edit</title>
</head>
<body>

	<h1>Customer edit</h1>
	<a href="${pageContext.request.contextPath }/">Index</a>
	<c:if test="${not empty customer }">
		<form:form action="${pageContext.request.contextPath }/customer-edit" modelAttribute="customer" method="Post">
			<table>
				<form:hidden path="id" value="${customer.id }"/>
				<tr>
					<td>Name: </td>
					<td> <form:input path="name" value="${customer.name }"/> </td>
				</tr>
				<tr>
					<td>Address: </td>
					<td> <form:input path="address" value="${customer.address }"/> </td>
				</tr>
				<tr>
					<td>Age: </td>
					<td> <form:input path="age" value="${customer.age }"/> </td>
				</tr>
				<tr>
					<td colspan="2"> <button type="submit">Edit</button>
				</tr>
			</table>
		</form:form>
	</c:if>

</body>
</html>