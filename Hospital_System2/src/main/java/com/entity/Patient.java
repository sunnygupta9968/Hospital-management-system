package com.entity;

public class Patient {
	private int id;
	
	private String fullName;
	private int age;
	private String department;
	private String doctor;
	private String email;
	private String mobno;
	public Patient(String fullName, int age, String department, String doctor, String email, String mobno) {
		super();
		this.fullName = fullName;
		this.age = age;
		this.department = department;
		this.doctor = doctor;
		this.email = email;
		this.mobno = mobno;
	}
	
	public Patient() {
		
	}
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDoctor() {
		return doctor;
	}
	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}

}
