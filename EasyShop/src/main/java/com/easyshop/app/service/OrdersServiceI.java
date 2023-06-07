package com.easyshop.app.service;

import java.util.List;

import com.easyshop.app.model.Order;
import com.easyshop.app.model.Product;
import com.easyshop.app.model.User;


public interface OrdersServiceI
{
	public void addOrder(User user,List<Product> productList);
	public List<Order> getOrders(User user);

}
