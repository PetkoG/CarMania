package com.controller;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model.Advert;
 
/**
 * A Spring controller that allows the users to download a PDF document
 * generated by the iText library.
 *
 * @author www.codejava.net
 *
 */
@Controller
public class PDFController {
 
    /**
     * Handle request to download a PDF document
     */
    @RequestMapping(value = "/downloadPdf", method = RequestMethod.GET)
    public String download(Model model,HttpSession session) {
    	Advert ad = (Advert) session.getAttribute("advert");
        model.addAttribute("advert", ad);
        return "";
    }
}