package com.tinhocanhtrang.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tinhocanhtrang.DAO.ProductDAO;
import com.tinhocanhtrang.entity.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDAO proDAO;

	@RequestMapping(value = "laptop/product", method = RequestMethod.GET)
	public String getProduct(Model model,@RequestParam("page") Optional<Integer> p) {
		Pageable pageable=PageRequest.of(p.orElse(0), 2);
		Page<Product> page=proDAO.findAll(pageable);
		model.addAttribute("items",page);
		return "product/product";
	}
}
