package com.controller;

import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.DAO.UserDAO;
import com.model.PasswordValidator;
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
		session.setAttribute("username", user);
		return "index";
	}
	
	@RequestMapping(value="/reg", method=RequestMethod.GET)
	public String register(Model viewModel,HttpSession session) {
		//System.out.println("Successful login with facebook");
		//session.setAttribute("logged", true);
		return "register";
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String normalRegister(Model viewModel,HttpSession session,@RequestParam String username,
			@RequestParam String email,@RequestParam String password,@RequestParam String password_confirm,
			@RequestParam String phone1,@RequestParam String phone2,@RequestParam String phone3,
			@RequestParam String age) {
		PasswordValidator pv = new PasswordValidator();
		String message;
		if (doesntHaveSpaces(username) && username.length()>=5 && username.length()<100){
			if (email.contains("@") && email.contains(".") && !email.contains(" ")){
				if ( pv.validate(password) && password.equals(password_confirm)){
					if (notEmpty(phone1) && containsOnlyNumbers(phone1) && containsOnlyNumbers(phone2) && containsOnlyNumbers(phone3)){
						if (doesntHaveSpaces(age) && containsOnlyNumbers(age)){
							int newAge = Integer.parseInt(age);
							User user = new User(username, email, DigestUtils.md5Hex(password).toUpperCase(), newAge);
							if (!phone1.isEmpty()){
								user.getPhoneNumbers().add(phone1);
							}
							if (!phone2.isEmpty()){
								user.getPhoneNumbers().add(phone2);
							}
							if (!phone3.isEmpty()){
								user.getPhoneNumbers().add(phone3);
							}
							try {
								UserDAO.addUser(user);
								message = "Register Successful! Please log in";
								session.setAttribute("message", message);
								return "register";
							} catch (SQLException e) {
								message = "User already taken, please try again";
								session.setAttribute("message", message);
								return "register";
							}
						}
						else {
							message = "Invalid age, try again!";
							session.setAttribute("message", message);
							return "register";
						}
					}
					else {
						message = "Invalid phone numbers, try again!";
						session.setAttribute("message", message);
						return "register";
					}
				}
				else {
					message = "Invalid password, try again!";
					session.setAttribute("message", message);
					return "register";
				}
			}
			else {
				message = "Invalid email, try again!";
				session.setAttribute("message", message);
				return "register";
			}
		}
		else {
			message = "Invalid username, try again!";
			session.setAttribute("message", message);
			return "register";
		}
		
		
	}
	private static boolean doesntHaveSpaces(String text){
		if (text == null || text.isEmpty()){
			return false;
		}
		for (int i =0; i<text.length();i++) {
			if (text.charAt(i) == ' '){
				return false;
			}
		}
		return true;
	}
	
	public static boolean containsOnlyNumbers(String number){
		for (int i =0; i<number.length();i++){
			if (!Character.isDigit(number.charAt(i))){
				return false;
			}
		}
		return true;
	}
	public static boolean notEmpty (String text){
		if (text != null && !text.trim().isEmpty()){
			return true;
		}
		return false;
	}
}
