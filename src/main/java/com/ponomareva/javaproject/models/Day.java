package com.ponomareva.javaproject.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="days")
public class Day {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	@NotNull(message="Please supply a date")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;
	@NotNull
    @Size(min=1, message="Can not be empty")
    private String start;
	@NotNull
    @Size(min=1, message="Can not be empty")
    private String end;
	@NotNull
    @Min(1)
    @Max(10000)
    private Integer mls;
	@NotNull
    @Min(1)
    @Max(24)
    private Integer hours;
	@NotNull
    @Size(min=1, message="Description can not be empty")
    private String description;
		
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="tripid")
    private Trip trip;
    
    public Day() {	
    }

	public Day(@NotNull(message = "Please supply a date") Date date,
			@NotNull @Size(min = 1, message = "Can not be empty") String start,
			@NotNull @Size(min = 1, message = "Can not be empty") String end, @NotNull @Min(1) @Max(10000) Integer mls,
			@NotNull @Min(1) @Max(24) Integer hours,
			@NotNull @Size(min = 1, message = "Description can not be empty") String description, Trip trip) {

		this.date = date;
		this.start = start;
		this.end = end;
		this.mls = mls;
		this.hours = hours;
		this.description = description;
		this.trip = trip;
	}

	public Long getId() {
		return id;
	}

	public Date getDate() {
		return date;
	}

	public String getStart() {
		return start;
	}

	public String getEnd() {
		return end;
	}

	public Integer getMls() {
		return mls;
	}

	public Integer getHours() {
		return hours;
	}

	public String getDescription() {
		return description;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public Trip getTrip() {
		return trip;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public void setMls(Integer mls) {
		this.mls = mls;
	}

	public void setHours(Integer hours) {
		this.hours = hours;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public void setTrip(Trip trip) {
		this.trip = trip;
	}
    
}
