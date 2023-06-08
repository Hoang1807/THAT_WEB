package com.tinhocanhtrang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.tinhocanhtrang.repository.UserRepository;
import com.tinhocanhtrang.service.CloudinaryService;
import com.tinhocanhtrang.service.SecurityService;

@Controller
public class HomeController {

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String getHome() throws Exception {
		return "index";
	}

	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String getProduct() {
		return "product/product";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String getDetailProduct() {
		return "product/detail_product";
	}
}
