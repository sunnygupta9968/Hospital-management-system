package com.entity;

public class Doctor {
	private int id;
	
	public Doctor(String fullName, String qualification, String specialist, String email, String mob,
			String password) {
		super();
		this.fullName = fullName;
		
		this.qualification = qualification;
		this.specialist = specialist;
		this.email = email;
		this.mob = mob;
		this.password = password;
	}
	
	public Doctor(int id, String fullName, String qualification, String specialist, String email, String mob,
			String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.qualification = qualification;
		this.specialist = specialist;
		this.email = email;
		this.mob = mob;
		this.password = password;
	}

	public Doctor(){
		
	}
	
	private String fullName;
	
	private String qualification;
	private String specialist;
	private String email;
	private String mob;
	private String password;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpecialist() {
		return specialist;
	}
	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMob() {
		return mob;
	}
	public void setMob(String mob) {
		this.mob = mob;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
	
}
