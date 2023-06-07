package com.easyshop.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyshop.app.model.Order;
import com.easyshop.app.model.OrderProduct;
import com.easyshop.app.model.Product;
import com.easyshop.app.model.User;
import com.easyshop.app.repository.OrderProductRepository;
import com.easyshop.app.repository.OrderRepository;

@Service
public class OrdersServiceImpl implements OrdersServiceI
{

	@Autowired
	OrderProductRepository orderProductRepo;
	@Autowired
	ProductServiceI ProductService;
	@Autowired
	OrderRepository orderRepo;
	@Override
	public void addOrder(User user, List<Product> productList) 
	{
		int orderAmount=0;
		Order order =new Order();
		order.setUser(user);
		orderRepo.save(order);
		for(Product p:productList)
		{
			OrderProduct orderProduct = new OrderProduct();
	        orderProduct.setOrder(order);
	        orderProduct.setProduct(p);
	        Product product =ProductService.viewProduct(p.getProductId());
	       	int newQty =product.getStockQuantity()-p.getStockQuantity();
	       	product.setStockQuantity(newQty);
	       	ProductService.updateProduct(product);
	        orderProduct.setQuantity(p.getStockQuantity()); 
			orderAmount =orderAmount+p.getProductPrice();
			orderProductRepo.save(orderProduct);
		}
		order.setOrderAmount(orderAmount);
		orderRepo.save(order);
	}
	@Override
	public List<Order> getOrders(User user) 
	{
		List<Order>  orders =orderRepo.findByUser(user);
		return orders;
	}

}
