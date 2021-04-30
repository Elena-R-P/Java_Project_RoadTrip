package com.ponomareva.javaproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ponomareva.javaproject.models.Day;



@Repository
public interface DayRepository extends CrudRepository<Day, Long>{
	List<Day> findAll();
	
	void deleteById(Long id);
	
	Day save(Day x);
	
	Optional<Day> findById(Long id);
}
