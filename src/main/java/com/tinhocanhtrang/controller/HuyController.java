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
	
	@RequestMapping(value = "/Product/ProductList",method = RequestMethod.GET)
	public String getProduct() {
		return "Admin/ProductList";
	}

	@RequestMapping(value = "/Product/ProductAdd",method = RequestMethod.GET)
	public String getDetailProduct() {
		return "Admin/ProductAdd";
	}
	
	@RequestMapping(value = "/Product/ProducerList",method = RequestMethod.GET)
	public String getProducer() {
		return "Admin/ProducerList";
	}
	
	@RequestMapping(value = "/Product/ProducerAdd",method = RequestMethod.GET)
	public String getDetailProducer() {
		return "Admin/ProducerAdd";
	}
	
	@RequestMapping(value = "/UserManager/UserList",method = RequestMethod.GET)
	public String getUser() {
		return "Admin/UserList";
	}
	
	@RequestMapping(value = "/UserManager/UserAdd",method = RequestMethod.GET)
	public String getDetailUser() {
		return "Admin/UserAdd";
	}
	
	@RequestMapping(value = "/Bill/BillList",method = RequestMethod.GET)
	public String getBill() {
		return "Admin/BillList";
	}
	
	@RequestMapping(value = "/Bill/BillDetail",method = RequestMethod.GET)
	public String getBillDetail() {
		return "Admin/BillDetail";
	}
	
	@RequestMapping(value = "/Product/CategoryAdd",method = RequestMethod.GET)
	public String getCategory() {
		return "Admin/CategoryAdd";
	}
	
	@RequestMapping(value = "/Product/SpecAdd",method = RequestMethod.GET)
	public String getSpecification() {
		return "Admin/SpecAdd";
	}
	
	@RequestMapping(value = "/Product/ImageAdd",method = RequestMethod.GET)
	public String getImageAdd() {
		return "Admin/ImageAdd";
	}
	
	@RequestMapping(value = "/Statistical",method = RequestMethod.GET)
	public String getStatistical() {
		return "Admin/StatisticsLayout";
	}
}
