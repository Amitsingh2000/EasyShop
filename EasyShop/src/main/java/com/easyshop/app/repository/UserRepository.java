package com.easyshop.app.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.easyshop.app.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>
{
	public User findByUserNameAndUserPassword(String username,String password);
	public User findByUserName(String username);
	public User findByUserId(int userId);
	
}
