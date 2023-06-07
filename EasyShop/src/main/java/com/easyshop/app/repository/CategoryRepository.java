package com.easyshop.app.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.easyshop.app.model.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Integer>
{
	public Category findByCategoryId(int categoryId);
}
