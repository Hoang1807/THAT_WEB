package com.tinhocanhtrang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tinhocanhtrang.service.CloudinaryService;
import com.tinhocanhtrang.service.SecurityService;

@Controller
public class HomeController {
	@Autowired
	SecurityService securityService;

	@Autowired
	CloudinaryService cloudinaryService;

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String getHome() {
		cloudinaryService.setCloudinary("cloudinary://584368271543577:DMdJ5OUw9j_WLnFRLCJA4h7S52U@dz9gzy7iz");
		try {
			System.out.println(cloudinaryService.uploadImage("H:/image/anhvilucnho.jpg", "use_filename", true));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

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
