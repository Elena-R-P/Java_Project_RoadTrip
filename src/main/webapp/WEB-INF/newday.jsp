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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=API_KEY&libraries=places"></script>
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
.contentTrip {
	padding: 20px;
	margin-left: 30px;
	width: 400px;
	dispaly: block;
}
#distance_form,
h3 {
	text-align: center;
}
#result{
	margin-top: 20px;
}
#result .info_out{
	color: red;
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

#button{
	margin-top:150px;
}
</style>
<script>
$(function(){
    google.maps.event.addDomListener(window, "load", function (){
        var from_places = new google.maps.places.Autocomplete(document.getElementById('from_places'));
        var to_places = new google.maps.places.Autocomplete(document.getElementById('to_places'));

        google.maps.event.addListener(from_places, 'place_changed', function (){
            var from_place = from_places.getPlace();
            var from_address = from_place.formatted_address;
            $('#origin').val(from_address);
        });
        google.maps.event.addListener(to_places, 'place_changed', function (){
            var to_place = to_places.getPlace();
            var to_address = to_place.formatted_address;
            $('#destination').val(to_address);
        });
    });
    // Calculate distance
    function calculateDistance(){
        var origin = $('#origin').val();
        var destination = $('#destination').val();
        var service = new google.maps.DistanceMatrixService();
        service.getDistanceMatrix(
            {
                origins: [origin],
                destinations: [destination],
                travelMode: google.maps.TravelMode.DRIVING,
                unitSystem: google.maps.UnitSystem.IMPERIAL,
                avoidHighways: false,
                avoidTolls: false,
            }, callback);
    }
    // Get results
    function callback(response, status){
        if (status != google.maps.DistanceMatrixStatus.OK){
            $('#result').html(err);
        } else {
            var origin = response.originAddresses[0];
            var destination = response.destinationAddresses[0];
            if (response.rows[0].elements[0].status === "ZERO_RESULTS"){
                $('#result').html("Plane is better for this route");
            } else {
                var distance = response.rows[0].elements[0].distance;
                var duration = response.rows[0].elements[0].duration;
                console.log(response.rows[0].distance);
                var distance_in_mile = distance.value / 1609.34;
                var duration_text = duration.text;
                $('#in_mile').text(distance_in_mile.toFixed(2));
                $('#duration_text').text(duration_text);

            }
        }

    }
    $('#distance_form').submit(function(e) {
        e.preventDefault();
        calculateDistance();
    });
});

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
				<div class="jumbotron">
		            <h3>Please choose locations that you want to check</h3>
		            <form id="distance_form">
		                <div class="form-group mb-3 mt-3">
		                    <input id="from_places" class="form-control" placeholder="Enter an Origin location" />
		                    <input id="origin" type="hidden" name="origin" required/>
		                </div>
		                <div class="form-group mb-2">
		                    <input id="to_places" class="form-control" placeholder="Enter a Destination location" />
		                    <input id="destination" type="hidden" name="destination" required/>
		                </div>
		                <input type="submit" value="Calculate" class="btn btn-outline-danger"/>
		            </form>
		        </div>
	            <div id="result">
	                <ul class="list-group">
	                    <li class="list-group-items d-flex justify-content between align-items-center">
	                        <p class="info">Distance In Mile ===><p>
	                        <p class="info_out"><span id="in_mile"></span></p>
	                    </li>
	                    <li class="list-group-items d-flex justify-content between align-items-center">
	                        <p class="info">Driving hours ===><p>
	                        <p class="info_out"><span id="duration_text"></span></p>
	                    </li>
	                </ul>
	            </div>

        	</div>
			
			<div id="trip_plan">
				<h1>Let's plan your day</h1>
				<form:form action="/day/new" method="post" modelAttribute="day">
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
				    <form:hidden value="${tripId}" path="trip"/>
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

</body>
</html>