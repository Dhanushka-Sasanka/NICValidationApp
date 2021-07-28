package com.nicv.service.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.nicv.model.User;
import com.nicv.service.UserService;
import com.nicv.util.CrudUtil;

public class UserServiceImpl implements UserService {

	@Override
	public boolean addUser(User user) throws Exception {
		String sql = "INSERT into users(user_name,address,nationality,nic, dob,age,gender) values(?,?,?,?,?,?,?)";
		return CrudUtil.executeUpdate(sql, user.getUserName(), user.getAddress(), user.getNationality(), user.getNic(),
				user.getDateOfBirth(), user.getAge(), user.getGender());
	}

	@Override
	public User getUserByID(Long userID) throws Exception {
		User user = null;
		String sql = "select * from users where userid = ? ";
		System.out.println(sql);
		ResultSet rst = CrudUtil.executeQuery(sql, userID);
		while (rst.next()) {
			user = new User(rst.getLong(1), rst.getString(2), rst.getString(3), rst.getString(4), rst.getString(5),
					rst.getDate(6), rst.getInt(7), rst.getString(8));
		}
		return user;
	}

	@Override
	public JSONArray getUsers() throws Exception {
		List<User> users = new ArrayList<>();
		JSONArray userToJSonArray = new JSONArray();
		
		String sql = "SELECT *  from users";
		ResultSet rst = CrudUtil.executeQuery(sql);
		
		while (rst.next()) {
			
			userToJSonArray.put(new JSONObject(new User(rst.getLong(1), rst.getString(2), rst.getString(3), rst.getString(4), rst.getString(5),
					rst.getDate(6), rst.getInt(7), rst.getString(8))));
		}
		
		return userToJSonArray;
		
	}

	@Override
	public boolean updateUser(Long userID, User user) throws Exception {
		String sql = "UPDATE users set user_name = ? , address = ? , nationality = ? , nic = ? ,dob = ? ,age = ? ,gender = ? , where userID = ?";
		return CrudUtil.executeUpdate(sql, user.getUserName(), user.getAddress(), user.getNationality(), user.getNic(),
				user.getDateOfBirth(), user.getAge(), user.getGender()
				 , userID);
	}

	@Override
	public boolean removeUser(Long userID) throws Exception {
		String sql = "DELETE from users where userID = ?";
		return CrudUtil.executeUpdate(sql, userID);
	}

	@Override
	public String getNextID() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getAllUserIDs() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserAuthority(String userName, String password) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
