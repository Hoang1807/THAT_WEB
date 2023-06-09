package com.tinhocanhtrang.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tinhocanhtrang.entity.Category;
import com.tinhocanhtrang.repository.CategoryRepository;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminController {
	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	HttpServletResponse response;

	@ModelAttribute("listCate")
	public List<Category> getAllCategory() {
		return categoryRepository.findAll();
	}

	@GetMapping(value = "admin/manager-category")
	public String getManagerCategory() {
		return "admin/Category";
	}

	@PostMapping(value = "admin/manager-category/create")
	public String getManagerCategory_Create(Category category) throws IOException {
		categoryRepository.save(category);
		return "redirect:/admin/manager-category";
	}
	@PostMapping(value = "admin/manager-category/delete")
	public String getManagerCategory_Delete(Category category) throws IOException {
		categoryRepository.delete(category);
		return "redirect:/admin/manager-category";
	}

	@PostMapping(value = "admin/manager-category/check")
	public @ResponseBody boolean getManagerCategory_Check(Category category) {
		if (categoryRepository.existsByCategoryId(category.getCategoryId())) {
			return true;
		} else {
			return false;
		}
	}

	@GetMapping(value = "admin/manager-product")
	public String getManagerProduct() {
		return "admin/Product";
	}

}
