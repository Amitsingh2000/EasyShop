package com.easyshop.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyshop.app.model.Category;
import com.easyshop.app.service.CategoryServiceI;

@Controller
@RequestMapping(value="/adminDashboard/")
public class CategoryController 
{
	@Autowired
	CategoryServiceI CategoryService;
	@PostMapping(value="addCategory")
	public String addCategory(@ModelAttribute Category category,RedirectAttributes redirectAttributes)
	{
		System.out.println(category);
		CategoryService.addCategory(category);
		redirectAttributes.addFlashAttribute("message","Category Added Successfully");
		return "redirect:/adminDashboard";
	}
	@RequestMapping(value="/deleteCategory")
	public String deleteCategory(@RequestParam int categoryId,RedirectAttributes redirectAttributes)
	{
		CategoryService.deleteCategoryById(categoryId);
		redirectAttributes.addFlashAttribute("message","Category Deleted Successfully");
		return"redirect:/adminDashboard";
	}
	@GetMapping(value="/viewCategory")
	public String viewCategory(@RequestParam int categoryId,ModelMap m)
	{
		Category category = CategoryService.viewCategory(categoryId);
		m.addAttribute("category",category);
		return "Admin/Category";
	}
	@PostMapping(value="/updateCategory")
	public String updateCategory(@ModelAttribute Category category,RedirectAttributes redirectAttributes)
	{
		CategoryService.updateCategory(category);
		redirectAttributes.addFlashAttribute("message","Category Updated Successfully");
		return"redirect:/adminDashboard";
	}
	
}
