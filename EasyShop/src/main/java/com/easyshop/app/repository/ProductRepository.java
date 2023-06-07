package com.easyshop.app.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.easyshop.app.model.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer>
{
	public List<Product> findAllProductByProductCategoryCategoryId(int categoryId);
	public Product findByProductId(int productId);
}
