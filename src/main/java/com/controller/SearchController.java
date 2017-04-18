package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model viewModel,HttpSession session,
			@RequestParam String category,@RequestParam String mark,@RequestParam String model,@RequestParam String bodyType,
			@RequestParam String transmission,@RequestParam String fuelType,@RequestParam String color,@RequestParam String sortBy,
			@RequestParam Integer maxMileage,@RequestParam Integer yearFrom,@RequestParam Integer yearTo,@RequestParam Integer priceFrom,
			@RequestParam Integer priceTo,@RequestParam Integer hpFrom,@RequestParam Integer hpTo, @RequestParam Integer page) {
		
		return "index";
	}

}
