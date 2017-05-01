package com.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;

import javax.servlet.ServletContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;
import com.DAO.AdvertDAO;
import com.DAO.PopulateDAO;


@Component
public class PopulateListener implements ServletContextAware{
	private static Thread cleaner = new Thread(new Runnable() {
		@Override
		public void run() {
			while (true){
				try {
					AdvertDAO.cleanOldAdverts();
					try {
						Thread.sleep(24 * 60 * 60 * 1000); // once a day
					} catch (InterruptedException e) {
						System.out.println("Thread could not be put to sleep" + e.getMessage());
					}
				} catch (SQLException e) {
					System.out.println("Something went wrong with the sql connection in populateListener cleaning thread" + e.getMessage());
				}
			}
		}
	});

	private static final String FILE_LOCATION = "C:"+File.separator+"Users"+File.separator+"Petko"+File.separator+"Desktop"+File.separator+"CarManiaImages"+File.separator;
	@Override
	public void setServletContext(ServletContext servletContext) {
    	HashMap<String, TreeMap<String, ArrayList<String>>> catMarkModel = null;
    	HashMap<String, ArrayList<String>> catBody = null;
    	
		try {
			catMarkModel = PopulateDAO.getInstance().getCatMarkModel();
			catBody = PopulateDAO.getInstance().getCatBody();
		} catch (SQLException e) {
			System.out.println("Problem in context Initialized in PopulateListener. Exception: MysqlException");
		}
    	servletContext.setAttribute("imagePath", FILE_LOCATION);
    	servletContext.setAttribute("catMarkModel", catMarkModel);
    	servletContext.setAttribute("catBody", catBody);
    	try {
			servletContext.setAttribute("vipAdverts", AdvertDAO.getVipAdverts());
		} catch (SQLException e) {
			System.out.println("Problem fetching VIP Adverts");
		}
    	
    	cleaner.setDaemon(true);
    	cleaner.start();
    	
	}
	
}
