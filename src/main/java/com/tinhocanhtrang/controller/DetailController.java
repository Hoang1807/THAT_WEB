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
		List<Image> img=imgDao.findByIdproduct(id);
		Optional<Product> product=proDAO.findById(id);
		Product pro=product.get();
		model.addAttribute("pro",pro);
		model.addAttribute("image",img);
		return "product/detail_product";
	}
}
