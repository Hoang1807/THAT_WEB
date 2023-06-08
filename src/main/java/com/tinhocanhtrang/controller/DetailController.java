package com.tinhocanhtrang.controller;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tinhocanhtrang.DAO.ImageDAO;
import com.tinhocanhtrang.DAO.ProductDAO;
import com.tinhocanhtrang.entity.Image;
import com.tinhocanhtrang.entity.Product;

@Controller
public class DetailController {
	@Autowired
	ProductDAO proDAO;
	@Autowired 
	ImageDAO imgDao;
	@RequestMapping(value = "product/detail", method = RequestMethod.GET)
	public String getDetailProduct(Model model,@RequestParam("id") String id) {
		Optional<Product> productOptional = proDAO.findById(id);
		
		Product product = productOptional.orElse(null);
		if (product != null) {
		    Set<Image> images = product.getImages();
		    System.out.println(images.size());
		} else {
		    // Xử lý khi không có giá trị tồn tại
		}
		return "product/detail_product";
	}
}
