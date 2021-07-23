package com.nicv.service;

import java.util.List;
import java.util.logging.Logger;

import com.nicv.model.User;


public interface UserService {

	
	/** Initialize logger */
	public static final Logger log = Logger.getLogger(UserService.class.getName());

	/**
	 * Add User for User table
	 * 
	 * @param user
	 * @return boolean
	 */
	public boolean addUser(User user) throws Exception;

	/**
	 * Get a particular User
	 *
	 * @param empoyeeID
	 * @return User
	 */
	public User getUserByID(Long userID) throws Exception;

	/**
	 * Get all list of User
	 *
	 * @return ArrayList<User>
	 */
	public List<User> getUsers() throws Exception;

	/**
	 * Update existing User
	 * 
	 * @param userID
	 * @param user
	 *
	 * @return boolean 
	 */
	public boolean updateUser(Long userID, User user) throws Exception;

	/**
	 * Remove existing User
	 * @param userID
	 * @return boolean
	 */
	public boolean removeUser(Long userID) throws Exception;
	
	/**
	 * Getting next ID 
	 * @return String
	 */
	public String getNextID()throws Exception;
	
	/**
	 * Getting All IDs 
	 * @return List<String>
	 */
	public List<String> getAllUserIDs()throws Exception;
	
	/**
	 * getting existing User
	 * @param userName
	 * @param password
	 * @return boolean
	 */
	public User getUserAuthority(String userName , String password ) throws Exception;
	
	
	
}
