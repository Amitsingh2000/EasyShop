package com.easyshop.app.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="userOrders")
public class Order
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderId;
	private int orderAmount;
	private String orderStatus;
	
	@ManyToOne
	private User user;
    
//    @ManyToMany
//    @JoinTable(name = "order_product",
//    joinColumns = @JoinColumn(name = "order_id"),
//    inverseJoinColumns = @JoinColumn(name = "product_id"))
//    private List<Product> products;
	
	@OneToMany(mappedBy = "order")
    private List<OrderProduct> orderProducts;
	

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<OrderProduct> getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(List<OrderProduct> orderProducts) {
		this.orderProducts = orderProducts;
	}

	
	
    
}
