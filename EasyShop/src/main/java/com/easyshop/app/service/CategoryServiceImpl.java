package com.easyshop.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyshop.app.model.Category;
import com.easyshop.app.repository.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryServiceI
{
	@Autowired
	CategoryRepository CategoryRepo;
	@Override
	public void addCategory(Category category) 
	{
		CategoryRepo.save(category);
	}
	@Override
	public List<Category> getCategory() 
	{
		return (List<Category>) CategoryRepo.findAll();
	}
	@Override
	public void deleteCategoryById(int categoryId) 
	{
		CategoryRepo.deleteById(categoryId);
	}
	@Override
	public Category viewCategory(int categoryId) 
	{
		return 	CategoryRepo.findByCategoryId(categoryId);
	}
	@Override
	public void updateCategory(Category category) 
	{
		CategoryRepo.save(category);
	}

}
