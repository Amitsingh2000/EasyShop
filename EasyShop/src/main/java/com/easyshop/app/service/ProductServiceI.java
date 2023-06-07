package com.easyshop.app.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.easyshop.app.model.Product;


public interface ProductServiceI
{
	public void addProduct(Product product,MultipartFile productPhoto);
	public List<Product> getAllProducts();
	public List<Product> getAllProductsByCategoryId(int categoryId);
	public void deleteProductById(int productId);
	public Product viewProduct(int productId);
	public void updateProduct(Product product,MultipartFile productPhoto);
	public void updateProduct(Product product);
}
