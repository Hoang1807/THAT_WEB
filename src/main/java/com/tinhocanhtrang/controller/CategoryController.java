package com.tinhocanhtrang.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tinhocanhtrang.entity.Category;
import com.tinhocanhtrang.repository.CategoryRepository;
import com.tinhocanhtrang.service.SessionService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CategoryController {
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	SessionService sessionService;

	@ModelAttribute("listCate")
	public Page<Category> getAllCategory() {
		Pageable pageable = PageRequest.of(0, 6);
		return categoryRepository.findByCategoryNameLikeOrCategoryIdLike("%", "%", pageable);
	}

	@GetMapping(value = "admin/manager-category")
	public String getManagerCategory() {
		return "Admin/Category";
	}

	@PostMapping(value = "admin/manager-category/create")
	public String getManagerCategory_Create(Category category) {
		categoryRepository.save(category);
		return "redirect:/admin/manager-category";
	}

	@PostMapping(value = "admin/manager-category/delete")
	public String getManagerCategory_Delete(Category category) {
		categoryRepository.delete(category);
		return "redirect:/admin/manager-category";
	}

	@GetMapping(value = "admin/manager-category/search")
	public String getManagerCategory_Search(@RequestParam("search") Optional<String> s,
			@RequestParam("page") Optional<Integer> p, Model model) {
		String kwords = s.orElse(sessionService.get("keywords"));
		sessionService.set("keywords", kwords);
		sessionService.set("page", p.orElse(0));
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Category> page = categoryRepository.findByCategoryNameLikeOrCategoryIdLike(
				"%" + (kwords == null ? "" : kwords) + "%", "%" + (kwords == null ? "" : kwords) + "%", pageable);
		model.addAttribute("listCate", page);
		model.addAttribute("search", kwords);
		return "Admin/Category";
	}

	@GetMapping(value = "admin/manager-category/sort")
	public String getManagerCategory_Sort(@RequestParam("name") Optional<String> n,
			@RequestParam("sort") Optional<Boolean> s, Model model) {
		String kwords = sessionService.get("keywords");
		Integer p = sessionService.get("page");
		String name = n.orElse("categoryName");
		Boolean sort = s.orElse(true);
		Pageable pageable = PageRequest.of(p, 6, sort ? Direction.ASC : Direction.DESC, name);
		Page<Category> page = categoryRepository.findByCategoryNameLikeOrCategoryIdLike(
				"%" + (kwords == null ? "" : kwords) + "%", "%" + (kwords == null ? "" : kwords) + "%", pageable);
		model.addAttribute("listCate", page);
		model.addAttribute("search", kwords);
		return "Admin/Category";
	}

	@PostMapping(value = "admin/manager-category/check")
	public @ResponseBody boolean getManagerCategory_Check(Category category) {
		if (categoryRepository.existsByCategoryId(category.getCategoryId())) {
			return true;
		} else {
			return false;
		}
	}

	

}
