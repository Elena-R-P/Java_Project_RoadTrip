<%@ page isErrorPage="true" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript" src="js/app.js"></script>
    <c:url value="/img/road.jpg" var="road"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

</head>
<body>
	<p class="text-denger"><c:out value="${please}"/></p>
	<div class="container">
		<nav class="navbar justify-content-between">
		  <img id="road" src="/img/road.jpg">
		  <a href="/mytrips" class="name">My trips</a>
		  <a href="/newtrip" class="name">Create a new trip</a>
		  <a href="/logout" class="name"">Logout</a>
		  <form class="d-flex" th:action="@{/dashboard}">
			 <input class="form-control me-2" placeholder="Search" type="text" name="keyword" id="keyword" size="20" th:value="${keyword}" required />
			    &nbsp;
			    <input type="submit" value="Search" class="btn btn-outline-success"/>
			    <a href="/dashboard" class="btn btn-outline-success ms-2">Clear</a>
			</form>
		</nav>
		<div class="row">
			<div class="col p-3 m-3">
	    		<h2 class="info">Future Trips</h2>
	    			<table class="table table-hover mt-5">
					  <thead>
					    <tr>
					      <th scope="col">Location</th>
					      <th scope="col">Date</th>
					      <th scope="col">Description</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">Chicago,IL - Nashville,TN</th>
					      <td>05/21/2021</td>
					      <td>3 days road trip, want to visit ..... </td>
					    </tr>
					</table>	
	    	</div>
	    	<div class="col p-3 m-3">
	    		<h2 class="info">Past Trips</h2>
	    			<table class="table table-hover mt-5">
					  <thead>
					    <tr>
					      <th scope="col">Location</th>
					      <th scope="col">Date</th>
					      <th scope="col">Description</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">Chicago,IL - Nashville,TN</th>
					      <td>05/21/2021</td>
					      <td>3 days road trip, want to visit ..... </td>
					    </tr>
					</table>	
	    	</div>
		
		
		
		</div>
    	
	</div>
</body>
</html>