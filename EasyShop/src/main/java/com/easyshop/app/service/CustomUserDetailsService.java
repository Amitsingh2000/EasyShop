package com.easyshop.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.easyshop.app.config.PasswordEncoderUtil;
import com.easyshop.app.model.User;
import com.easyshop.app.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserServiceI,UserDetailsService
{
	@Autowired
	UserRepository UserRepo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user =UserRepo.findByUserName(username);
		System.out.println(user);
		if(user==null)
		{
			throw new UsernameNotFoundException("User Not Found");
		}
		return new CustomUserDetails(user);
	}
	@Override
	public void addUser(User user)
	{
		user.setUserPassword(PasswordEncoderUtil.encodePassword(user.getUserPassword()));
		UserRepo.save(user);
	}
	@Override
	public User checkUser(String username) 
	{
		return UserRepo.findByUserName(username);
	}
	@Override
	public List<User> getAllUsers() 
	{
		List<User> userList =(List<User>) UserRepo.findAll();
		return userList;
	}
	@Override
	public void deleteUserById(int userId) 
	{
		UserRepo.deleteById(userId);
	}
	@Override
	public User getUser(int userId) 
	{
		return UserRepo.findByUserId(userId);
	}
	
	

}
