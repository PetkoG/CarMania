package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.DAO.AdvertDAO;
import com.DAO.UserDAO;
import com.model.Advert;
import com.model.Comment;
import com.model.SearchParams;
import com.model.User;

@Controller
@MultipartConfig
public class AdvertController {
	private static long imageName = new Random().nextInt(99999);
	private static final String FILE_LOCATION = "C:"+File.separator+"Users"+File.separator+"Petko"+File.separator+"Desktop"+File.separator+"CarManiaImages"+File.separator;
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model viewModel,HttpSession session,
			@RequestParam(required = false, defaultValue="") String category,
			@RequestParam(required = false, defaultValue="") String mark,
			@RequestParam(required = false, defaultValue="")String model,
			@RequestParam(required = false, defaultValue="") String bodyType,
			@RequestParam(required = false, defaultValue="") String transType,
			@RequestParam(required = false, defaultValue="") String fuelType,
			@RequestParam(required = false, defaultValue="") String color,
			@RequestParam(required = false, defaultValue="") String sortBy,
			@RequestParam(required = false, defaultValue="1000000000") Integer maxMileage,
			@RequestParam(required = false, defaultValue="0") Integer yearFrom,
			@RequestParam(required = false, defaultValue="5000") Integer yearTo,
			@RequestParam(required = false, defaultValue="0") Integer priceFrom,
			@RequestParam(required = false, defaultValue="9999999") Integer priceTo,
			@RequestParam(required = false, defaultValue="0") Integer hpFrom,
			@RequestParam(required = false, defaultValue="999999") Integer hpTo,
			@RequestParam(required = false, defaultValue="1") Integer page) {
		
		SearchParams sp = new SearchParams(category, mark, model, bodyType, transType, fuelType, color, maxMileage,
				yearFrom, yearTo, priceFrom, priceTo, hpFrom, hpTo, sortBy, page);
		try {
			ArrayList<Advert> matched = AdvertDAO.getMatchedAdverts(sp);
			for (Advert adv : matched){
				System.out.println(adv.getImage());
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
	@RequestMapping(value="/searchpage", method=RequestMethod.GET)
	public String searchPage(Model viewModel,HttpSession session,@RequestParam Integer page) {
		SearchParams sp = (SearchParams) session.getAttribute("searchParams");
		sp.setPage(page);
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
	
	@RequestMapping(value="/ad", method=RequestMethod.GET)
	public String advert() {
		return "advert";
	}
	
	@RequestMapping(value="/advert", method=RequestMethod.GET)
	public String advert(Model viewModel,HttpSession session,@RequestParam Integer id) {
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
	@RequestMapping(value="/myAdverts", method = RequestMethod.GET)
	public String myAdverts(HttpSession session, Model model){
		if (session.getAttribute("username") != null){
			String username = (String) session.getAttribute("username");
			try {
				ArrayList<Advert> myAdverts = AdvertDAO.getMyAdverts(username);
				model.addAttribute("myAdverts", myAdverts);
				return "myAdverts";
			} catch (SQLException e) {
				return "error";
			}
		}
		return "login";
	}
	
	@RequestMapping(value="/addAdvert", method=RequestMethod.POST)
	public String addAdvert(Model viewModel,HttpSession session,
			@RequestParam(required= false) String title,
			@RequestParam(required= false) String category,
			@RequestParam(required= false) String mark,
			@RequestParam(required= false) String model,
			@RequestParam(required= false) String bodyType,
			@RequestParam(required= false) String transmissionType,
			@RequestParam(required= false) String fuel,
			@RequestParam(required= false) String color,
			@RequestParam(required= false) String priceText,
			@RequestParam(required= false) String mileageText,
			@RequestParam(required= false) Integer year,
			@RequestParam(required= false) String hpText,
			@RequestParam(required= false) String description,
			@RequestParam(required= false) String vip,
			@RequestParam("image") MultipartFile image) {

		String username = ((String)session.getAttribute("username"));
		int userId=0;
		String message = null;
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
													File imageToSave = new File(FILE_LOCATION + imageName+".jpeg");
													try {
														Files.copy(image.getInputStream(), imageToSave.toPath(), StandardCopyOption.REPLACE_EXISTING);
													} catch (IOException e1) {
														System.out.println("STACKTRACE "+ e1.getMessage() );
														return "error";
													}
													boolean isVip=false;
													if(vip.equals("vip")) {
														isVip=true;
													}
													Advert add = new Advert(mark, model, price, category, year, hp,
															mileage, color, userId, title, description, LocalDate.now(),
															transmissionType, fuel, bodyType, imageName+".jpeg",isVip);
													imageName++;
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
	@RequestMapping(value="/showSearch", method=RequestMethod.GET)
	public String login(Model viewModel,HttpSession session) {
		//System.out.println("Successful login with facebook");
		//session.setAttribute("logged", true);
		return "search";
	}
	@RequestMapping(value="/deleteAdvert", method=RequestMethod.GET)
	public String deleteAdvert(HttpSession session,@RequestParam Integer id) {
		if (session.getAttribute("username") == null){
			return "login";
		}
		try {
			AdvertDAO.deleteAdvert(id);
			return "myAdverts";
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
