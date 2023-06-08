package com.tinhocanhtrang.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;

import com.tinhocanhtrang.DAO.ProductDAO;
import com.tinhocanhtrang.entity.Product;
import com.tinhocanhtrang.repositoty.UserRepository;
=======
import com.tinhocanhtrang.repository.UserRepository;
import com.tinhocanhtrang.service.CloudinaryService;
>>>>>>> df1cbf8853dfec96a40bd4451cb6f0b7404b7d71
import com.tinhocanhtrang.service.SecurityService;

@Controller
public class HomeController {

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String getHome() throws Exception {
		return "index";
	}
}
