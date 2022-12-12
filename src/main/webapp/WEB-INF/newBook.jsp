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
    <title>New Book</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
    	<h1> WELCOME, <c:out value="${userName }"/> </h1>
   		<p> <a href="/logout">Logout</a>
   		<form:form action="/books/new" method="POST" modelAttribute="newBook">
  <p>
        	<form:label path="bookName">Book Name:</form:label>
        	<form:errors path="bookName"/>
       		<form:input path="bookName" class="form-control"/>
    </p>
     <p>
        	<form:label path="quantity">Quantity:</form:label>
        	<form:errors path="quantity"/>
        	<form:input type="number" path="quantity" class="form-control"/>
    </p>
     <p>
        	<form:label path="description">Description:</form:label>
        	<form:errors path="description"/>
        	<form:textarea path="description" class="form-control"></form:textarea>
    </p>
    		<form:hidden path="book" value="${userId}" /> <!-- I set path = book, but Heidi used donor. Why? -->
    		<button type="submit">Add new book</button>
		</form:form>
 	</div>
</body>
</html>