package com.easyshop.app.service;

import java.beans.JavaBean;
import java.util.List;

import com.easyshop.app.model.Category;

public interface CategoryServiceI 
{
	public void addCategory(Category category);
	public List<Category> getCategory();
	public void deleteCategoryById(int categoryId);
	public Category viewCategory(int categoryId);
	public void updateCategory(Category category);
}
