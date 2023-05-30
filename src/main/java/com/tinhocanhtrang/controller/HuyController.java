package com.tinhocanhtrang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HuyController {
	
	@RequestMapping(value = "AdminHome",method = RequestMethod.GET)
	public String getHome() {
		return "Admin/ProductList";
	}
	
	@RequestMapping(value = "ProductList",method = RequestMethod.GET)
	public String getProduct() {
		return "Admin/ProductList";
	}

	@RequestMapping(value = "ProductAdd",method = RequestMethod.GET)
	public String getDetailProduct() {
		return "Admin/ProductAdd";
	}
	
	@RequestMapping(value = "ProducerList",method = RequestMethod.GET)
	public String getProducer() {
		return "Admin/ProducerList";
	}
	
	@RequestMapping(value = "ProducerAdd",method = RequestMethod.GET)
	public String getDetailProducer() {
		return "Admin/ProducerAdd";
	}
	
	@RequestMapping(value = "UserList",method = RequestMethod.GET)
	public String getUser() {
		return "Admin/UserList";
	}
	
	@RequestMapping(value = "UserAdd",method = RequestMethod.GET)
	public String getDetailUser() {
		return "Admin/UserAdd";
	}
	
	@RequestMapping(value = "BillList",method = RequestMethod.GET)
	public String getBill() {
		return "Admin/BillList";
	}
	
	@RequestMapping(value = "CategoryAdd",method = RequestMethod.GET)
	public String getCategory() {
		return "Admin/CategoryAdd";
	}
	
	@RequestMapping(value = "SpecAdd",method = RequestMethod.GET)
	public String getSpecification() {
		return "Admin/SpecAdd";
	}
	
	@RequestMapping(value = "ImageAdd",method = RequestMethod.GET)
	public String getImageAdd() {
		return "Admin/ImageAdd";
	}
}
