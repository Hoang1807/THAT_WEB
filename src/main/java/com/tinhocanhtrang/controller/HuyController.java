package com.tinhocanhtrang.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tinhocanhtrang.entity.Product;
import com.tinhocanhtrang.repository.ProductRepository;
import com.tinhocanhtrang.service.SessionService;

@Controller
public class HuyController {
	@Autowired
	ProductRepository dao;
	@Autowired
	SessionService sessionService;
	
	@ModelAttribute("productInStore")
	public Page<Product> getListTable(){
		Pageable pageable = PageRequest.of(0, 6);
		return dao.findByProductIdLike("%", pageable);
	}
	
	@ModelAttribute("cboProduct")
	public List<Product> getCboProduct(){
		return dao.findAll();
	}
	
//	// gửi optional của page, tức là có thể có hoặc ko, (là lựa chọn - option) :)))
//	// vì có thể khi load trang lần đầu tiên thì sẽ ko có tham số nào dc gửi, nhưng ta vẫn phải mặc định hiểu là load trang 1
//	@GetMapping("/admin/statistical") 
//	public String ChangeTabGET(@RequestParam("TabReport") Optional<Integer> tab, Model model,@RequestParam("page") Optional<Integer> p) {
//		int tabNumber = tab.orElse(1); // lấy giá trị optional về, nếu có giá trị ví dụ 1,2,3.. thì lấy, nếu ko có thì gán số 1
//		tabNumber = tabNumber >=1 && tabNumber <= 3 ? tabNumber : 1; // validate chỉ lấy giá trị khi >=1 và <=3, ngoài phạm vị gán số 1
//		model.addAttribute("TabReport", tabNumber); //Gán giá trị tab
//		if(tabNumber==3) {
//			model.addAttribute("productInStore", getListTable());
//		}
//		model.addAttribute("cboProduct", dao.findAll());
//		return "Admin/StatisticsLayout";
//	}
	
	@GetMapping("/admin/statistical_two")
	public String index() {
		return "Admin/ReportLayout2";
	}
	
	@GetMapping("/admin/statistical_two/search")
	public String getManagerProducer_Search(@RequestParam("search") Optional<String> s,
			@RequestParam("page") Optional<Integer> p, Model model) {
		String kwords = s.orElse(sessionService.get("keywords"));
		sessionService.set("keywords", kwords);
		sessionService.set("page", p.orElse(0));
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
//		Page<Product> page = dao.findByProductIdLike("%" + (kwords == null ? "" : kwords) + "%", "%" + (kwords == null ? "" : kwords) + "%", pageable);
				
		model.addAttribute("listProducer", page);
		model.addAttribute("search", kwords);
		return "Admin/ReportLayout2";
	}
	
//	@GetMapping("/admin/statistical_two/search")
//	public String cboProduct(@RequestParam("productId") String id,Model model,@RequestParam("page") Optional<Integer> p) {
//		Pageable pageable = PageRequest.of(p.orElse(0), 6);
//		Page<Product> page = dao.findByProductIdLike("%" + (id == null ? "" : id) + "%", pageable);
//		model.addAttribute("productInStore", page);
//		return "Admin/ReportLayout2";
//	}
	
}
