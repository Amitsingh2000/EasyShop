package com.easyshop.app.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyshop.app.model.Category;
import com.easyshop.app.model.Product;
import com.easyshop.app.model.User;
import com.easyshop.app.service.CategoryServiceI;
import com.easyshop.app.service.ProductServiceI;
import com.easyshop.app.service.UserServiceI;

@Controller
public class HomeController 
{
	@Autowired
	CategoryServiceI categoryService;
	@Autowired
	UserServiceI UserService;
	@Autowired
	ProductServiceI ProductService;

	@PreAuthorize(value="hasAnyAuthority('ADMIN', 'USER')")
	@GetMapping(value="/Dashboard")
	public String dashboard(Authentication authentication,HttpSession session,ModelMap m)
	{
		UserDetails user =(UserDetails) authentication.getPrincipal();
		User currUser =UserService.checkUser(user.getUsername());
		if (user.getAuthorities().contains(new SimpleGrantedAuthority("ADMIN"))) 
		{
			session.setAttribute("user", currUser);
			return "redirect:/adminDashboard";
		}
		else if(user.getAuthorities().contains(new SimpleGrantedAuthority("USER")))
		{
			session.setAttribute("user", currUser);
			return "redirect:/userDashboard";
		}
		else
		{
			m.addAttribute("message","Enter Valid Login Details");
			return "login";	
		}
	}
	
	
	@GetMapping(value="/Home")
	public String home(ModelMap m)
	{
		List<Category> categoryList=categoryService.getCategory();
		m.addAttribute("categoryList",categoryList);
		List<Product> productList =ProductService.getAllProducts();
		m.addAttribute("productList",productList);
		
		return "index";
	}
	@GetMapping(value="/login")
	public String login()
	{
		
		return "login";
	}
	
	
//	@PostMapping(value="/login")
//	public String register(@RequestParam String userName,@RequestParam String userPassword,HttpSession session,ModelMap m)
//	{
//		User user = UserService.checkUser(userName,userPassword);
//		if(user==null)
//		{
//			m.addAttribute("message","User Not Found");
//		}
//		else
//		{
//			if(user.getUserRole().equals("ADMIN"))
//			{
//				session.setAttribute("user", user);
//				return "redirect:/adminDashboard";
//			}
//			else if(user.getUserRole().equals("USER"))
//			{
//				session.setAttribute("user", user);
//				return "redirect:/userDashboard";
//			}
//		}
//		return "Login";
//	}
	@GetMapping(value="/adminDashboard")
	public String admin(ModelMap m)
	{	
		
		List<Category> categoryList=categoryService.getCategory();
		m.addAttribute("categoryList",categoryList);
		List<Product> productList =ProductService.getAllProducts();
		m.addAttribute("productList",productList);
		List<User> usersList =UserService.getAllUsers();
		m.addAttribute("usersList",usersList);
		return "Admin/Admin";
	}
	@GetMapping(value="/userDashboard")
	public String user(ModelMap m)
	{	
		return "User/User";
	}
	@PreAuthorize(value="hasAnyAuthority('ADMIN', 'USER')")
	@GetMapping(value="/viewProfile")
	public String viewProfile(ModelMap m)
	{	
		return "Profile";
	}
	@GetMapping(value="/getProductByCategory")
	public String home(@RequestParam int categoryId,ModelMap m)
	{
		List<Category> categoryList=categoryService.getCategory();
		m.addAttribute("categoryList",categoryList);
		List<Product> productList =ProductService.getAllProductsByCategoryId(categoryId);
		System.out.println(productList);
		m.addAttribute("productList",productList);
		return "Index";
	}
//	@GetMapping("/logout")
//	public String logout(HttpServletRequest request){
//	    request.getSession().invalidate();
//	    return "redirect:/login";
//	}
	@GetMapping(value="/contactUs")
	public String contactUs(ModelMap m)
	{
		List<Category> categoryList=categoryService.getCategory();
		m.addAttribute("categoryList",categoryList);
		return "ContactUs";
	}
	@PreAuthorize(value="hasAnyAuthority('USER')")
	@GetMapping(value="/checkout")
	public String checkoutProducts(HttpSession session,RedirectAttributes redirectAttributes,ModelMap m)
	{
		User user = (User) session.getAttribute("user");
		if(user!=null)
		{
			session.setAttribute("user", user);
			return "User/checkout";
		}
		else
		{
			redirectAttributes.addFlashAttribute("message","User Not Login Please Login First");
			return "redirect:/login";
		}
	}
}
