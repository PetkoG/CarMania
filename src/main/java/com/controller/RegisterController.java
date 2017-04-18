package com.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.SendEmail;
import com.model.User;

@Controller
public class RegisterController {
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String fbRegister(Model viewModel,HttpSession session,@RequestParam String last_name,
			@RequestParam String first_name,@RequestParam String email) {
		
		// if(UserDAO.getAllUsers().contains(email) {  
		// } else {
		int randomId=new Random().nextInt(10000);
		String user = first_name.concat(last_name) + randomId;
		String pass = first_name.concat(last_name) + randomId;
		SendEmail.sendEmail(email, first_name+" "+last_name, pass,user);
		User u = new User(user, pass, email);
		// UserDAO.addUser(u);
		System.out.println("sent register email to " + email);
		session.setAttribute("email", email);
		return "index";
	}
	
	@RequestMapping(value="/reg", method=RequestMethod.GET)
	public String register(Model viewModel,HttpSession session) {
		//System.out.println("Successful login with facebook");
		//session.setAttribute("logged", true);
		return "register";
	}

}
