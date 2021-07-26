package com.nicv.service;

import com.nicv.model.UserInputNICDetailResponce;

public interface UserNICDetailService {
	
	public UserInputNICDetailResponce setUserInputNIC(String userInputId);
	
	public void getYear();
        
    public int getDays();
        
    public void setMonth();
       
    public void getSex();
    
    public void setAge(int year, int month, int dayOfMonth);
    

}
