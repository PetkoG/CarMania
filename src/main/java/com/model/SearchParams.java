package com.model;

public class SearchParams {
	private int id;
	private String category;
	private String mark;
	private String model;
	private String bodyType;
	private String transmission;
	private String fuelType;
	private String color;
	private int maxMileage;
	private int yearFrom;
	private int yearTo;
	private int priceFrom;
	private int priceTo;
	private int hpFrom;
	private int hpTo;
	private String sortBy;
	private int page;
	
	
	public SearchParams(String category, String mark, String model, String bodyType, String transmission,
			String fuelType, String color, int maxMileage, int yearFrom, int yearTo, int priceFrom, int priceTo,
			int hpFrom, int hpTo, String sortBy, int page) {
		if (!category.isEmpty()){
			this.category = category;
		}
		if (!mark.isEmpty()){
			this.mark = mark;
		}
		if (!model.isEmpty()){
			this.model = model;
		}
		if (!bodyType.isEmpty()){
			this.bodyType = bodyType;
		}
		if (!transmission.isEmpty()){
			this.transmission = transmission;
		}
		if (!fuelType.isEmpty()){
			this.fuelType = fuelType;
		}
		if (!color.isEmpty()){
			this.color = color;
		}
		this.maxMileage = maxMileage;
		this.yearFrom = yearFrom;
		this.yearTo = yearTo;
		this.priceFrom = priceFrom;
		this.priceTo = priceTo;
		this.hpFrom = hpFrom;
		this.hpTo = hpTo;
		this.sortBy = sortBy;
		this.page = page;
	}
	public String getCategory() {
		return category;
	}
	public String getMark() {
		return mark;
	}
	public String getModel() {
		return model;
	}
	public String getBodyType() {
		return bodyType;
	}
	public String getTransmission() {
		return transmission;
	}
	public String getFuelType() {
		return fuelType;
	}
	public String getColor() {
		return color;
	}
	public int getMaxMileage() {
		return maxMileage;
	}
	public int getYearFrom() {
		return yearFrom;
	}
	public int getYearTo() {
		return yearTo;
	}
	public int getPriceFrom() {
		return priceFrom;
	}
	public int getPriceTo() {
		return priceTo;
	}
	public int getHpFrom() {
		return hpFrom;
	}
	public int getHpTo() {
		return hpTo;
	}
	public String getSortBy() {
		return sortBy;
	}
	public long getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
}
