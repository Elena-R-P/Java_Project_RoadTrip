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

	width: 500px;
	height: 600px;
}
#road_bw {
	width: 200px;
    height: 150px;
    border-radius: 50%;
    display: block;
    -webkit-filter: grayscale(100%);
  	filter: grayscale(100%);
}
#car {
	margin-top: 70px;
	margin-left: 100px;
	width: 200px;
    height: 150px;
    border-radius: 50%;
    display: block;
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
#floating-panel {
	top: 10px;
    left: 25%;
    z-index: 5;
    padding: 5px;
    text-align: center;
    line-height: 30px;
    padding-left: 10px;
}
#map {
    margin-top: 20px;
    margin-left: 10px;
    border-radius: 20px;
	width: 100%;
	height: 400px;
    
}

#button{
	margin-top:150px;
}
</style>
<script>
function initMap() {
    const directionsService = new google.maps.DirectionsService();
    const directionsRenderer = new google.maps.DirectionsRenderer();
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 7,
        center: {lat: 41.8638, lng: -87.6372},
    });
    directionsRenderer.setMap(map);

    const onChangeHandler = function () {
        calculateAndDisplayRoute(directionsService, directionsRenderer);
    };
    document.getElementById("start").addEventListener("change", onChangeHandler);
    document.getElementById("end").addEventListener("change", onChangeHandler);
}

function calculateAndDisplayRoute(directionsService, directionsRenderer) {
    directionsService.route(
    {
        origin: {
            query: document.getElementById("start").value,
        },
        destination: {
            query: document.getElementById("end").value,
        },
        travelMode: google.maps.TravelMode.DRIVING,
    },
    (response, status) => {
        if (status === "OK") {
            directionsRenderer.setDirections(response);
        } else {
            window.alert("Directions request failed due to " + status);
        }
    });
}

</script>

</head>
<body>
	<p class="text-denger"><c:out value="${please}"/></p>
	<div class="container">
		<div id="main">
		    <div id="new_trip_img">
				    <img id="road_bw" src="/img/road.jpg">
				    <img id="car" src="/img/car.jpg">
				    <img id="join_bw" src="/img/join.jpg">
			</div>
			<div class="contentTrip">
				<div id="floating-panel">
				    <b class="ps-2">Origin: </b>
				    <select id="start" class="mb-3">
				        <option value="chicago, il">Chicago, IL</option>
				        <option value="miami, fl">Miami, FL</option>
				        <option value="nashville, tn">Nashville, TN</option>
				        <option value="joplin, mo">Joplin, MO</option>
				        <option value="oklahoma city, ok">Oklahoma City, OK</option>
				        <option value="amarillo, tx">Amarillo, TX</option>
				        <option value="gallup, nm">Gallup, NM</option>
				        <option value="flagstaff, az">Flagstaff, AZ</option>
				        <option value="winona, az">Winona, AZ</option>
				        <option value="kingman, az">Kingman, AZ</option>
				        <option value="barstow, ca">Barstow, CA</option>
				        <option value="san bernardino, ca">San Bernardino, CA</option>
				        <option value="los angeles, ca">Los Angeles, CA</option>
				    </select>
				    <b class="pl-2">Destination: </b>
				    <select id="end" class="mb-3">
				        <option value="chicago, il">Chicago, IL</option>
				        <option value="miami, fl">Miami, FL</option>
				        <option value="nashville, tn">Nashville, TN</option>
				        <option value="joplin, mo">Joplin, MO</option>
				        <option value="oklahoma city, ok">Oklahoma City, OK</option>
				        <option value="amarillo, tx">Amarillo, TX</option>
				        <option value="gallup, nm">Gallup, NM</option>
				        <option value="flagstaff, az">Flagstaff, AZ</option>
				        <option value="winona, az">Winona, AZ</option>
				        <option value="kingman, az">Kingman, AZ</option>
				        <option value="barstow, ca">Barstow, CA</option>
				        <option value="san bernardino, ca">San Bernardino, CA</option>
				        <option value="los angeles, ca">Los Angeles, CA</option>
				    </select>
				 </div>
				 <div id="map"></div>
			</div>
			<div id="trip_plan">
				<h1>Let's plan your day</h1>
				<form:form action="/day/${id}" method="post" modelAttribute="day">
					<input type="hidden" name="_method" value="put">
					<div class="mb-3">
				        <form:label class="form-label" path="trip">Trip</form:label>
				        <form:select path="trip" class="form-control">
				        <c:forEach items="${trips}" var="trip">
				        	<form:option name="priority" value="${trip.id}"><c:out value="${trip.name}"/></form:option>
				        </c:forEach>
				        </form:select>
				        <form:errors class="text-danger" path="trip"/>
			    	</div>
				    <div class="mb-3">
				        <form:label class="form-label" path="date">Date</form:label>
				        <form:input path="date" class="form-control" type="date"/>
				        <form:errors class="text-danger" path="date"/>
				    </div>
				    <div class="mb-3">
				        <form:label class="form-label" path="start">Origin</form:label>
				        <form:input path="start" class="form-control"/>
				        <form:errors class="text-danger" path="start"/>
				    </div>
				    <div class="mb-3">
				        <form:label class="form-label" path="end">Destination</form:label>
				        <form:input path="end" class="form-control"/>
				        <form:errors class="text-danger" path="end"/>
				    </div>
				    <div class="mb-3">
				        <form:label class="form-label" path="mls">Mls</form:label>
				        <form:input type="number" path="mls" class="form-control"/>
				        <form:errors class="text-danger" path="mls"/>
				    </div>
				    <div class="mb-3">
				        <form:label class="form-label" path="hours">Driving hours</form:label>
				        <form:input type="number" path="hours" class="form-control"/>
				        <form:errors class="text-danger" path="hours"/>
				    </div>
				    <div class="mb-3">
				        <form:label class="form-label" path="description">Description</form:label>
				        <form:textarea path="description" class="form-control"/>
				        <form:errors class="text-danger" path="description"/>
				    </div>
				    <form:hidden value="${day.trip.id}" path="trip"/>
				    <div class="mb-3">
				    	<input class="btn btn-info" type="submit" value="Submit"/>
				    </div>
				</form:form>
				
			</div>
			
		</div>
		<div id="button">
				 <a href="/dashboard" class="btn btn-info">Go to dashboard</a>
		</div>	
			
	</div>
<script
    src="https://maps.googleapis.com/maps/api/js?key=API-KEY&callback=initMap&libraries=&v=weekly"
    async
    ></script>
		<script src="js/app.js"></script>
</body>
</html>