package com.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

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

	@Override
	public void setServletContext(ServletContext servletContext) {
    	HashMap<String, HashMap<String, ArrayList<String>>> catMarkModel = null;
    	HashMap<String, ArrayList<String>> catBody = null;
		try {
			catMarkModel = PopulateDAO.getInstance().getCatMarkModel();
			catBody = PopulateDAO.getInstance().getCatBody();
		} catch (SQLException e) {
			System.out.println("Problem in context Initialized in PopulateListener. Exception: MysqlException");
		}
    	 
    	servletContext.setAttribute("catMarkModel", catMarkModel);
    	servletContext.setAttribute("catBody", catBody);
    	
    	cleaner.setDaemon(true);
    	cleaner.start();
    	
	}
	
}
