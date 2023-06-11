package com.tinhocanhtrang.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.tinhocanhtrang.DAO.ProductDAO;
import com.tinhocanhtrang.entity.Product;

@Controller
@Transactional
public class ProductController {
	@Autowired
	ProductDAO proDAO;

	@RequestMapping(value = "laptop/product", method = RequestMethod.GET)
	public String getProduct(Model model,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 18);
		Page<Product> page=proDAO.findAll(pageable);
		model.addAttribute("items",page.getContent());
		model.addAttribute("page",page);
		return "product/product";
	}
	@RequestMapping(value = "/a",method = RequestMethod.GET)
	@ResponseBody
	public RedirectView findGiaSP(Model model,@RequestParam("danhmuc") String danhmuc, @RequestParam("sapxep") String sapxep) {
		List<Product> page=proDAO.SP_FilterProAndPrice(danhmuc,String.valueOf(0));
		System.out.println(page.size());
		model.addAttribute("items",page);
		return new RedirectView("product/product");
	}
	
}
