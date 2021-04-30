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
	padding: 50px;
	text-align: center;
	width: 500px;
	height: 330px;
	background: rgb(208,254,255);
	background: radial-gradient(circle, rgba(208,254,255,1) 0%, rgba(16,244,255,0.8729866946778712) 38%);
	border-radius: 50%;
}
#road {
	width: 200px;
    height: 150px;
    border-radius: 50%;
    display: block;
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
#join_bw {
	margin-top: 70px;
	width: 200px;
    height: 150px;
    border-radius: 50%;
    display: block;
    -webkit-filter: grayscale(100%);
    filter: grayscale(100%);
}
.display{
	background: rgb(208,254,255);
	background: radial-gradient(circle, rgba(208,254,255,1) 0%, rgba(16,244,255,0.8729866946778712) 38%);
	border-radius: 10px;
}

/**
.input{
	text-align:center;
}
input[type="text"]{
	height: 50px;
	width: 200px;
	background: white;
	border: none;
	border-radius: 2px;
}



*/


</style>


</head>
<body>
	<p class="text-denger"><c:out value="${please}"/></p>
	<div class="container">
		<div id="main">
		    <div id="new_trip_img">
				<img id="road" src="/img/road.jpg">
				<img id="car_bw" src="/img/car.jpg">
				<img id="join_bw" src="/img/join.jpg">
			</div>
			<div id="contentTrip">
				<h1>Create a new Trip!</h1>
				<form:form action="/trip/new" method="post" modelAttribute="trip">
				    <div class="mb-3">
				        <form:label class="form-label" path="name">Name</form:label>
				        <form:input path="name" class="form-control"/>
				        <form:errors class="text-danger" path="name"/>
				    </div>
				     <div class="mb-3">
				        <form:label class="form-label" path="dateStart">Date</form:label>
				        <form:input path="dateStart" class="form-control" type="date"/>
				        <form:errors class="text-danger" path="dateStart"/>
				    </div>
				    <div class="mb-3">
				        <form:label class="form-label" path="dateEnd">Date</form:label>
				        <form:input path="dateEnd" class="form-control" type="date"/>
				        <form:errors class="text-danger" path="dateEnd"/>
				    </div>
				    <div class="mb-3">
				        <form:label class="form-label" path="duration">Duration</form:label>
				        <form:input path="duration" class="form-control"/>
				        <form:errors class="text-danger" path="duration"/>
				    </div>
				    
				    <div class="mb-3">
				        <form:label class="form-label" path="description">Description</form:label>
				        <form:textarea path="description" class="form-control"/>
				        <form:errors class="text-danger" path="description"/>
				    </div>
				   
				    <form:hidden value="${userId}" path="user"/>
				    <div class="mb-3 d-flex justify-content-end">
				    	<input class="btn btn-info" type="submit" value="Daily Plan Page"/>
				    </div>
				</form:form>
	    	</div>
	    	<div id="trip_plan">
	    		<h1>Let's create a daily plan for your trip! But first you might want to check the weather:</h1>
	    		<div class="input">
	    			<input type="text" class="inputValue" placeholder="Enter a location">
	    			<input type="submit" value="Submit" class="button">
	    		</div>
	    		<div class="display">
	    			<h1 class="city"></h1>
	    			<p class="desc"></p>
	    			<p class="temp"></p>
	    		</div>
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
					    <tr>
					      <th scope="row"><a href="/day/${day.id}"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${day.date}"/></a></th>
					      <td><c:out value="${day.start}"/></td>
					      <td><c:out value="${day.end}"/></td>
					      <td><c:out value="${day.mls}"/></td>
					      <td><c:out value="${day.hours}"/></td>
					      <td><c:out value="${day.description}"/></td>
					      <td>
					      	<form action="/day/delete/${day.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-outline-danger me-3">
							</form>
					      
					      </td>
					    </tr>
					    </c:forEach>
					</tbody>
				</table>
				
		    </div>
	    <div class="mb-3 d-flex justify-content-end">
			<a class="btn btn-warning" href="/newtrip_two">Next Step</a>
		</div>
	  
	</div>
		
<script>
	var button = document.querySelector('.button');
	var inputValue = document.querySelector('.inputValue');
	var city = document.querySelector('.city');
	var desc = document.querySelector('.desc');
	var temp = document.querySelector('.temp');
	
	button.addEventListener('click', function(){
		fetch('http://api.openweathermap.org/data/2.5/weather?q='+inputValue.value+'&appid=API_KEY&units=imperial')
		.then(response => response.json())
		.then(data => {
			var cityValue = data['name'];
			var tempValue = data['main']['temp'];
			var descValue = data['weather'][0]['description'];
			
			city.innerHTML = cityValue;
			temp.innerHTML = tempValue;
			desc.innerHTML = descValue;
		})
		
		
		
		
		.catch(err => alert("Wrong city name"))
	})

</script>


</body>

</html>