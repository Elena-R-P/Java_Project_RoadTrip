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
		  <a href="/trip/new" class="name">Create a new trip</a>
		  <a href="/logout" class="name">Logout</a>
		  <form class="d-flex" th:action="@{/dashboard}">
			 <input class="form-control me-2" placeholder="Search" type="text" name="keyword" id="keyword" size="20" th:value="${keyword}" required />
			    &nbsp;
			    <input type="submit" value="Search" class="btn btn-outline-success"/>
			    <a href="/dashboard" class="btn btn-outline-success ms-2">Clear</a>
			</form>
		</nav>
		
    	<div class="row p-3 m-3">
    		<h2 class="info">Road trips have always been a favorite pastime in the United States and will continue to be, as what better way than being free to experience a vast array of stunning coastal views, breathtaking valleys and rocky cliffs, lush forests and limitless deserts. Behind the wheel. Our website will help you plan your trip, whichever destination you choose in the United States.</h2>
    			<table class="table table-hover mt-5">
				  <thead>
				    <tr>
				      <th scope="col">Name</th>
				      <th scope="col">Date</th>
				      <th scope="col">Duration</th>
				      <th scope="col">Organized By</th>
				      <th scope="col">Description</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach items="${trips}" var="trip">
				    <tr>
				      <th scope="row"><a href="/trip/show/${trip.id}"><c:out value="${trip.name}"/></a></th>
				      <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${trip.dateStart}"/> - <fmt:formatDate pattern = "yyyy-MM-dd" value = "${trip.dateEnd}"/></td>
				      <td><c:out value="${trip.duration}"/></td>
				      <td><c:out value="${trip.user.firstName}"/> <c:out value="${trip.user.lastName}"/></td> 
				      <td><c:out value="${trip.description}"/></td>
				    </tr>
				    </c:forEach>
				</table>	
    	</div>
	
	</div>
</body>
</html>