package com.easyshop.app.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyshop.app.model.Order;
import com.easyshop.app.model.Product;
import com.easyshop.app.model.User;
import com.easyshop.app.service.OrdersServiceI;
import com.easyshop.app.service.UserServiceI;


@Controller
public class OrdersContoller 
{
	@Autowired
	UserServiceI UserService;
	@Autowired
	OrdersServiceI OrderService;
	
	@GetMapping(value="/myOrders")
	public String myOrders(@RequestParam int userId,ModelMap m)
	{
		User user =UserService.getUser(userId);
		List<Order> orderList =OrderService.getOrders(user);
		m.addAttribute("orderList",orderList);
		return "User/Orders";
	}
	
	@RequestMapping(value = "/addOrders/{userId}")
	public String addOrders(@PathVariable int userId,@RequestBody List<Product> products,RedirectAttributes redirectAttributes) 
	{
		User user =UserService.getUser(userId);
		OrderService.addOrder(user, products);
		System.out.println("Order Place Successfully");
		return "redirect:/userDashboard";
	}
	
}
