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
<script src="https://kit.fontawesome.com/ab2155e76b.js" crossorigin="anonymous"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Original+Surfer&display=swap');
.container{
	min-width: 1500px;
	padding: 30px;
    min-height: 100vh;
	background-image: linear-gradient(-20deg, #e9defa 0%, #fbfcdb 100%);
	font-family: 'Original Surfer', cursive;
	background-size:cover;
    opacity: initial;
}
#main {
	width: 1400px;
    display: flex;
    justify-content: space-between;
    align-items:center;
}
#contentTrip{
	margin-left: 30px;
	width: 500px;
}
#trip_plan{
	margin-left: 20px;
	padding: 45px;
	text-align: center;
	width: 500px;
	height: 180px;
	background: rgb(208,254,255);
	background: radial-gradient(circle, rgba(208,254,255,1) 0%, rgba(16,244,255,0.8729866946778712) 38%);
	border-radius: 50%;
}
#join {
	margin-top: 70px;
	width: 200px;
    height: 150px;
    border-radius: 50%;
    display: block;
}
#road_bw {
	width: 200px;
    height: 150px;
    border-radius: 50%;
    display: block;
    -webkit-filter: grayscale(100%);
  	filter: grayscale(100%);
}
#car_bw {
	margin-top: 70px;
	margin-left: 100px;
	width: 200px;
    height: 150px;
    border-radius: 50%;
    display: block;
    -webkit-filter: grayscale(100%);
 	filter: grayscale(100%);
}
</style>


</head>
<body>
	<p class="text-denger"><c:out value="${please}"/></p>
	<div class="container">
		<div id="main">
		    <div id="new_trip_img">
				<img id="road_bw" src="/img/road.jpg">
				<img id="car_bw" src="/img/car.jpg">
				<img id="join" src="/img/join.jpg">
			</div>
			<div id="contentTrip">
				<h1>Let's check the Trip you created</h1>
					<ul class="list-group list-group-flush">
						<li class="list-group-item text-left "><h3 class="card-title">Name: <c:out value="${trip.name}"/></h3></li>
						<li class="list-group-item text-left"><h3 class="card-title">Date: <fmt:formatDate pattern = "yyyy-MM-dd" value = "${trip.dateStart}"/> - <fmt:formatDate pattern = "yyyy-MM-dd" value = "${trip.dateEnd}"/></h3></li>
						<li class="list-group-item text-left"><h3 class="card-title">Duration: <c:out value="${trip.duration}"/></h3></li>
						<li class="list-group-item text-left"><h3 class="card-title">Organized by: <c:out value="${trip.description}"/></h3></li>
					</ul>
				
				
	    	</div>
	    	<div id="trip_plan">
	    		<h1>Daily plan for your trip</h1>
	    	</div>
	    </div>
	    <div class="contentDay">
	    				
				<table class="table table-hover mt-5">
				  <thead>
				    <tr>
				      <th scope="col">Date</th>
				      <th scope="col">From</th>
				      <th scope="col">To</th>
				      <th scope="col">mls</th>
				      <th scope="col">Driving hours</th>
				      <th scope="col">Description</th>
				      <th scope="col">Actions</th>
				    </tr>
				  </thead>
				  	<tbody>
				  	<c:forEach items="${days}" var="day">
				  		<c:if test="${day.trip.id == trip.id}">
					  	
					  	
					    <tr>
					      <th scope="row"><a href="/day/${day.id}"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${day.date}"/></a></th>
					      <td><c:out value="${day.start}"/></td>
					      <td><c:out value="${day.end}"/></td>
					      <td><c:out value="${day.mls}"/></td>
					      <td><c:out value="${day.hours}"/></td>
					      <td><c:out value="${day.description}"/></td>
					      <td>
					      <c:if test="${trip.user.id == userId}">
					      	<form action="/day/delete/${day.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-outline-danger me-3">
							</form>
					      </c:if>
					      </td>
					    </tr>
					   
					    
					    </c:if> 
					</c:forEach>
					</tbody>
				</table>
			
		  </div>
	    <div class="mb-3 d-flex justify-content-end">
			<a class="btn btn-warning" href="/dashboard">Go to Dashboard</a>
		</div>
	  
	</div>
		

</body>

</html>