package com.controller;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.DAO.AdvertDAO;
import com.DAO.UserDAO;
import com.model.Advert;
import com.model.Comment;
import com.model.SearchParams;
import com.model.User;

@Controller
public class SearchController {
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model viewModel,HttpSession session,
			@RequestParam String category,@RequestParam String mark,@RequestParam String model,@RequestParam String bodyType,
			@RequestParam String transmission,@RequestParam String fuelType,@RequestParam String color,@RequestParam String sortBy,
			@RequestParam Integer maxMileage,@RequestParam Integer yearFrom,@RequestParam Integer yearTo,@RequestParam Integer priceFrom,
			@RequestParam Integer priceTo,@RequestParam Integer hpFrom,@RequestParam Integer hpTo, @RequestParam Integer page) {
		
		SearchParams sp = new SearchParams(category, mark, model, bodyType, transmission, fuelType, color, maxMileage,
				yearFrom, yearTo, priceFrom, priceTo, hpFrom, hpTo, sortBy, page);
		try {
			ArrayList<Advert> matched = AdvertDAO.getMatchedAdverts(sp);
			for (Advert adv : matched){
				System.out.println(adv.getPrice());
			}
			Integer maxPages = AdvertDAO.pageCount(sp);
			session.setAttribute("searchParams", sp);
			session.setAttribute("matched", matched);
			session.setAttribute("maxPages", maxPages);
			
		} catch (SQLException e) {
			System.out.println("wtf");
		}
		return "advertlist";
	}
	@RequestMapping(value="/searchpage/{page}", method=RequestMethod.GET)
	public String searchPage(Model viewModel,HttpSession session,@PathVariable("page")String page) {
		SearchParams sp = (SearchParams) session.getAttribute("searchParams");
		int newPage = validPage(page);
		sp.setPage(newPage);
		try {
			ArrayList<Advert> matched = AdvertDAO.getMatchedAdverts(sp);
			Integer maxPages = AdvertDAO.pageCount(sp);
			session.setAttribute("searchParams", sp);
			session.setAttribute("matched", matched);
			session.setAttribute("maxPages", maxPages);
			
		} catch (SQLException e) {
			System.out.println("wtf");
		}
		return "advertlist";
	}
	@RequestMapping(value="/advert/{id}", method=RequestMethod.GET)
	public String advert(Model viewModel,HttpSession session,@PathVariable("id")int id) {
	Advert advert;
	User user;
	try {
		advert = AdvertDAO.getAdvert(id);
		user = UserDAO.getUser(advert.getUserId());
		if (advert == null || user == null){
			return "error";
		}
		session.setAttribute("advert", advert);
		session.setAttribute("user", user);
		return "advert";
	} catch (SQLException e) {
		return "register";
		}
	}
	
	@RequestMapping(value="/addComment", method=RequestMethod.POST)
	public String addComent(Model viewModel,HttpSession session,@RequestParam String comment) {
		String text = comment;
		int advertId = ((Advert) session.getAttribute("advert")).getId();
		try {
			User user = UserDAO.getUser((String)session.getAttribute("username"));
			Comment comm = new Comment(text, user, advertId);
			AdvertDAO.addComment(comm);
			return "advert";
		} catch (SQLException e) {
			return "error";
		}
	}
	
	@RequestMapping(value="/addAdvert", method=RequestMethod.GET)
	public String addAdvert() {
		return "addAdvert";
	}
	@RequestMapping(value="/myAdverts", method=RequestMethod.GET)
	public String myAdverts() {
		return "myAdverts";
	}
	
	@RequestMapping(value="/addAdvert", method=RequestMethod.POST)
	public String addAdvert(Model viewModel,HttpSession session,
			@RequestParam String message,@RequestParam String title,
			@RequestParam String category,@RequestParam String mark,@RequestParam String model,@RequestParam String bodyType,
			@RequestParam String transmissionType,@RequestParam String fuel,@RequestParam String color,@RequestParam String priceText,
			@RequestParam String mileageText,@RequestParam Integer year,@RequestParam String hpText,
			@RequestParam String description) {
		String username = ((String)session.getAttribute("username"));
		int userId=0;
		try {
			userId = UserDAO.getUserId(username);
		} catch (SQLException e) {
			return "login";
		}
		if (category != null && !category.isEmpty()) {
			if (mark != null && !mark.isEmpty()) {
				if (model != null && !model.isEmpty()) {
					if (bodyType != null && !bodyType.isEmpty()) {
						if (transmissionType != null && !transmissionType.isEmpty()) {
							if (title != null && !title.isEmpty()) {
								if (color != null && !color.isEmpty()) {
									if (fuel != null && !fuel.isEmpty()) {
										if (priceText != null && !priceText.isEmpty()
												&& containsOnlyNumbers(priceText)) {
											if (hpText != null && !hpText.isEmpty()
													&& containsOnlyNumbers(hpText)) {
												if (mileageText != null && !mileageText.isEmpty()
														&& containsOnlyNumbers(mileageText)) {
													int price = Integer.parseInt(priceText);
													int hp = Integer.parseInt(hpText);
													int mileage = Integer.parseInt(mileageText);
													Advert add = new Advert(mark, model, price, category, year, hp,
															mileage, color, userId, title, description, LocalDate.now(),
															transmissionType, fuel, bodyType);
													try {
														AdvertDAO.addAdvert(add);
														message = "ADVERT ADDED SUCCEFULLY";
														session.setAttribute("message", message);
														return "addAdvert";
													} catch (SQLException e) {
														message = "SOMETHING WENT WRONG, TRY AGAIN";
														session.setAttribute("message", message);
														return "addAdvert";
													}

												} else {
													message = "PLEASE ENTER MILEAGE";
													session.setAttribute("message", message);
													return "addAdvert";
												}
											} else {
												message = "PLEASE ENTER HORSE POWER";
												session.setAttribute("message", message);
												return "addAdvert";
											}
										} else {
											message = "PLEASE ENTER PRICE";
											session.setAttribute("message", message);
											return "addAdvert";
										}
									} else {
										message = "PLEASE ENTER FUEL TYPE";
										session.setAttribute("message", message);
										return "addAdvert";
									}
								} else {
									message = "PLEASE ENTER COLOR";
									session.setAttribute("message", message);
									return "addAdvert";
								}
							} else {
								message = "PLEASE ENTER TITLE";
								session.setAttribute("message", message);
								return "addAdvert";
							}
						} else {
							message = "PLEASE ENTER TRANSMISSION";
							session.setAttribute("message", message);
							return "addAdvert";
						}
					} else {
						message = "PLEASE ENTER BODY CATEGORY";
						session.setAttribute("message", message);
						return "addAdvert";
					}
				} else {
					message = "PLEASE ENTER MODEL";
					session.setAttribute("message", message);
					return "addAdvert";
				}
			} else {
				message = "PLEASE ENTER MARK";
				session.setAttribute("message", message);
				return "addAdvert";
			}
		} else {
			message = "PLEASE ENTER CATEGORY";
			session.setAttribute("message", message);
			return "addAdvert";
		}
		
	}
	
	@RequestMapping(value="/deleteAdvert", method=RequestMethod.POST)
	public String deleteAdvert(Model viewModel,HttpSession session,@RequestParam Integer advertId) {
		if (session.getAttribute("username") == null){
			return "login";
		}
		try {
			AdvertDAO.deleteAdvert(advertId);
			return "myadverts";
		} catch (SQLException e) {
			return "error";
		}
	}
	
	public static int stringToInt(String input) {
		if (input == null || input.isEmpty() || !containsOnlyNumbers(input)) {
			return -1;
		}
		int x = Integer.parseInt(input);
		if (x < 0) {
			return -1;
		}
		return x;

	}
	
	public static String checkIfEmpty(String input){
		if (input == null || input.isEmpty()){
			return null;
		}
		return input;
	}
	public static int validPage(String page){
		if (page == null || page.isEmpty()){
			return 1;
		}
		boolean isInteger = true;
		for (int i=0;i<page.length();i++){
			if (!Character.isDigit(page.charAt(i))){
				isInteger = false;
			}
		}
		if (isInteger){
			return Integer.parseInt(page);
		}
		return 1;
	}
	public static boolean containsOnlyNumbers(String number){
		for (int i =0; i<number.length();i++){
			if (!Character.isDigit(number.charAt(i))){
				return false;
			}
		}
		return true;
	}

}
