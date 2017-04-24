package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String sayHi(Model viewModel,HttpSession session) {
		// talk with model
		if(session.getAttribute("message")!=null) {
			session.setAttribute("message", null);
		}
		viewModel.addAttribute("Text","Hello");
		
		return "index";
	}
	
	
}
