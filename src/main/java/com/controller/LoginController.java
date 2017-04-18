package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String fbLogin(Model viewModel,HttpSession session) {
		System.out.println("Successful login with facebook");
		session.setAttribute("logged", true);
		return "forward:index.jsp";
	}
	@RequestMapping(value="/log", method=RequestMethod.POST)
	public String login(Model viewModel,HttpSession session) {
		//System.out.println("Successful login with facebook");
		//session.setAttribute("logged", true);
		return "login";
	}
	@RequestMapping(value="/profile", method=RequestMethod.POST)
	public String profile(Model viewModel,HttpSession session) {
		//System.out.println("Successful login with facebook");
		//session.setAttribute("logged", true);
		return "profile";
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(Model viewModel,HttpSession session) {
		//System.out.println("Successful login with facebook");
		session.invalidate();
		return "index";
	}

}
