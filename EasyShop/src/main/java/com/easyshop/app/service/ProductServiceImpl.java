package com.easyshop.app.service;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.easyshop.app.model.Product;
import com.easyshop.app.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductServiceI
{
	@Autowired
	ProductRepository ProductRepo;
	@Override
	public void addProduct(Product product,MultipartFile productPhoto)
	{
		System.out.println(product);
		System.out.println(productPhoto);
		String uplodDirectory;
		try 
		{
			uplodDirectory = new ClassPathResource("static/Img/products").getFile().getAbsolutePath();
			String fileName =productPhoto.getOriginalFilename();
			System.out.println(uplodDirectory);
			System.out.println(fileName);
			product.setProductPhoto(fileName);
			FileUploadUtil.saveFile(uplodDirectory, fileName, productPhoto);
		}catch(IOException e)
		{
			e.printStackTrace();
		}
		ProductRepo.save(product);
	}
	@Override
	public List<Product> getAllProducts() 
	{
		List<Product> productList =(List<Product>) ProductRepo.findAll();
		return productList;
	}
	@Override
	public List<Product> getAllProductsByCategoryId(int categoryId) 
	{
		List<Product> productList=null;
		if(categoryId==0)
		{
			productList=(List<Product>) ProductRepo.findAll();
		}
		else
		{
			productList =ProductRepo.findAllProductByProductCategoryCategoryId(categoryId);
		}
		return productList;
	}
	@Override
	public void deleteProductById(int productId) 
	{
		ProductRepo.deleteById(productId);
	}
	@Override
	public void updateProduct(Product product,MultipartFile productPhoto) 
	{
		String fileName =productPhoto.getOriginalFilename();
		Product pdt =ProductRepo.findByProductId(product.getProductId());
		System.out.println(pdt);
			if(!fileName.equals(""))
			{
				String uplodDirectory="";
				try 
				{
					uplodDirectory = new ClassPathResource("static/Img/products").getFile().getAbsolutePath();
					product.setProductPhoto(fileName);
					FileUploadUtil.saveFile(uplodDirectory, fileName, productPhoto);
				}catch(IOException e)
				{
					e.printStackTrace();
				}
			}
			else
			{
				String filename =pdt.getProductPhoto();
				System.out.println(filename);
				product.setProductPhoto(filename);
			}
			
		ProductRepo.save(product);
	}
	@Override
	public Product viewProduct(int productId) 
	{
		return ProductRepo.findByProductId(productId);
	}
	@Override
	public void updateProduct(Product product) 
	{
		Product pdt =ProductRepo.findByProductId(product.getProductId());
		String filename =pdt.getProductPhoto();
		System.out.println(filename);
		product.setProductPhoto(filename);
		ProductRepo.save(product);
	}
	

}
