package com.model;

import java.time.LocalDate;
import java.util.ArrayList;

public class Advert {
 
	private int id;
	private String mark;
	private String model;
	private int price;
	private String category;
	private int year;
	private int horsePower; 
	private int mileage;
	private String color;
	private int userId;
	private String title;
	private String description;
	private LocalDate creationTime;
	private ArrayList<Comment> comments;
	private String transmissionType;
	private String fuelType;	
	private String bodyType;
	private String image;
	private boolean vip;

	public Advert(String mark, String model, int price, String category, int year, int horsePower, int mileage,
			String color, int userId, String title, String description, LocalDate creationTime,
			String transmissionType, String fuelType, String bodyType, String image,boolean vip) {
		this.mark = mark;
		this.model = model;
		this.price = price;
		this.category = category;
		this.year = year;
		this.horsePower = horsePower;
		this.mileage = mileage;
		this.color = color;
		this.userId = userId;
		this.title = title;
		this.description = description;
		this.transmissionType = transmissionType;
		this.fuelType = fuelType;
		this.bodyType = bodyType;
		this.image = image;
		this.comments = new ArrayList<>();
		this.creationTime = creationTime;
		this.vip=vip;
	}

	public boolean isVip() {
		return vip;
	}

	public void setVip(boolean vip) {
		this.vip = vip;
	}

	public String getImage() {
		return image;
	}

	public String getMark() {
		return mark;
	}

	public String getModel() {
		return model;
	}

	public int getPrice() {
		return price;
	}

	public String getCategory() {
		return category;
	}

	public int getYear() {
		return year;
	}

	public int getHorsePower() {
		return horsePower;
	}

	public int getMileage() {
		return mileage;
	}

	public String getColor() {
		return color;
	}

	public int getUserId() {
		return userId;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public LocalDate getCreationTime() {
		return creationTime;
	}

	public ArrayList<Comment> getComments() {
		return comments;
	}

	public String getTransmissionType() {
		return transmissionType;
	}

	public String getFuelType() {
		return fuelType;
	}

	public String getBodyType() {
		return bodyType;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}


	@Override
	public String toString() {
		return "Advert [mark=" + mark + ", model=" + model + ", price=" + price + ", category=" + category + ", year="
				+ year + ", horsePower=" + horsePower + ", mileage=" + mileage + ", color=" + color + ", userId="
				+ userId + ", title=" + title + ", description=" + description + ", creationTime=" + creationTime
				+ ", comments=" + comments + ", transmissionType=" + transmissionType + ", fuelType=" + fuelType
				+ ", bodyType=" + bodyType + "]";
	}
}
