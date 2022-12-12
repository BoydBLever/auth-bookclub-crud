<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Details</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-5">
	<h3><c:out value="${book.user.userName}"/> read <c:out value="${book.bookName}"/>
	by <c:out value="${book.author}"/>.</h3>
	<table class="table">
<%-- 	<tr>
		<td> Book Name: </td>
		<td> <c:out value="${book.bookName}"/> </td>
	</tr>
	<tr>
		<td> Author: </td>
		<td> <c:out value="${book.author}"/> </td>
	</tr> --%>
	<tr>
		<td> Here are <c:out value="${book.user.userName}"/>'s thoughts: </td>
		<td> <c:out value="${book.description}"/> </td>
	</tr>
	<c:choose>
		<c:when test="${book.user.id == userId}">
		<tr>
			<td><a class="btn btn-success" href="/books/edit/${book.id }">Edit</a><form action="/books/delete/${book.id}" method="post">
					<input type="hidden" name="_method" value="delete"/>
					<input class="btn btn-danger" type="submit" value="Delete"/>
					</form>
			</td>
		</tr>
		</c:when>
	</c:choose>
	</table>
	<p> <a href="/books"> Back to Book Club</a></p>
</div>

</body>
</html>