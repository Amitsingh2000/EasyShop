package com.easyshop.app.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.easyshop.app.model.Order;
import com.easyshop.app.model.User;

@Repository
public interface OrderRepository extends CrudRepository<Order, Integer>
{
	public List<Order> findByUser(User user);


	

}
