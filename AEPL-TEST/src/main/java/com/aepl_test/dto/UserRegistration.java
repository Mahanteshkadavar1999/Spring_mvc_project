package com.aepl_test.dto;

import javax.persistence.Entity;

import javax.persistence.Id;



@Entity
public class UserRegistration {
	@Id
	private long mobilenumber;
	private String name;
	private String email;
	private String dob;
	private String location;
//	 private MultipartFile file;
	private String file;

	
//	public MultipartFile getFile() {
//		return file;
//	}
//	public void setFile(MultipartFile file) {
//		this.file = file;
//	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public long getMobilenumber() {
		return mobilenumber;
	}
	public void setMobilenumber(long mobilenumber) {
		this.mobilenumber = mobilenumber;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "UserRegistration [mobilenumber=" + mobilenumber + ", name=" + name + ", email=" + email + ", dob=" + dob
				+ ", location=" + location + ", file=" + file + "]";
	}
//	
	
	
	
	
	

}
