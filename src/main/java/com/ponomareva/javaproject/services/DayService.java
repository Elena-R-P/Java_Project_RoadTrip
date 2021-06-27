package com.ponomareva.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ponomareva.javaproject.models.Day;
import com.ponomareva.javaproject.repositories.DayRepository;

@Service
public class DayService {
	private final DayRepository dayRepository;
	public DayService(DayRepository dayRepository) {
		this.dayRepository = dayRepository;
	}
	
	public Day findDayById(Long id) {
    	Optional<Day> day = dayRepository.findById(id);
    	
    	if(day.isPresent()) {
            return day.get();
    	} else {
    	    return null;
    	}
    }
	public List<Day> findAllDays(){
		return dayRepository.findAll();
	}
	public void deleteDay(Long id) {
		dayRepository.deleteById(id);
	}
	public Day saveDay(Day d) {
		return dayRepository.save(d);
	}
	
}
