package com.ponomareva.javaproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ponomareva.javaproject.models.Trip;

@Repository
public interface TripRepository extends CrudRepository<Trip, Long>{
	@Query("SELECT p FROM Trip p WHERE CONCAT(p.name, '', p.duration, '') LIKE %?1%")
	public List<Trip> search(String keyword);
	
	List<Trip> findAll();
	
	void deleteById(Long id);
	
	Trip save(Trip x);
	
	Optional<Trip> findById(Long id);
	
	
	
	
}
