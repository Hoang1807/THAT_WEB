package com.tinhocanhtrang.controller;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "home",method = RequestMethod.GET)
	public String getHome() {
		return "index";
	}
	@RequestMapping(value = "product",method = RequestMethod.GET)
	public String getProduct() {
		return "product";
	}
	@RequestMapping(value = "detail",method = RequestMethod.GET)
	public String getDetailProduct() {
		return "detail_product";
	}
}
