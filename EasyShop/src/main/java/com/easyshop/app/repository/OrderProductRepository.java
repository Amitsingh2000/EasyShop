package com.easyshop.app.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.easyshop.app.model.OrderProduct;

@Repository
public interface OrderProductRepository extends CrudRepository<OrderProduct, Integer>
{

}
