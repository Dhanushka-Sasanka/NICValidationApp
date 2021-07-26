package com.nicv.service.impl;

import java.time.LocalDate;
import java.time.Period;

import com.nicv.model.UserInputNICDetailResponce;
import com.nicv.service.UserNICDetailService;

public class UserNICDetailServiceImpl implements UserNICDetailService {
	
	
	private String id;
	private int month[] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	private boolean isNewFormat = false;
	private UserInputNICDetailResponce userInputNICDetailResponce;
	
	
	public UserNICDetailServiceImpl(){
		this.userInputNICDetailResponce = new UserInputNICDetailResponce();
	}
	
	@Override
	public UserInputNICDetailResponce setUserInputNIC(String userInputId) {
		
		this.id = userInputId;
		if (id.length() == 12) {
            isNewFormat = true;
        }
		getYear();
		setMonth();
		getSex();
		
		return this.userInputNICDetailResponce;
		
	}
	
	

	@Override
	public void getYear() {
		if (isNewFormat) {
			this.userInputNICDetailResponce.setYear(Integer.parseInt(id.substring(0, 4)));
        }
		this.userInputNICDetailResponce.setYear(1900 + Integer.parseInt(id.substring(0, 2)));
	}

	@Override
	public int getDays() {
		 int d;
	        if (isNewFormat) {
	            d = Integer.parseInt(id.substring(4, 7));
	        } else {
	            d = Integer.parseInt(id.substring(2, 5));
	        }
	        if (d > 500) {
	            return (d - 500);
	        } else {
	            return d;
	        }
	}

	@Override
	public void setMonth() {
		int mo = 0, day = 0;
        int days = getDays();

        for (int i = 0; i < month.length; i++) {
            if (days < month[i]) {
                mo = i + 1;
                day = days;
                break;
            } else {
                days = days - month[i];
            }
        }
        
        System.out.println("Month : " + mo + "\nDate : " + day);
        
        this.userInputNICDetailResponce.setMonth(mo);
        this.userInputNICDetailResponce.setDay(day);
        setAge(this.userInputNICDetailResponce.getYear() ,
        		this.userInputNICDetailResponce.getMonth(),
        		this.userInputNICDetailResponce.getDay()
        		);
       
		
	}

	@Override
	public void getSex() {
		 String male = "Male", feemale = "Female";
	        int d;
	        if (isNewFormat) {
	            d = Integer.parseInt(id.substring(4, 7));
	        } else {
	            d = Integer.parseInt(id.substring(2, 5));
	        }
	        if (d > 500) {
	            this.userInputNICDetailResponce.setGender(feemale);
	        } else {
	        	this.userInputNICDetailResponce.setGender(male);
	        }
	}

	@Override
	public void setAge(int year, int month, int dayOfMonth) {
		
		int age = Period.between(
                LocalDate.of(year, month, dayOfMonth),
                LocalDate.now()
            ).getYears();
		this.userInputNICDetailResponce.setAge(age);
	}

}
