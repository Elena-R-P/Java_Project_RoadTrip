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
		<nav class="navbar justify-content-between ps-3 pe-3">
		  <p class="name">Create a new Trip!</p>
		  <a href="/logout" class="name"">Logout</a>
		</nav>
		<div id="main">
		    <div class="new_trip_img">
		    	<div class="col">
				    <img id="road_bw" src="/img/road.jpg">
				    <img id="car" src="/img/car.jpg">
				    <img id="join_bw" src="/img/join.jpg">
			    </div>
			</div>
			<div class="content">
				<h1>Step 2. Let's plan what you're going to do every day</h1>
				<p>Check how many days you will need to make this trip?</p>
				
				<a class="btn btn-warning" href="/day/new">Add new day</a>
				<table class="table table-hover mt-5">
				  <thead>
				    <tr>
				      <th scope="col">Date</th>
				      <th scope="col">From</th>
				      <th scope="col">To</th>
				      <th scope="col">mls</th>
				      <th scope="col">Driving hours</th>
				      <th scope="col">Description</th>
				    </tr>
				  </thead>
				  	<tbody>
					  	<c:forEach items="${days}" var="day">
					    <tr>
					      <th scope="row"><a href="/day/${day.id}"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${day.date}"/></a></th>
					      <td><c:out value="${day.start}"/></a></td>
					      <td><c:out value="${day.end}"/></a></td>
					      <td><c:out value="${day.mls}"/></a></td>
					      <td><c:out value="${day.hours}"/></a></td>
					      <td><c:out value="${day.description}"/></a></td>
					    </tr>
					    </c:forEach>
					</tbody>
				</table>
				
		    </div>
		    
	    </div>
	    <div class="mb-3 d-flex justify-content-end">
			<a class="btn btn-warning" href="/newtrip">Previous Step</a>
			<a class="btn btn-warning ms-3" href="/showtrip">Next Step</a>
		</div>
	  </div>
	


</body>

</html>