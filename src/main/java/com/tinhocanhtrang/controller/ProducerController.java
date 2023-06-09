package com.tinhocanhtrang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tinhocanhtrang.entity.Producer;
import com.tinhocanhtrang.repository.ProducerRepository;

@Controller
public class ProducerController {
	@Autowired 
	ProducerRepository dao ;
	
	@ModelAttribute("listProducer")
	public List<Producer> getListProducer(){
		return dao.findAll();
	}
	
	@GetMapping(value = "admin/producer")
	public String getProducer() {
		return "Admin/Producer";
	}
	
	
	@PostMapping(value = "admin/producer/save")
	public String getSaveProducer(Producer p) {
		dao.save(p);
		return "redirect:/admin/producer";
	}
	
	@PostMapping(value = "admin/producer/delete")
	public String getDeleteProducer(Producer p) {
		dao.delete(p);
		return "redirect:/admin/producer";
	}
	
//	@RequestMapping(value = "/Product/ProducerAdd/insert",method = RequestMethod.POST)
//	public String insertProducer(Producer p) {
//		dao.save(p);
//		return ""; 
//	}
	
	@PostMapping(value = "admin/producer/check")
	public @ResponseBody boolean getCheckProducer(Producer producer) {
		if(dao.existsByProducerId(producer.getProducerId())) {
			return true;
		}else return false;
	}
		
	
}
