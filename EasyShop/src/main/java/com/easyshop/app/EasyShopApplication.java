package com.easyshop.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.easyshop.app.model.User;
import com.easyshop.app.service.UserServiceI;

@SpringBootApplication
public class EasyShopApplication implements CommandLineRunner
{
	@Autowired
	UserServiceI userService;
	
	public static void main(String[] args) {
		SpringApplication.run(EasyShopApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		List<User> userList = userService.getAllUsers();
	    User user = new User("user", "user", "USER");

	    boolean userExists = false;
	    for (User existingUser : userList) {
	        if (existingUser.getUserName().equals(user.getUserName())) {
	            userExists = true;
	            break;
	        }
	    }

	    if (!userExists) {
	        userService.addUser(user);
	    } else {
	        System.out.println("User Already Exists");
	    }
		
		
		
	}

}
