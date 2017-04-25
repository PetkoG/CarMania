package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ImageController {
		
	private static final String FILE_LOCATION = "C:"+File.separator+"Users"+File.separator+"Petko"+File.separator+"Desktop"+File.separator+"CarManiaImages"+File.separator;
	
	@RequestMapping(value="/image/{fileName}", method=RequestMethod.GET)
	@ResponseBody
	public void prepareForUpload(@PathVariable("fileName") String fileName, HttpServletResponse resp) throws IOException {
		File file = new File(FILE_LOCATION + fileName + ".jpeg");
		try {
			Files.copy(file.toPath(), resp.getOutputStream());
		} catch (IOException e) {
			System.out.println("No such file");
			resp.sendError(0);
		}
	}

}
