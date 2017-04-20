package com.controller;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.DAO.UserDAO;
import com.model.User;

@Controller
public class LoginController {
	
	@RequestMapping(value="/log", method=RequestMethod.POST)
	public String login(Model viewModel,HttpSession session) {
		//System.out.println("Successful login with facebook");
		//session.setAttribute("logged", true);
		return "login";
	}
	@RequestMapping(value="/profile", method=RequestMethod.POST)
	public String profile(Model viewModel,HttpSession session) {
		String username;
		
		if (session != null){
			if (session.getAttribute("username") != null){
				username = (String) session.getAttribute("username");
				try {
					User user = UserDAO.getUser(username);
					session.setAttribute("username", user.getUsername());
					session.setAttribute("email", user.getEmail());
					session.setAttribute("age", user.getAge());
					session.setAttribute("phoneNumbers", user.getPhoneNumbers());
					return "profile";
					
				} catch (SQLException e) {
					System.out.println("something went bad in profile servlet");
				}
			}
			else {
				System.out.println("username null");
				return "login";
			}
		}
		return "login";
	}
	
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(Model viewModel,HttpSession session) {
		//System.out.println("Successful login with facebook");
		session.invalidate();
		return "index";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String normalLogin(Model viewModel,HttpSession session,
			@RequestParam String username, @RequestParam String password) {
		String message;
		try {
			if (UserDAO.validLogin(username,  DigestUtils.md5Hex(password))) {
				session.setAttribute("username", username);
				session.setMaxInactiveInterval(30*60);
				Cookie user = new Cookie("username", username);
				user.setMaxAge(30*60);
				return "index";
			} else {
				message = "Wrong username or password!";
				session.setAttribute("message", message);
				return "login";
			}
		} catch (SQLException e) {
			return "error";
		}
	}

}
