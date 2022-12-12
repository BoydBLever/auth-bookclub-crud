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
    <title>Books</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container mt-5"> 
		<h1> WELCOME to the Book Club, <c:out value="${userName }"/>! </h1>
   		<p> <a href="/books/new">Add Book</a> | 
   		<a href="/logout">Logout</a> </p>
   		<!-- TABLE: DO SOME COPY AND PASTE FROM "YESTERDAY'S" ONE-TO-MANY ASSIGNMENT-->
   	<table class="table">
   		<thead>
		<tr>
			<th>ID</th>
			<th>Book</th>
			<th>Author</th>
			<th>Posted By</th>
		</tr>
	</thead>
		<tbody>
			<c:forEach var="eachBook" items="${bookList }">
				<tr>
					<td> ${eachBook.id} </td> <!-- ID -->
					<td> <a href="/books/${eachBook.id }">
								<c:out value="${eachBook.bookName}"/></a></td><!-- Book -->
					<td> <c:out value="${eachBook.author}"/></td><!-- Author -->
					<td> <c:out value="${eachBook.user.userName}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
   		
   </div>
</body>
</body>
</html>