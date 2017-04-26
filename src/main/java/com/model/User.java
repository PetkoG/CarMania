package com.model;

import java.util.ArrayList;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class User {
	
	private long id;
	@NotNull
	@Size(min=5, max=64)
	private String username;
	@NotNull
	@Email
	private String email;
	@NotNull
	private String password;
	private ArrayList<String> phoneNumbers;	
	@NotNull 
	private int age;
	
	public User(String username, String password,String email) {

		phoneNumbers = new ArrayList<>();
		this.username = username;
		this.email = email;
		this.password = password;
	}
	
	public User(String username, String email, String password, int age) {

		phoneNumbers = new ArrayList<>();
		this.username = username;
		this.email = email;
		this.password = password;
		this.age = age;
	}
	public String getUsername() {
		return username;
	}
	public int getAge() {
		return age;
	}
	public String getEmail() {
		return email;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public ArrayList<String> getPhoneNumbers() {
		return phoneNumbers;
	}
	public int getId() {
		return (int) this.id;
	}
}
