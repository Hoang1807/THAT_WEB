package com.tinhocanhtrang.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tinhocanhtrang.entity.Producer;
import com.tinhocanhtrang.repository.ProducerRepository;
import com.tinhocanhtrang.service.SessionService;


@Controller
public class ProducerController {
	@Autowired 
	ProducerRepository dao ;
	@Autowired
	SessionService sessionService;
	
	@ModelAttribute("listProducer")
	public Page<Producer> getListProducer(){
		Pageable pageable = PageRequest.of(0, 6);
		return dao.findByProducerNameLikeOrProducerIdLike("%", "%", pageable);
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
	
	@GetMapping(value = "admin/producer/search")
	public String getManagerProducer_Search(@RequestParam("search") Optional<String> s,
			@RequestParam("page") Optional<Integer> p, Model model) {
		String kwords = s.orElse(sessionService.get("keywords"));
		sessionService.set("keywords", kwords);
		sessionService.set("page", p.orElse(0));
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Producer> page = dao.findByProducerNameLikeOrProducerIdLike(
				"%" + (kwords == null ? "" : kwords) + "%", "%" + (kwords == null ? "" : kwords) + "%", pageable);
		model.addAttribute("listProducer", page);
		model.addAttribute("search", kwords);
		return "Admin/Producer";
	}

	@GetMapping(value = "admin/producer/sort")
	public String getManagerProducer_Sort(@RequestParam("name") Optional<String> n,
			@RequestParam("sort") Optional<Boolean> s, Model model) {
		String kwords = sessionService.get("keywords");
		Integer p = sessionService.get("page");
		String name = n.orElse("producerName");
		Boolean sort = s.orElse(true);
		Pageable pageable = PageRequest.of(p, 6, sort ? Direction.ASC : Direction.DESC, name);
		Page<Producer> page = dao.findByProducerNameLikeOrProducerIdLike(
				"%" + (kwords == null ? "" : kwords) + "%", "%" + (kwords == null ? "" : kwords) + "%", pageable);
		model.addAttribute("listProducer", page);
		model.addAttribute("search", kwords);
		return "Admin/Producer";
	}
	
	@PostMapping(value = "admin/producer/check")
	public @ResponseBody boolean getCheckProducer(Producer producer) {
		if(dao.existsByProducerId(producer.getProducerId())) {
			return true;
		}else return false;
	}
}
