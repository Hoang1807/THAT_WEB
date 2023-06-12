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

import com.tinhocanhtrang.entity.Spec;
import com.tinhocanhtrang.entity.User;
import com.tinhocanhtrang.repository.UserRepository;
import com.tinhocanhtrang.service.SecurityService;
import com.tinhocanhtrang.service.SessionService;

@Controller
public class AccountController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	SecurityService securityService;
	@Autowired
	SessionService sessionService;

	@ModelAttribute("listAccount")
	public Page<User> getAllAccount() {
		Pageable pageable = PageRequest.of(0, 6);
		return userRepository.findByUserNameContainingOrUserEmailContaining("", "", pageable);
	}

	@PostMapping(value = "admin/manager-account/create")
	public String getManagerAccount_Create(User account) {
		account.setUserPhone(securityService.sha256(account.getUserPhone()));
		account.setUserPassword(securityService.encodePassword(account.getUserPassword()));
		userRepository.save(account);
		return "redirect:/admin/manager-account";
	}

	@GetMapping(value = "admin/manager-account")
	public String getManagerAccount() {
		return "Admin/Account";
	}

	@GetMapping(value = "admin/manager-account/search")
	public String getManagerSpec_Search(@RequestParam("search") Optional<String> s,
			@RequestParam("page") Optional<Integer> p, Model model) {
		String kwords = s.orElse(sessionService.get("keywords"));
		sessionService.set("keywords", kwords);
		sessionService.set("page", p.orElse(0));
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<User> page = userRepository.findByUserNameContainingOrUserEmailContaining((kwords == null ? "" : kwords),
				(kwords == null ? "" : kwords), pageable);
		model.addAttribute("listAccount", page);
		model.addAttribute("search", kwords);
		return "Admin/Account";
	}
	
	@GetMapping(value = "admin/manager-account/sort")
	public String getManagerCategory_Sort(@RequestParam("name") Optional<String> n,
			@RequestParam("sort") Optional<Boolean> s, Model model) {
		String kwords = sessionService.get("keywords");
		Integer p = sessionService.get("page");
		sessionService.set("page", p == null ? 0 : p);
		String name = n.orElse("categoryName");
		Boolean sort = s.orElse(true);
		Pageable pageable = PageRequest.of(p, 6, sort ? Direction.ASC : Direction.DESC, name);
		Page<User> page = userRepository.findByUserNameContainingOrUserEmailContaining((kwords == null ? "" : kwords),
				(kwords == null ? "" : kwords), pageable);
		model.addAttribute("listAccount", page);
		model.addAttribute("search", kwords);
		return "Admin/Account";
	}

	@PostMapping(value = "admin/manager-account/check")
	public @ResponseBody boolean getManagerAccount_Check(User account) {
		account.setUserPhone(securityService.sha256(account.getUserPhone()));
		if (userRepository.existsByUserPhone(account.getUserPhone())) {
			System.out.println("true");
			return true;
		} else {
			System.out.println("false");
			return false;
		}
	}
}
