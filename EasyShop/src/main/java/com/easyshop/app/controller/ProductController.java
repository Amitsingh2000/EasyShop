package com.easyshop.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyshop.app.model.Category;
import com.easyshop.app.model.Product;
import com.easyshop.app.service.CategoryServiceI;
import com.easyshop.app.service.ProductServiceI;
@Controller
@RequestMapping(value="/adminDashboard/")
public class ProductController 
{
	@Autowired
	ProductServiceI ProductService;
	@Autowired
	CategoryServiceI CategoryService;
	@PostMapping(value="/addProduct")
	public String addProduct(@ModelAttribute("product") Product product,@RequestParam("productImg") MultipartFile productPhoto,RedirectAttributes redirectAttributes)
	{
		ProductService.addProduct(product,productPhoto);
		redirectAttributes.addFlashAttribute("message","Product Added Successfully");
		return "redirect:/adminDashboard";
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct(@RequestParam int productId,RedirectAttributes redirectAttributes)
	{
		ProductService.deleteProductById(productId);
		redirectAttributes.addFlashAttribute("message","Product Deleted Successfully");
		return "redirect:/adminDashboard";
	}
	@GetMapping(value="/viewProduct")
	public String viewProduct(@RequestParam int productId,ModelMap m)
	{
		Product product =ProductService.viewProduct(productId);
		List<Category> categoryList =CategoryService.getCategory();
		categoryList.remove(product.getProductCategory());
		System.out.println(categoryList);
		m.addAttribute("categoryList",categoryList);
		m.addAttribute("product",product);
		return "Admin/Product";
	}
	@PostMapping(value="/updateProduct")
	public String updateProduct(@ModelAttribute("product") Product product,@RequestParam("productImg") MultipartFile productPhoto,RedirectAttributes redirectAttributes)
	{
		ProductService.updateProduct(product,productPhoto);
		redirectAttributes.addFlashAttribute("message","Product Updated Successfully");
		return "redirect:/adminDashboard";
	}

	
}
