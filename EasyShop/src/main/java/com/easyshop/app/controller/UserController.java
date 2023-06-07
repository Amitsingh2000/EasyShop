package com.easyshop.app.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyshop.app.model.User;
import com.easyshop.app.service.UserServiceI;

@Controller
public class UserController 
{
	@Autowired
	UserServiceI UserService;
	@RequestMapping(value="/register")
	public String register()
	{
		return "Register";
	}
	@PostMapping(value="/registerUser")
	public String register(@ModelAttribute User user,RedirectAttributes redirectAttributes)
	{
		UserService.addUser(user);
		redirectAttributes.addFlashAttribute("message","User Registered Successfully");
		return "redirect:/register";
	}
	@PostMapping(value="/updateUser")
	public String update(@ModelAttribute User user,RedirectAttributes redirectAttributes)
	{
		UserService.addUser(user);
		redirectAttributes.addFlashAttribute("message","User Updated Successfully");
		return "redirect:/userDashboard";
	}
	@RequestMapping(value="/deleteUser")
	public String deleteUser(@RequestParam int userId,RedirectAttributes redirectAttributes)
	{
		UserService.deleteUserById(userId);
		redirectAttributes.addFlashAttribute("message","User Deleted Successfully");
		return "redirect:/adminDashboard";
	}
}


