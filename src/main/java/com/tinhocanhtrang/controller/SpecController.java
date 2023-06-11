package com.tinhocanhtrang.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.tinhocanhtrang.entity.Category;
import com.tinhocanhtrang.entity.Spec;
import com.tinhocanhtrang.repository.SpecRepository;
import com.tinhocanhtrang.service.SessionService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;
import lombok.experimental.PackagePrivate;

@Controller
@Transactional
public class SpecController {
	@Autowired
	SpecRepository specRepository;
	@Autowired
	HttpServletResponse response;
	@Autowired
	SessionService sessionService;

	@ModelAttribute("listSpec")
	public Page<Spec> getAllSpec() {
		Pageable pageable = PageRequest.of(0, 6);
		return specRepository.findBySpecKeyContainingOrSpecValueContaining("", "", pageable);
	}

	@GetMapping(value = "admin/manager-spec")
	public String getSpec() {
		return "admin/Spec";
	}

	@PostMapping(value = "admin/manager-spec/create")
	public String getManagerSpec_Create(Spec spec) {
		specRepository.save(spec);
		return "redirect:/admin/manager-spec";
	}

	@PostMapping(value = "admin/manager-spec/delete")
	public String getManagerspec_Delete(Spec spec) throws IOException {
		if (spec.getSpecId() != null) {
			if (specRepository.findById(spec.getSpecId()).get().getProducts().size() > 0) {
				response.sendError(500);
			} else {
				specRepository.deleteBySpecKeyLikeAndSpecValueLike(spec.getSpecKey(), spec.getSpecValue());
			}
		} else {
			specRepository.deleteBySpecKeyLikeAndSpecValueLike(spec.getSpecKey(), spec.getSpecValue());
		}
		return "redirect:/admin/manager-spec";
	}

	@GetMapping(value = "admin/manager-spec/search")
	public String getManagerSpec_Search(@RequestParam("search") Optional<String> s,
			@RequestParam("page") Optional<Integer> p, Model model) {
		String kwords = s.orElse(sessionService.get("keywords"));
		sessionService.set("keywords", kwords);
		sessionService.set("page", p.orElse(0));
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Spec> page = specRepository.findBySpecKeyContainingOrSpecValueContaining((kwords == null ? "" : kwords),
				(kwords == null ? "" : kwords), pageable);
		model.addAttribute("listSpec", page);
		model.addAttribute("search", kwords);
		return "admin/Spec";
	}

	@PostMapping(value = "admin/manager-spec/check")
	public @ResponseBody boolean getManagerSpec_Check(Spec spec) {
		if (specRepository.existsBySpecIdOrSpecKeyLikeAndSpecValueLike(spec.getSpecId(), spec.getSpecKey(),
				spec.getSpecValue())) {
			return true;
		} else {
			return false;
		}
	}
}
