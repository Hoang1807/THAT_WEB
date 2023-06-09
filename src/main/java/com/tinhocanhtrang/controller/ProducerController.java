package com.tinhocanhtrang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tinhocanhtrang.entity.Producter;
import com.tinhocanhtrang.repositoty.ProducerRepository;

@Controller
public class ProducerController {
	@Autowired 
	ProducerRepository dao ;
	
	@RequestMapping(value = "/Product/ProducerList",method = RequestMethod.GET)
	public String getProducer() {
		return "Admin/ProducerList";
	}
	
	
	@RequestMapping(value = "/Product/ProducerAdd",method = RequestMethod.GET)
	public String getDetailProducer() {
		return "Admin/ProducerAdd";
	}
	
	@RequestMapping(value = "/Product/ProducerAdd/insert",method = RequestMethod.POST)
	public String insertProducer(Producter p) {
		dao.save(p);
		return "/Admin/ProducerList"; 
	}
}
