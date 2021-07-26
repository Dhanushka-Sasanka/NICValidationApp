package com.nicv.model;

public class UserInputNICDetailResponce {
	
	private int year;
	
	private int month;
	
	private int day;
	
	private String gender;
	
	private int age;
	

	public UserInputNICDetailResponce() {
		super();
	}

	public UserInputNICDetailResponce(int year, int month, int day, String gender, int age) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.gender = gender;
		this.age = age;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "UserInputNICDetailResponce [year=" + year + ", month=" + month + ", day=" + day + ", gender=" + gender
				+ ", age=" + age + "]";
	}
	
	
}
