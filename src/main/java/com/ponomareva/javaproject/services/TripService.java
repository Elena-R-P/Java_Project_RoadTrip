package com.ponomareva.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ponomareva.javaproject.models.Trip;
import com.ponomareva.javaproject.repositories.TripRepository;

@Service
public class TripService {
	private final TripRepository tripRepository;
	public TripService(TripRepository tripRepository) {
		this.tripRepository = tripRepository;
	}
	
	public Trip findTripById(Long id) {
    	Optional<Trip> trip = tripRepository.findById(id);
    	if(trip.isPresent()) {
            return trip.get();
    	} else {
    	    return null;
    	}
    }
	public List<Trip> findAllTrips(){
		return tripRepository.findAll();
	}
	public void deleteTrip(Long id) {
		tripRepository.deleteById(id);
	}
	public Trip saveTrip(Trip t) {
		return tripRepository.save(t);
	}
	public List<Trip> listAll(String keyword){
		if (keyword != null) {
			return tripRepository.search(keyword);
		}
		return tripRepository.findAll();
	}
	
}
