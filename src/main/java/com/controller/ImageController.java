package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ImageController {
	
	private static final String FILE_LOCATION = "C:"+File.separator+"Users"+File.separator+"Petko"+File.separator+"Desktop"+File.separator+"CarManiaImages"+File.separator;
	
	@RequestMapping(value="/image", method=RequestMethod.GET)
	@ResponseBody
	public void getImage(@RequestParam String fileName, HttpServletResponse response) {
		File file = new File(FILE_LOCATION + fileName);
		System.out.println("FAIL" + file);
		try {
			Files.copy(file.toPath(), response.getOutputStream());
		} catch (IOException e) {
			System.out.println("Failed to copy image" + e.getMessage());
		}
	}

}
