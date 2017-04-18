package com.model;

public class Comment {

	private String text;
	private User user;
	private int advertId;
	
	public Comment(String text, User user, int advertId) {
		this.text=text;
		this.advertId=advertId;
		this.user = user;
	}
	public String getText() {
		return text;
	}
	public User getUser() {
		return user;
	}
	public int getAdvertId() {
		return advertId;
	}
}
