package com.easyshop.app.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Product 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	private String productName;
	private String productDescription;
	private String productPhoto;
	private int productPrice; 
	private int stockQuantity;
	@ManyToOne
	private Category productCategory;
	@OneToMany(mappedBy = "product")
    private List<OrderProduct> orderProducts;
	
	
	public Product() 
	{
		
	}


	public Product(int productId, String productName, String productDescription, int productPrice, int stockQuantity,
			Category productCategory)
	{
		this.productId = productId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.stockQuantity = stockQuantity;
		this.productCategory = productCategory;
	}


	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getProductPhoto() {
		return productPhoto;
	}
	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	public int getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public Category getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(Category productCategory) {
		this.productCategory = productCategory;
	}


	public List<OrderProduct> getOrderProducts() {
		return orderProducts;
	}


	public void setOrderProducts(List<OrderProduct> orderProducts) {
		this.orderProducts = orderProducts;
	}


	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPhoto=" + productPhoto + ", productPrice=" + productPrice
				+ ", stockQuantity=" + stockQuantity + ", productCategory=" + productCategory + "]";
	}
	
}
