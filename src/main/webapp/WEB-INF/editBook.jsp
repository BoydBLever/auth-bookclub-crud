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
    <title>Edit Book</title>
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
   		<h1>Edit Book</h1>
   		<form:form action="/books/edit/${id}" method="POST" modelAttribute="foundBook" class="form">
  		<input type="hidden" name="_method" value="put"/>
  	<p>
        	<form:label path="bookName">Book Name:</form:label>
        	<form:errors path="bookName"/>
       		<form:input type="text" path="bookName" class="form-control"/>
    </p>
     <p>
        	<form:label path="author">Author:</form:label>
        	<form:errors path="author"/>
        	<form:input type="text" path="author" class="form-control"/>
    </p>
     <p>
        	<form:label path="description">Description:</form:label>
        	<form:errors path="description"/>
        	<form:textarea path="description" class="form-control"></form:textarea>
    </p>
    		<form:hidden path="user" /> 
    		<button type="submit" class="btn btn-primary">Edit book</button>
		</form:form>
 	</div>
</body>
</html>