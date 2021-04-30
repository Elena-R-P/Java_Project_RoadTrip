package com.ponomareva.javaproject.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="trips")
public class Trip {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	@NotNull
    @Size(min=1, message="Can not be empty")
    private String name;
	@NotNull(message="Please supply a date")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date dateStart;
	@NotNull(message="Please supply a date")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date dateEnd;
	@NotNull
    @Min(1)
    @Max(100)
    private Integer duration;
	@NotNull
    @Size(min=1, message="Description can not be empty")
    private String description;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="userid")
    private User user;
    
    @OneToMany(mappedBy="trip", fetch = FetchType.LAZY)
    private List<Day> days;
    
    public Trip() {	
    }

	public Trip(@NotNull @Size(min = 1, message = "Can not be empty") String name,
			@NotNull(message = "Please supply a date") Date dateStart,
			@NotNull(message = "Please supply a date") Date dateEnd, @NotNull @Min(1) @Max(100) Integer duration,
			@NotNull @Size(min = 1, message = "Description can not be empty") String description, User user,
			List<Day> days) {
		this.name = name;
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
		this.duration = duration;
		this.description = description;
		this.user = user;
		this.days = days;
	}

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public Date getDateEnd() {
		return dateEnd;
	}

	public Integer getDuration() {
		return duration;
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

	public User getUser() {
		return user;
	}

	public List<Day> getDays() {
		return days;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
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

	public void setUser(User user) {
		this.user = user;
	}

	public void setDays(List<Day> days) {
		this.days = days;
	}
	
	
}
