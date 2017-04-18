package com.model;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    public static void sendEmail (String user, String name,String password,String username){
        try{
        	System.out.println("Da VLIZA");
            String host ="smtp.gmail.com" ;
            String sender = "carmaniafinal@gmail.com";
            String pass = "CarManiaFinal123";
            String from = "carmaniafinal@gmail.com";
            String link = "";
            String subject = "You made an account in CarMania";
            String messageText = "Hi " + name + ",\nYou've created a new CarMania account using " + username 
            		+ " as your username, and " + password + " as your password.";
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            //java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(user)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, sender, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
        }catch(Exception ex)
        {
            System.out.println("Not sent" + ex.getMessage());
        }

    }
}