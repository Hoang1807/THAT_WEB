package com.tinhocanhtrang.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;

import com.tinhocanhtrang.entity.Product;
import com.tinhocanhtrang.repository.ProductRepository;
import com.tinhocanhtrang.service.SessionService;
import com.tinhocanhtrang.service.ShoppingCartService;



@Controller
public class CartController {
	List<Product> carts = new ArrayList<>();

	@Autowired 
	SessionService session;

	@Autowired
	ShoppingCartService cart;

	@Autowired
	ProductRepository productRepository;
	
	// Collection<Object> carts = session.getAll("ShoppingCartService");

	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String getHome() throws Exception {
		return "cart/index";
	}

	@RequestMapping("/cart/index")
	public String view(Model model) {
		model.addAttribute("cart", cart);
		// model.addAttribute(getHome(), model)
		return "cart/index";
	}

	@PostMapping("/cart/add")
	public String add(@RequestParam("prid") String id) {
		// System.out.println(id);
		// cart.add(id);
		Product pro = productRepository.findProdById(id);
		// System.out.println(pro);
		carts.add(pro);
		// System.out.println(carts.get(0) +"done");
		return "redirect:/cart/index";
	}

	@RequestMapping("/cart/remove")
	public String remove(@RequestParam("prid") Integer id) {
		cart.remove(id);
		return "redirect:/cart/index";
	}

	@RequestMapping("/cart/update")
	public String update(@RequestParam("prid") Integer id, @RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/cart/index";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/index";
	}

}
