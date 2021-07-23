package com.nicv.model;

import java.util.Date;

public class User {
	
	private Long userID;
	private String userName;
	private String address;
	private String nationality;
	private String nic;
	private Date dateOfBirth;
	private int age;
	private String gender;
	
	
	public User() {}
	
	

	public User(Long userID, String userName, String address, String nationality, String nic, Date dateOfBirth, int age,
			String gender) {
		this.userID = userID;
		this.userName = userName;
		this.address = address;
		this.nationality = nationality;
		this.nic = nic;
		this.dateOfBirth = dateOfBirth;
		this.age = age;
		this.gender = gender;
	}



	public Long getUserID() {
		return userID;
	}
	public void setUserID(Long userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "User [userID=" + userID + ", userName=" + userName + ", address=" + address + ", nationality="
				+ nationality + ", nic=" + nic + ", dateOfBirth=" + dateOfBirth + ", age=" + age + ", gender=" + gender
				+ "]";
	}

	

	

	
}
