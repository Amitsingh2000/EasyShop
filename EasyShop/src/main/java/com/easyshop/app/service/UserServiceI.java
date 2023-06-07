package com.easyshop.app.service;

import java.util.List;

import com.easyshop.app.model.User;

public interface UserServiceI 
{
	public void addUser(User user);
	public User checkUser(String username);
	public List<User> getAllUsers();
	public void deleteUserById(int userId);
	public User getUser(int userId);
}
