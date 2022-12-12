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
    <title>LogReg</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
   <div class="container mt-5">
   		<h1>Register</h1>
   		<form:form action="/register" method="POST" modelAttribute="newUser">
   		<!-- register form -->
   		<div class="form-group">
        	<form:label path="userName">User Name:</form:label>
        	<form:input path="userName" class="form-control"/>
        	<form:errors path="userName" class="text-danger"/>
    	</div>
    	<div class="form-group">
        	<form:label path="email">Email:</form:label>
        	<form:input path="email" class="form-control"/>
        	<form:errors path="email" class="text-danger"/>
    	</div>
    	<div class="form-group">
        	<form:label path="password">Password:</form:label>
        	<form:input type="password" path="password" class="form-control"/>
        	<form:errors path="password" class="text-danger"/>
     	</div>
     	<div class="form-group">
        	<form:label path="confirm">Confirm password:</form:label>
        	<form:input type="password" path="confirm" class="form-control"/>
       		<form:errors path="confirm" class="text-danger"/>
    	</div>
    		<button type="submit" class="btn btn-primary">Register</button>
   		</form:form>
   		
   		<h1>Login</h1>
   		<form:form action="/login" method="POST" modelAttribute="newLogin">
   		<div class="form-group">
        	<form:label path="email">Email:</form:label>
        	<form:input path="email" class="form-control"/>
        	<form:errors path="email" class="text-danger"/>
   		</div>
     	<div class="form-group">
        	<form:label path="password">Password:</form:label>
        	<form:input type="password" path="password" class="form-control"/>
        	<form:errors type="password" path="password" class="text-danger"/>
    	</div>
   		 <button type="submit" class="btn btn-primary">Login</button>
   		</form:form>
   </div>
</body>
</html>