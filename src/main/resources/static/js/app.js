/**
Distance Matrix API
Directions API
Maps JavaScript API
Places API
 */
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



/** create autocomplete */

var options = {
	types: ['(cities)']
}

var input1 = document.getElementById("start");
var autocomplete1 = new google.maps.places.Autocomplete(input1, options);

var input2 = document.getElementById("end");
var autocomplete2 = new google.maps.places.Autocomplete(input2, options);
















